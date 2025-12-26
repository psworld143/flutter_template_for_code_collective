import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/tailwind_theme.dart';
import 'components/services/theme_provider.dart';
import 'components/services/branding_provider.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/main_app_screen.dart';
import 'presentation/screens/example_dashboard_screen.dart';
import 'presentation/widgets/app_sidebar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize theme provider and load saved theme preference
  final themeProvider = ThemeProvider();
  await themeProvider.initializeTheme();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider(create: (_) => BrandingProvider()),
      ],
      child: const BrandedApp(),
    ),
  );
}

class BrandedApp extends StatelessWidget {
  const BrandedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Branded Flutter App',
          debugShowCheckedModeBanner: false,
          theme: TailwindTheme.lightTheme,
          darkTheme: TailwindTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: const AppWrapper(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}

class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool _isLoggedIn = false;

  // Example menu items
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
    SidebarMenuItem(
      title: 'Profile',
      icon: Icons.person,
      index: 2,
    ),
    SidebarMenuItem(
      title: 'Reports',
      icon: Icons.assessment,
      index: 3,
      subItems: [
        SidebarMenuItem(
          title: 'Sales Report',
          icon: Icons.trending_up,
          index: 4,
        ),
        SidebarMenuItem(
          title: 'Analytics',
          icon: Icons.analytics,
          index: 5,
        ),
      ],
    ),
  ];

  void _handleLogin(String email, String password) async {
    // Simulate login process
    await Future.delayed(const Duration(seconds: 1));
    
    // In a real app, you would validate credentials here
    if (mounted) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  void _handleLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  Widget _buildContent(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const ExampleDashboardScreen();
      case 1:
        return const Center(
          child: Text(
            'Settings Content',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            'Profile Content',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 4:
        return const Center(
          child: Text(
            'Sales Report Content',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      case 5:
        return const Center(
          child: Text(
            'Analytics Content',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
      default:
        return const Center(
          child: Text(
            'Content Placeholder',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoggedIn) {
      return LoginScreen(onLogin: _handleLogin);
    }

    return MainAppScreen(
      menuItems: _menuItems,
      contentBuilder: _buildContent,
      headerTitle: 'Welcome',
      headerSubtitle: 'Manage your application',
      headerIcon: Icons.dashboard,
      onLogout: _handleLogout,
    );
  }
}

