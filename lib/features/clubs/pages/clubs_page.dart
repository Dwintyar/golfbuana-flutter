import 'package:flutter/material.dart';

// ============================================================
// CLUBS PAGE — Main entry point
// ============================================================
class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  bool _showMyClubs = true;

  static const bgColor = Color(0xFF0A1A0A);
  static const greenPrimary = Color(0xFF2E7D32);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  final _myClubs = [
    {
      'name': 'Euphoria',
      'type': 'Golf Club',
      'members': '79 members',
      'role': 'Owner',
      'desc': 'Untuk para penikmat golf yang euforia',
      'avatar': null,
      'initials': 'E',
    },
    {
      'name': 'Gunung Geulis CC East Course',
      'type': 'Golf Venue',
      'members': '1 staff',
      'role': 'Owner',
      'desc': 'Golf venue: Sumedang, Jawa Barat',
      'avatar': null,
      'initials': 'GG',
    },
    {
      'name': 'Gunung Geulis CC West Cour...',
      'type': 'Golf Venue',
      'members': '1 staff',
      'role': 'Owner',
      'desc': 'Golf venue: Sumedang, Jawa Barat',
      'avatar': null,
      'initials': 'GG',
    },
    {
      'name': 'Jagorawi Golf & Country Club',
      'type': 'Golf Venue',
      'members': '1 staff',
      'role': 'Owner',
      'desc': 'Golf venue: Cibinong, Bogor',
      'avatar': null,
      'initials': 'JG',
    },
    {
      'name': 'Matoa Golf & Garden',
      'type': 'Golf Venue',
      'members': '1 staff',
      'role': 'Owner',
      'desc': 'Golf venue: Depok, Jawa Barat',
      'avatar': null,
      'initials': 'MG',
    },
    {
      'name': 'New Kuta Golf Pecatu',
      'type': 'Golf Venue',
      'members': '1 staff',
      'role': 'Owner',
      'desc': 'Golf venue: Uluwatu, Bali',
      'avatar': null,
      'initials': 'NK',
    },
    {
      'name': 'The Explorationists Golf Club',
      'type': 'Golf Club',
      'members': '10 members',
      'role': 'Owner',
      'desc': 'Klub golf profesional eksplorasi migas Indonesia',
      'avatar': null,
      'initials': 'EGC',
      'isEGC': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            const Text('Clubs',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
            const Spacer(),
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(color: greenPrimary, shape: BoxShape.circle),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2A1A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.search, color: Color(0xFF9E9E9E), size: 18),
                  SizedBox(width: 8),
                  Text('Search clubs...', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14)),
                ],
              ),
            ),
          ),

          // My Clubs / Discover tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => _showMyClubs = true),
                  child: Column(
                    children: [
                      Text(
                        'My Clubs (${_myClubs.length + 8})',
                        style: TextStyle(
                          color: _showMyClubs ? greenLight : textSecondary,
                          fontWeight: _showMyClubs ? FontWeight.w600 : FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      if (_showMyClubs)
                        Container(height: 2, width: 80, color: greenLight, margin: const EdgeInsets.only(top: 4)),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                GestureDetector(
                  onTap: () => setState(() => _showMyClubs = false),
                  child: Column(
                    children: [
                      Text(
                        'Discover',
                        style: TextStyle(
                          color: !_showMyClubs ? greenLight : textSecondary,
                          fontWeight: !_showMyClubs ? FontWeight.w600 : FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      if (!_showMyClubs)
                        Container(height: 2, width: 60, color: greenLight, margin: const EdgeInsets.only(top: 4)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Color(0xFF1A2A1A), height: 1),

          // Club list
          Expanded(
            child: ListView.separated(
              itemCount: _myClubs.length,
              separatorBuilder: (_, __) => const Divider(color: Color(0xFF1A2A1A), height: 1),
              itemBuilder: (context, index) {
                final club = _myClubs[index];
                return InkWell(
                  onTap: () {
                    if (club['isEGC'] == true) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) => const ClubDetailPage(),
                      ));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1A2A1A),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              club['initials'] as String,
                              style: const TextStyle(color: greenLight, fontWeight: FontWeight.w700, fontSize: 13),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(club['name'] as String,
                                style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Text('🏌️ ', style: TextStyle(fontSize: 11)),
                                  Text(
                                    '${club['type']} · ${club['members']} · ${club['role']}',
                                    style: const TextStyle(color: textSecondary, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(club['desc'] as String,
                                style: const TextStyle(color: textSecondary, fontSize: 12)),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: textSecondary, size: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CLUB DETAIL — The Explorationists Golf Club
// ============================================================
class ClubDetailPage extends StatefulWidget {
  const ClubDetailPage({super.key});

  @override
  State<ClubDetailPage> createState() => _ClubDetailPageState();
}

class _ClubDetailPageState extends State<ClubDetailPage> {
  bool _showMembers = false;

  static const bgColor = Color(0xFF0A1A0A);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  final _members = [
    {'name': 'dwintyar', 'role': 'Owner', 'roleColor': 0xFFB8860B, 'tags': []},
    {'name': 'Achmad Luthfi', 'role': 'Admin', 'roleColor': 0xFFB8860B, 'tags': ['Chairman', 'Tour Admin']},
    {'name': 'Ridwan Sulaiman', 'role': 'Admin', 'roleColor': 0xFFB8860B, 'tags': ['Captain']},
    {'name': 'Syamsu Alam', 'role': 'Admin', 'roleColor': 0xFFB8860B, 'tags': []},
    {'name': 'Hendra Dinata', 'role': 'Member', 'roleColor': 0xFF2E7D32, 'tags': []},
    {'name': 'Yoki Sugiarto', 'role': 'Member', 'roleColor': 0xFF2E7D32, 'tags': []},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.person_add_outlined, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.white), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ClubAdminPage()));
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Club header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(color: Color(0xFF1A2A1A), shape: BoxShape.circle),
                    child: const Center(
                      child: Text('EGC', style: TextStyle(color: greenLight, fontWeight: FontWeight.w700, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('The Explorationists Golf Club',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13),
                      children: [
                        TextSpan(text: 'Golf Club · ', style: TextStyle(color: Color(0xFF9E9E9E))),
                        TextSpan(text: '10 members', style: TextStyle(color: greenLight, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Klub golf profesional eksplorasi migas Indonesia. Forum silaturahmi dan kompetisi golf antar perusahaan eksplorasi sejak 2011. Website: www.egc-indonesia.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 13, height: 1.4),
                  ),
                  const SizedBox(height: 14),
                  // Role badges
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _badge('📢 Channel', const Color(0xFF1A2A1A), Colors.white),
                      const SizedBox(width: 8),
                      _badge('👑 Owner', const Color(0xFF3A2A00), const Color(0xFFFFB300)),
                      const SizedBox(width: 8),
                      _badge('⚙️ Admin', const Color(0xFF2A2A2A), Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            // Members / Tournaments tabs
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _showMembers = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: _showMembers ? greenLight : Colors.transparent,
                          width: 2,
                        )),
                      ),
                      child: Text('Members',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _showMembers ? greenLight : textSecondary,
                          fontWeight: _showMembers ? FontWeight.w600 : FontWeight.w400,
                        )),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _showMembers = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: !_showMembers ? greenLight : Colors.transparent,
                          width: 2,
                        )),
                      ),
                      child: Text('Tournaments',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !_showMembers ? greenLight : textSecondary,
                          fontWeight: !_showMembers ? FontWeight.w600 : FontWeight.w400,
                        )),
                    ),
                  ),
                ),
              ],
            ),

            const Divider(color: Color(0xFF1A2A1A), height: 1),

            // Content
            if (_showMembers) _buildMembers() else _buildTournaments(),
          ],
        ),
      ),
    );
  }

  Widget _buildMembers() {
    return Column(
      children: [
        // Search
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF1A2A1A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF2A3A2A)),
            ),
            child: const Row(
              children: [
                SizedBox(width: 12),
                Icon(Icons.search, color: Color(0xFF9E9E9E), size: 18),
                SizedBox(width: 8),
                Text('Type a name...', style: TextStyle(color: Color(0xFF9E9E9E))),
                Spacer(),
                Icon(Icons.mic_outlined, color: Color(0xFF9E9E9E), size: 18),
                SizedBox(width: 12),
              ],
            ),
          ),
        ),
        ..._members.map((m) => ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF1A2A1A),
            child: Text(
              (m['name'] as String).substring(0, 1).toUpperCase(),
              style: const TextStyle(color: greenLight, fontWeight: FontWeight.w600),
            ),
          ),
          title: Text(m['name'] as String,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          subtitle: Wrap(
            spacing: 4,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Color((m['roleColor'] as int)).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(m['role'] as String,
                  style: TextStyle(color: Color(m['roleColor'] as int), fontSize: 11)),
              ),
              ...((m['tags'] as List).map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF0A2A4A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(t, style: const TextStyle(color: Colors.lightBlue, fontSize: 10)),
              ))),
            ],
          ),
          trailing: const Icon(Icons.email_outlined, color: greenLight, size: 20),
        )),
      ],
    );
  }

  Widget _buildTournaments() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TournamentDetailPage()));
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF111E11),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A1A),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.emoji_events_outlined, color: greenLight),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EGT – Explorationists Golf To...',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    SizedBox(height: 4),
                    Text('2025 · Interclub',
                      style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(String label, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
      child: Text(label, style: TextStyle(color: fg, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }
}

// ============================================================
// TOURNAMENT DETAIL — EGT 2025
// ============================================================
class TournamentDetailPage extends StatefulWidget {
  const TournamentDetailPage({super.key});

  @override
  State<TournamentDetailPage> createState() => _TournamentDetailPageState();
}

class _TournamentDetailPageState extends State<TournamentDetailPage> {
  int _tabIndex = 0;
  static const bgColor = Color(0xFF0A1A0A);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  final _tabs = ['Events', 'Leaderboard', 'Players', 'Clubs'];

  final _events = [
    {'name': 'EGT 2025 #01 – Janua...', 'date': 'Minggu, 19 Januari 2025', 'venue': 'Jagorawi Golf & Country Club', 'status': 'Done'},
    {'name': 'EGT 2025 #02 – Febru...', 'date': 'Minggu, 16 Februari 2025', 'venue': 'Riverside Golf Club', 'status': 'Done'},
    {'name': 'EGT 2025 #03 – Maret...', 'date': 'Minggu, 16 Maret 2025', 'venue': 'Palm Hill Golf Club', 'status': 'Done'},
    {'name': 'EGT 2025 #04 – April...', 'date': 'Minggu, 20 April 2025', 'venue': 'Emeralda Golf Club', 'status': 'Done'},
  ];

  final _leaderboard = [
    {'rank': '🥇', 'init': 'HS', 'name': 'Heru Sancoyo', 'club': 'Schlumberger Geo...', 'gp': '1/12', 'net': '68', 'avg': '68'},
    {'rank': '🥈', 'init': 'GB', 'name': 'Gord Begg', 'club': 'Bukit Energy Indon...', 'gp': '1/12', 'net': '75', 'avg': '75'},
    {'rank': '🥉', 'init': 'KK', 'name': 'Koichi Kihara', 'club': 'INPEX Corporation', 'gp': '1/12', 'net': '76', 'avg': '76'},
    {'rank': '4', 'init': 'YY', 'name': 'Yoshifumi Yoshid...', 'club': 'Kangean Energy In...', 'gp': '1/12', 'net': '77', 'avg': '77'},
    {'rank': '5', 'init': 'EH', 'name': 'Eamon Hurley', 'club': 'Bukit Energy Indon...', 'gp': '1/12', 'net': '79', 'avg': '79'},
  ];

  final _clubs = [
    {'init': 'A', 'name': 'Apexindo Pratama Duta,...', 'quota': '4', 'players': '8', 'status': 'accepted'},
    {'init': 'B', 'name': 'Baker Hughes Indonesia...', 'quota': '4', 'players': '15', 'status': 'accepted'},
    {'init': 'B', 'name': 'Bukit Energy Indonesia...', 'quota': '4', 'players': '11', 'status': 'accepted'},
    {'init': 'C', 'name': 'Chevron Pacific Indones...', 'quota': '4', 'players': '5', 'status': 'accepted'},
    {'init': 'C', 'name': 'CNOOC SES Ltd.', 'quota': '4', 'players': '8', 'status': 'accepted'},
  ];

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
                // Back + Private badge
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
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2A00),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text('🔒 Private',
                          style: TextStyle(color: Color(0xFFFFB300), fontSize: 13)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Tournament logo
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(16)),
                  child: const Icon(Icons.emoji_events, color: greenLight, size: 40),
                ),
                const SizedBox(height: 12),

                const Text('EGT – Explorationists Golf\nTournament 2025',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text('The Explorationists Golf Club · 2025',
                  style: TextStyle(color: textSecondary, fontSize: 13)),
                const SizedBox(height: 6),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text('Annual EGC Tournament 2027 – 12 events, 39 member clubs, 144 contestants per event',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textSecondary, fontSize: 12)),
                ),
                const SizedBox(height: 12),

                // Type badges
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _pill('Interclub', const Color(0xFF1A3A1A), greenLight),
                    const SizedBox(width: 8),
                    _pill('👑 Organizer', const Color(0xFF3A2A00), const Color(0xFFFFB300)),
                    const SizedBox(width: 8),
                    _pill('👥 38 clubs', const Color(0xFF1A2A1A), Colors.white70),
                  ],
                ),
                const SizedBox(height: 16),

                // Admin action grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      _actionTile(Icons.calendar_today_outlined, 'New Event'),
                      _actionTile(Icons.person_add_outlined, 'Register'),
                      _actionTile(Icons.layers_outlined, 'Flights'),
                      _actionTile(Icons.military_tech_outlined, 'Categories'),
                      _actionTile(Icons.description_outlined, 'Invitation'),
                      _actionTile(Icons.group_add_outlined, 'Invite Club'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Tab bar
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xFF1A2A1A))),
                  ),
                  child: Row(
                    children: List.generate(_tabs.length, (i) {
                      final active = _tabIndex == i;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _tabIndex = i),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(
                                color: active ? greenLight : Colors.transparent,
                                width: 2,
                              )),
                            ),
                            child: Text(_tabs[i],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: active ? greenLight : textSecondary,
                                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                                fontSize: 13,
                              )),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Tab content
          SliverToBoxAdapter(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_tabIndex) {
      case 0: return _buildEvents();
      case 1: return _buildLeaderboard();
      case 2: return _buildPlayers();
      case 3: return _buildClubs();
      default: return const SizedBox();
    }
  }

  Widget _buildEvents() {
    return Column(
      children: _events.map((e) => Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF111E11),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4),
                  Row(children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: Color(0xFF9E9E9E)),
                    const SizedBox(width: 4),
                    Text(e['date']!, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                  ]),
                  Row(children: [
                    const Icon(Icons.location_on_outlined, size: 12, color: Color(0xFF9E9E9E)),
                    const SizedBox(width: 4),
                    Text(e['venue']!, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                  ]),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: greenLight),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(e['status']!, style: const TextStyle(color: greenLight, fontSize: 12)),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, color: Color(0xFF9E9E9E), size: 18),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildLeaderboard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF111E11),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF1A3A1A)),
            ),
            child: const Row(
              children: [
                Icon(Icons.location_on_outlined, color: greenLight, size: 16),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Posisi Anda', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                    Text('#23 · Net 233 · Avg 77.7', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                Text('Main\n3/12', textAlign: TextAlign.right, style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
              ],
            ),
          ),
        ),
        // Header
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(width: 32),
              Expanded(child: Text('PLAYER', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11))),
              Text('GP  ', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
              Text('NET  ', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
              Text('AVG', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
            ],
          ),
        ),
        ..._leaderboard.map((p) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox(width: 32, child: Text(p['rank']!, style: const TextStyle(fontSize: 16))),
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFF1A2A1A),
                child: Text(p['init']!, style: const TextStyle(color: greenLight, fontSize: 11, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(p['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    Text(p['club']!, style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 11)),
                  ],
                ),
              ),
              Text('${p['gp']}  ', style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
              Text('${p['net']}  ', style: const TextStyle(color: greenLight, fontWeight: FontWeight.w600)),
              Text(p['avg']!, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildPlayers() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text('170 players · 37 clubs', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildClubs() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF111E11),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('38 Clubs · 170 Players registered · 138 Total quota',
              style: TextStyle(color: Colors.white, fontSize: 13)),
          ),
        ),
        ..._clubs.map((c) => Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF111E11),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF1A2A1A)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: const Color(0xFF1A2A1A),
                    child: Text(c['init']!, style: const TextStyle(color: greenLight, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        Text('Quota: ${c['quota']} · Players: ${c['players']} / ${c['quota']}',
                          style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: greenLight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text('accepted', style: TextStyle(color: greenLight, fontSize: 12)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(height: 3, decoration: BoxDecoration(
                color: greenLight, borderRadius: BorderRadius.circular(2))),
            ],
          ),
        )),
      ],
    );
  }

  Widget _pill(String label, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(14)),
      child: Text(label, style: TextStyle(color: fg, fontSize: 12)),
    );
  }

  Widget _actionTile(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111E11),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF66BB6A), size: 28),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ============================================================
