import 'package:flutter/material.dart';

class LoungePage extends StatefulWidget {
  const LoungePage({super.key});

  @override
  State<LoungePage> createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage>
    with SingleTickerProviderStateMixin {
  late TabController _mainTabController;

  // Dark theme colors matching screenshots
  static const bgColor = Color(0xFF0A1A0A);
  static const cardColor = Color(0xFF111E11);
  static const greenPrimary = Color(0xFF2E7D32);
  static const greenLight = Color(0xFF66BB6A);
  static const textPrimary = Colors.white;
  static const textSecondary = Color(0xFF9E9E9E);

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _mainTabController.dispose();
    super.dispose();
  }

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
            _hexLogo(),
            const SizedBox(width: 10),
            const Text(
              'Lounge',
              style: TextStyle(
                color: textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _mainTabController,
          labelColor: greenLight,
          unselectedLabelColor: textSecondary,
          indicatorColor: greenLight,
          indicatorWeight: 2,
          tabs: const [
            Tab(text: 'Channels'),
            Tab(text: 'Chats'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _mainTabController,
        children: [
          const _ChannelsTab(),
          const _ChatsTab(),
        ],
      ),
    );
  }

  Widget _hexLogo() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xFF1B2E1B),
      ),
      child: const Icon(Icons.hexagon_outlined, color: greenLight, size: 20),
    );
  }
}

// ============================================================
// CHANNELS TAB
// ============================================================
class _ChannelsTab extends StatefulWidget {
  const _ChannelsTab();

  @override
  State<_ChannelsTab> createState() => _ChannelsTabState();
}

class _ChannelsTabState extends State<_ChannelsTab> {
  bool _showFollowing = true;
  String? _selectedChannel;

  static const bgColor = Color(0xFF0A1A0A);
  static const greenPrimary = Color(0xFF2E7D32);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  final _followingChannels = [
    {'name': 'GolfBuana Official', 'followers': '2,839', 'verified': true, 'icon': '📢'},
    {'name': 'Paradjana', 'followers': '8', 'verified': false, 'icon': '🏌️'},
    {'name': 'Euphoria', 'followers': '79', 'verified': false, 'icon': '🌐'},
    {'name': 'Permata Sentul Golf Course', 'followers': '2,838', 'verified': false, 'icon': '🌐'},
    {'name': 'The Explorationists Golf Club', 'followers': '10', 'verified': false, 'icon': '⚙️'},
    {'name': 'Palm Hill Golf Club', 'followers': '2,838', 'verified': false, 'icon': '🌐'},
    {'name': 'Sentul Highland Golf Club', 'followers': '2,838', 'verified': false, 'icon': '🌐'},
    {'name': 'Nirwana Bali Golf Club', 'followers': '2,838', 'verified': false, 'icon': '🌐'},
  ];

  final _discoverChannels = [
    {'name': 'Advocat Golf Society', 'followers': '80'},
    {'name': 'Drilling Operators Golf Club', 'followers': '79'},
    {'name': 'Bali Expat Golfers', 'followers': '78'},
    {'name': 'Alumni UI Hukum 91 Golf C...', 'followers': '78'},
    {'name': 'Notaris Golf Club', 'followers': '78'},
    {'name': 'Pertamina Golf Club', 'followers': '78'},
    {'name': 'Komisaris & Direksi Golf Fo...', 'followers': '77'},
    {'name': 'Surabaya Business Golf', 'followers': '76'},
  ];

