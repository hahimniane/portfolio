import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const Navbar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (isMobile) {
      return Positioned(
        bottom: 20,
        left: 20,
        right: 20,
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.9),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavIcon(0, Icons.home, widget.onHomePressed),
                _buildNavIcon(1, Icons.person, widget.onAboutPressed),
                _buildNavIcon(2, Icons.code, widget.onSkillsPressed),
                _buildNavIcon(3, Icons.work, widget.onProjectsPressed),
                _buildNavIcon(4, Icons.email, widget.onContactPressed),
              ],
            ),
          ),
        ),
      );
    }

    return Positioned(
      top: 20,
      left: 0,
      right: 0,
      child: Center(
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.9),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavButton(0, 'Home', widget.onHomePressed),
                const SizedBox(width: 8),
                _buildNavButton(1, 'About', widget.onAboutPressed),
                const SizedBox(width: 8),
                _buildNavButton(2, 'Skills', widget.onSkillsPressed),
                const SizedBox(width: 8),
                _buildNavButton(3, 'Projects', widget.onProjectsPressed),
                const SizedBox(width: 8),
                _buildNavButton(4, 'Contact', widget.onContactPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(int index, String label, VoidCallback onPressed) {
    final isSelected = _selectedIndex == index;
    return TextButton(
      onPressed: () {
        setState(() => _selectedIndex = index);
        onPressed();
      },
      style: TextButton.styleFrom(
        backgroundColor: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.transparent,
        foregroundColor: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildNavIcon(int index, IconData icon, VoidCallback onPressed) {
    final isSelected = _selectedIndex == index;
    return IconButton(
      onPressed: () {
        setState(() => _selectedIndex = index);
        onPressed();
      },
      icon: Icon(icon),
      color: isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
      iconSize: 28,
    );
  }
}

