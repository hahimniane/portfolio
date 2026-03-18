# Customization Guide

This guide will help you customize the portfolio to make it your own.

## Quick Start Checklist

- [ ] Update personal information (name, bio, location)
- [ ] Add your own profile image
- [ ] Update skills and proficiency levels
- [ ] Add your real projects
- [ ] Update social media links
- [ ] Configure contact information
- [ ] Change color scheme (optional)
- [ ] Add your resume/CV PDF

## 1. Personal Information

### Hero Section (`lib/widgets/hero_section.dart`)

**Line 81-85**: Change your name
```dart
Text(
  'Your Name',  // ← Change this
  style: TextStyle(...),
),
```

**Line 93-121**: Update your roles/titles
```dart
TypewriterAnimatedText(
  'Full Stack Developer',  // ← Add your role
  textStyle: TextStyle(...),
),
```

**Line 135-138**: Update your bio description
```dart
Text(
  'Passionate about creating...',  // ← Your description
  style: TextStyle(...),
),
```

**Line 193-209**: Update social media links
```dart
_buildSocialButton(
  context,
  FontAwesomeIcons.github,
  'https://github.com/yourusername',  // ← Your links
),
```

## 2. About Section (`lib/widgets/about_section.dart`)

**Line 83-99**: Update your bio text
```dart
Text(
  'I specialize in building...',  // ← Your about text
  style: TextStyle(...),
),
```

**Line 104-106**: Update statistics
```dart
_buildStatCard(context, '5+', 'Years Experience', isMobile),  // ← Your stats
_buildStatCard(context, '50+', 'Projects Completed', isMobile),
_buildStatCard(context, '30+', 'Happy Clients', isMobile),
```

## 3. Skills Section (`lib/widgets/skills_section.dart`)

**Line 64-97**: Customize your skills

Add or remove skills by modifying the GridView children:
```dart
_buildSkillCard(
  context,
  'Your Skill',           // ← Skill name
  FontAwesomeIcons.icon,  // ← Choose icon
  0.90,                   // ← Proficiency (0.0 to 1.0)
  isMobile,
),
```

Available icons: Check [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter) for icon names.

## 4. Projects Section (`lib/widgets/projects_section.dart`)

**Line 61-121**: Update projects

Each project needs:
```dart
_buildProjectCard(
  context,
  'Project Name',                    // ← Project title
  'Project description here...',     // ← Description
  ['Tech1', 'Tech2', 'Tech3'],      // ← Technologies used
  Colors.blue,                       // ← Accent color
  isMobile,
),
```

**Update project links** (Line 267-286):
```dart
onPressed: () async {
  final uri = Uri.parse('https://github.com/yourproject');  // ← Your repo
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
},
```

## 5. Contact Section (`lib/widgets/contact_section.dart`)

**Line 195-211**: Update contact information
```dart
_buildInfoCard(
  context,
  Icons.email_outlined,
  'Email',
  'your.email@example.com',  // ← Your email
  isMobile,
),
```

**Line 127**: Update copyright
```dart
Text(
  '© 2025 Your Name. All rights reserved.',  // ← Your name
  style: TextStyle(...),
),
```

## 6. Adding Images/Assets

### Step 1: Create assets folder
```bash
mkdir -p assets/images
```

### Step 2: Add images to `assets/images/`
- Profile photo: `profile.jpg`
- Project screenshots: `project1.png`, `project2.png`, etc.

### Step 3: Update `pubspec.yaml`
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

### Step 4: Use images in code

**For profile image** (in `hero_section.dart`):
```dart
// Replace Container with gradient (Line 68-86) with:
Container(
  width: isMobile ? 120 : 160,
  height: isMobile ? 120 : 160,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: const DecorationImage(
      image: AssetImage('assets/images/profile.jpg'),
      fit: BoxFit.cover,
    ),
    boxShadow: [...],
  ),
),
```

**For project images** (in `projects_section.dart`):
```dart
// Replace the gradient Container (Line 228-247) with:
Container(
  height: isMobile ? 120 : 150,
  decoration: BoxDecoration(
    image: const DecorationImage(
      image: AssetImage('assets/images/project1.png'),
      fit: BoxFit.cover,
    ),
    borderRadius: const BorderRadius.only(...),
  ),
),
```

## 7. Theme Customization (`lib/main.dart`)

**Change primary color:**
```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: const Color(0xFF6366F1),  // ← Change hex color
  brightness: Brightness.dark,
),
```

**Popular color options:**
- Blue: `0xFF2563EB`
- Purple: `0xFF6366F1`
- Green: `0xFF10B981`
- Orange: `0xFFF59E0B`
- Pink: `0xFFEC4899`
- Teal: `0xFF14B8A6`

**Switch to light mode:**
```dart
themeMode: ThemeMode.light,  // or ThemeMode.system
```

## 8. Adding Resume/CV Download

### Step 1: Add PDF to assets
1. Place your CV in `assets/resume.pdf`
2. Update `pubspec.yaml`:
```yaml
assets:
  - assets/resume.pdf
```

### Step 2: Update download button in `hero_section.dart` (Line 150-165)
```dart
ElevatedButton.icon(
  onPressed: () async {
    final uri = Uri.parse('https://your-website.com/resume.pdf');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  },
  icon: const Icon(Icons.download),
  label: const Text('Download CV'),
  style: ElevatedButton.styleFrom(...),
),
```

## 9. Contact Form Backend

The contact form currently shows a success message. To make it functional:

### Option 1: EmailJS
```dart
// Add email_js package to pubspec.yaml
// Configure in contact_section.dart

onPressed: () async {
  if (_formKey.currentState!.validate()) {
    // Send email via EmailJS API
    await sendEmail(
      name: _nameController.text,
      email: _emailController.text,
      message: _messageController.text,
    );
  }
},
```

### Option 2: Firebase Cloud Functions
```dart
// Add cloud_firestore package
// Store messages in Firestore

onPressed: () async {
  if (_formKey.currentState!.validate()) {
    await FirebaseFirestore.instance
        .collection('messages')
        .add({
      'name': _nameController.text,
      'email': _emailController.text,
      'message': _messageController.text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
},
```

## 10. Responsive Design Testing

Test your portfolio on different screen sizes:
```bash
# Desktop
flutter run -d chrome

# Mobile view (resize browser window or use DevTools)
# Press F12 in Chrome → Toggle device toolbar
```

## 11. Performance Optimization

After customization, optimize for production:

```bash
# Analyze bundle size
flutter build web --release --analyze-size

# Enable web renderer optimizations
flutter build web --release --web-renderer canvaskit

# For better load times, use HTML renderer
flutter build web --release --web-renderer html
```

## Tips

1. **Icons**: Browse [Font Awesome](https://fontawesome.com/icons) for more icons
2. **Colors**: Use [Coolors](https://coolors.co/) for color palette inspiration
3. **Fonts**: Check [Google Fonts](https://fonts.google.com/) for different fonts
4. **Images**: Use high-quality images (compressed with [TinyPNG](https://tinypng.com/))
5. **Test**: Always test on multiple devices and browsers

## Need Help?

- Flutter Documentation: https://docs.flutter.dev
- Flutter Web: https://flutter.dev/web
- Stack Overflow: https://stackoverflow.com/questions/tagged/flutter

Happy customizing! 🚀

