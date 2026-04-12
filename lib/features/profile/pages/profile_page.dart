import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _tabIndex = 0;
  static const bg = Color(0xFF0A1A0A);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);
  final tabs = ['About', 'Clubs', 'Stats', 'Gallery', 'Bookings'];

  void _showSettings() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A2A1A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => _SettingsSheet(onAdmin: () {
        Navigator.pop(context);
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AdminDashboardPage()));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(children: [
            const SizedBox(height: 52),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                Row(children: [
                  Container(width: 28, height: 28,
                    decoration: BoxDecoration(color: greenDark, borderRadius: BorderRadius.circular(6)),
                    child: const Icon(Icons.hexagon_outlined, color: Colors.white, size: 16)),
                  const SizedBox(width: 8),
                  const Text('Profile', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
                ]),
                const Spacer(),
                GestureDetector(onTap: _showSettings,
                  child: const Icon(Icons.settings_outlined, color: secondary, size: 24)),
              ]),
            ),
            const SizedBox(height: 24),
            Stack(alignment: Alignment.bottomRight, children: [
              Container(width: 96, height: 96,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  border: Border.all(color: greenDark, width: 2),
                  color: const Color(0xFF1A3A1A)),
                child: const Icon(Icons.person, color: green, size: 52)),
              Container(padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: greenDark, shape: BoxShape.circle),
                child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 14)),
            ]),
            const SizedBox(height: 12),
            const Text('dwintyar', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            const Text('ANDROMEDA GALAXY', style: TextStyle(color: secondary, fontSize: 12, letterSpacing: 1.2)),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(border: Border.all(color: green), borderRadius: BorderRadius.circular(24)),
                child: const Text('Ref HCP 13.0', style: TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 14))),
              const SizedBox(width: 12),
              Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white24), borderRadius: BorderRadius.circular(24)),
                child: const Text('15 CLUBS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14))),
            ]),
            const SizedBox(height: 6),
            const Text('Updated -615 days ago', style: TextStyle(color: secondary, fontSize: 12)),
            const SizedBox(height: 20),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(children: List.generate(tabs.length, (i) {
                final active = _tabIndex == i;
                return GestureDetector(onTap: () => setState(() => _tabIndex = i),
                  child: Container(padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(
                      color: active ? green : Colors.transparent, width: 2))),
                    child: Text(tabs[i], style: TextStyle(
                      color: active ? green : secondary,
                      fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 14))));
              }))),
            const Divider(color: Color(0xFF1A2A1A), height: 1),
          ])),
          SliverToBoxAdapter(child: _buildTab()),
        ],
      ),
    );
  }

  Widget _buildTab() {
    switch (_tabIndex) {
      case 0: return _buildAbout();
      case 1: return _buildClubs();
      case 2: return _buildStats();
      case 3: return _buildGallery();
      case 4: return _buildBookings();
      default: return const SizedBox();
    }
  }

  Widget _buildAbout() {
    return Padding(padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('App Inventor', style: TextStyle(color: secondary, fontStyle: FontStyle.italic, fontSize: 14)),
        const SizedBox(height: 12),
        _infoCard(Icons.language_outlined, 'No website linked'),
        const SizedBox(height: 8),
        _infoCard(Icons.mail_outline, 'Contact via Message'),
        const SizedBox(height: 16),
        Container(padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              Icon(Icons.trending_down, color: green, size: 18),
              SizedBox(width: 8),
              Text('Handicap History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            ]),
            const SizedBox(height: 16),
            SizedBox(height: 60, child: CustomPaint(painter: _HcpChartPainter(), size: Size.infinite)),
          ])),
      ]));
  }

  Widget _infoCard(IconData icon, String text) {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        Icon(icon, color: secondary, size: 20),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ]));
  }

  Widget _buildClubs() {
    final clubs = ['Matoa Golf & Garden', 'Nirwana Bali Golf Cl...', 'Permata Sentul', 'Geopost'];
    final initials = ['M', 'N', 'P', 'G'];
    return Padding(padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1),
        itemCount: clubs.length,
        itemBuilder: (_, i) => Container(
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(initials[i], style: const TextStyle(color: green, fontSize: 36, fontWeight: FontWeight.w300)),
            const SizedBox(height: 8),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(clubs[i], textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70, fontSize: 12))),
          ]))));
  }

  Widget _buildStats() {
    return Padding(padding: const EdgeInsets.all(16),
      child: Container(padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const Icon(Icons.emoji_events_outlined, color: green, size: 18),
            const SizedBox(width: 8),
            const Text('Tournament History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            const Spacer(),
            const Text('2 tournament', style: TextStyle(color: secondary, fontSize: 12)),
          ]),
          const SizedBox(height: 12),
          Container(padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF0A1A0A), borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('EGT – Explorationists Golf To...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
                SizedBox(height: 4),
                Text('2025 · interclub · The Explorationists Golf Club', style: TextStyle(color: secondary, fontSize: 11)),
              ])),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('Tour HCP', style: TextStyle(color: secondary, fontSize: 11)),
                Text('14 → 8', style: TextStyle(color: green, fontWeight: FontWeight.w700, fontSize: 14)),
              ]),
            ])),
          const SizedBox(height: 8),
          _eventRow('EGT 2025 #12 – Desember (Sen...)', '2025-12-13 · Sentul Highland Golf Club', 8, 47, 41, 88, 82),
          const SizedBox(height: 8),
          _eventRow('EGT 2025 #11 – November (BSD...)', '2025-11-15 · The Green BSD City', 8, null, null, null, null),
        ])));
  }

  Widget _eventRow(String name, String sub, int hcp, int? out, int? inn, int? gross, int? nett) {
    return Container(padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF0A1A0A), borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500))),
          const Icon(Icons.receipt_long_outlined, color: secondary, size: 14),
          const SizedBox(width: 4),
          const Text('HCP', style: TextStyle(color: secondary, fontSize: 11)),
          const SizedBox(width: 4),
          Text('$hcp', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
        ]),
        const SizedBox(height: 4),
        Text(sub, style: const TextStyle(color: secondary, fontSize: 11)),
        if (out != null) ...[
          const SizedBox(height: 8),
          Row(children: [
            _score('OUT', '$out'), const SizedBox(width: 16),
            _score('IN', '$inn'), const SizedBox(width: 16),
            _score('GROSS', '$gross'), const SizedBox(width: 16),
            _score('NETT', '$nett'),
          ]),
        ],
      ]));
  }

  Widget _score(String label, String value) {
    return Column(children: [
      Text(label, style: const TextStyle(color: secondary, fontSize: 10)),
      Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
    ]);
  }

  Widget _buildGallery() {
    return Padding(padding: const EdgeInsets.all(16),
      child: Column(children: [
        Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.camera_alt_outlined, color: secondary, size: 18),
            SizedBox(width: 8),
            Text('Add Photo', style: TextStyle(color: secondary, fontSize: 14)),
          ])),
        const SizedBox(height: 60),
        const Icon(Icons.camera_alt_outlined, color: Color(0xFF2A4A2A), size: 48),
        const SizedBox(height: 16),
        const Text('No photos yet', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        const Text('Tap tombol di atas untuk tambah foto pertama.', textAlign: TextAlign.center,
          style: TextStyle(color: secondary, fontSize: 13)),
      ]));
  }

  Widget _buildBookings() {
    return const Padding(padding: EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Column(children: [
        Text('📅', style: TextStyle(fontSize: 48)),
        SizedBox(height: 16),
        Text('No bookings', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
        SizedBox(height: 8),
        Text('Book tee time di lapangan pilihan Anda melalui tab Venues.',
          textAlign: TextAlign.center, style: TextStyle(color: secondary, fontSize: 13)),
      ]));
  }
}

