import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../core/theme/tailwind_theme.dart';
import '../../components/services/theme_provider.dart';
import 'dart:math' as math;

class LoginScreen extends StatefulWidget {
  final Function(String email, String password)? onLogin;

  const LoginScreen({
    super.key,
    this.onLogin,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  // Animation controllers
  late AnimationController _truckController;
  late AnimationController _routeController;

  @override
  void initState() {
    super.initState();

    // Truck animation (moving across screen)
    _truckController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    // Route animation (dashed line)
    _routeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _truckController.dispose();
    _routeController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Call the onLogin callback if provided
      if (widget.onLogin != null) {
        await widget.onLogin!(
          _emailController.text.trim(),
          _passwordController.text,
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final screenSize = MediaQuery.of(context).size;
        final isMobile = screenSize.width < 768;
        // Use ThemeProvider to get accurate dark mode status (accounts for system mode)
        final isDark = themeProvider.isDarkMode(context);

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Stack(
        children: [
          // Animated Background
          _buildAnimatedBackground(isDark),

          // Animated Route Lines
          _buildAnimatedRoutes(isDark),

          // Animated Trucks
          _buildAnimatedTrucks(isDark),

          // Floating Particles
          _buildFloatingParticles(isDark),

          // Theme Toggle Button (Top Right)
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    final isDarkMode = themeProvider.isDarkMode(context);
                    final themeMode = themeProvider.themeMode;
                    IconData icon;
                    String tooltip;
                    
                    if (themeMode == ThemeMode.system) {
                      icon = Icons.brightness_auto;
                      tooltip = 'System Mode (${isDarkMode ? "Dark" : "Light"}) - Tap to switch';
                    } else if (themeMode == ThemeMode.dark) {
                      icon = Icons.light_mode;
                      tooltip = 'Light Mode - Tap to switch to System';
                    } else {
                      icon = Icons.dark_mode;
                      tooltip = 'Dark Mode - Tap to switch to System';
                    }
                    
                    return IconButton(
                      icon: Icon(icon),
                      color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
                      tooltip: tooltip,
                      onPressed: () {
                        themeProvider.toggleTheme();
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                        padding: const EdgeInsets.all(12),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMobile ? 20 : 32),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Card(
                    color: isDark ? const Color(0xFF1C1C1E) : Colors.white,
                    elevation: 24,
                    shadowColor: TailwindTheme.primaryBlue.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              isDark ? const Color(0xFF1C1C1E) : Colors.white,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(isMobile ? 28 : 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TailwindTheme.primaryBlue.withOpacity(0.1),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Logo Section
                                _buildStaticLogo(),

                                const SizedBox(height: 32),

                                // Title with shimmer effect
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                    colors: [
                                      TailwindTheme.primaryBlue,
                                      TailwindTheme.primaryBlue
                                          .withOpacity(0.7),
                                    ],
                                  ).createShader(bounds),
                                  child: Text(
                                    'Welcome Back',
                                    style: GoogleFonts.poppins(
                                      fontSize: isMobile ? 24 : 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.5,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  'Sign in to continue',
                                  style: GoogleFonts.poppins(
                                    fontSize: isMobile ? 13 : 15,
                                    color: isDark
                                        ? Colors.white70
                                        : TailwindTheme.mediumGray,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.3,
                                  ),
                                ),

                                const SizedBox(height: 40),

                                // Email Field
                                _buildAnimatedTextField(
                                  controller: _emailController,
                                  label: 'Email',
                                  hint: 'Enter your email',
                                  icon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  isDark: isDark,
                                  textInputAction: TextInputAction.next,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 20),

                                // Password Field
                                _buildAnimatedTextField(
                                  controller: _passwordController,
                                  label: 'Password',
                                  hint: 'Enter your password',
                                  icon: Icons.lock_outlined,
                                  obscureText: !_isPasswordVisible,
                                  isDark: isDark,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (_) {
                                    if (!_isLoading) {
                                      _handleLogin();
                                    }
                                  },
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: isDark
                                          ? Colors.white70
                                          : TailwindTheme.mediumGray,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 32),

                                // Login Button
                                _buildLoginButton(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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

  // Build animated background with gradient
  Widget _buildAnimatedBackground(bool isDark) {
    return AnimatedBuilder(
      animation: _truckController,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      const Color(0xFF1C1C1E),
                      const Color(0xFF2C2C2E),
                      const Color(0xFF1C1C1E),
                    ]
                  : [
                      TailwindTheme.primaryBlue.withOpacity(0.05),
                      Colors.white,
                      TailwindTheme.primaryBlue.withOpacity(0.03),
                    ],
              stops: [
                0.0,
                0.5 + (math.sin(_truckController.value * 2 * math.pi) * 0.1),
                1.0,
              ],
            ),
          ),
        );
      },
    );
  }

  // Build animated routes/paths in background
  Widget _buildAnimatedRoutes(bool isDark) {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _routeController,
        builder: (context, child) {
          return CustomPaint(
            painter: RoutePainter(
              animationValue: _routeController.value,
              color: isDark
                  ? TailwindTheme.primaryBlue.withOpacity(0.15)
                  : TailwindTheme.primaryBlue.withOpacity(0.1),
            ),
          );
        },
      ),
    );
  }

  // Build animated trucks moving across screen
  Widget _buildAnimatedTrucks(bool isDark) {
    return AnimatedBuilder(
      animation: _truckController,
      builder: (context, child) {
        final screenWidth = MediaQuery.of(context).size.width;
        final truck1Position =
            (_truckController.value * screenWidth * 1.5) - (screenWidth * 0.25);
        final truck2Position =
            ((_truckController.value + 0.5) % 1.0) * screenWidth * 1.5 -
                (screenWidth * 0.25);

        return Stack(
          children: [
            // Truck 1
            Positioned(
              left: truck1Position,
              top: 100,
              child: Opacity(
                opacity: isDark ? 0.2 : 0.3,
                child: Icon(
                  Icons.local_shipping,
                  size: 40,
                  color: TailwindTheme.primaryBlue,
                ),
              ),
            ),
            // Truck 2
            Positioned(
              right: screenWidth - truck2Position,
              bottom: 150,
              child: Opacity(
                opacity: isDark ? 0.15 : 0.2,
                child: Transform.flip(
                  flipX: true,
                  child: Icon(
                    Icons.local_shipping,
                    size: 35,
                    color: TailwindTheme.primaryBlue.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Build floating particles
  Widget _buildFloatingParticles(bool isDark) {
    return AnimatedBuilder(
      animation: _routeController,
      builder: (context, child) {
        return CustomPaint(
          painter: ParticlePainter(
            animationValue: _routeController.value,
            color: isDark
                ? TailwindTheme.primaryBlue.withOpacity(0.15)
                : TailwindTheme.primaryBlue.withOpacity(0.2),
          ),
          size: Size.infinite,
        );
      },
    );
  }

  // Build static logo
  Widget _buildStaticLogo() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            TailwindTheme.primaryBlue,
            TailwindTheme.primaryBlue.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: TailwindTheme.primaryBlue.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(
        Icons.apps_rounded,
        color: Colors.white,
        size: 50,
      ),
    );
  }

  // Build animated text field
  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: isDark ? Colors.white : Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white70 : TailwindTheme.mediumGray,
        ),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: isDark
              ? Colors.white38
              : TailwindTheme.mediumGray.withOpacity(0.5),
        ),
        prefixIcon: Icon(icon, color: TailwindTheme.primaryBlue),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: isDark ? const Color(0xFF2C2C2E) : Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF3C3C3E) : Colors.grey[200]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF3C3C3E) : Colors.grey[200]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: TailwindTheme.primaryBlue,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      validator: validator,
    );
  }

  // Build login button
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: TailwindTheme.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: TailwindTheme.primaryBlue.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.1)),
        ),
        child: _isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Signing in...',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_rounded, size: 20),
                ],
              ),
      ),
    );
  }
}

