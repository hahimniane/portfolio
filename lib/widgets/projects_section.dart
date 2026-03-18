import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
      child: Column(
        children: [
          // Section title
          Text(
            'Featured Projects',
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
          // Projects grid
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: [
                    _buildProjectCard(
                      context,
                      'Money Transfer Application',
                      'Fintech application for Landstar Company enabling safe and swift money transfers across African countries (Guinea, Liberia, Turkey). Features transaction confirmation, customer payments, and real-time processing.',
                      ['Flutter', 'Firebase', 'Payment APIs'],
                      const Color(0xFF10B981),
                      isMobile,
                      'https://github.com/hahimniane/myt_transfer_app',
                    ),
                    const SizedBox(height: 20),
                    _buildProjectCard(
                      context,
                      'Food Delivery Platform',
                      'Large-scale food delivery app serving millions across Guinea, Liberia, and Sierra Leone. Led team of 10 developers. Features multi-restaurant showcase, real-time order tracking, and location-based services.',
                      ['Flutter', 'Firebase', 'Algolia', 'Google Maps'],
                      const Color(0xFFEF4444),
                      isMobile,
                      'https://github.com/hahimniane/ravie',
                    ),
                    const SizedBox(height: 20),
                    _buildProjectCard(
                      context,
                      'Ahlan Cargo Logistics',
                      'Logistics management system for Ahlan Company (Dubai to Africa). Enables real-time container tracking, inter-department data sharing, and status updates for goods shipment across continents.',
                      ['Flutter', 'Firebase', 'Real-time DB'],
                      const Color(0xFF3B82F6),
                      isMobile,
                      'https://github.com/hahimniane/AHLAN_CARGO_PROJECT',
                    ),
                  ],
                );
              }
              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: size.width < 1200 ? 1 : 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1.3,
                children: [
                  _buildProjectCard(
                    context,
                    'Money Transfer Application',
                    'Fintech application for Landstar Company enabling safe and swift money transfers across African countries (Guinea, Liberia, Turkey). Features transaction confirmation, customer payments, and real-time processing.',
                    ['Flutter', 'Firebase', 'Payment APIs'],
                    const Color(0xFF10B981),
                    isMobile,
                    'https://github.com/hahimniane/myt_transfer_app',
                  ),
                  _buildProjectCard(
                    context,
                    'Food Delivery Platform',
                    'Large-scale food delivery app serving millions across Guinea, Liberia, and Sierra Leone. Led team of 10 developers. Features multi-restaurant showcase, real-time order tracking, and location-based services.',
                    ['Flutter', 'Firebase', 'Algolia', 'Google Maps'],
                    const Color(0xFFEF4444),
                    isMobile,
                    'https://github.com/hahimniane/ravie',
                  ),
                  _buildProjectCard(
                    context,
                    'Ahlan Cargo Logistics',
                    'Logistics management system for Ahlan Company (Dubai to Africa). Enables real-time container tracking, inter-department data sharing, and status updates for goods shipment across continents.',
                    ['Flutter', 'Firebase', 'Real-time DB'],
                    const Color(0xFF3B82F6),
                    isMobile,
                    'https://github.com/hahimniane/AHLAN_CARGO_PROJECT',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    String title,
    String description,
    List<String> technologies,
    Color accentColor,
    bool isMobile,
    String githubUrl,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.95, end: 1.0),
        duration: const Duration(milliseconds: 200),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project image/header
                  Container(
                    height: isMobile ? 120 : 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          accentColor,
                          accentColor.withOpacity(0.6),
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.laptop_mac,
                        size: isMobile ? 48 : 64,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                  // Project content
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(isMobile ? 20 : 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: isMobile ? 20 : 24,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: isMobile ? 8 : 12),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 15,
                              height: 1.6,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.7),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          // Technologies
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: technologies.map((tech) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: accentColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  tech,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: isMobile ? 12 : 16),
                          // Action buttons
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () async {
                                  final uri = Uri.parse(githubUrl);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  }
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.github,
                                  size: 16,
                                ),
                                label: const Text('View Code'),
                                style: TextButton.styleFrom(
                                  foregroundColor: accentColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

