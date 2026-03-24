import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A365D),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  static const _projects = [
    _Project(
      name: 'University Community Engagement File Repository System',
      description:
          'A file repository system for managing and organizing community engagement files.',
      tech: 'Flutter, Firebase, Cloud Storage',
      screenshotUrls: [
        'repository_screenshot',
        'repository_screenshot_2',
        'repository_screenshot_3',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renz Portfolio'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProfileCard(),
              const SizedBox(height: 48),
              const SectionTitle(title: 'About Me'),
              const Text(
                'A recent graduate with strong academic credentials for graduating and finishing a Bachelor\'s Degree for Bachelor of Science in Information and Technology, seeking to leverage analytical skills and passion for innovation in entry-level roles. Proven ability to adapt quickly, collaborate effectively across diverse teams, and deliver high-quality work under tight deadlines.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Color(0xFF2D3748),
                  letterSpacing: -0.1,
                ),
              ),
              const SizedBox(height: 48),
              const SectionTitle(title: 'Skills'),
              const _SkillsGrid(),
              const SizedBox(height: 48),
              const SectionTitle(title: 'Projects'),
              ..._projects.map((project) => _ProjectCard(project: project)),
              const SizedBox(height: 48),
              const SectionTitle(title: 'Contact'),
              const _ContactCard(),
              const SizedBox(height: 80),
              Center(
                child: Text(
                  'Thank You For Your Time.',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF718096),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  static const _roles = [
    'Flutter Developer',
    'Graphic Designer',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8FAFC), Color(0xFFFFFFFF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: const AssetImage('assets/images/profile.jpg'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello, I\'m Renz Cyrone Caguite, Welcome to My Portfolio!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A202C),
                        letterSpacing: -0.5,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _roles.map((role) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              
                              Text(
                                role,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Building polished cross-platform apps since 2024',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF4A5568),
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  static const _skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'UI/UX',
    'Git',
    'Responsive Design',
    'Graphic Design',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _skills.map((skill) => Chip(label: Text(skill))).toList(),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _Project project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFF8FAFC)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectScreenshots(project.screenshotUrls),
              const SizedBox(height: 20),
              Text(
                project.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A202C),
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                project.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4A5568),
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  project.tech,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildProjectScreenshots(List<String> screenshotUrls) {
  return SizedBox(
    height: 240,
    child: Scrollbar(
      thumbVisibility: true,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: false,  // Add this
        itemCount: screenshotUrls.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
            final name = screenshotUrls[index];
            return SizedBox(
              width: 300,
              child: GestureDetector(
                onTap: () => _openScreenshotViewer(context, name),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset('assets/images/$name.jpg', fit: BoxFit.contain),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          name.replaceAll('_', ' '),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _openScreenshotViewer(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        final screenSize = MediaQuery.of(context).size;
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ),
          backgroundColor: Colors.transparent,
          child: Center(
            child: Container(
              width: screenSize.width * 0.95,
              height: screenSize.height * 0.85,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: InteractiveViewer(
                        minScale: 1,
                        maxScale: 4,
                        child: Image.asset(
                          'assets/images/$name.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(dialogContext).pop(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A202C),
              letterSpacing: -0.4,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 3,
            width: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final gmailUri = Uri.parse(
                  'https://mail.google.com/mail/?view=cm&fs=1&to=caguiterenzcyrone@gmail.com',
                );
                if (await canLaunchUrl(gmailUri)) {
                  await launchUrl(
                    gmailUri,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  final emailUri = Uri.parse(
                    'mailto:caguiterenzcyrone@gmail.com',
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri);
                  }
                }
              },
              child: Row(
                children: const [
                  Icon(Icons.email, color: Color(0xFF1A202C)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'caguiterenzcyrone@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1A202C),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final phoneUri = Uri.parse('tel:+639475580109');
                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                }
              },
              child: Row(
                children: const [
                  Icon(Icons.phone, color: Color(0xFF1A202C)),
                  SizedBox(width: 8),
                  Text(
                    '+63 947 558 0109',
                    style: TextStyle(fontSize: 16, color: Color(0xFF1A202C)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final githubUri = Uri.parse('https://github.com/Hikira06');
                if (await canLaunchUrl(githubUri)) {
                  await launchUrl(
                    githubUri,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Row(
                children: const [
                  Icon(Icons.code, color: Color(0xFF1A202C)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'github.com/Hikira06',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1A202C),
                        decoration: TextDecoration.underline,
                      ),
                    ),
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

class _Project {
  final String name;
  final String description;
  final String tech;
  final List<String> screenshotUrls;

  const _Project({
    required this.name,
    required this.description,
    required this.tech,
    required this.screenshotUrls,
  });
}
