import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/tailwind_theme.dart';
import '../../components/services/branding_provider.dart';

/// Sidebar Menu Item Model
class SidebarMenuItem {
  final String title;
  final IconData icon;
  final int index;
  final List<SidebarMenuItem>? subItems;
  final Color? iconColor;

  SidebarMenuItem({
    required this.title,
    required this.icon,
    required this.index,
    this.subItems,
    this.iconColor,
  });
}

/// App Sidebar Widget
class AppSidebar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final VoidCallback? onLogout;
  final List<SidebarMenuItem> menuItems;

  const AppSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.onLogout,
    required this.menuItems,
  });

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  final Map<String, bool> _expandedGroups = {};

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandingProvider>(
      builder: (context, branding, child) {
        final primaryColor = branding.primaryColor;
        final companyName = branding.companyName;
        final logoWidget = branding.getLogoWidget(maxHeight: 50);

        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Container(
          width: 280,
          decoration: BoxDecoration(
            color: isDark ? TailwindTheme.slate900 : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
                blurRadius: 10,
                offset: const Offset(2, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              // Logo Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: ClipOval(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isDark ? TailwindTheme.slate800 : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: logoWidget,
                    ),
                  ),
                ),
              ),

              // Company Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  companyName,
                  style: TailwindTheme.textBase.copyWith(
                    fontWeight: TailwindTheme.fontBold,
                    color: isDark ? Colors.white : TailwindTheme.darkGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 8),

              // Tagline
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  branding.tagline,
                  style: TailwindTheme.textXs.copyWith(
                    color: isDark
                        ? Colors.white70
                        : TailwindTheme.mediumGray,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              // Navigation Items
              Expanded(
                child: ListView.builder(
                  itemCount: widget.menuItems.length,
                  itemBuilder: (context, index) {
                    final item = widget.menuItems[index];
                    if (item.subItems != null && item.subItems!.isNotEmpty) {
                      return _buildCollapsibleGroup(
                        item,
                        primaryColor,
                        isDark,
                      );
                    }
                    return _buildSidebarItem(
                      item,
                      primaryColor,
                      isDark,
                    );
                  },
                ),
              ),

              // Logout Section
              if (widget.onLogout != null)
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 4, 12, 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: TailwindTheme.error,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: widget.onLogout,
                      borderRadius: BorderRadius.circular(4),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(Icons.logout,
                                color: Colors.white, size: 14),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white.withOpacity(0.7),
                            size: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSidebarItem(
    SidebarMenuItem item,
    Color primaryColor,
    bool isDark,
  ) {
    final isSelected = widget.selectedIndex == item.index;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onItemSelected(item.index),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? primaryColor : null,
              borderRadius: BorderRadius.circular(8),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withOpacity(0.2)
                        : (item.iconColor?.withOpacity(0.1) ?? 
                            TailwindTheme.mediumGray.withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    item.icon,
                    color: isSelected
                        ? Colors.white
                        : (item.iconColor ?? 
                            (isDark
                                ? Colors.white70
                                : TailwindTheme.mediumGray)),
                    size: 16,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : (isDark ? Colors.white : TailwindTheme.darkGray),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 4,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCollapsibleGroup(
    SidebarMenuItem item,
    Color primaryColor,
    bool isDark,
  ) {
    final groupKey = item.title;
    final isExpanded = _expandedGroups[groupKey] ?? false;
    final hasSelectedSubItem = item.subItems?.any((subItem) =>
            widget.selectedIndex == subItem.index) ??
        false;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          key: ValueKey(groupKey),
          initiallyExpanded: hasSelectedSubItem,
          tilePadding: EdgeInsets.zero,
          childrenPadding: const EdgeInsets.only(left: 20, bottom: 4),
          title: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: item.iconColor?.withOpacity(0.1) ?? 
                        TailwindTheme.mediumGray.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    item.icon,
                    color: item.iconColor ?? 
                        (isDark ? Colors.white70 : TailwindTheme.mediumGray),
                    size: 16,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: isDark ? Colors.white70 : TailwindTheme.darkGray,
                      fontWeight: hasSelectedSubItem
                          ? FontWeight.w600
                          : FontWeight.w500,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
              size: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedGroups[groupKey] = expanded;
            });
          },
          children: item.subItems?.map((subItem) {
                // Check if this subItem has its own subItems (nested)
                if (subItem.subItems != null && subItem.subItems!.isNotEmpty) {
                  // Render as nested collapsible group
                  return _buildCollapsibleGroup(
                    subItem,
                    primaryColor,
                    isDark,
                  );
                }
                // Render as simple item
                final isSelected = widget.selectedIndex == subItem.index;
                return Container(
                  margin: const EdgeInsets.only(left: 6, right: 6, bottom: 2),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => widget.onItemSelected(subItem.index),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? (isDark
                                  ? TailwindTheme.slate700
                                  : TailwindTheme.slate100)
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: subItem.iconColor?.withOpacity(0.1) ?? 
                                    TailwindTheme.mediumGray.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Icon(
                                subItem.icon,
                                color: subItem.iconColor ?? 
                                    (isDark
                                        ? Colors.white70
                                        : TailwindTheme.mediumGray),
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                subItem.title,
                                style: TextStyle(
                                  color: isDark
                                      ? Colors.white70
                                      : TailwindTheme.darkGray,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isSelected)
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList() ??
              [],
        ),
      ),
    );
  }
}

