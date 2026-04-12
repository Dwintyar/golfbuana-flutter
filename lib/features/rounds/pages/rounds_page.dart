import 'package:flutter/material.dart';

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

  final _upcoming = [
    {'name': 'Paradjana March 2026', 'date': '2026-03-28', 'venue': 'The Green B...', 'status': 'scheduled'},
    {'name': 'Piala Walikota Depok', 'date': '2026-04-11', 'venue': 'Emeralda Golf...', 'status': 'scheduled'},
    {'name': 'Paradjana April 2026', 'date': '2026-04-18', 'venue': 'Emeralda Gol...', 'status': 'scheduled'},
    {'name': 'Paradjana May 2026', 'date': '2026-05-16', 'venue': 'Bukit Pelangi ...', 'status': 'scheduled'},
    {'name': 'Paradjana June 2026', 'date': '2026-06-20', 'venue': 'Halim Golf C...', 'status': 'scheduled'},
    {'name': 'Paradjana July 2026', 'date': '2026-07-18', 'venue': 'Jagorawi Golf ...', 'status': 'scheduled'},
    {'name': 'Paradjana Aug 2026', 'date': '2026-08-22', 'venue': 'Matoa Golf &...', 'status': 'scheduled'},
    {'name': 'Paradjana Sept 2026', 'date': '2026-09-19', 'venue': 'Merapi View ...', 'status': 'scheduled'},
    {'name': 'Paradjana Oct 2026', 'date': '2026-10-17', 'venue': 'New Kuta Golf...', 'status': 'scheduled'},
  ];

  final _completed = [
    {'name': 'EGT 2025 #12 – Desembe...', 'date': '2025-12-13', 'venue': 'Sentul Highland Gol...', 'status': 'done'},
    {'name': 'EGT 2025 #11 – Novembe...', 'date': '2025-11-15', 'venue': 'The Green BSD City', 'status': 'done'},
    {'name': 'EGT 2025 #10 – Oktober ...', 'date': '2025-10-18', 'venue': 'Gunung Geulis CC ...', 'status': 'done'},
    {'name': 'EGT 2025 #09 – Septem...', 'date': '2025-09-20', 'venue': 'Gunung Geulis CC...', 'status': 'done'},
    {'name': 'EGT 2025 #08 – Agustus ...', 'date': '2025-08-17', 'venue': 'New Kuta Golf Pec...', 'status': 'done'},
    {'name': 'EGT 2025 #07 – Juli (Nir...', 'date': '2025-07-20', 'venue': 'Nirwana Bali Golf ...', 'status': 'done'},
    {'name': 'EGT 2025 #06 – Juni (PSP)', 'date': '2025-06-15', 'venue': 'PSP Golf Course', 'status': 'done'},
    {'name': 'EGT 2025 #05 – Mei (Ma...', 'date': '2025-05-18', 'venue': 'Matoa Golf & Gard...', 'status': 'done'},
    {'name': 'EGT 2025 #04 – April (Pe...', 'date': '2025-04-20', 'venue': 'Permata Sentul...', 'status': 'done'},
  ];

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
      body: ListView.separated(
        itemCount: list.length,
        separatorBuilder: (_, __) => const Divider(color: Color(0xFF1A2A1A), height: 1),
        itemBuilder: (context, index) {
          final event = list[index];
          final isDone = event['status'] == 'done';
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
                    width: 36,
                    height: 36,
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

  final _checkinClubs = [
    {
      'club': 'Apexindo Pratama Duta, PT.',
      'count': 4,
      'players': [
        {'no': 1, 'name': 'Agustinus Irawan', 'hcp': 18, 'flight': 'B', 'time': '06:0'},
        {'no': 2, 'name': 'Anti Rivai', 'hcp': 30, 'flight': 'C', 'time': '06:0'},
        {'no': 3, 'name': 'Bayu Hariyadi Putra', 'hcp': 2, 'flight': 'A', 'time': '06:0'},
        {'no': 4, 'name': 'Don K Wood', 'hcp': 18, 'flight': 'B', 'time': '06:0'},
      ],
    },
    {
      'club': 'Baker Hughes Indonesia, PT.',
      'count': 8,
      'players': [
        {'no': 1, 'name': 'Kirby L Wedewer', 'hcp': 10, 'flight': 'A', 'time': '06:0'},
        {'no': 2, 'name': 'Leif Nordenstam', 'hcp': 9, 'flight': 'A', 'time': '06:0'},
      ],
    },
  ];

  final _boardData = [
    {'club': 'Bukit Energy ...', 'out': '41', 'in': '41', 'tot': '82', 'hcp': '11', 'nett': '71'},
    {'club': 'Bukit Energy ...', 'out': '38', 'in': '38', 'tot': '76', 'hcp': '4', 'nett': '72'},
    {'club': 'JOB Pertamina...', 'out': '47', 'in': '46', 'tot': '93', 'hcp': '3', 'nett': '73'},
    {'club': 'Kreasindo Era...', 'out': '47', 'in': '47', 'tot': '94', 'hcp': '2', 'nett': '73'},
    {'club': 'Apexindo Prat...', 'out': '47', 'in': '45', 'tot': '92', 'hcp': '2', 'nett': '73'},
    {'club': 'Salsabila Riz...', 'out': '47', 'in': '49', 'tot': '96', 'hcp': '0', 'nett': '74'},
    {'club': 'Bukit Energy ...', 'out': '44', 'in': '41', 'tot': '85', 'hcp': '10', 'nett': '74'},
  ];

  final _hcpData = [
    {'no': '1', 'name': 'Urpan Dani', 'club': 'Salsabila Riz...', 'awal': '1', 'koreksi': '1'},
    {'no': '2', 'name': 'Norman H Harahap', 'club': 'EMP Bentu L...', 'awal': '0', 'koreksi': '1'},
    {'no': '3', 'name': 'Bambang Manumayoso', 'club': 'JOB Pertami...', 'awal': '5', 'koreksi': '3'},
    {'no': '4', 'name': 'Indra Prasetya', 'club': 'JOB Pertami...', 'awal': '3', 'koreksi': '3'},
    {'no': '5', 'name': 'Witan Arjakusumah', 'club': 'The Explorat...', 'awal': '3', 'koreksi': '3'},
  ];

  bool get isDone => widget.status == 'done';

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
                // Header row
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

                // Event icon
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

                // Title
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

                // Stats row
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

                // Action buttons
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
                            _actionBtn(Icons.edit_outlined, 'Input\nScore'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.people_outline, 'Assign'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.check_circle_outline, 'Set\nReady'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.emoji_events_outlined, 'Results'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.monitor_outlined, 'Live'),
                            const SizedBox(width: 8),
                            _actionBtn(Icons.share_outlined, 'Share'),
                          ],
                  ),
                ),
                const SizedBox(height: 12),

                // Tabs
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
      case 1: return _buildCheckin();
      case 2: return _buildPairings();
      case 3: return _buildBoard();
      case 4: return _buildHCP();
      default: return const SizedBox();
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
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A1A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('144', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
        ..._contestants.map((c) => Container(
          margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF111E11),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 28, height: 28,
                decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
                child: Center(child: Text(c['init']!, style: const TextStyle(color: greenLight, fontSize: 12, fontWeight: FontWeight.w600))),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    Text('HCP ${c['hcp']} · ${c['flight']}', style: const TextStyle(color: textSecondary, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF2A4A2A)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(c['status']!, style: const TextStyle(color: Colors.white70, fontSize: 11)),
              ),
            ],
          ),
        )),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCheckin() {
    return Column(
      children: [
        // Summary card
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF111E11),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.checklist, color: greenLight, size: 18),
                  SizedBox(width: 8),
                  Text('Check-in', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  Spacer(),
                  Text('144 Players', style: TextStyle(color: textSecondary, fontSize: 12)),
                  Text(' · ', style: TextStyle(color: textSecondary)),
                  Text('37 Clubs', style: TextStyle(color: textSecondary, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 8),
              Container(height: 4, decoration: BoxDecoration(
                color: greenLight, borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 10),
              Row(
                children: [
                  _miniStat('144', 'Registered', Colors.white),
                  const SizedBox(width: 16),
                  _miniStat('144', 'Checked In', greenLight),
                  const SizedBox(width: 16),
                  _miniStat('0', 'Not Yet', Colors.white70),
                ],
              ),
            ],
          ),
        ),

        // Search
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1A2A1A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                SizedBox(width: 12),
                Icon(Icons.search, color: textSecondary, size: 18),
                SizedBox(width: 8),
                Text('Search player or club...', style: TextStyle(color: textSecondary, fontSize: 13)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Club groups
        ..._checkinClubs.map((club) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: const Color(0xFF2A1000),
              child: Row(
                children: [
                  const Icon(Icons.business, color: Colors.orange, size: 16),
                  const SizedBox(width: 8),
                  Text('${club['club']} (${club['count']})',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            // Table header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  SizedBox(width: 24, child: Text('NO', style: TextStyle(color: textSecondary, fontSize: 11))),
                  Expanded(child: Text('CONTESTANT NAME', style: TextStyle(color: textSecondary, fontSize: 11))),
                  Text('HCP  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                  Text('FLIGHT  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                  Text('ATTEND', style: TextStyle(color: textSecondary, fontSize: 11)),
                ],
              ),
            ),
            ...(club['players'] as List).map((p) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  SizedBox(width: 24, child: Text('${p['no']}', style: const TextStyle(color: textSecondary, fontSize: 13))),
                  Expanded(child: Text(p['name'], style: const TextStyle(color: Colors.white, fontSize: 13))),
                  Text('${p['hcp']}  ', style: const TextStyle(color: Colors.white, fontSize: 13)),
                  Container(
                    width: 28, height: 28,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: _flightColor(p['flight']),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Text(p['flight'], style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))),
                  ),
                  Text('✓ ${p['time']}', style: const TextStyle(color: greenLight, fontSize: 12)),
                ],
              ),
            )),
          ],
        )),
      ],
    );
  }

  Color _flightColor(String flight) {
    switch (flight) {
      case 'A': return const Color(0xFF1A3A8A);
      case 'B': return const Color(0xFF8A4A00);
      case 'C': return const Color(0xFF4A4A4A);
      default: return const Color(0xFF1A3A1A);
    }
  }

  Widget _buildPairings() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text('Pairings data akan tersedia setelah flights diatur.',
        style: TextStyle(color: textSecondary)),
    );
  }

  Widget _buildBoard() {
    return Column(
      children: [
        // Header info
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Text('144 players', style: TextStyle(color: Colors.white, fontSize: 13)),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Row(children: const [
                  Icon(Icons.refresh, color: textSecondary, size: 16),
                  SizedBox(width: 4),
                  Text('Refresh', style: TextStyle(color: textSecondary, fontSize: 13)),
                ]),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A1A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(children: const [
                  Icon(Icons.download_outlined, color: Colors.white70, size: 14),
                  SizedBox(width: 4),
                  Text('Export PNG', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ]),
              ),
            ],
          ),
        ),

        // Board card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0A0A1A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF2A2A4A)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    Text('EGT – EXPLORATIONISTS GOLF\nTOURNAMENT 2025',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                    SizedBox(height: 4),
                    Text('Gunung Geulis CC East Course — 20 September 2025 — CR 72',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: textSecondary, fontSize: 11)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: const Color(0xFF0A0A8A),
                child: const Row(
                  children: [
                    Text('FLIGHT LEVEL A 0 – 16',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    Spacer(),
                    Text('(75 players)', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
              ),
              // Table header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  children: [
                    Expanded(child: Text('CLUB', style: TextStyle(color: textSecondary, fontSize: 11))),
                    Text('OUT  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                    Text('IN  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                    Text('TOT  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                    Text('HCP  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                    Text('NETT  ', style: TextStyle(color: textSecondary, fontSize: 11)),
                    Text('REM', style: TextStyle(color: textSecondary, fontSize: 11)),
                  ],
                ),
              ),
              ..._boardData.map((row) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Row(
                  children: [
                    Expanded(child: Text(row['club']!, style: const TextStyle(color: Colors.white, fontSize: 12))),
                    Text('${row['out']}  ', style: const TextStyle(color: Colors.white, fontSize: 12)),
                    Text('${row['in']}  ', style: const TextStyle(color: Colors.white, fontSize: 12)),
                    Text('${row['tot']}  ', style: const TextStyle(color: Colors.white, fontSize: 12)),
                    Text('${row['hcp']}  ', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    Text('${row['nett']}  ', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                    const Text('', style: TextStyle(fontSize: 12)),
                  ],
                ),
              )),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHCP() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [
              Text('HCP Correction — 144 players corrected',
                style: TextStyle(color: Colors.white, fontSize: 13)),
              Spacer(),
            ],
          ),
        ),
        // Summary stats
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _hcpStatBox('144', 'Total\nCorrected'),
              const SizedBox(width: 8),
              _hcpStatBox('-0.1', 'Avg Correction'),
              const SizedBox(width: 8),
              _hcpStatBox('5', 'Flight\nPromotion', greenLight),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Table header
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              SizedBox(width: 32, child: Text('NO', style: TextStyle(color: textSecondary, fontSize: 11))),
              Expanded(child: Text("PLAYER'S NAME", style: TextStyle(color: textSecondary, fontSize: 11))),
              Text('CLUB  ', style: TextStyle(color: textSecondary, fontSize: 11)),
              Text('HCP\nAWAL  ', textAlign: TextAlign.right, style: TextStyle(color: textSecondary, fontSize: 10)),
              Text('HCP\nKOREK', textAlign: TextAlign.right, style: TextStyle(color: textSecondary, fontSize: 10)),
            ],
          ),
        ),
        ..._hcpData.map((p) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox(width: 32, child: Text(p['no']!, style: const TextStyle(color: textSecondary))),
              Expanded(child: Text(p['name']!, style: const TextStyle(color: Colors.white, fontSize: 13))),
              Text('${p['club']}  ', style: const TextStyle(color: textSecondary, fontSize: 12)),
              Text('${p['awal']}  ', style: const TextStyle(color: Colors.white, fontSize: 13)),
              Text(p['koreksi']!, style: const TextStyle(color: greenLight, fontWeight: FontWeight.w600, fontSize: 13)),
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
        decoration: BoxDecoration(
          color: const Color(0xFF111E11),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
            Text(label, style: const TextStyle(color: textSecondary, fontSize: 10), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _actionBtn(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1A2A1A),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: greenLight, size: 22),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _miniStat(String value, String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w700)),
        Text(label, style: const TextStyle(color: textSecondary, fontSize: 11)),
      ],
    );
  }

  Widget _hcpStatBox(String value, String label, [Color? color]) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF111E11),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(color: color ?? Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
            Text(label, style: const TextStyle(color: textSecondary, fontSize: 11), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}