// CLUB ADMIN PAGE
// ============================================================
class ClubAdminPage extends StatefulWidget {
  const ClubAdminPage({super.key});

  @override
  State<ClubAdminPage> createState() => _ClubAdminPageState();
}

class _ClubAdminPageState extends State<ClubAdminPage> {
  int _tabIndex = 0;
  static const bgColor = Color(0xFF0A1A0A);
  static const greenLight = Color(0xFF66BB6A);

  final _tabs = ['Members', 'Tournaments', 'Announcements', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Admin — The Explorati...', style: TextStyle(color: Colors.white, fontSize: 16)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1A2A1A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Community', style: TextStyle(color: Colors.white70, fontSize: 12)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Club selector
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF111E11),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFF1A3A1A)),
              ),
              child: const Row(
                children: [
                  Text('The Explorationists Golf Club (owner)',
                    style: TextStyle(color: Colors.white)),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white54),
                ],
              ),
            ),
          ),

          // Club admin banner
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF3A2A00),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, color: Color(0xFFFFB300), size: 10),
                SizedBox(width: 8),
                Text('CLUB ADMIN', style: TextStyle(color: Color(0xFFFFB300), fontSize: 12, fontWeight: FontWeight.w600)),
                Text(' › The Explorationists Golf Club', style: TextStyle(color: Color(0xFFFFB300), fontSize: 12)),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Stats grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2.5,
              children: [
                _statCard(Icons.people_outline, '10', 'Members', const Color(0xFF0A2A0A)),
                _statCard(Icons.emoji_events_outlined, '1', 'Tournaments', const Color(0xFF2A2A00)),
                _statCard(Icons.campaign_outlined, '–', 'Announcements', const Color(0xFF0A2A0A)),
                _statCard(Icons.notifications_outlined, '0', 'Pending', const Color(0xFF0A2A0A)),
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
                    margin: const EdgeInsets.only(left: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: active ? const Color(0xFF2A2A2A) : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(_tabs[i],
                      style: TextStyle(
                        color: active ? Colors.white : Colors.white54,
                        fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                      )),
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 8),
          const Divider(color: Color(0xFF1A2A1A), height: 1),

          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_tabIndex) {
      case 0: // Members
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2A1A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('+ Invite Member', textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70)),
            ),
          ],
        );
      case 1: // Tournaments
        return ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2A1A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('+ Create Tournament', textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70)),
            ),
          ],
        );
      case 2: // Announcements
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A1A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('+ New Announcement', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111E11),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Icon(Icons.campaign_outlined, color: Colors.white38, size: 36),
                  SizedBox(height: 8),
                  Text('No announcements yet', style: TextStyle(color: Colors.white54)),
                ],
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  Widget _statCard(IconData icon, String value, String label, Color bg) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF1A3A1A)),
      ),
      child: Row(
        children: [
          Icon(icon, color: greenLight, size: 20),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
              Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}