  @override
  Widget build(BuildContext context) {
    if (_selectedChannel != null) {
      return _ChannelDetail(
        channelName: _selectedChannel!,
        onBack: () => setState(() => _selectedChannel = null),
      );
    }

    return Container(
      color: bgColor,
      child: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
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
                  Text('Search channels...', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 14)),
                ],
              ),
            ),
          ),

          // Following / Discover toggle
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _showFollowing = true),
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: _showFollowing ? greenPrimary : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Following (${_followingChannels.length})',
                        style: TextStyle(
                          color: _showFollowing ? Colors.white : textSecondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _showFollowing = false),
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        color: !_showFollowing ? greenPrimary : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Discover',
                        style: TextStyle(
                          color: !_showFollowing ? Colors.white : textSecondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Channel list
          Expanded(
            child: ListView.builder(
              itemCount: _showFollowing
                  ? _followingChannels.length
                  : _discoverChannels.length,
              itemBuilder: (context, index) {
                if (_showFollowing) {
                  final ch = _followingChannels[index];
                  return _ChannelItem(
                    name: ch['name'] as String,
                    followers: ch['followers'] as String,
                    verified: ch['verified'] as bool,
                    icon: ch['icon'] as String,
                    onTap: () => setState(() => _selectedChannel = ch['name'] as String),
                  );
                } else {
                  final ch = _discoverChannels[index];
                  return _DiscoverItem(
                    name: ch['name'] as String,
                    followers: ch['followers'] as String,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChannelItem extends StatelessWidget {
  final String name;
  final String followers;
  final bool verified;
  final String icon;
  final VoidCallback onTap;

  const _ChannelItem({
    required this.name,
    required this.followers,
    required this.verified,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF1A2A1A),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (verified) ...[
                        const SizedBox(width: 4),
                        const Icon(Icons.check, color: Color(0xFF66BB6A), size: 14),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$followers followers',
                    style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiscoverItem extends StatefulWidget {
  final String name;
  final String followers;

  const _DiscoverItem({required this.name, required this.followers});

  @override
  State<_DiscoverItem> createState() => _DiscoverItemState();
}

class _DiscoverItemState extends State<_DiscoverItem> {
  bool _following = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFF1A2A1A),
              shape: BoxShape.circle,
            ),
            child: const Center(child: Text('🏌️', style: TextStyle(fontSize: 22))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  '${widget.followers} followers',
                  style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _following = !_following),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
              decoration: BoxDecoration(
                color: _following ? const Color(0xFF2E7D32) : const Color(0xFF1A2A1A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF2E7D32)),
              ),
              child: Text(
                _following ? 'Following' : 'Follow',
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CHANNEL DETAIL
// ============================================================
class _ChannelDetail extends StatelessWidget {
  final String channelName;
  final VoidCallback onBack;

  const _ChannelDetail({required this.channelName, required this.onBack});

  static const bgColor = Color(0xFF0A1A0A);
  static const cardColor = Color(0xFF111E11);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          // Channel header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onBack,
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(color: Color(0xFF1A2A1A), shape: BoxShape.circle),
                  child: const Center(child: Text('📢', style: TextStyle(fontSize: 18))),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            channelName,
                            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A2A1A),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0xFF66BB6A)),
                            ),
                            child: const Text('✓ Official', style: TextStyle(color: Color(0xFF66BB6A), fontSize: 11)),
                          ),
                        ],
                      ),
                      const Text('2,839 followers', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Color(0xFF1A2A1A), height: 1),

          // Post
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(radius: 18, backgroundColor: Color(0xFF2E7D32),
                          child: Text('D', style: TextStyle(color: Colors.white))),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('dwintyar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            Text('Mar 29, 2026', style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Selamat Datang di GolfBuana! 🏌️ 🚩\n\nSenang banget kamu udah gabung di sini. GolfBuana adalah tempat ngumpulnya para golfer Indonesia — dari yang baru belajar swing sampai yang udah jago kikin birdie.\n\nDi sini kamu bisa:\n🚩 Catat score dan pantau handicap kamu\n🏆 Ikut tournament dan event bareng club\n💬 Ngobrol dan share momen golf sama sesama golfer\n📍 Eksplor golf course di seluruh Indonesia',
                      style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CHATS TAB
// ============================================================
class _ChatsTab extends StatefulWidget {
  const _ChatsTab();

  @override
  State<_ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<_ChatsTab> {
  bool _showChats = true;
  bool _showNewMessage = false;

  static const bgColor = Color(0xFF0A1A0A);
  static const greenLight = Color(0xFF66BB6A);
  static const textSecondary = Color(0xFF9E9E9E);

  final _chats = [
    {'name': 'Djana Persada', 'last': 'test', 'time': 'Wed', 'avatar': '⚙️'},
    {'name': 'Djana Karsa', 'last': 'Oke', 'time': 'Mar 29', 'avatar': '🎯'},
    {'name': 'Hendra Dinata', 'last': 'Test', 'time': 'Mar 23', 'avatar': null},
    {'name': 'Yoki Sugiarto', 'last': 'Test', 'time': 'Mar 17', 'avatar': '🌿'},
  ];

  final _buddies = [
    {'name': 'Djana Karsa', 'hcp': null},
    {'name': 'DBEPTI', 'hcp': null},
    {'name': 'Hendra Dinata', 'hcp': null},
    {'name': 'Nita Sunaryo', 'hcp': 'HCP 22'},
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: bgColor,
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    const Text('Chats', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => setState(() => _showNewMessage = true),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(color: Color(0xFF2E7D32), shape: BoxShape.circle),
                        child: const Icon(Icons.edit_outlined, color: Colors.white, size: 18),
                      ),
                    ),
                  ],
                ),
              ),

              // Chats / Contacts sub-tabs
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _subTab('Chats', _showChats, () => setState(() => _showChats = true)),
                    const SizedBox(width: 20),
                    _subTab('Contacts', !_showChats, () => setState(() => _showChats = false)),
                  ],
                ),
              ),

              const Divider(color: Color(0xFF1A2A1A), height: 1),

              // Content
              Expanded(
                child: _showChats ? _buildChatsList() : _buildContactsList(),
              ),
            ],
          ),
        ),

        // New Message modal
        if (_showNewMessage)
          GestureDetector(
            onTap: () => setState(() => _showNewMessage = false),
            child: Container(color: Colors.black54),
          ),
        if (_showNewMessage)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF111E11),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text('New Message', textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _showNewMessage = false),
                        child: const Icon(Icons.close, color: Colors.white54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A2A1A),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: const Color(0xFF2E7D32)),
                    ),
                    child: const Row(
                      children: [
                        SizedBox(width: 14),
                        Icon(Icons.search, color: Color(0xFF9E9E9E), size: 18),
                        SizedBox(width: 8),
                        Text('Search buddies...', style: TextStyle(color: Color(0xFF9E9E9E))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._buddies.map((b) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF1A2A1A),
                      child: Text(
                        (b['name'] as String).substring(0, 1).toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(b['name'] as String, style: const TextStyle(color: Colors.white)),
                    trailing: b['hcp'] != null
                        ? Text(b['hcp'] as String, style: const TextStyle(color: Color(0xFF66BB6A), fontWeight: FontWeight.w600))
                        : null,
                  )),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _subTab(String label, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label,
              style: TextStyle(
                color: active ? greenLight : textSecondary,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          if (active)
            Container(height: 2, width: 60, color: greenLight),
        ],
      ),
    );
  }

  Widget _buildChatsList() {
    return ListView.builder(
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: CircleAvatar(
            backgroundColor: const Color(0xFF1A2A1A),
            radius: 26,
            child: chat['avatar'] != null
                ? Text(chat['avatar'] as String, style: const TextStyle(fontSize: 22))
                : Text(
                    (chat['name'] as String).substring(0, 1),
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
          ),
          title: Text(chat['name'] as String,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
          subtitle: Text(chat['last'] as String,
            style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13)),
          trailing: Text(chat['time'] as String,
            style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12)),
        );
      },
    );
  }

  Widget _buildContactsList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.people_outline, color: Color(0xFF2E7D32), size: 56),
          const SizedBox(height: 16),
          const Text('No contacts yet',
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          const Text('Add buddies first to start chatting.',
            style: TextStyle(color: Color(0xFF9E9E9E), fontSize: 13)),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: const Text('Cari golfer',
              style: TextStyle(color: Color(0xFF66BB6A), fontSize: 14, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}