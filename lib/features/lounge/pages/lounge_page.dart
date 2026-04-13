import 'package:flutter/material.dart';

class LoungePage extends StatefulWidget {
  const LoungePage({super.key});
  @override
  State<LoungePage> createState() => _LoungePageState();
}

class _LoungePageState extends State<LoungePage> {
  int _mainTab = 0; // 0=Channels, 1=Chats
  static const bg = Color(0xFF0A1A0A);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const secondary = Color(0xFF9E9E9E);
  static const card = Color(0xFF111E11);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(children: [
            Container(width: 28, height: 28,
              decoration: BoxDecoration(color: greenDark, borderRadius: BorderRadius.circular(6)),
              child: const Icon(Icons.hexagon_outlined, color: Colors.white, size: 16)),
            const SizedBox(width: 8),
            const Text('Lounge', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
            const Spacer(),
            const Icon(Icons.notifications_outlined, color: secondary, size: 22),
            const SizedBox(width: 16),
            const Icon(Icons.chat_bubble_outline, color: secondary, size: 22),
            const SizedBox(width: 16),
            const Icon(Icons.person_outline, color: secondary, size: 22),
            const SizedBox(width: 16),
            const Icon(Icons.settings_outlined, color: secondary, size: 22),
          ])),
        Row(children: [
          _tab('Channels', 0),
          _tab('Chats', 1),
        ]),
        const Divider(color: Color(0xFF1A2A1A), height: 1),
        Expanded(child: _buildMain()),
      ])),
      floatingActionButton: _mainTab == 0 ? FloatingActionButton(
        backgroundColor: greenDark,
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ) : null,
    );
  }

  Widget _tab(String label, int idx) {
    final active = _mainTab == idx;
    return Expanded(child: GestureDetector(
      onTap: () => setState(() => _mainTab = idx),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(
          color: active ? green : Colors.transparent, width: 2))),
        child: Text(label, textAlign: TextAlign.center,
          style: TextStyle(color: active ? green : secondary,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400, fontSize: 14)))));
  }

  Widget _buildMain() {
    switch (_mainTab) {
      case 0: return const _ChannelsTab();
      case 1: return const _ChatsTab();
      default: return const SizedBox();
    }
  }

  Widget _buildFeeds() {
    return ListView(children: [
      Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Column(children: [
          Row(children: [
            Container(width: 36, height: 36,
              decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
              child: const Icon(Icons.person, color: green, size: 20)),
            const SizedBox(width: 10),
            Expanded(child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(20)),
              child: const Text("What's on your mind?", style: TextStyle(color: secondary, fontSize: 14)))),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            const Text('📷', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            const Text('Photo', style: TextStyle(color: secondary, fontSize: 13)),
            const SizedBox(width: 16),
            const Text('🏌', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 6),
            const Text('Score', style: TextStyle(color: secondary, fontSize: 13)),
          ]),
        ])),
      Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 36, height: 36,
              decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
              child: const Icon(Icons.person, color: green, size: 20)),
            const SizedBox(width: 10),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text('dwintyar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                SizedBox(width: 6),
                Text('Matoa Golf & Garden', style: TextStyle(color: green, fontSize: 13)),
              ]),
              Text('HCP 13 · 9d ago', style: TextStyle(color: secondary, fontSize: 12)),
            ])),
            Icon(Icons.delete_outline, color: secondary, size: 18),
          ]),
          const SizedBox(height: 10),
          const Text('Selamat Datang di GolfBuana! Senang banget kamu udah gabung di sini. GolfBuana adalah tempat ngumpulnya para golfer Indonesia.',
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5)),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.favorite_border, color: secondary, size: 18),
            const SizedBox(width: 4),
            const Text('Like', style: TextStyle(color: secondary, fontSize: 13)),
            const SizedBox(width: 16),
            const Icon(Icons.chat_bubble_outline, color: secondary, size: 18),
            const SizedBox(width: 4),
            const Text('Comment', style: TextStyle(color: secondary, fontSize: 13)),
            const SizedBox(width: 16),
            const Icon(Icons.share_outlined, color: secondary, size: 18),
            const SizedBox(width: 4),
            const Text('Share', style: TextStyle(color: secondary, fontSize: 13)),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Container(width: 28, height: 28,
              decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
              child: const Icon(Icons.person, color: green, size: 16)),
            const SizedBox(width: 8),
            Expanded(child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(20)),
              child: const Text('Write a comment...', style: TextStyle(color: secondary, fontSize: 13)))),
            const SizedBox(width: 8),
            const Text('Send', style: TextStyle(color: green, fontSize: 13, fontWeight: FontWeight.w600)),
          ]),
        ])),
    ]);
  }
}