class _SettingsSheet extends StatefulWidget {
  final VoidCallback onAdmin;
  const _SettingsSheet({required this.onAdmin});
  @override
  State<_SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends State<_SettingsSheet> {
  bool _darkMode = true;
  static const secondary = Color(0xFF9E9E9E);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          const Text('Settings', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          const Spacer(),
          GestureDetector(onTap: () => Navigator.pop(context),
            child: const Icon(Icons.close, color: secondary)),
        ]),
        const SizedBox(height: 24),
        _item(Icons.settings_outlined, Colors.green, 'Edit Profile', 'Update name, bio, and photo', onTap: () {}),
        const SizedBox(height: 16),
        _item(Icons.shield_outlined, Colors.green, 'Change Password', 'Update your account password', onTap: () {}),
        const SizedBox(height: 16),
        _itemToggle(Icons.wb_sunny_outlined, Colors.orange, 'Dark Mode', 'Switch to dark', _darkMode, (v) => setState(() => _darkMode = v)),
        const SizedBox(height: 16),
        _item(Icons.notifications_outlined, Colors.amber, 'Push Notifications', 'Manage notification permissions', onTap: () {}),
        const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: Color(0xFF2A3A2A))),
        _item(Icons.admin_panel_settings_outlined, Colors.red, 'Admin Dashboard', 'Platform administration', textColor: Colors.red, onTap: widget.onAdmin),
        const SizedBox(height: 16),
        _item(Icons.logout, Colors.deepOrange, 'Sign Out', 'Sign out of your account', textColor: Colors.deepOrange, onTap: () {}),
      ]));
  }

  Widget _item(IconData icon, Color iconColor, String title, String sub, {Color? textColor, required VoidCallback onTap}) {
    return GestureDetector(onTap: onTap,
      child: Row(children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 16),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(color: textColor ?? Colors.white, fontWeight: FontWeight.w600)),
          Text(sub, style: const TextStyle(color: secondary, fontSize: 12)),
        ]),
      ]));
  }

  Widget _itemToggle(IconData icon, Color iconColor, String title, String sub, bool value, ValueChanged<bool> onChanged) {
    return Row(children: [
      Icon(icon, color: iconColor, size: 22),
      const SizedBox(width: 16),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
        Text(sub, style: const TextStyle(color: secondary, fontSize: 12)),
      ])),
      Switch(value: value, onChanged: onChanged, activeColor: const Color(0xFF66BB6A)),
    ]);
  }
}

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});
  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int _tabIndex = 0;
  static const bg = Color(0xFF0A1A0A);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);
  static const green = Color(0xFF66BB6A);
  final tabs = ['Tours', 'Event', 'Courses', 'Reports', 'Features', 'Users'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bg,
      body: SafeArea(child: Column(children: [
        Padding(padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(children: [
            Container(width: 36, height: 36,
              decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.hexagon_outlined, color: Colors.white54, size: 20)),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Platform', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
              Text('Admin Dashboard', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
            ])),
            GestureDetector(onTap: () => Navigator.pop(context),
              child: const Row(children: [
                Icon(Icons.arrow_back, color: secondary, size: 16),
                SizedBox(width: 4),
                Text('Back', style: TextStyle(color: secondary, fontSize: 13)),
              ])),
            const SizedBox(width: 16),
            const Icon(Icons.notifications_outlined, color: secondary, size: 22),
            const SizedBox(width: 16),
            const Icon(Icons.chat_bubble_outline, color: secondary, size: 22),
            const SizedBox(width: 16),
            const Icon(Icons.person_outline, color: secondary, size: 22),
            const SizedBox(width: 16),
            const Icon(Icons.settings_outlined, color: secondary, size: 22),
          ])),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Row(children: [
              _statCard('2840', 'Pengguna', Icons.people_outline, green),
              const SizedBox(width: 8),
              _statCard('148', 'Klub', Icons.business_outlined, Colors.orange),
              const SizedBox(width: 8),
              _statCard('4', 'Tur', Icons.emoji_events_outlined, green),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              _statCard('32', 'Event', Icons.calendar_month_outlined, Colors.orange),
              const SizedBox(width: 8),
              _statCard('18', 'Venues', Icons.location_on_outlined, green),
              const SizedBox(width: 8),
              _statCard('0', 'Active', Icons.flag_outlined, Colors.orange),
            ]),
          ])),
        const SizedBox(height: 12),
        SingleChildScrollView(scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(children: List.generate(tabs.length, (i) {
            final active = _tabIndex == i;
            return GestureDetector(onTap: () => setState(() => _tabIndex = i),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: active ? const Color(0xFF2A3A2A) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
                child: Text(tabs[i], style: TextStyle(
                  color: active ? Colors.white : secondary,
                  fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 13))));
          }))),
        const SizedBox(height: 8),
        const Divider(color: Color(0xFF1A2A1A), height: 1),
        Expanded(child: _buildAdminTab()),
      ])),
    );
  }

  Widget _buildAdminTab() {
    switch (_tabIndex) {
      case 0: return _buildTours();
      case 1: return _buildEvents();
      case 2: return _buildCourses();
      case 3: return _buildReports();
      case 4: return _buildFeatures();
      case 5: return _buildUsers();
      default: return const SizedBox();
    }
  }

  Widget _buildTours() {
    final tours = [
      {'name': 'EGT – Explorationis...', 'sub': 'The Explorationists Golf Club · 12 events · 2025', 'status': 'completed'},
      {'name': 'XMAX TOURNAMENT...', 'sub': 'XMAX-DEPOK · 1 events · 2026', 'status': 'upcoming'},
      {'name': 'PPDMring Tour 2026', 'sub': 'Ppdm Ring Golf · 9 events · 2026', 'status': 'upcoming'},
      {'name': 'Paradjana Champio...', 'sub': 'Paradjana · 10 events · 2026', 'status': 'upcoming'},
    ];
    return ListView(padding: const EdgeInsets.all(16),
      children: tours.map((t) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          const Icon(Icons.emoji_events_outlined, color: green, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(t['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            Text(t['sub']!, style: const TextStyle(color: secondary, fontSize: 12)),
          ])),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: t['status'] == 'completed' ? Colors.orange : const Color(0xFF4A6A4A)),
              borderRadius: BorderRadius.circular(12)),
            child: Text(t['status']!, style: TextStyle(color: t['status'] == 'completed' ? Colors.orange : secondary, fontSize: 11))),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: secondary, size: 18),
        ]))).toList());
  }

  Widget _buildEvents() {
    final events = [
      {'name': 'Paradjana Dec 2026', 'sub': 'Riverside Golf Club · 2026-12-19 · 0 peserta'},
      {'name': 'Nov 2026', 'sub': 'Merapi View Golf Course · 2026-11-23 · 0 peserta'},
      {'name': 'Paradjana Nov 2026', 'sub': 'Palm Hill Golf Club · 2026-11-21 · 0 peserta'},
      {'name': 'Oct 2026', 'sub': 'Matoa Golf & Garden · 2026-10-26 · 0 peserta'},
    ];
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: const Row(children: [
          Icon(Icons.filter_alt_outlined, color: secondary, size: 18),
          SizedBox(width: 8),
          Expanded(child: Text('All Status', style: TextStyle(color: Colors.white70))),
          Icon(Icons.keyboard_arrow_down, color: secondary),
        ])),
      const SizedBox(height: 12),
      ...events.map((e) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(e['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(e['sub']!, style: const TextStyle(color: secondary, fontSize: 12)),
          ])),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4A6A4A)), borderRadius: BorderRadius.circular(12)),
            child: const Text('scheduled', style: TextStyle(color: secondary, fontSize: 11))),
        ]))),
    ]);
  }

  Widget _buildCourses() {
    final courses = [
      {'name': 'Bandung Giri Gahana Golf', 'sub': 'Jatinangor, Sumedang, Jawa Barat · Par 72'},
      {'name': 'Bukit Pelangi Golf Course', 'sub': 'Sentul, Bogor, Jawa Barat · Par 72'},
      {'name': 'Emeralda Golf Club', 'sub': 'Cimanggis, Depok, Jawa Barat · Par 72'},
    ];
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(width: double.infinity, padding: const EdgeInsets.symmetric(vertical: 14),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.add, color: secondary, size: 18),
          SizedBox(width: 8),
          Text('Add Venue', style: TextStyle(color: secondary)),
        ])),
      ...courses.map((c) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
        child: Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(c['sub']!, style: const TextStyle(color: secondary, fontSize: 12)),
          ])),
          TextButton(onPressed: () {}, child: const Text('View', style: TextStyle(color: secondary))),
          const SizedBox(width: 4),
          ElevatedButton(onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E7D32),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6), minimumSize: Size.zero),
            child: const Text('Manage', style: TextStyle(fontSize: 12))),
        ]))),
    ]);
  }

  Widget _buildReports() {
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(children: [
            Icon(Icons.trending_up, color: green, size: 18),
            SizedBox(width: 8),
            Text('Registrasi User per Bulan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 12),
          Row(children: [
            const Text('2026-03', style: TextStyle(color: secondary, fontSize: 12)),
            const SizedBox(width: 12),
            Expanded(child: Container(height: 8,
              decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(4)))),
            const SizedBox(width: 12),
            const Text('1000', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ]),
        ])),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          const Row(children: [
            Icon(Icons.bar_chart, color: Colors.orange, size: 18),
            SizedBox(width: 8),
            Text('Ringkasan Platform', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          ]),
          const SizedBox(height: 12),
          Row(children: [_summaryItem('Total Users', '2840'), _summaryItem('Total Clubs', '148')]),
          const SizedBox(height: 8),
          Row(children: [_summaryItem('Total Event', '32'), _summaryItem('Total Venue', '18')]),
        ])),
    ]);
  }

  Widget _summaryItem(String label, String value) {
    return Expanded(child: Row(children: [
      Text('$label  ', style: const TextStyle(color: secondary, fontSize: 13)),
      Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
    ]));
  }

  Widget _buildFeatures() {
    return ListView(padding: const EdgeInsets.all(16), children: [
      Container(padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: const Row(children: [
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Fitur Aktif', style: TextStyle(color: secondary, fontSize: 12)),
            Text('0 / 6', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
          ])),
          Icon(Icons.toggle_off_outlined, color: secondary, size: 32),
        ])),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: const Color(0xFF1A1200), borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0x4DFF6D00))),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text('🚦 ', style: TextStyle(fontSize: 14)),
            Text('Platform saat ini dalam mode ', style: TextStyle(color: Colors.white70, fontSize: 13)),
            Text('Logbook', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w700, fontSize: 13)),
          ]),
          SizedBox(height: 8),
          Text('Aktifkan fitur satu per satu setelah caddy dan venue siap bergabung.',
            style: TextStyle(color: secondary, fontSize: 12)),
        ])),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text('Caddy Assignment', style: TextStyle(color: Color(0xFF66AAFF), fontWeight: FontWeight.w600)),
              SizedBox(width: 8),
              Text('OFF', style: TextStyle(color: secondary, fontSize: 12)),
            ]),
            SizedBox(height: 4),
            Text('Dropdown pilih caddy saat buat round', style: TextStyle(color: secondary, fontSize: 12)),
          ])),
          Switch(value: false, onChanged: (_) {}, activeColor: green),
        ])),
    ]);
  }

  Widget _buildUsers() {
    final users = ['A Alfian Husen', 'Aarwinda', 'Abby Mulia', 'Abdul Rozak', 'Abdul Chalid', 'Abdul Mutalib Masdar'];
    final hcps = ['HCP 16', '—', '—', '—', '—', 'HCP 18'];
    return Column(children: [
      Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          Container(height: 44,
            decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(22)),
            child: const Row(children: [
              SizedBox(width: 14),
              Icon(Icons.search, color: secondary, size: 18),
              SizedBox(width: 8),
              Text('Search user name...', style: TextStyle(color: secondary)),
            ])),
          const SizedBox(height: 12),
          Row(children: ['A–Z', 'Terbaru', 'Terlama', 'HCP'].map((s) => Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: s == 'A–Z' ? const Color(0xFF2E7D32) : Colors.transparent,
              border: Border.all(color: s == 'A–Z' ? Colors.transparent : const Color(0xFF2A3A2A)),
              borderRadius: BorderRadius.circular(20)),
            child: Text(s, style: TextStyle(color: s == 'A–Z' ? Colors.white : secondary, fontSize: 13)))).toList()),
          const SizedBox(height: 12),
          ...[['A','B','C','D','E','F','G','H','I','J'],
              ['K','L','M','N','O','P','Q','R','S','T'],
              ['U','V','W','X','Y','Z']].map((row) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: row.map((l) => _alphaBtn(l, l == 'A')).toList()))),
          const SizedBox(height: 8),
          const Align(alignment: Alignment.centerLeft,
            child: Text('271 user berawalan "A"', style: TextStyle(color: secondary, fontSize: 12))),
        ])),
      Expanded(child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: users.length,
        itemBuilder: (_, i) => Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Container(width: 32, height: 32,
              decoration: const BoxDecoration(color: Color(0xFF2E7D32), shape: BoxShape.circle),
              child: const Center(child: Text('A', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(users[i], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              Text('— · ${hcps[i]} · 20/3/2026', style: const TextStyle(color: secondary, fontSize: 12)),
            ])),
            const Icon(Icons.chevron_right, color: secondary, size: 18),
          ])))),
    ]);
  }

  Widget _alphaBtn(String letter, bool active) {
    return Container(width: 28, height: 28,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF2E7D32) : const Color(0xFF1A2A1A),
        shape: BoxShape.circle),
      child: Center(child: Text(letter, style: TextStyle(
        color: active ? Colors.white : secondary,
        fontSize: 12, fontWeight: FontWeight.w600))));
  }

  Widget _statCard(String value, String label, IconData icon, Color color) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
        Text(label, style: const TextStyle(color: secondary, fontSize: 12)),
      ])));
  }
}

class _HcpChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final points = [13.0, 13.0, 14.0, 10.0, 11.0, 10.0, 10.0, 10.0, 10.0];
    final paint = Paint()..color = const Color(0xFF66BB6A)..strokeWidth = 2..style = PaintingStyle.stroke;
    final dotPaint = Paint()..color = const Color(0xFF66BB6A)..style = PaintingStyle.fill;
    final path = Path();
    for (int i = 0; i < points.length; i++) {
      final x = i * size.width / (points.length - 1);
      final y = size.height - (points[i] - 9) / 6 * size.height;
      if (i == 0) path.moveTo(x, y); else path.lineTo(x, y);
      canvas.drawCircle(Offset(x, y), 3, dotPaint);
    }
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(_) => false;
}