// Custom painter for animated routes
class RoutePainter extends CustomPainter {
  final double animationValue;
  final Color color;

  RoutePainter({required this.animationValue, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 10.0;
    const dashSpace = 5.0;
    final offset = animationValue * (dashWidth + dashSpace);

    // Draw multiple diagonal dashed lines
    for (var i = 0; i < 8; i++) {
      final startX = -size.width * 0.2 + (i * size.width * 0.3);
      final path = Path();
      path.moveTo(startX, 0);
      path.lineTo(startX + size.width * 0.6, size.height);

      _drawDashedPath(canvas, path, paint, dashWidth, dashSpace, offset);
    }
  }

  void _drawDashedPath(
    Canvas canvas,
    Path path,
    Paint paint,
    double dashWidth,
    double dashSpace,
    double offset,
  ) {
    final dashPath = Path();
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      var distance = -offset;
      while (distance < metric.length) {
        final start = distance;
        final end = distance + dashWidth;
        if (start < metric.length) {
          dashPath.addPath(
            metric.extractPath(
              math.max(0, start),
              math.min(end, metric.length),
            ),
            Offset.zero,
          );
        }
        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(RoutePainter oldDelegate) => true;
}

// Custom painter for floating particles
class ParticlePainter extends CustomPainter {
  final double animationValue;
  final Color color;

  ParticlePainter({required this.animationValue, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final random = math.Random(42);
    for (var i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final baseY = random.nextDouble() * size.height;
      final y = baseY + (math.sin(animationValue * 2 * math.pi + i) * 30);
      final radius = 2.0 + (random.nextDouble() * 3);

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}