class _ChannelsTab extends StatefulWidget {
  const _ChannelsTab();
  @override
  State<_ChannelsTab> createState() => _ChannelsTabState();
}

class _ChannelsTabState extends State<_ChannelsTab> {
  bool _showDiscover = false;
  static const secondary = Color(0xFF9E9E9E);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const card = Color(0xFF111E11);

  final _following = [
    {'name': 'GolfBuana Official', 'followers': '2,839', 'official': true},
    {'name': 'Paradjana', 'followers': '8', 'official': false},
    {'name': 'Euphoria', 'followers': '79', 'official': false},
    {'name': 'Permata Sentul Golf Course', 'followers': '2,838', 'official': false},
    {'name': 'The Explorationists Golf Club', 'followers': '10', 'official': false},
    {'name': 'Palm Hill Golf Club', 'followers': '2,838', 'official': false},
    {'name': 'Sentul Highland Golf Club', 'followers': '2,838', 'official': false},
  ];

  final _discover = [
    {'name': 'Advocat Golf Society', 'followers': '80'},
    {'name': 'Drilling Operators Golf Club', 'followers': '79'},
    {'name': 'Bali Expat Golfers', 'followers': '78'},
    {'name': 'Alumni UI Hukum 91 Golf C...', 'followers': '78'},
    {'name': 'Notaris Golf Club', 'followers': '78'},
    {'name': 'Pertamina Golf Club', 'followers': '78'},
    {'name': 'Surabaya Business Golf', 'followers': '76'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Container(height: 40,
            decoration: BoxDecoration(color: card, borderRadius: BorderRadius.circular(20)),
            child: const Row(children: [
              SizedBox(width: 12),
              Icon(Icons.search, color: secondary, size: 18),
              SizedBox(width: 8),
              Text('Search channels...', style: TextStyle(color: secondary, fontSize: 13)),
            ])),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: GestureDetector(
              onTap: () => setState(() => _showDiscover = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: !_showDiscover ? greenDark : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
                child: Text('Following (16)', textAlign: TextAlign.center,
                  style: TextStyle(color: !_showDiscover ? Colors.white : secondary,
                    fontWeight: FontWeight.w600, fontSize: 13))))),
            const SizedBox(width: 8),
            Expanded(child: GestureDetector(
              onTap: () => setState(() => _showDiscover = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: _showDiscover ? greenDark : Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
                child: Text('Discover', textAlign: TextAlign.center,
                  style: TextStyle(color: _showDiscover ? Colors.white : secondary,
                    fontWeight: FontWeight.w600, fontSize: 13))))),
          ]),
        ])),
      Expanded(child: ListView(
        children: _showDiscover
          ? _discover.map((c) => _discoverRow(c['name']!, c['followers']!)).toList()
          : _following.map((c) => _followingRow(c)).toList(),
      )),
    ]);
  }

  Widget _followingRow(Map<String, dynamic> c) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(children: [
        Container(width: 44, height: 44,
          decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(10)),
          child: c['official'] == true
            ? const Center(child: Text('📢', style: TextStyle(fontSize: 22)))
            : const Icon(Icons.directions_run, color: Colors.orange, size: 22)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(c['name'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
            if (c['official'] == true) ...[
              const SizedBox(width: 4),
              const Icon(Icons.check, color: green, size: 14),
            ],
          ]),
          Text('${c['followers']} followers', style: const TextStyle(color: secondary, fontSize: 12)),
        ])),
      ]));
  }

  Widget _discoverRow(String name, String followers) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(children: [
        Container(width: 44, height: 44,
          decoration: BoxDecoration(color: const Color(0xFF3A1A0A), borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.directions_run, color: Colors.orange, size: 22)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
          Text('$followers followers', style: const TextStyle(color: secondary, fontSize: 12)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(color: const Color(0xFF1A2A1A), borderRadius: BorderRadius.circular(16)),
          child: const Text('Follow', style: TextStyle(color: Colors.white70, fontSize: 12))),
      ]));
  }
}

