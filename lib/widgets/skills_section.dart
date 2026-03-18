import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.3),
      ),
      child: Column(
        children: [
          // Section title
          Text(
            'Skills & Expertise',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          // Skills grid
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 2 : (size.width < 1200 ? 3 : 4);
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 1 : 1.2,
                children: [
                  _buildSkillCard(
                    context,
                    'Flutter & Dart',
                    FontAwesomeIcons.mobile,
                    0.95,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Firebase',
                    FontAwesomeIcons.fire,
                    0.90,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Java',
                    FontAwesomeIcons.java,
                    0.85,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Python & AI',
                    FontAwesomeIcons.python,
                    0.82,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'AWS',
                    FontAwesomeIcons.aws,
                    0.80,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'C++ / C#',
                    FontAwesomeIcons.code,
                    0.85,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'SQL',
                    FontAwesomeIcons.database,
                    0.83,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'HTML/CSS/JS',
                    FontAwesomeIcons.html5,
                    0.88,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Algolia',
                    FontAwesomeIcons.magnifyingGlass,
                    0.80,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Git & GitHub',
                    FontAwesomeIcons.github,
                    0.90,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Team Leadership',
                    FontAwesomeIcons.users,
                    0.85,
                    isMobile,
                  ),
                  _buildSkillCard(
                    context,
                    'Google Cloud',
                    FontAwesomeIcons.cloud,
                    0.82,
                    isMobile,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    String skill,
    IconData icon,
    double proficiency,
    bool isMobile,
  ) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: proficiency),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: FaIcon(
                    icon,
                    size: isMobile ? 32 : 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: isMobile ? 12 : 16),
                Text(
                  skill,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: isMobile ? 8 : 12),
                Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainer,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: value,
                      child: Container(
                        height: 6,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).colorScheme.secondary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 4 : 8),
                Text(
                  '${(value * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

