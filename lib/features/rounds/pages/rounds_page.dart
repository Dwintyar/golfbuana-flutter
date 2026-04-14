import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoundsPage extends StatefulWidget {
  const RoundsPage({super.key});
  @override
  State<RoundsPage> createState() => _RoundsPageState();
}

class _RoundsPageState extends State<RoundsPage> {
  bool _showUpcoming = true;
  static const bgColor = Color(0xFF0A1A0A);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  List<Map<String, dynamic>> _upcoming = [];
  List<Map<String, dynamic>> _completed = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      print('DEBUG userId: $userId');
      if (userId == null) { print('DEBUG: userId null'); return; }

      // Fetch events where user is a contestant via tickets
      final res = await Supabase.instance.client
          .from('events')
          .select('id, name, date, status, courses(name)')
          .order('date', ascending: false)
          .limit(50);

      final now = DateTime.now();
      final upcoming = <Map<String, dynamic>>[];
      final completed = <Map<String, dynamic>>[];

      print('DEBUG events count: ${(res as List).length}');
      for (final e in res as List) {
        final date = DateTime.tryParse(e['event_date'] ?? '');
        final status = (e['status'] ?? '').toString().toLowerCase();
        final venueName = e['course_id'] ?? '—';
        final item = {
          'name': e['name'] ?? '—',
          'date': e['event_date'] ?? '—',
          'venue': venueName.length > 18 ? venueName.substring(0, 18) + '...' : venueName,
          'status': status,
          'id': e['id'],
        };
        if (status == 'done' || status == 'completed') {
          completed.add(item);
        } else {
          upcoming.add(item);
        }
      }

      // Sort upcoming ascending, completed descending
      upcoming.sort((a, b) => (a['date'] as String).compareTo(b['date'] as String));
      completed.sort((a, b) => (b['date'] as String).compareTo(a['date'] as String));

      if (mounted) setState(() {
        _upcoming = upcoming;
        _completed = completed;
        _loading = false;
      });
    } catch (e) {
      print('DEBUG error: $e');
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final list = _showUpcoming ? _upcoming : _completed;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            const Icon(Icons.hexagon_outlined, color: greenLight, size: 28),
            const SizedBox(width: 10),
            const Text('Rounds',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Row(
            children: [
              _tab('Upcoming', _showUpcoming, () => setState(() => _showUpcoming = true)),
              _tab('Completed', !_showUpcoming, () => setState(() => _showUpcoming = false)),
            ],
          ),
        ),
      ),
      body: _loading
        ? const Center(child: CircularProgressIndicator(color: greenLight))
        : list.isEmpty
          ? Center(child: Text(
              _showUpcoming ? 'Tidak ada event upcoming' : 'Tidak ada event selesai',
              style: const TextStyle(color: textSecondary)))
          : ListView.separated(
              itemCount: list.length,
              separatorBuilder: (_, __) => const Divider(color: Color(0xFF1A2A1A), height: 1),
              itemBuilder: (context, index) {
                final event = list[index];
                final isDone = event['status'] == 'done' || event['status'] == 'completed';
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_) => EventDetailPage(
                        name: event['name']!,
                        date: event['date']!,
                        venue: event['venue']!,
                        status: event['status']!,
                      ),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 36, height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A3A1A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text('E', style: TextStyle(
                              color: greenLight, fontWeight: FontWeight.w700, fontSize: 14)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(event['name']!,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                              const SizedBox(height: 3),
                              Text('${event['date']} · ${event['venue']}',
                                style: const TextStyle(color: textSecondary, fontSize: 12)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: isDone ? greenLight : const Color(0xFF4A6A4A)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(event['status']!,
                            style: TextStyle(
                              color: isDone ? greenLight : textSecondary,
                              fontSize: 12,
                            )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget _tab(String label, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: active ? greenLight : Colors.transparent,
              width: 2,
            )),
          ),
          child: Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: active ? greenLight : textSecondary,
              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              fontSize: 14,
            )),
        ),
      ),
    );
  }
}

// ============================================================
// EVENT DETAIL PAGE
// ============================================================
class EventDetailPage extends StatefulWidget {
  final String name;
  final String date;
  final String venue;
  final String status;

  const EventDetailPage({
    super.key,
    required this.name,
    required this.date,
    required this.venue,
    required this.status,
  });

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  int _tabIndex = 0;

