import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_sidebar.dart';
import '../widgets/app_header.dart';
import '../../core/theme/tailwind_theme.dart';
import '../../components/services/theme_provider.dart';

/// Main App Screen with Sidebar and Content Layout
class MainAppScreen extends StatefulWidget {
  final List<SidebarMenuItem> menuItems;
  final Widget Function(int selectedIndex) contentBuilder;
  final String? headerTitle;
  final String? headerSubtitle;
  final IconData? headerIcon;
  final List<Widget>? headerActions;
  final VoidCallback? onLogout;

  const MainAppScreen({
    super.key,
    required this.menuItems,
    required this.contentBuilder,
    this.headerTitle,
    this.headerSubtitle,
    this.headerIcon,
    this.headerActions,
    this.onLogout,
  });

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _selectedIndex = 0;

  // Helper function to find menu item by index (including nested items)
  SidebarMenuItem? _findMenuItemByIndex(int index, List<SidebarMenuItem> items) {
    for (final item in items) {
      if (item.index == index) {
        return item;
      }
      if (item.subItems != null) {
        final found = _findMenuItemByIndex(index, item.subItems!);
        if (found != null) {
          return found;
        }
      }
    }
    return null;
  }

  // Get header info based on selected index
  Map<String, dynamic> _getHeaderInfo(int index) {
    final menuItem = _findMenuItemByIndex(index, widget.menuItems);
    
    if (menuItem != null) {
      return {
        'title': menuItem.title,
        'icon': menuItem.icon,
        'subtitle': _getSubtitleForIndex(index),
      };
    }
    
    // Fallback to provided header or default
    return {
      'title': widget.headerTitle ?? 'Dashboard',
      'icon': widget.headerIcon ?? Icons.dashboard,
      'subtitle': widget.headerSubtitle ?? 'Welcome back',
    };
  }

  // Get contextual subtitle based on screen
  String _getSubtitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Overview and quick actions';
      case 1:
        return 'Application settings';
      case 2:
        return 'User profile information';
      default:
        return 'Welcome back';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark 
        ? TailwindTheme.slate950 
        : TailwindTheme.slate50;
    
    final headerInfo = _getHeaderInfo(_selectedIndex);
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          // Sidebar
          AppSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            onLogout: widget.onLogout,
            menuItems: widget.menuItems,
          ),

          // Main Content Area
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: AppHeader(
                        title: headerInfo['title'] as String,
                        subtitle: headerInfo['subtitle'] as String?,
                        icon: headerInfo['icon'] as IconData?,
                        actions: [
                            // Theme Toggle Button
                            Consumer<ThemeProvider>(
                              builder: (context, themeProvider, child) {
                                final isDark = themeProvider.isDarkMode(context);
                                final themeMode = themeProvider.themeMode;
                                IconData icon;
                                String tooltip;
                                
                                if (themeMode == ThemeMode.system) {
                                  icon = isDark ? Icons.brightness_auto : Icons.brightness_auto;
                                  tooltip = 'System Mode (${isDark ? "Dark" : "Light"}) - Tap to switch';
                                } else if (themeMode == ThemeMode.dark) {
                                  icon = Icons.light_mode;
                                  tooltip = 'Light Mode - Tap to switch to System';
                                } else {
                                  icon = Icons.dark_mode;
                                  tooltip = 'Dark Mode - Tap to switch to System';
                                }
                                
                                return IconButton(
                                  icon: Icon(icon),
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white70
                                      : TailwindTheme.mediumGray,
                                  tooltip: tooltip,
                                  onPressed: () {
                                    themeProvider.toggleTheme();
                                  },
                                );
                              },
                            ),
                            // Additional actions if provided
                            if (widget.headerActions != null) ...widget.headerActions!,
                          ],
                        ),
                      ),

                    // Content
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: widget.contentBuilder(_selectedIndex),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

