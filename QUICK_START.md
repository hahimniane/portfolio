# Quick Start Guide

Get your portfolio up and running in 5 minutes!

## 🚀 Run the App

```bash
cd portfolio_web
flutter run -d chrome
```

The app will open automatically in Chrome.

## ✏️ Quick Customization

### 1. Change Your Name (30 seconds)

Open `lib/widgets/hero_section.dart` and find line 81:
```dart
'Your Name',  // ← Change this to your actual name
```

### 2. Update Social Links (1 minute)

In `lib/widgets/hero_section.dart`, lines 193-209:
```dart
_buildSocialButton(context, FontAwesomeIcons.github, 'https://github.com/yourusername'),
_buildSocialButton(context, FontAwesomeIcons.linkedin, 'https://linkedin.com/in/yourusername'),
// Update with your actual social media URLs
```

### 3. Edit Your Bio (2 minutes)

In `lib/widgets/about_section.dart`, line 83:
```dart
'I specialize in building...'  // ← Write your own bio
```

### 4. Update Contact Info (1 minute)

In `lib/widgets/contact_section.dart`, lines 195-211:
```dart
'your.email@example.com',     // ← Your email
'+1 (555) 123-4567',          // ← Your phone
'Your City, Country',         // ← Your location
```

## 🎨 Hot Reload

After making changes:
1. **Save the file** (Cmd+S / Ctrl+S)
2. **Changes appear automatically** in the browser!

No need to restart the app - Flutter's hot reload is instant! ⚡

## 📱 Test Responsiveness

1. Run the app: `flutter run -d chrome`
2. Press **F12** to open Chrome DevTools
3. Click the **device icon** (Toggle device toolbar)
4. Try different screen sizes:
   - iPhone 12 Pro
   - iPad
   - Desktop HD

## 🎯 Next Steps

1. ✅ Read [CUSTOMIZATION_GUIDE.md](CUSTOMIZATION_GUIDE.md) for detailed instructions
2. ✅ Add your own projects and skills
3. ✅ Add profile picture (see customization guide)
4. ✅ Build for production: `flutter build web --release`
5. ✅ Deploy (see [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md))

## 📦 Project Structure

```
portfolio_web/
├── lib/
│   ├── main.dart              # App entry & theme
│   ├── screens/
│   │   └── home_screen.dart   # Main layout
│   └── widgets/               # All sections
│       ├── navbar.dart        # Navigation
│       ├── hero_section.dart  # ← Start here!
│       ├── about_section.dart
│       ├── skills_section.dart
│       ├── projects_section.dart
│       └── contact_section.dart
└── web/                       # Web-specific files
```

## ⚡ Pro Tips

1. **Change Theme Color**: Edit `main.dart` line 18
   ```dart
   seedColor: const Color(0xFF6366F1),  // Try: 0xFF2563EB for blue
   ```

2. **Switch to Light Mode**: Edit `main.dart` line 29
   ```dart
   themeMode: ThemeMode.light,  // or ThemeMode.system
   ```

3. **Faster Edits**: Use multi-cursor selection:
   - Mac: Cmd+D
   - Windows/Linux: Ctrl+D

## 🆘 Need Help?

- **Comprehensive guide**: [CUSTOMIZATION_GUIDE.md](CUSTOMIZATION_GUIDE.md)
- **Deploy your site**: [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md)
- **Flutter docs**: https://flutter.dev/docs

## 🎉 You're Ready!

Your portfolio is live locally. Make it yours and share it with the world!

---

**Time to customize**: 5-30 minutes  
**Time to deploy**: 5-10 minutes  
**Total**: Under 1 hour to have a professional portfolio live! 🚀