  static const bgColor = Color(0xFF0A1A0A);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  final _tabs = ['Overview', 'Check-in', 'Pairings', 'Board', 'HCP Cor'];

  final _contestants = [
    {'init': 'A', 'name': 'Abby Mulia', 'hcp': '17', 'flight': 'Flight Level B', 'status': 'confirmed'},
    {'init': 'A', 'name': 'Achmad Luthfi', 'hcp': '8', 'flight': 'Flight Level A', 'status': 'confirmed'},
    {'init': 'A', 'name': 'Adji Arwinda S', 'hcp': '5', 'flight': 'Flight Level A', 'status': 'confirmed'},
    {'init': 'A', 'name': 'Adriansyah', 'hcp': '12', 'flight': 'Flight Level B', 'status': 'confirmed'},
  ];

  bool get isDone => widget.status == 'done' || widget.status == 'completed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A2A1A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(widget.status,
                          style: const TextStyle(color: Colors.white70, fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 72, height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A2A0A),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF2E7D32)),
                  ),
                  child: const Icon(Icons.flag_outlined, color: greenLight, size: 36),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(widget.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 13, color: textSecondary),
                    const SizedBox(width: 4),
                    Text(widget.date, style: const TextStyle(color: textSecondary, fontSize: 13)),
                    const Text(' · ', style: TextStyle(color: textSecondary)),
                    const Icon(Icons.location_on_outlined, size: 13, color: textSecondary),
                    const SizedBox(width: 4),
                    Text(widget.venue, style: const TextStyle(color: textSecondary, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _statBox('144', 'Players', Icons.people_outline, greenLight),
                      const SizedBox(width: 8),
                      _statBox('144', 'Check-ins', Icons.checklist_outlined, const Color(0xFFFFB300)),
                      const SizedBox(width: 8),
                      _statBox(isDone ? '36' : '0', 'Groups', Icons.shuffle, Colors.white70),
                      const SizedBox(width: 8),
                      _statBox('72', 'Par', Icons.emoji_events_outlined, const Color(0xFFFFB300)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: isDone
                        ? [
                            _actionBtn(Icons.people_outline, 'Assign'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.emoji_events_outlined, 'Results'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.monitor_outlined, 'Live'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.share_outlined, 'Share'),
                          ]
                        : [
                            _actionBtn(Icons.edit_outlined, 'Input Score'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.people_outline, 'Assign'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.emoji_events_outlined, 'Results'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.monitor_outlined, 'Live'),
                          ],
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_tabs.length, (i) {
                      final active = _tabIndex == i;
                      return GestureDetector(
                        onTap: () => setState(() => _tabIndex = i),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: active ? greenLight : Colors.transparent,
                              width: 2,
                            )),
                          ),
                          child: Text(_tabs[i],
                            style: TextStyle(
                              color: active ? greenLight : textSecondary,
                              fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                              fontSize: 13,
                            )),
                        ),
                      );
                    }),
                  ),
                ),
                const Divider(color: Color(0xFF1A2A1A), height: 1),
              ],
            ),
          ),
          SliverToBoxAdapter(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_tabIndex) {
      case 0: return _buildOverview();
      default: return Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Coming soon', style: const TextStyle(color: textSecondary)));
    }
  }

  Widget _buildOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Row(
            children: [
              const Icon(Icons.people_outline, color: greenLight, size: 18),
              const SizedBox(width: 8),
              const Text('Contestants', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(12)),
                child: const Text('144', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        ..._contestants.map((c) => Container(
          margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(color: const Color(0xFF111E11), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: 28, height: 28,
                decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
                child: Center(child: Text(c['init']!, style: const TextStyle(color: greenLight, fontSize: 12, fontWeight: FontWeight.w600))),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  Text('HCP ${c['hcp']} · ${c['flight']}', style: const TextStyle(color: textSecondary, fontSize: 12)),
                ]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(border: Border.all(color: const Color(0xFF2A4A2A)), borderRadius: BorderRadius.circular(10)),
                child: Text(c['status']!, style: const TextStyle(color: Colors.white70, fontSize: 11)),
              ),
            ],
          ),
        )),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _statBox(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: const Color(0xFF111E11), borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          Text(label, style: const TextStyle(color: textSecondary, fontSize: 10), textAlign: TextAlign.center),
        ]),
      ),
    );
  }

  Widget _actionBtn(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Icon(icon, color: greenLight, size: 22),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
        ]),
      ),
    );
  }
}