class _ChatsTab extends StatefulWidget {
  const _ChatsTab();
  @override
  State<_ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<_ChatsTab> {
  int _sub = 0;
  static const secondary = Color(0xFF9E9E9E);
  static const green = Color(0xFF66BB6A);
  static const greenDark = Color(0xFF2E7D32);
  static const card = Color(0xFF111E11);

  final _chats = [
    {'name': 'Djana Persada', 'msg': 'test', 'time': 'Wed'},
    {'name': 'Djana Karsa', 'msg': 'Oke', 'time': 'Mar 29'},
    {'name': 'Hendra Dinata', 'msg': 'Test', 'time': 'Mar 23'},
    {'name': 'Yoki Sugiarto', 'msg': 'Test', 'time': 'Mar 17'},
  ];

  void _showNewMessage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A2A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              const Text('New Message', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
              const Spacer(),
              GestureDetector(onTap: () => Navigator.pop(ctx),
                child: const Icon(Icons.close, color: secondary)),
            ]),
            const SizedBox(height: 16),
            Container(height: 44,
              decoration: BoxDecoration(border: Border.all(color: green), borderRadius: BorderRadius.circular(22)),
              child: const Row(children: [
                SizedBox(width: 12),
                Icon(Icons.search, color: secondary, size: 18),
                SizedBox(width: 8),
                Text('Search buddies...', style: TextStyle(color: secondary)),
              ])),
            const SizedBox(height: 16),
            ...['Djana Karsa', 'DBEPTI', 'Hendra Dinata', 'Nita Sunaryo'].map((name) =>
              Padding(padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  Container(width: 40, height: 40,
                    decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
                    child: Center(child: Text(name[0], style: const TextStyle(color: green, fontWeight: FontWeight.w600)))),
                  const SizedBox(width: 12),
                  Expanded(child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 14))),
                  if (name == 'Nita Sunaryo')
                    const Text('HCP 22', style: TextStyle(color: green, fontSize: 13)),
                ]))),
          ]));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
        child: Row(children: [
          const Text('Chats', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700)),
          const Spacer(),
          GestureDetector(onTap: _showNewMessage,
            child: Container(width: 36, height: 36,
              decoration: const BoxDecoration(color: greenDark, shape: BoxShape.circle),
              child: const Icon(Icons.edit_outlined, color: Colors.white, size: 18))),
        ])),
      Row(children: [
        _subTab('Chats', 0),
        _subTab('Contacts', 1),
      ]),
      const Divider(color: Color(0xFF1A2A1A), height: 1),
      Expanded(child: _sub == 0 ? _buildChatList() : _buildContacts()),
    ]);
  }

  Widget _subTab(String label, int idx) {
    final active = _sub == idx;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: () => setState(() => _sub = idx),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(border: Border(bottom: BorderSide(
            color: active ? green : Colors.transparent, width: 2))),
          child: Text(label, style: TextStyle(
            color: active ? green : secondary,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400, fontSize: 14)))));
  }

  Widget _buildChatList() {
    return ListView.separated(
      itemCount: _chats.length,
      separatorBuilder: (_, __) => const Divider(color: Color(0xFF1A2A1A), height: 1, indent: 72),
      itemBuilder: (_, i) {
        final c = _chats[i];
        return ListTile(
          leading: Container(width: 48, height: 48,
            decoration: const BoxDecoration(color: Color(0xFF1A3A1A), shape: BoxShape.circle),
            child: Center(child: Text(c['name']![0],
              style: const TextStyle(color: green, fontWeight: FontWeight.w600, fontSize: 18)))),
          title: Text(c['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          subtitle: Text(c['msg']!, style: const TextStyle(color: secondary, fontSize: 13)),
          trailing: Text(c['time']!, style: const TextStyle(color: secondary, fontSize: 12)),
        );
      });
  }

  Widget _buildContacts() {
    return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Icon(Icons.people_outline, color: Color(0xFF2A4A2A), size: 56),
      const SizedBox(height: 16),
      const Text('No contacts yet', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      const Text('Add buddies first to start chatting.', style: TextStyle(color: secondary, fontSize: 13)),
      const SizedBox(height: 12),
      const Text('Cari golfer', style: TextStyle(color: green, fontSize: 14, fontWeight: FontWeight.w600)),
    ]));
  }
}
