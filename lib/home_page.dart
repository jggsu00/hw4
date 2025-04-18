import 'package:flutter/material.dart';
import 'chat_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> boards = const [
    {
      'name': 'General Chat',
      'colors': [Colors.redAccent, Colors.orangeAccent],
      'icon': Icons.chat,
    },
    {
      'name': 'Gaming',
      'colors': [Colors.teal, Colors.lightBlueAccent],
      'icon': Icons.sports_esports,
    },
    {
      'name': 'Movies & TV',
      'colors': [Colors.pinkAccent, Colors.deepPurpleAccent],
      'icon': Icons.movie,
    },
    {
      'name': 'Tech Talk',
      'colors': [Colors.deepPurpleAccent, Colors.indigoAccent],
      'icon': Icons.computer,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final totalHeight = MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select A Room'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Message Boards'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: boards.length,
        itemBuilder: (context, index) {
          final board = boards[index];
          final bool isEven = index % 2 == 0;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(boardName: board['name']),
                ),
              );
            },
            child: Container(
              height: totalHeight / boards.length,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: List<Color>.from(board['colors']),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: isEven
                    ? [
                  const SizedBox(width: 32),
                  Expanded(
                    child: Text(
                      board['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    board['icon'],
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 32),
                ]
                    : [
                  const SizedBox(width: 32),
                  Icon(
                    board['icon'],
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      board['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
