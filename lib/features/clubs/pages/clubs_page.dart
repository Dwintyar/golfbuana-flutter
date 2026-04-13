import 'package:flutter/material.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});
  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  int _tab = 0;
  static const bg = Color(0xFF0A1A0A);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);

  final _myClubs = [
    {'init': 'E', 'name': 'Euphoria', 'type': 'Golf Club', 'members': 79, 'role': 'Owner', 'desc': 'Untuk para penikmat golf yang euforia', 'venue': false},
    {'init': 'GG', 'name': 'Gunung Geulis CC East Course', 'type': 'Golf Venue', 'members': 1, 'role': 'Owner', 'desc': 'Golf venue: Sumedang, Jawa Barat', 'venue': true},
    {'init': 'GG', 'name': 'Gunung Geulis CC West Cour...', 'type': 'Golf Venue', 'members': 1, 'role': 'Owner', 'desc': 'Golf venue: Sumedang, Jawa Barat', 'venue': true},
    {'init': 'JG', 'name': 'Jagorawi Golf & Country Club', 'type': 'Golf Venue', 'members': 1, 'role': 'Owner', 'desc': 'Golf venue: Cibinong, Bogor', 'venue': true},
    {'init': 'MG', 'name': 'Matoa Golf & Garden', 'type': 'Golf Venue', 'members': 1, 'role': 'Owner', 'desc': 'Golf venue: Depok, Jawa Barat', 'venue': true},
    {'init': 'NK', 'name': 'New Kuta Golf Pecatu', 'type': 'Golf Venue', 'members': 1, 'role': 'Owner', 'desc': 'Golf venue: Uluwatu, Bali', 'venue': true},
  ];

  final _discover = [
    {'init': 'TC', 'name': 'The Explorationists Golf Club', 'type': 'Golf Club', 'members': 10, 'desc': 'Klub golf profesional eksplorasi migas'},
    {'init': 'P', 'name': 'Paradjana', 'type': 'Golf Club', 'members': 5, 'desc': 'Club golf Paradjana'},
    {'init': 'BE', 'name': 'Bukit Energy Golf Club', 'type': 'Golf Club', 'members': 25, 'desc': 'Bukit Energy Indonesia Golf Club'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Row(children: [
            Container(width: 28, height: 28,
              decoration: BoxDecoration(color: greenDark, borderRadius: BorderRadius.circular(6)),
              child: const Icon(Icons.hexagon_outlined, color: Colors.white, size: 16)),
            const SizedBox(width: 8),
            const Text('Clubs', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
          ])),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(children: [
            Expanded(child: Container(
              height: 40,
              decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(20)),
              child: const Row(children: [
                SizedBox(width: 12),
                Icon(Icons.search, color: secondary, size: 18),
                SizedBox(width: 8),
                Text('Search clubs...', style: TextStyle(color: secondary, fontSize: 13)),
              ]))),
            const SizedBox(width: 8),
            Container(width: 36, height: 36,
              decoration: const BoxDecoration(color: greenDark, shape: BoxShape.circle),
              child: const Icon(Icons.add, color: Colors.white, size: 20)),
          ])),
        Row(children: [
          _tabBtn('My Clubs (15)', 0),
          _tabBtn('Discover', 1),
        ]),
        const Divider(color: Color(0xFF1A2A1A), height: 1),
        Expanded(child: _tab == 0 ? _buildMyClubs() : _buildDiscover()),
      ])),
    );
  }

  Widget _tabBtn(String label, int idx) {
    final active = _tab == idx;
    return Expanded(child: GestureDetector(
      onTap: () => setState(() => _tab = idx),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(
          color: active ? green : Colors.transparent, width: 2))),
        child: Text(label, textAlign: TextAlign.center,
          style: TextStyle(color: active ? green : secondary,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400, fontSize: 14)))));
  }

  Widget _buildMyClubs() {
    return ListView.separated(
      itemCount: _myClubs.length,
      separatorBuilder: (_, __) => const Divider(color: Color(0xFF1A2A1A), height: 1),
      itemBuilder: (_, i) {
        final c = _myClubs[i];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => ClubDetailPage(club: c))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(children: [
              Container(width: 48, height: 48,
                decoration: BoxDecoration(
                  color: c['venue'] == true ? const Color(0xFF0A2A0A) : const Color(0xFF1A1A3A),
                  borderRadius: BorderRadius.circular(10)),
                child: Center(child: c['init'] == 'E' && c['venue'] == false
                  ? const Icon(Icons.hexagon_outlined, color: green, size: 28)
                  : Text(c['init'] as String, style: const TextStyle(color: green, fontWeight: FontWeight.w700, fontSize: 14)))),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c['name'] as String,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                Row(children: [
                  if (c['venue'] == true) const Text('⛳ ', style: TextStyle(fontSize: 12)),
                  Text('${c['type']} · ${c['members']} ${c['members'] == 1 ? 'staff' : 'members'} · ${c['role']}',
                    style: const TextStyle(color: secondary, fontSize: 12)),
                ]),
                Text(c['desc'] as String, style: const TextStyle(color: secondary, fontSize: 12)),
              ])),
              const Icon(Icons.chevron_right, color: secondary, size: 20),
            ])));
      });
  }

  Widget _buildDiscover() {
    return ListView.separated(
      itemCount: _discover.length,
      separatorBuilder: (_, __) => const Divider(color: Color(0xFF1A2A1A), height: 1),
      itemBuilder: (_, i) {
        final c = _discover[i];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(children: [
            Container(width: 48, height: 48,
              decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text(c['init'] as String,
                style: const TextStyle(color: green, fontWeight: FontWeight.w700, fontSize: 14)))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(c['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
              Text('${c['type']} · ${c['members']} members', style: const TextStyle(color: secondary, fontSize: 12)),
              Text(c['desc'] as String, style: const TextStyle(color: secondary, fontSize: 12)),
            ])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(color: greenDark, borderRadius: BorderRadius.circular(16)),
              child: const Text('Join', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600))),
          ]));
      });
  }
}

