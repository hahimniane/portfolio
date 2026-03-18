# Portfolio Web App

A beautiful and modern portfolio web application built with Flutter Web.

## Features

✨ **Modern Design**
- Clean and professional UI with smooth animations
- Gradient backgrounds and beautiful color schemes
- Responsive design that works on all screen sizes

🎨 **Sections**
- **Hero Section**: Eye-catching introduction with animated text
- **About**: Personal information with statistics
- **Skills**: Visual skill cards with proficiency indicators
- **Projects**: Showcase of featured projects with details
- **Contact**: Contact form and information

🚀 **Technologies**
- Flutter Web
- Google Fonts
- Font Awesome Icons
- Animated Text Kit
- URL Launcher

## Getting Started

### Prerequisites
- Flutter SDK (3.9.2 or higher)
- A web browser

### Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd portfolio_web
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run -d chrome
```

### Building for Production

Build for web deployment:
```bash
flutter build web --release
```

The built files will be in `build/web/` directory.

## Customization

### Personal Information
Update the following files to customize with your information:

1. **Hero Section** (`lib/widgets/hero_section.dart`):
   - Change name, roles, and description
   - Update social media links

2. **About Section** (`lib/widgets/about_section.dart`):
   - Modify personal description
   - Update statistics (years of experience, projects, clients)

3. **Skills Section** (`lib/widgets/skills_section.dart`):
   - Add/remove skills
   - Adjust proficiency levels

4. **Projects Section** (`lib/widgets/projects_section.dart`):
   - Add your own projects
   - Update project details, technologies, and links

5. **Contact Section** (`lib/widgets/contact_section.dart`):
   - Update email, phone, and location
   - Configure contact form backend

### Theme Colors
Modify the theme in `lib/main.dart`:
```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: const Color(0xFF6366F1), // Change this color
  brightness: Brightness.dark,
),
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   └── home_screen.dart     # Main screen with navigation
└── widgets/
    ├── navbar.dart          # Navigation bar
    ├── hero_section.dart    # Hero/landing section
    ├── about_section.dart   # About section
    ├── skills_section.dart  # Skills section
    ├── projects_section.dart # Projects showcase
    └── contact_section.dart # Contact form
```

## Deployment

### Firebase Hosting
```bash
firebase init hosting
firebase deploy
```

### Netlify
1. Connect your repository
2. Set build command: `flutter build web --release`
3. Set publish directory: `build/web`

### GitHub Pages
```bash
flutter build web --release --base-href "/your-repo-name/"
# Copy build/web/* to your gh-pages branch
```

## License

This project is open source and available under the MIT License.

## Contact

Feel free to reach out if you have any questions!

---

Made with ❤️ using Flutter
