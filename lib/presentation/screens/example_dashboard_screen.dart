import 'package:flutter/material.dart';
import '../../core/theme/tailwind_theme.dart';

/// Example Dashboard Screen
/// This demonstrates how to create content screens for the main app
class ExampleDashboardScreen extends StatelessWidget {
  const ExampleDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Page Title
          Text(
            'Dashboard',
            style: TailwindTheme.heading1.copyWith(
              color: isDark ? Colors.white : TailwindTheme.darkGray,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome to your dashboard',
            style: TailwindTheme.bodyMedium.copyWith(
              color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
            ),
          ),
          const SizedBox(height: 32),

          // Stats Cards
          isMobile
              ? Column(
                  children: [
                    _buildStatCard(
                      context,
                      title: 'Total Users',
                      value: '1,234',
                      icon: Icons.people,
                      color: TailwindTheme.primaryBlue,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildStatCard(
                      context,
                      title: 'Revenue',
                      value: '\$45,678',
                      icon: Icons.attach_money,
                      color: TailwindTheme.success,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 16),
                    _buildStatCard(
                      context,
                      title: 'Orders',
                      value: '567',
                      icon: Icons.shopping_cart,
                      color: TailwindTheme.warning,
                      isDark: isDark,
                    ),
                  ],
                )
              : Row(
                  children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  title: 'Total Users',
                  value: '1,234',
                  icon: Icons.people,
                  color: TailwindTheme.primaryBlue,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  context,
                  title: 'Revenue',
                  value: '\$45,678',
                  icon: Icons.attach_money,
                  color: TailwindTheme.success,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        title: 'Orders',
                        value: '567',
                        icon: Icons.shopping_cart,
                        color: TailwindTheme.warning,
                        isDark: isDark,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 32),

          // Content Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Activity',
                    style: TailwindTheme.heading3.copyWith(
                      color: isDark ? Colors.white : TailwindTheme.darkGray,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: isDark ? TailwindTheme.emerald400 : Colors.green,
                    ),
                    title: Text(
                      'Order #1234 completed',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      '2 hours ago',
                      style: TailwindTheme.bodySmall.copyWith(
                        color: isDark ? Colors.white60 : TailwindTheme.mediumGray,
                      ),
                    ),
                  ),
                  Divider(
                    color: isDark ? TailwindTheme.slate800 : TailwindTheme.slate200,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_add,
                      color: isDark ? TailwindTheme.blue400 : Colors.blue,
                    ),
                    title: Text(
                      'New user registered',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      '5 hours ago',
                      style: TailwindTheme.bodySmall.copyWith(
                        color: isDark ? Colors.white60 : TailwindTheme.mediumGray,
                      ),
                    ),
                  ),
                  Divider(
                    color: isDark ? TailwindTheme.slate800 : TailwindTheme.slate200,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.payment,
                      color: isDark ? TailwindTheme.amber400 : Colors.orange,
                    ),
                    title: Text(
                      'Payment received',
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      '1 day ago',
                      style: TailwindTheme.bodySmall.copyWith(
                        color: isDark ? Colors.white60 : TailwindTheme.mediumGray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required bool isDark,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: TailwindTheme.heading2.copyWith(
                color: isDark ? Colors.white : TailwindTheme.darkGray,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TailwindTheme.bodySmall.copyWith(
                color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