// ── Club Detail Page ──────────────────────────────────────────
class ClubDetailPage extends StatefulWidget {
  final Map<String, dynamic> club;
  const ClubDetailPage({super.key, required this.club});
  @override
  State<ClubDetailPage> createState() => _ClubDetailPageState();
}

class _ClubDetailPageState extends State<ClubDetailPage> {
  int _tab = 0;
  static const bg = Color(0xFF0A1A0A);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);

  bool get isVenue => widget.club['venue'] == true;

  final _members = [
    {'init': 'D', 'name': 'dwintyar', 'role': 'Owner', 'roleColor': 0xFF2E7D32},
    {'init': 'AL', 'name': 'Achmad Luthfi', 'role': 'Admin', 'roleColor': 0xFF8B4513},
    {'init': 'RS', 'name': 'Ridwan Sulaiman', 'role': 'Admin', 'roleColor': 0xFF8B4513},
    {'init': 'SA', 'name': 'Syamsu Alam', 'role': 'Member', 'roleColor': 0xFF1A3A1A},
    {'init': 'WA', 'name': 'Witan Arjakusumah', 'role': 'Member', 'roleColor': 0xFF1A3A1A},
  ];

  final _tournaments = [
    {'name': 'EGT – Explorationists Golf To...', 'year': '2025', 'type': 'Interclub'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
          const SizedBox(height: 52),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              GestureDetector(onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white)),
              const Spacer(),
              const Icon(Icons.person_add_outlined, color: secondary, size: 22),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (_) => ClubAdminPage(club: widget.club))),
                child: const Icon(Icons.settings_outlined, color: secondary, size: 22)),
            ])),
          const SizedBox(height: 20),
          Container(width: 80, height: 80,
            decoration: BoxDecoration(
              color: isVenue ? const Color(0xFF0A2A0A) : const Color(0xFF1A1A3A),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF2A4A2A), width: 2)),
            child: Center(child: Text(widget.club['init'] as String,
              style: const TextStyle(color: green, fontWeight: FontWeight.w700, fontSize: 22)))),
          const SizedBox(height: 12),
          Text(widget.club['name'] as String,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(widget.club['type'] as String, style: const TextStyle(color: secondary, fontSize: 13)),
            Text(' · ', style: const TextStyle(color: secondary)),
            Text('${widget.club['members']} members', style: const TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 13)),
          ]),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              isVenue
                ? 'Golf venue di ${widget.club['desc'].toString().replaceAll('Golf venue: ', '')}'
                : 'Klub golf profesional eksplorasi migas Indonesia. Forum silaturahmi dan kompetisi golf antar perusahaan eksplorasi sejak 2011.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: secondary, fontSize: 13, height: 1.5))),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _badge('📢 Channel', const Color(0xFF1A2A1A), Colors.white),
            const SizedBox(width: 8),
            _badge('👑 Owner', const Color(0xFF2A1A00), Colors.orange),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => ClubAdminPage(club: widget.club))),
              child: _badge('⚙️ Admin', const Color(0xFF2A2A2A), Colors.white70)),
          ]),
          const SizedBox(height: 16),
          Row(children: [
            _tab2('Members', 0),
            _tab2('Tournaments', 1),
          ]),
          const Divider(color: Color(0xFF1A2A1A), height: 1),
        ])),
        SliverToBoxAdapter(child: _tab == 0 ? _buildMembers() : _buildTournaments()),
      ]),
    );
  }

  Widget _badge(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: fg, fontSize: 13, fontWeight: FontWeight.w600)));
  }

  Widget _tab2(String label, int idx) {
    final active = _tab == idx;
    return Expanded(child: GestureDetector(
      onTap: () => setState(() => _tab = idx),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(
          color: active ? green : Colors.transparent, width: 2))),
        child: Text(label, textAlign: TextAlign.center,
          style: TextStyle(color: active ? green : secondary,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400, fontSize: 14)))));
  }

  Widget _buildMembers() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Container(height: 40,
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(20)),
          child: const Row(children: [
            SizedBox(width: 12),
            Icon(Icons.search, color: secondary, size: 18),
            SizedBox(width: 8),
            Text('Type a name...', style: TextStyle(color: secondary, fontSize: 13)),
          ]))),
      ..._members.map((m) => Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(children: [
            Container(width: 42, height: 42,
              decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
              child: Center(child: Text(m['init'] as String,
                style: const TextStyle(color: green, fontWeight: FontWeight.w600)))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(m['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14)),
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(color: Color(m['roleColor'] as int), borderRadius: BorderRadius.circular(8)),
                  child: Text(m['role'] as String, style: const TextStyle(color: Colors.white, fontSize: 11))),
              ]),
            ])),
            const Icon(Icons.mail_outline, color: green, size: 18),
          ])),
        const Divider(color: Color(0xFF1A2A1A), height: 1),
      ])),
    ]);
  }

  Widget _buildTournaments() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        ..._tournaments.map((t) => GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => const TourDetailPage())),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Container(width: 44, height: 44,
                decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.emoji_events_outlined, color: green, size: 22)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(t['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                Text('${t['year']} · ${t['type']}', style: const TextStyle(color: secondary, fontSize: 12)),
              ])),
              const Icon(Icons.chevron_right, color: secondary),
            ]))),
        ),
      ]));
  }
}

