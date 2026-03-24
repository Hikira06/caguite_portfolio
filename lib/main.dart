import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Renz Cyrone Caguite Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  static const _skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'UI/UX',
    'Git',
    'Responsive Design',
  ];

  static const _projects = [
    _Project(
      name: 'Portfolio Website',
      description:
          'A lightweight, maintainable portfolio Website for Android, iOS, web and desktop.',
      tech: 'Flutter, Material 3',
    ),
    _Project(
      name: 'University Community Engagement File Repository System',
      description:
          'A file repository system for managing and organizing community engagement files.',
      tech: 'Flutter, Firebase, Cloud Storage',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renz Portfolio'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProfileCard(),
              const SizedBox(height: 14),
              const SectionTitle(title: 'About Me'),
              const Text(
                'Recent graduate with strong academic credentials for graduating and finishing a Bachelor\'s Degree for Bachelor of Science in Information and Technology, seeking to leverage analytical skills and passion for innovation in entry-level roles. Proven ability to adapt quickly, collaborate effectively across diverse teams, and deliver high-quality work under tight deadlines.',
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Skills'),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _skills
                    .map(
                      (skill) => Chip(
                        label: Text(skill),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(30),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Projects'),
              ..._projects.map((project) => _ProjectCard(project: project)),
              const SizedBox(height: 20),
              const SectionTitle(title: 'Contact'),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Theme.of(context).colorScheme.primary.withAlpha(18),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: caguiterenzcyrone@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'LinkedIn: linkedin.com/in/renz',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'GitHub: github.com/renz',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  'Built with sustainability in mind: reusable components and stable architecture.',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 34,
              child: Text(
                'R',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hello, I’m Renz',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('Flutter Developer', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 2),
                  Text(
                    'Building polished cross-platform apps since 2024',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
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

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              project.description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              'Tech: ${project.tech}',
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class _Project {
  final String name;
  final String description;
  final String tech;

  const _Project({
    required this.name,
    required this.description,
    required this.tech,
  });
}
