import 'package:flutter/material.dart';

void main() {
  runApp(const NovaStreamSportsApp());
}

class NovaStreamSportsApp extends StatelessWidget {
  const NovaStreamSportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NovaStream Sports',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B6E4F)),
        useMaterial3: true,
      ),
      home: const SportsHomePage(),
    );
  }
}

class SportsHomePage extends StatefulWidget {
  const SportsHomePage({super.key});

  @override
  State<SportsHomePage> createState() => _SportsHomePageState();
}

class _SportsHomePageState extends State<SportsHomePage> {
  int _selectedIndex = 0;

  static const _pages = [
    _HomeView(),
    _MatchesView(),
    _NewsView(),
    _FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NovaStream Sports'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.sports_soccer_outlined), selectedIcon: Icon(Icons.sports_soccer), label: 'Matches'),
          NavigationDestination(icon: Icon(Icons.article_outlined), selectedIcon: Icon(Icons.article), label: 'News'),
          NavigationDestination(icon: Icon(Icons.star_outline), selectedIcon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text('Good morning', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Your football news, fixtures, and live scores in one place.'),
        SizedBox(height: 24),
        _SectionTitle(title: 'Live now'),
        _EmptyCard(message: 'Live matches will appear here when connected to a football data provider.'),
        SizedBox(height: 20),
        _SectionTitle(title: 'Today’s fixtures'),
        _EmptyCard(message: 'Fixtures will be loaded from the configured football API.'),
      ],
    );
  }
}

class _MatchesView extends StatelessWidget {
  const _MatchesView();

  @override
  Widget build(BuildContext context) => const Center(child: Text('Matches\nFixtures and live scores coming next.', textAlign: TextAlign.center));
}

class _NewsView extends StatelessWidget {
  const _NewsView();

  @override
  Widget build(BuildContext context) => const Center(child: Text('News\nFootball news feeds coming next.', textAlign: TextAlign.center));
}

class _FavoritesView extends StatelessWidget {
  const _FavoritesView();

  @override
  Widget build(BuildContext context) => const Center(child: Text('Favorites\nYour teams and leagues will appear here.', textAlign: TextAlign.center));
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(message),
      ),
    );
  }
}