// ── Club Admin Page ───────────────────────────────────────────
class ClubAdminPage extends StatefulWidget {
  final Map<String, dynamic> club;
  const ClubAdminPage({super.key, required this.club});
  @override
  State<ClubAdminPage> createState() => _ClubAdminPageState();
}

class _ClubAdminPageState extends State<ClubAdminPage> {
  int _tab = 0;
  static const bg = Color(0xFF0A1A0A);
  static const green = Color(0xFF66BB6A);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);

  bool get isVenue => widget.club['venue'] == true;
  final tabs = ['Members', 'Tournaments', 'Announcements', 'Settings'];
  final venueTabs = ['Staff', 'Schedule', 'Course', 'Settings'];

  List<String> get currentTabs => isVenue ? venueTabs : tabs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(children: [
            GestureDetector(onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back, color: Colors.white)),
            const SizedBox(width: 12),
            Expanded(child: Text(
              'Admin — ${widget.club['name'].toString().length > 20 ? widget.club['name'].toString().substring(0, 20) + '...' : widget.club['name']}',
              style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(16)),
              child: Text(isVenue ? 'Golf Venue' : 'Community', style: const TextStyle(color: Colors.white70, fontSize: 12))),
          ])),
        // Club selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
            child: Row(children: [
              Expanded(child: Text('${widget.club['name']} (owner)',
                style: const TextStyle(color: Colors.white70, fontSize: 13))),
              const Icon(Icons.keyboard_arrow_down, color: secondary),
            ]))),
        const SizedBox(height: 8),
        // Breadcrumb
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: const Color(0xFF2A1500), borderRadius: BorderRadius.circular(8)),
            child: Row(children: [
              const Icon(Icons.circle, color: Colors.orange, size: 10),
              const SizedBox(width: 8),
              const Text('CLUB ADMIN', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w700, fontSize: 12)),
              const Text(' › ', style: TextStyle(color: secondary)),
              Expanded(child: Text(widget.club['name'] as String,
                style: const TextStyle(color: Colors.orange, fontSize: 12))),
            ]))),
        const SizedBox(height: 12),
        // Stat cards
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: isVenue ? _buildVenueStats() : _buildClubStats()),
        const SizedBox(height: 12),
        // Tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: List.generate(currentTabs.length, (i) {
            final active = _tab == i;
            return GestureDetector(
              onTap: () => setState(() => _tab = i),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: active ? const Color(0xFF2A3A2A) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
                child: Text(currentTabs[i], style: TextStyle(
                  color: active ? Colors.white : secondary,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400, fontSize: 13))));
          }))),
        const SizedBox(height: 4),
        const Divider(color: Color(0xFF1A2A1A), height: 1),
        Expanded(child: _buildTabContent()),
      ])),
    );
  }

  Widget _buildClubStats() {
    return Column(children: [
      Row(children: [
        _statCard('10', 'Members', Icons.people_outline, green),
        const SizedBox(width: 8),
        _statCard('1', 'Tournaments', Icons.emoji_events_outlined, Colors.orange),
      ]),
      const SizedBox(height: 8),
      Row(children: [
        _statCard('—', 'Announcements', Icons.campaign_outlined, green),
        const SizedBox(width: 8),
        _statCard('0', 'Pending', Icons.notifications_outlined, Colors.orange),
      ]),
    ]);
  }

  Widget _buildVenueStats() {
    return Column(children: [
      Row(children: [
        _statCard('1', 'Members', Icons.people_outline, green),
        const SizedBox(width: 8),
        _statCard('0', 'Staff', Icons.badge_outlined, Colors.orange),
      ]),
      const SizedBox(height: 8),
      Row(children: [
        _statCard('0', 'Bookings Today', Icons.calendar_today_outlined, green),
        const SizedBox(width: 8),
        _statCard('0', 'Pending', Icons.notifications_outlined, Colors.orange),
      ]),
    ]);
  }

  Widget _statCard(String value, String label, IconData icon, Color color) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
        Text(label, style: const TextStyle(color: secondary, fontSize: 11)),
      ])));
  }

  Widget _buildTabContent() {
    if (isVenue) {
      switch (_tab) {
        case 0: return _buildStaff();
        case 1: return _buildSchedule();
        case 2: return _buildCourse();
        case 3: return _buildSettings();
        default: return const SizedBox();
      }
    } else {
      switch (_tab) {
        case 0: return _buildAdminMembers();
        case 1: return _buildAdminTournaments();
        case 2: return _buildAnnouncements();
        case 3: return _buildSettings();
        default: return const SizedBox();
      }
    }
  }

  Widget _buildAdminMembers() {
    final members = [
      {'init': 'D', 'name': 'dwintyar', 'role': 'owner'},
      {'init': 'A', 'name': 'Achmad Luthfi', 'role': 'admin'},
      {'init': 'R', 'name': 'Ridwan Sulaiman', 'role': 'member'},
    ];
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.add, color: secondary, size: 18),
          SizedBox(width: 8),
          Text('Invite Member', style: TextStyle(color: secondary)),
        ])),
      Container(height: 40, margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(20)),
        child: const Row(children: [
          SizedBox(width: 12),
          Icon(Icons.search, color: secondary, size: 18),
          SizedBox(width: 8),
          Text('Search members...', style: TextStyle(color: secondary, fontSize: 13)),
        ])),
      Row(children: [
        const Text('10 member', style: TextStyle(color: secondary, fontSize: 12)),
        const Spacer(),
        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(12)),
          child: const Text('By Role', style: TextStyle(color: Colors.white, fontSize: 12))),
        const SizedBox(width: 8),
        const Text('A-Z', style: TextStyle(color: secondary, fontSize: 12)),
      ]),
      const SizedBox(height: 8),
      ...members.map((m) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Container(width: 40, height: 40,
            decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
            child: Center(child: Text(m['init']!, style: const TextStyle(color: green, fontWeight: FontWeight.w600)))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(m['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
            Container(margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: m['role'] == 'owner' ? const Color(0xFF2E7D32) : const Color(0xFF8B4513),
                borderRadius: BorderRadius.circular(8)),
              child: Text(m['role']!, style: const TextStyle(color: Colors.white, fontSize: 11))),
          ])),
          const Icon(Icons.chevron_right, color: secondary),
        ]))),
    ]);
  }

  Widget _buildAdminTournaments() {
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.add, color: secondary, size: 18),
          SizedBox(width: 8),
          Text('Create Tournament', style: TextStyle(color: secondary)),
        ])),
      GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TourDetailPage())),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('EGT – Explorationists Golf Tourname...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Row(children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(border: Border.all(color: secondary), borderRadius: BorderRadius.circular(8)),
                child: const Text('interclub', style: TextStyle(color: secondary, fontSize: 11))),
              const SizedBox(width: 6),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(border: Border.all(color: secondary), borderRadius: BorderRadius.circular(8)),
                child: const Text('2025', style: TextStyle(color: secondary, fontSize: 11))),
              const SizedBox(width: 6),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: const Color(0xFF1A3A00), borderRadius: BorderRadius.circular(8)),
                child: const Text('Organizer', style: TextStyle(color: green, fontSize: 11))),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down, color: secondary),
            ]),
            const SizedBox(height: 6),
            const Text('12 events · 1728 players', style: TextStyle(color: secondary, fontSize: 12)),
          ]))),
    ]);
  }

  Widget _buildAnnouncements() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 12),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.add, color: secondary, size: 18),
            SizedBox(width: 8),
            Text('New Announcement', style: TextStyle(color: secondary)),
          ])),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: const Column(children: [
            Icon(Icons.campaign_outlined, color: secondary, size: 40),
            SizedBox(height: 12),
            Text('No announcements yet', style: TextStyle(color: Colors.white70, fontSize: 14)),
          ])),
      ]));
  }

  Widget _buildSettings() {
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.business_outlined, color: green, size: 18),
            SizedBox(width: 8),
            Text('Club Identity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 16),
          const Text('Club Name', style: TextStyle(color: secondary, fontSize: 12)),
          const SizedBox(height: 6),
          Container(padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(8)),
            child: Text(widget.club['name'] as String, style: const TextStyle(color: Colors.white))),
          const SizedBox(height: 12),
          const Text('Description', style: TextStyle(color: secondary, fontSize: 12)),
          const SizedBox(height: 6),
          Container(padding: const EdgeInsets.all(12), height: 80,
            decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(8)),
            child: const Text('Klub golf profesional eksplorasi migas Indonesia.',
              style: TextStyle(color: Colors.white70))),
          const SizedBox(height: 12),
          const Text('Contact Phone', style: TextStyle(color: secondary, fontSize: 12)),
          const SizedBox(height: 6),
          Container(padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(8)),
            child: const SizedBox(height: 18)),
          const SizedBox(height: 16),
          Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(10)),
            child: const Text('Save Changes', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
        ])),
      const SizedBox(height: 12),
      if (!isVenue) ...[
        Container(padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              Icon(Icons.shield_outlined, color: green, size: 18),
              SizedBox(width: 8),
              Text('Admin Management', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 12),
            ...['Ridwan Sulaiman', 'Syamsu Alam', 'Achmad Luthfi'].map((name) =>
              Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Container(width: 32, height: 32,
                    decoration: const BoxDecoration(color: Color(0xFF8B4513), shape: BoxShape.circle),
                    child: Center(child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)))),
                  const SizedBox(width: 10),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(name, style: const TextStyle(color: Colors.white, fontSize: 13)),
                    Container(margin: const EdgeInsets.only(top: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(color: const Color(0xFF8B4513), borderRadius: BorderRadius.circular(4)),
                      child: const Text('admin', style: TextStyle(color: Colors.white, fontSize: 10))),
                  ])),
                  const Text('Demote', style: TextStyle(color: secondary, fontSize: 12)),
                ]))),
          ])),
        const SizedBox(height: 12),
        Container(padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: card, borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.red.withOpacity(0.3))),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              Icon(Icons.warning_outlined, color: Colors.red, size: 18),
              SizedBox(width: 8),
              Text('Danger Zone', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 8),
            const Text('Club akan diarsipkan. Member tidak bisa bergabung baru. Data tetap tersimpan.',
              style: TextStyle(color: secondary, fontSize: 13)),
            const SizedBox(height: 12),
            Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(border: Border.all(color: Colors.red.withOpacity(0.5)), borderRadius: BorderRadius.circular(8)),
              child: const Text('Archive Club', textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600))),
          ])),
      ],
      if (isVenue) ...[
        Container(padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Container(padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: const Color(0xFF0A1A0A), borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                const SizedBox(width: 60, height: 50, child: Icon(Icons.landscape_outlined, color: green, size: 32)),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(widget.club['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  const Text('Par 72 · 18 holes', style: TextStyle(color: secondary, fontSize: 12)),
                ])),
              ]),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(8)),
                child: const Text('View Course', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)))),
              const SizedBox(width: 8),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(8)),
                child: const Text('Manage Tee Times', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)))),
            ]),
          ])),
      ],
    ]);
  }

  Widget _buildStaff() {
    return const Center(child: Text('No staff yet', style: TextStyle(color: secondary)));
  }

  Widget _buildSchedule() {
    return const Center(child: Text('Schedule coming soon', style: TextStyle(color: secondary)));
  }

  Widget _buildCourse() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Row(children: [
              Container(width: 60, height: 60,
                decoration: BoxDecoration(color: const Color(0xFF0A2A0A), borderRadius: BorderRadius.circular(8)),
                child: const Icon(Icons.landscape_outlined, color: green, size: 32)),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(widget.club['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                const Text('Par 72 · 18 holes', style: TextStyle(color: secondary, fontSize: 12)),
              ])),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(8)),
                child: const Text('View Course', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)))),
              const SizedBox(width: 8),
              Expanded(child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(8)),
                child: const Text('Manage Tee Times', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)))),
            ]),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFF0A1A0A), borderRadius: BorderRadius.circular(8)),
                child: const Column(children: [
                  Icon(Icons.calendar_today_outlined, color: green, size: 20),
                  SizedBox(height: 4),
                  Text('0', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  Text('Bookings Today', style: TextStyle(color: secondary, fontSize: 11)),
                ]))),
              const SizedBox(width: 8),
              Expanded(child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFF0A1A0A), borderRadius: BorderRadius.circular(8)),
                child: const Column(children: [
                  Icon(Icons.date_range_outlined, color: Colors.orange, size: 20),
                  SizedBox(height: 4),
                  Text('0', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
                  Text('This Week', style: TextStyle(color: secondary, fontSize: 11)),
                ]))),
            ]),
          ])),
      ]));
  }
}

