# Flutter Branded App Template

A comprehensive Flutter application template featuring modern UI design, sidebar navigation, customizable branding, and a beautiful login screen. This template is based on the architectural patterns from a production TMS (Transport Management System) application.

## Features

### 🎨 **Modern UI Design**
- Tailwind CSS-inspired theme system
- Comprehensive color palette (Slate, Blue, Emerald, Amber, Red, Indigo, Purple)
- Typography system using Google Fonts (Poppins)
- Light and dark theme support
- Responsive design

### 🚪 **Login Screen**
- Animated background with gradient effects
- Moving truck animations
- Animated route lines (dashed paths)
- Floating particles
- Modern card-based design
- Form validation

### 📱 **Sidebar Navigation**
- Role-based menu items
- Collapsible groups with sub-items
- Active state highlighting
- Logo and branding support
- Logout functionality

### 📋 **Header Component**
- Gradient backgrounds
- Icon support
- Title and subtitle
- Action buttons area
- Responsive layout

### 🎯 **Main App Layout**
- Sidebar + Content area layout
- Header integration
- Content builder pattern
- Easy customization

### 🎨 **Branding System**
- White-label support
- Customizable company name and tagline
- Logo widget support
- Color customization (primary, secondary, accent)
- Theme provider integration

## Project Structure

```
lib/
├── core/
│   ├── theme/
│   │   └── tailwind_theme.dart      # Theme system with colors, typography, spacing
│   └── utils/                        # Utility functions
├── components/
│   ├── services/
│   │   ├── theme_provider.dart      # Theme state management
│   │   └── branding_provider.dart   # Branding state management
│   └── widgets/                      # Reusable widgets
└── presentation/
    ├── screens/
    │   ├── login_screen.dart         # Login screen with animations
    │   └── main_app_screen.dart      # Main app layout
    └── widgets/
        ├── app_sidebar.dart          # Sidebar navigation
        └── app_header.dart           # Header component
```

## Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Run the App

```bash
flutter run
```

### 3. Customize Branding

Update the branding in `main.dart`:

```dart
final brandingProvider = Provider.of<BrandingProvider>(context);
brandingProvider.setCompanyName('Your Company Name');
brandingProvider.setTagline('Your Tagline');
brandingProvider.setPrimaryColor(Colors.blue);
```

### 4. Customize Menu Items

Edit the menu items in `main.dart`:

```dart
final List<SidebarMenuItem> _menuItems = [
  SidebarMenuItem(
    title: 'Dashboard',
    icon: Icons.dashboard,
    index: 0,
  ),
  SidebarMenuItem(
    title: 'Settings',
    icon: Icons.settings,
    index: 1,
  ),
  // Add more items...
];
```

## Usage Examples

### Custom Login Handler

```dart
LoginScreen(
  onLogin: (email, password) async {
    // Your authentication logic here
    final success = await authenticateUser(email, password);
    if (success) {
      // Navigate to main app
    }
  },
)
```

### Custom Content Builder

```dart
MainAppScreen(
  menuItems: _menuItems,
  contentBuilder: (selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return DashboardScreen();
      case 1:
        return SettingsScreen();
      default:
        return Placeholder();
    }
  },
)
```

### Custom Header

```dart
AppHeader(
  title: 'Dashboard',
  subtitle: 'Overview of your data',
  icon: Icons.dashboard,
  actions: [
    IconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {},
    ),
  ],
)
```

## Theme Customization

### Colors

The theme uses a comprehensive color system:

- **Slate**: Neutral grays (slate50 to slate950)
- **Blue**: Primary brand color (blue50 to blue950)
- **Emerald**: Success/green colors (emerald50 to emerald950)
- **Amber**: Warning colors (amber50 to amber950)
- **Red**: Error colors (red50 to red950)
- **Indigo**: Secondary colors (indigo50 to indigo950)
- **Purple**: Accent colors (purple50 to purple950)

### Typography

Text styles are available via `TailwindTheme`:

- `TailwindTheme.textXs` to `TailwindTheme.text6xl`
- `TailwindTheme.heading1` to `TailwindTheme.heading6`
- `TailwindTheme.bodyLarge`, `bodyMedium`, `bodySmall`

### Spacing

Consistent spacing system:

- `TailwindTheme.spacing1` (4px) to `TailwindTheme.spacing24` (96px)

### Border Radius

- `TailwindTheme.roundedSm` to `TailwindTheme.roundedFull`

## Architecture

### State Management

The template uses **Provider** for state management:

- `ThemeProvider`: Manages light/dark theme
- `BrandingProvider`: Manages branding and white-label settings

### Component Pattern

Components follow a clean separation:

- **Screens**: Full-page widgets (LoginScreen, MainAppScreen)
- **Widgets**: Reusable UI components (AppSidebar, AppHeader)
- **Services**: State management and business logic

## Customization Guide

### 1. Change Primary Colors

Edit `tailwind_theme.dart` or use `BrandingProvider`:

```dart
brandingProvider.setPrimaryColor(Color(0xFF10B981)); // Emerald
```

### 2. Add Custom Fonts

1. Add fonts to `assets/fonts/`
2. Update `pubspec.yaml` fonts section
3. Modify `tailwind_theme.dart` to use custom fonts

### 3. Customize Login Screen

Edit `login_screen.dart`:

- Change logo icon
- Modify animations
- Update form fields
- Customize colors

### 4. Extend Sidebar

Add more menu items or customize the sidebar appearance in `app_sidebar.dart`.

## Dependencies

- `flutter`: SDK
- `provider`: State management
- `shared_preferences`: Local storage
- `google_fonts`: Typography

## License

This template is provided as-is for use in your projects.

## Contributing

Feel free to customize this template for your needs. The architecture is designed to be easily extensible.

## Notes

- The template is based on production code patterns
- All components are fully customizable
- Dark mode is fully supported
- Responsive design is built-in
- Animation performance is optimized

