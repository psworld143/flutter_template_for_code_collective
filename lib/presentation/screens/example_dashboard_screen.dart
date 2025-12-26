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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date Display
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _getCurrentDate(),
                style: TailwindTheme.textSm.copyWith(
                  color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Stats Grid
          GridView.count(
            crossAxisCount: isMobile ? 1 : 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: isMobile ? 3.0 : 2.5,
            children: [
              _buildStatCard(
                context,
                'Total Users',
                '1,234',
                Icons.people,
                TailwindTheme.blue500,
                'Active users',
              ),
              _buildStatCard(
                context,
                'Revenue',
                '\$45,678',
                Icons.attach_money,
                TailwindTheme.emerald500,
                'This month',
              ),
              _buildStatCard(
                context,
                'Orders',
                '567',
                Icons.shopping_cart,
                TailwindTheme.purple500,
                'Pending orders',
              ),
              _buildStatCard(
                context,
                'Products',
                '89',
                Icons.inventory,
                TailwindTheme.amber500,
                'In stock',
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Quick Actions
          Text(
            'Quick Actions',
            style: TailwindTheme.heading4.copyWith(
              color: isDark ? Colors.white : TailwindTheme.darkGray,
            ),
          ),
          const SizedBox(height: 16),
          
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildQuickActionCard(
                context,
                'Add User',
                Icons.person_add,
                TailwindTheme.blue500,
                () {
                  // Navigate to add user
                },
              ),
              _buildQuickActionCard(
                context,
                'New Order',
                Icons.add_shopping_cart,
                TailwindTheme.emerald500,
                () {
                  // Navigate to new order
                },
              ),
              _buildQuickActionCard(
                context,
                'Add Product',
                Icons.add_box,
                TailwindTheme.purple500,
                () {
                  // Navigate to add product
                },
              ),
              _buildQuickActionCard(
                context,
                'View Reports',
                Icons.assessment,
                TailwindTheme.indigo500,
                () {
                  // Navigate to reports
                },
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Recent Activity
          isMobile
              ? Column(
                  children: [
                    _buildActivityCard(
                      context,
                      'Recent Activity',
                      Icons.history,
                      [
                        'Order #1234 completed',
                        'New user registered',
                        'Payment received',
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildActivityCard(
                        context,
                        'Recent Orders',
                        Icons.shopping_cart,
                        [
                          'Order #1234 completed',
                          'Order #1235 pending',
                          'Order #1236 shipped',
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildActivityCard(
                        context,
                        'Recent Users',
                        Icons.people,
                        [
                          'John Doe registered',
                          'Jane Smith logged in',
                          'Mike Johnson updated profile',
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[now.month - 1]} ${now.day}, ${now.year}';
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TailwindTheme.textSm.copyWith(
                      color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
                      fontWeight: TailwindTheme.fontMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TailwindTheme.text2xl.copyWith(
                      fontWeight: TailwindTheme.fontBold,
                      color: isDark ? Colors.white : TailwindTheme.darkGray,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TailwindTheme.textXs.copyWith(
                      color: isDark ? Colors.white60 : TailwindTheme.mediumGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isDark ? TailwindTheme.slate800 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? TailwindTheme.slate700 : TailwindTheme.slate200,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: TailwindTheme.textSm.copyWith(
                fontWeight: TailwindTheme.fontMedium,
                color: isDark ? Colors.white : TailwindTheme.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard(
    BuildContext context,
    String title,
    IconData icon,
    List<String> items,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: TailwindTheme.blue500),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TailwindTheme.heading5.copyWith(
                    color: isDark ? Colors.white : TailwindTheme.darkGray,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...items.take(3).map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: TailwindTheme.blue500,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: TailwindTheme.textSm.copyWith(
                        color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
