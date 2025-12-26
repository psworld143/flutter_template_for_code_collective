import 'package:flutter/material.dart';
import '../../core/theme/tailwind_theme.dart';

/// App Header Widget
class AppHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Gradient? gradient;

  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.actions,
    this.backgroundColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDark ? const Color(0xFF2C2C2E) : Colors.white),
        gradient: gradient ??
            (!isDark
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      TailwindTheme.primaryBlue.withOpacity(0.05),
                      TailwindTheme.primaryGreen.withOpacity(0.05),
                    ],
                  )
                : null),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : TailwindTheme.primaryBlue.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: isDark
              ? const Color(0xFF3A3A3C)
              : TailwindTheme.primaryBlue.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    TailwindTheme.primaryBlue,
                    TailwindTheme.accentBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: TailwindTheme.primaryBlue.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 20),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: isDark ? Colors.white : const Color(0xFF1D1D1F),
                    letterSpacing: -0.8,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:
                          isDark ? Colors.white70 : const Color(0xFF86868B),
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (actions != null && actions!.isNotEmpty) ...[
            const SizedBox(width: 16),
            ...actions!,
          ],
        ],
      ),
    );
  }
}

