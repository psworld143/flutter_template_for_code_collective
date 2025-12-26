# Quick Start Guide

## Installation

1. **Navigate to the template directory:**
   ```bash
   cd /Applications/XAMPP/xamppfiles/htdocs/flutter_app_branded_template
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## Basic Customization

### 1. Change App Name

Edit `pubspec.yaml`:
```yaml
name: your_app_name
```

### 2. Customize Branding

In `main.dart`, update the branding provider:

```dart
// After login, customize branding
final brandingProvider = Provider.of<BrandingProvider>(context, listen: false);
brandingProvider.setCompanyName('Your Company');
brandingProvider.setTagline('Your Tagline');
brandingProvider.setPrimaryColor(Color(0xFF10B981)); // Emerald green
```

### 3. Add Menu Items

Edit the `_menuItems` list in `main.dart`:

```dart
final List<SidebarMenuItem> _menuItems = [
  SidebarMenuItem(
    title: 'Dashboard',
    icon: Icons.dashboard,
    index: 0,
  ),
  SidebarMenuItem(
    title: 'My Feature',
    icon: Icons.star,
    index: 1,
  ),
  // Add more items...
];
```

### 4. Create Content Screens

Create new screens in `lib/presentation/screens/`:

```dart
class MyFeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My Feature Content'),
      ),
    );
  }
}
```

Then update the `_buildContent` method in `main.dart`:

```dart
Widget _buildContent(int selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return ExampleDashboardScreen();
    case 1:
      return MyFeatureScreen();
    default:
      return Placeholder();
  }
}
```

### 5. Add Logo

1. Place your logo image in `assets/images/logo.png`
2. Update branding:

```dart
brandingProvider.setLogoPath('assets/images/logo.png');
```

Or use a custom widget:

```dart
brandingProvider.setLogoWidget(
  Image.asset('assets/images/logo.png'),
);
```

## Architecture Overview

- **Theme System**: `lib/core/theme/tailwind_theme.dart`
- **State Management**: Provider pattern
- **Screens**: `lib/presentation/screens/`
- **Widgets**: `lib/presentation/widgets/`
- **Services**: `lib/components/services/`

## Key Components

- `LoginScreen`: Animated login screen
- `MainAppScreen`: Main layout with sidebar
- `AppSidebar`: Navigation sidebar
- `AppHeader`: Page header component
- `TailwindTheme`: Complete theme system
- `BrandingProvider`: Branding management
- `ThemeProvider`: Theme mode management

## Next Steps

1. Customize colors in `tailwind_theme.dart`
2. Add your authentication logic
3. Create your content screens
4. Add API integration
5. Customize the login screen animations
6. Add more menu items and features

## Tips

- Use `TailwindTheme` for consistent styling
- Leverage `BrandingProvider` for white-label customization
- Follow the existing component patterns
- Keep screens in `presentation/screens/`
- Keep reusable widgets in `presentation/widgets/`