// ── Tour Detail Page ──────────────────────────────────────────
class TourDetailPage extends StatefulWidget {
  const TourDetailPage({super.key});
  @override
  State<TourDetailPage> createState() => _TourDetailPageState();
}

class _TourDetailPageState extends State<TourDetailPage> {
  int _tab = 0;
  static const bg = Color(0xFF0A1A0A);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);
  final tabs = ['Events', 'Leaderboard', 'Players', 'Clubs'];

  final _events = [
    {'name': 'EGT 2025 #01 – Janua...', 'date': 'Minggu, 19 Januari 2025', 'venue': 'Jagorawi Golf & Country Club', 'status': 'Done'},
    {'name': 'EGT 2025 #02 – Febru...', 'date': 'Minggu, 16 Februari 2025', 'venue': 'Riverside Golf Club', 'status': 'Done'},
    {'name': 'EGT 2025 #03 – Maret...', 'date': 'Minggu, 16 Maret 2025', 'venue': 'Palm Hill Golf Club', 'status': 'Done'},
    {'name': 'EGT 2025 #04 – April ...', 'date': 'Minggu, 20 April 2025', 'venue': 'Permata Sentul', 'status': 'Done'},
  ];

  final _leaderboard = [
    {'init': 'HS', 'name': 'Heru Sancoyo', 'club': 'Schlumberger Geo...', 'gp': '1/12', 'net': 68, 'avg': 68},
    {'init': 'GB', 'name': 'Gord Begg', 'club': 'Bukit Energy Indon...', 'gp': '1/12', 'net': 75, 'avg': 75},
    {'init': 'KK', 'name': 'Koichi Kihara', 'club': 'INPEX Corporation', 'gp': '1/12', 'net': 76, 'avg': 76},
    {'init': 'YY', 'name': 'Yoshifumi Yoshid...', 'club': 'Kangean Energy In...', 'gp': '1/12', 'net': 77, 'avg': 77},
    {'init': 'EH', 'name': 'Eamon Hurley', 'club': 'Bukit Energy Indon...', 'gp': '1/12', 'net': 79, 'avg': 79},
  ];

  final _clubs = [
    {'init': 'A', 'name': 'Apexindo Pratama Duta,...', 'quota': 4, 'players': 8},
    {'init': 'B', 'name': 'Baker Hughes Indonesia...', 'quota': 4, 'players': 15},
    {'init': 'B', 'name': 'Bukit Energy Indonesia ...', 'quota': 4, 'players': 11},
    {'init': 'C', 'name': 'Chevron Pacific Indonesi...', 'quota': 4, 'players': 5},
    {'init': 'C', 'name': 'CNOOC SES Ltd.', 'quota': 4, 'players': 8},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Column(children: [
          const SizedBox(height: 52),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              GestureDetector(onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white)),
              const Spacer(),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(border: Border.all(color: Colors.orange.withOpacity(0.5)), borderRadius: BorderRadius.circular(16)),
                child: const Text('🔒 Private', style: TextStyle(color: Colors.orange, fontSize: 12))),
            ])),
          const SizedBox(height: 16),
          Container(width: 72, height: 72,
            decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(16)),
            child: const Icon(Icons.emoji_events_outlined, color: green, size: 36)),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text('EGT – Explorationists Golf Tournament 2025',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700))),
          const SizedBox(height: 4),
          const Text('The Explorationists Golf Club · 2025', style: TextStyle(color: secondary, fontSize: 13)),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text('Annual EGC Tournament 2027 – 12 events, 39 member clubs, 144 contestants per event',
              textAlign: TextAlign.center, style: TextStyle(color: secondary, fontSize: 12))),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _pill('Interclub', Colors.white24, Colors.white70),
            const SizedBox(width: 8),
            _pill('👑 Organizer', const Color(0xFF2A1500), Colors.orange),
            const SizedBox(width: 8),
            _pill('👥 38 clubs', Colors.white12, Colors.white70),
          ]),
          const SizedBox(height: 16),
          // Action grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              Row(children: [
                _actionBox(Icons.calendar_month_outlined, 'New Event'),
                const SizedBox(width: 8),
                _actionBox(Icons.person_add_outlined, 'Register'),
                const SizedBox(width: 8),
                _actionBox(Icons.layers_outlined, 'Flights'),
              ]),
              const SizedBox(height: 8),
              Row(children: [
                _actionBox(Icons.emoji_events_outlined, 'Categories'),
                const SizedBox(width: 8),
                _actionBox(Icons.description_outlined, 'Invitation'),
                const SizedBox(width: 8),
                _actionBox(Icons.group_add_outlined, 'Invite Club'),
              ]),
            ])),
          const SizedBox(height: 12),
          // Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: List.generate(tabs.length, (i) {
              final active = _tab == i;
              return GestureDetector(
                onTap: () => setState(() => _tab = i),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(
                    color: active ? green : Colors.transparent, width: 2))),
                  child: Text(tabs[i], style: TextStyle(
                    color: active ? green : secondary,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400, fontSize: 14))));
            }))),
          const Divider(color: Color(0xFF1A2A1A), height: 1),
        ])),
        SliverToBoxAdapter(child: _buildTabContent()),
      ]),
    );
  }

  Widget _pill(String text, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Text(text, style: TextStyle(color: fg, fontSize: 12)));
  }

  Widget _actionBox(IconData icon, String label) {
    return Expanded(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Icon(icon, color: green, size: 24),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
      ])));
  }

  Widget _buildTabContent() {
    switch (_tab) {
      case 0: return _buildEvents();
      case 1: return _buildLeaderboard();
      case 2: return _buildPlayers();
      case 3: return _buildClubsTab();
      default: return const SizedBox();
    }
  }

  Widget _buildEvents() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: _events.map((e) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(e['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Row(children: [
              const Icon(Icons.calendar_today_outlined, size: 11, color: secondary),
              const SizedBox(width: 4),
              Text(e['date']!, style: const TextStyle(color: secondary, fontSize: 11)),
            ]),
            Row(children: [
              const Icon(Icons.location_on_outlined, size: 11, color: secondary),
              const SizedBox(width: 4),
              Text(e['venue']!, style: const TextStyle(color: secondary, fontSize: 11)),
            ]),
          ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF1A3A00), borderRadius: BorderRadius.circular(12)),
            child: Text(e['status']!, style: const TextStyle(color: green, fontSize: 11))),
          const SizedBox(width: 4),
          const Icon(Icons.edit_outlined, color: secondary, size: 14),
          const SizedBox(width: 4),
          const Icon(Icons.delete_outline, color: Colors.red, size: 14),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, color: secondary, size: 16),
        ]))).toList()));
  }

  Widget _buildLeaderboard() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
          child: const Row(children: [
            Icon(Icons.location_on_outlined, color: green, size: 16),
            SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Posisi Anda', style: TextStyle(color: secondary, fontSize: 12)),
              Text('#23 · Net 233 · Avg 77.7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ]),
            Spacer(),
            Text('Main 3/12', style: TextStyle(color: secondary, fontSize: 12)),
          ])),
        Row(children: const [
          SizedBox(width: 32, child: Text('#', style: TextStyle(color: secondary, fontSize: 11))),
          Expanded(child: Text('PLAYER', style: TextStyle(color: secondary, fontSize: 11))),
          Text('GP  ', style: TextStyle(color: secondary, fontSize: 11)),
          Text('NET  ', style: TextStyle(color: secondary, fontSize: 11)),
          Text('AVG', style: TextStyle(color: secondary, fontSize: 11)),
        ]),
        const SizedBox(height: 8),
        ..._leaderboard.asMap().entries.map((e) {
          final i = e.key;
          final p = e.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(children: [
              SizedBox(width: 32, child: i < 3
                ? Text(['🥇','🥈','🥉'][i], style: const TextStyle(fontSize: 16))
                : Text('${i+1}', style: const TextStyle(color: secondary))),
              Container(width: 36, height: 36, margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
                child: Center(child: Text(p['init'] as String, style: const TextStyle(color: green, fontSize: 11, fontWeight: FontWeight.w600)))),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(p['name'] as String, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                Text(p['club'] as String, style: const TextStyle(color: secondary, fontSize: 11)),
              ])),
              Text('${p['gp']}  ', style: const TextStyle(color: secondary, fontSize: 13)),
              Text('${p['net']}  ', style: const TextStyle(color: green, fontWeight: FontWeight.w700, fontSize: 14)),
              Text('${p['avg']}', style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ]));
        }),
      ]));
  }

  Widget _buildPlayers() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text('170 players · 37 clubs', style: TextStyle(color: secondary)));
  }

  Widget _buildClubsTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
          child: const Text('38 Clubs · 170 Players registered · 138 Total quota',
            style: TextStyle(color: Colors.white70, fontSize: 13))),
        ..._clubs.map((c) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(width: 32, height: 32,
                decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
                child: Center(child: Text(c['init'] as String, style: const TextStyle(color: green, fontWeight: FontWeight.w600)))),
              const SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c['name'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                Text('Quota: ${c['quota']} · Players: ${c['players']} / ${c['quota']}',
                  style: const TextStyle(color: secondary, fontSize: 12)),
              ])),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(border: Border.all(color: green), borderRadius: BorderRadius.circular(8)),
                child: const Text('accepted', style: TextStyle(color: green, fontSize: 11))),
            ]),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: 1.0, backgroundColor: const Color(0xFF1A2A1A),
              valueColor: const AlwaysStoppedAnimation(green)),
          ]))),
      ]));
  }
}
