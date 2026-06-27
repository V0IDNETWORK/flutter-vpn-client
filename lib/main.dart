//so just sorry for bad coding 
//OH RIGHT IM ILIA 
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF050505),
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const noxVPNApp());
}

// ─── Color Palette ───────────────────────────────────────────
class RVColors {
  static const bg = Color(0xFF050505);
  static const surface = Color(0xFF0D0D14);
  static const primary = Color(0xFF8A2BE2);
  static const secondary = Color(0xFFC14EFF);
  static const accent = Color(0xFFE056FD);
  static const glow = Color(0xFFB84DFF);
  static const textPrimary = Color(0xFFF0E8FF);
  static const textSecondary = Color(0xFF9A7FC8);
  static const cardBg = Color(0xFF0F0F1A);
  static const borderGlow = Color(0xFF5A1A8C);
  static const neonMagenta = Color(0xFFFF00FF);
  static const deepPurple = Color(0xFF1A0033);

  static const List<Color> gradientPrimary = [Color(0xFF8A2BE2), Color(0xFFE056FD)];
  static const List<Color> gradientDark = [Color(0xFF0D0014), Color(0xFF1A0033)];
  static const List<Color> gradientCard = [Color(0xFF12112A), Color(0xFF0A0A18)];
}

// ─── Logo Base64 ─────────────────────────────────────────────
const String _logoBase64 =
    '/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAICAgICAQICAgIDAgIDAwYEAwMDAwcFBQQGCAcJCAgH'
    'CAgJCg0LCQoMCggICw8LDA0ODg8OCQsQERAOEQ0ODg7/2wBDAQIDAwMDAwcEBAcOCQgJDg4ODg4O'
    'Dg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg7/wAARCAKAAoADASIA'
    'AhEBAxEB/8QAHQABAAICAwEBAAAAAAAAAAAAAAECAwcEBQYICf/EAE8QAAEEAQMCBQEEBggDBgMG'
    'BwEAAgMRBAUSIQYxBxMiQVFhFDJxgQgVI0KRoRYkM1KxwdHwYnLhFyVDU4KSNESyY3STotLxJjVF'
    'VHODhP/EABwBAQACAwEBAQAAAAAAAAAAAAABAgMEBQYHCP/EAEERAAIBAgMEBwUGBQMEAwEAAAAB'
    'AgMRBCExBRJBURNhcYGRobEiMsHR8AYUQlKy4SMzYnLxJJLSFUOCwhYlojX/2gAMAwEAAhEDEQA/'
    'APwXREW4dwIiIAp2lQsiskSQOApRFYgIiKbE8AiIrkBERCQiIhAVXeysoq0IIsUoJsq1BKCtYjMr'
    'tKUaV0UkWMaJR+Eo/CWICIiWIsFBNKVFWlihQ90ViBXAVVFiLBERTZFQiIlkQQTRVFegVRRYo7h'
    'ERLMgrXqtCLKsiWzMZjRKPwigBERQUYUEWFKg3XCrYgoeCiHvyiqUYREQgIiKtgERFACq7srKD2U'
    'AoitXp7cqtH4QBERVdwERFUBERAFQGirqgHPIVLAncFBNq1BKCgFEVqalNQAmwqqxHHAVaPwgCdu'
    'rAfIU0LQFdpQigrqhuuUBCkC1CXSAe6kCwoU2QgO3REWwdwIikfeV1oADQVgKKUPhSpJQREQmwT3'
    'tPdCKPKyEhEQdwgsiQLUe6v8AvH4VSDZKCyIUA2SpRWsVYREViAiIgCIiAKDwFKKbFGUJsqFYjng'
    'KKIQghPZESxFh7KCLKlFBQoRQULIoofCAoisR8BVU2MYVCKCuiFWY0VyOOyrRUFSEREKBUP3irpQ'
    'SxBjRWI+AqqtirCIiixUqR3KqsiihCIi2DuBERQAiIgCIiAIiIAiIoAREQBERQD//2Q==';

// ─── App Root ─────────────────────────────────────────────────
class noxVPNApp extends StatelessWidget {
  const noxVPNApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nox VPN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: RVColors.primary,
          secondary: RVColors.secondary,
          surface: RVColors.surface,
        ),
        fontFamily: 'sans-serif',
        useMaterial3: true,
        scaffoldBackgroundColor: RVColors.bg,
      ),
      home: const SplashScreen(),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  SPLASH SCREEN
// ══════════════════════════════════════════════════════════════
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _starsCtrl;
  late AnimationController _earthCtrl;
  late AnimationController _logoCtrl;
  late AnimationController _glowCtrl;
  late AnimationController _satelliteCtrl;
  late AnimationController _rayCtrl;

  late Animation<double> _starsOpacity;
  late Animation<double> _earthScale;
  late Animation<double> _earthOpacity;
  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _glowRadius;
  late Animation<double> _satelliteAngle;
  late Animation<double> _rayOpacity;

  final List<_Star> _stars = [];
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _generateStars();

    _starsCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _earthCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    _logoCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat(reverse: true);
    _satelliteCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))..repeat();
    _rayCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    _starsOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _starsCtrl, curve: Curves.easeOut));
    _earthScale = Tween<double>(begin: 0.4, end: 1).animate(
        CurvedAnimation(parent: _earthCtrl, curve: Curves.easeOutExpo));
    _earthOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _earthCtrl, curve: Curves.easeIn));
    _logoScale = Tween<double>(begin: 0.6, end: 1).animate(
        CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutExpo));
    _logoOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _logoCtrl, curve: Curves.easeIn));
    _glowRadius = Tween<double>(begin: 60, end: 120).animate(
        CurvedAnimation(parent: _glowCtrl, curve: Curves.easeInOutCubic));
    _satelliteAngle = Tween<double>(begin: 0, end: 2 * math.pi).animate(
        CurvedAnimation(parent: _satelliteCtrl, curve: Curves.linear));
    _rayOpacity = Tween<double>(begin: 0, end: 0.6).animate(
        CurvedAnimation(parent: _rayCtrl, curve: Curves.easeOut));

    _runSequence();
  }

  void _generateStars() {
    for (int i = 0; i < 150; i++) {
      _stars.add(_Star(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 2.5 + 0.5,
        opacity: _random.nextDouble() * 0.7 + 0.3,
        twinkleSpeed: _random.nextDouble() * 2 + 1,
      ));
    }
  }

  Future<void> _runSequence() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _starsCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 600));
    _earthCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 600));
    _logoCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 400));
    _rayCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 2000));
    _navigateToLogin();
  }

  void _navigateToLogin() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) => const LoginScreen(),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(
            opacity: anim,
            child: SlideTransition(
              position: Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
                  .animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _starsCtrl.dispose();
    _earthCtrl.dispose();
    _logoCtrl.dispose();
    _glowCtrl.dispose();
    _satelliteCtrl.dispose();
    _rayCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: RVColors.bg,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _starsCtrl, _earthCtrl, _logoCtrl, _glowCtrl, _satelliteCtrl, _rayCtrl
        ]),
        builder: (context, _) {
          return Stack(
            children: [
              // Stars background
              Opacity(
                opacity: _starsOpacity.value,
                child: CustomPaint(
                  size: size,
                  painter: _StarsPainter(_stars, _glowCtrl.value),
                ),
              ),
              // Light rays
              Opacity(
                opacity: _rayOpacity.value,
                child: CustomPaint(
                  size: size,
                  painter: _LightRaysPainter(),
                ),
              ),
              // Earth hologram
              Center(
                child: Opacity(
                  opacity: _earthOpacity.value,
                  child: Transform.scale(
                    scale: _earthScale.value,
                    child: SizedBox(
                      width: 280,
                      height: 280,
                      child: CustomPaint(
                        painter: _EarthHologramPainter(_glowCtrl.value),
                      ),
                    ),
                  ),
                ),
              ),
              // Satellite orbiting
              Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: CustomPaint(
                    painter: _SatelliteOrbitPainter(_satelliteAngle.value),
                  ),
                ),
              ),
              // Glow pulse behind logo
              Center(
                child: Container(
                  width: _glowRadius.value * 2,
                  height: _glowRadius.value * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        RVColors.glow.withOpacity(0.35),
                        RVColors.primary.withOpacity(0.08),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Logo
              Center(
                child: Opacity(
                  opacity: _logoOpacity.value,
                  child: Transform.scale(
                    scale: _logoScale.value,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 60),
                        _LogoWidget(size: 140),
                        const SizedBox(height: 24),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [RVColors.secondary, RVColors.accent],
                          ).createShader(bounds),
                          child: const Text(
                            'nox VPN',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 8,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'SECURE • PRIVATE • LIMITLESS',
                          style: TextStyle(
                            fontSize: 10,
                            color: RVColors.textSecondary.withOpacity(0.7),
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Scanning radar at bottom
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: Opacity(
                    opacity: _logoOpacity.value * 0.6,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CustomPaint(
                        painter: _RadarScannerPainter(_satelliteAngle.value / (2 * math.pi)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  LOGIN SCREEN
// ══════════════════════════════════════════════════════════════
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _bgCtrl;
  late AnimationController _cardCtrl;
  late AnimationController _particleCtrl;
  late AnimationController _glowCtrl;
  late AnimationController _satelliteCtrl;

  late Animation<double> _cardSlide;
  late Animation<double> _cardOpacity;

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _rememberMe = false;
  bool _passVisible = false;
  bool _emailFocused = false;
  bool _passFocused = false;
  final _emailFocus = FocusNode();
  final _passFocus = FocusNode();
  final List<_Particle> _particles = [];
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _generateParticles();

    _bgCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))..repeat(reverse: true);
    _cardCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _particleCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 6000))..repeat();
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat(reverse: true);
    _satelliteCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000))..repeat();

    _cardSlide = Tween<double>(begin: 60, end: 0).animate(
        CurvedAnimation(parent: _cardCtrl, curve: Curves.easeOutExpo));
    _cardOpacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _cardCtrl, curve: Curves.easeIn));

    Future.delayed(const Duration(milliseconds: 100), () => _cardCtrl.forward());

    _emailFocus.addListener(() => setState(() => _emailFocused = _emailFocus.hasFocus));
    _passFocus.addListener(() => setState(() => _passFocused = _passFocus.hasFocus));
  }

  void _generateParticles() {
    for (int i = 0; i < 40; i++) {
      _particles.add(_Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 3 + 1,
        speed: _random.nextDouble() * 0.3 + 0.1,
        opacity: _random.nextDouble() * 0.5 + 0.1,
        angle: _random.nextDouble() * 2 * math.pi,
      ));
    }
  }

  void _navigateToMain() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const MainAppScreen(),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: anim, curve: Curves.easeInOut),
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bgCtrl.dispose();
    _cardCtrl.dispose();
    _particleCtrl.dispose();
    _glowCtrl.dispose();
    _satelliteCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: RVColors.bg,
      body: AnimatedBuilder(
        animation: Listenable.merge([_bgCtrl, _cardCtrl, _particleCtrl, _glowCtrl, _satelliteCtrl]),
        builder: (context, _) {
          return Stack(
            children: [
              // Animated gradient bg
              Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(
                      math.sin(_bgCtrl.value * math.pi) * 0.3,
                      math.cos(_bgCtrl.value * math.pi) * 0.3 - 0.2,
                    ),
                    radius: 1.2,
                    colors: [
                      RVColors.primary.withOpacity(0.15),
                      RVColors.bg,
                      RVColors.deepPurple.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
              // Particles
              CustomPaint(
                size: size,
                painter: _ParticlesPainter(_particles, _particleCtrl.value),
              ),
              // Floating satellites
              CustomPaint(
                size: size,
                painter: _FloatingSatellitesPainter(_satelliteCtrl.value),
              ),
              // Main content
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 48),
                        // Logo + title
                        _LogoWidget(size: 100),
                        const SizedBox(height: 16),
                        ShaderMask(
                          shaderCallback: (b) => const LinearGradient(
                            colors: [RVColors.secondary, RVColors.accent],
                          ).createShader(b),
                          child: const Text(
                            'nox VPN',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 6,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Your gateway to freedom',
                          style: TextStyle(
                            color: RVColors.textSecondary,
                            fontSize: 13,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Login card
                        Transform.translate(
                          offset: Offset(0, _cardSlide.value),
                          child: Opacity(
                            opacity: _cardOpacity.value,
                            child: _GlassCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: RVColors.textPrimary,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Access your secure connection',
                                    style: TextStyle(
                                      color: RVColors.textSecondary,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  _NeonTextField(
                                    controller: _emailCtrl,
                                    focusNode: _emailFocus,
                                    label: 'Email Address',
                                    hint: 'user@noxvpn.io',
                                    icon: Icons.email_outlined,
                                    isFocused: _emailFocused,
                                    glowValue: _glowCtrl.value,
                                  ),
                                  const SizedBox(height: 16),
                                  _NeonTextField(
                                    controller: _passCtrl,
                                    focusNode: _passFocus,
                                    label: 'Password',
                                    hint: '••••••••••••',
                                    icon: Icons.lock_outline,
                                    isFocused: _passFocused,
                                    isPassword: true,
                                    passwordVisible: _passVisible,
                                    onTogglePassword: () => setState(() => _passVisible = !_passVisible),
                                    glowValue: _glowCtrl.value,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => setState(() => _rememberMe = !_rememberMe),
                                        child: Row(
                                          children: [
                                            AnimatedContainer(
                                              duration: const Duration(milliseconds: 200),
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                border: Border.all(
                                                  color: _rememberMe ? RVColors.accent : RVColors.borderGlow,
                                                  width: 1.5,
                                                ),
                                                color: _rememberMe ? RVColors.primary.withOpacity(0.3) : Colors.transparent,
                                              ),
                                              child: _rememberMe
                                                  ? const Icon(Icons.check, size: 14, color: RVColors.accent)
                                                  : null,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Remember me',
                                              style: TextStyle(
                                                color: RVColors.textSecondary,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: RVColors.secondary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 28),
                                  _NeonButton(
                                    label: 'Sign In',
                                    onTap: _navigateToMain,
                                    glowValue: _glowCtrl.value,
                                  ),
                                  const SizedBox(height: 12),
                                  _GlassButton(
                                    label: 'Continue as Guest',
                                    onTap: _navigateToMain,
                                  ),
                                  const SizedBox(height: 20),
                                  Center(
                                    child: GestureDetector(
                                      onTap: _navigateToMain,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "Don't have an account? ",
                                          style: TextStyle(color: RVColors.textSecondary, fontSize: 13),
                                          children: [
                                            TextSpan(
                                              text: 'Create Account',
                                              style: TextStyle(
                                                color: RVColors.secondary,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  MAIN APP SCREEN  (5-tab nav)
// ══════════════════════════════════════════════════════════════
class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen>
    with TickerProviderStateMixin {
  int _selectedTab = 0;
  late AnimationController _navGlowCtrl;
  late AnimationController _tabCtrl;
  late Animation<double> _tabAnim;
  int _prevTab = 0;

  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.dashboard_rounded, label: 'Dashboard'),
    _NavItem(icon: Icons.public_rounded, label: 'Servers'),
    _NavItem(icon: Icons.diamond_outlined, label: 'Plans'),
    _NavItem(icon: Icons.bar_chart_rounded, label: 'Statistics'),
    _NavItem(icon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _navGlowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    _tabCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _tabAnim = CurvedAnimation(parent: _tabCtrl, curve: Curves.easeOutCubic);
    _tabCtrl.forward();
  }

  void _onTabTap(int i) {
    if (i == _selectedTab) return;
    setState(() {
      _prevTab = _selectedTab;
      _selectedTab = i;
    });
    _tabCtrl.forward(from: 0);
  }

  @override
  void dispose() {
    _navGlowCtrl.dispose();
    _tabCtrl.dispose();
    super.dispose();
  }

  Widget get _currentScreen {
    switch (_selectedTab) {
      case 0: return DashboardTab(anim: _tabAnim);
      case 1: return ServersTab(anim: _tabAnim);
      case 2: return PlansTab(anim: _tabAnim);
      case 3: return StatisticsTab(anim: _tabAnim);
      case 4: return ProfileTab(anim: _tabAnim);
      default: return DashboardTab(anim: _tabAnim);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RVColors.bg,
      body: AnimatedBuilder(
        animation: Listenable.merge([_navGlowCtrl, _tabCtrl]),
        builder: (context, _) {
          return Stack(
            children: [
              // Tab content
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.04),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOut)),
                    child: child,
                  ),
                ),
                child: _currentScreen,
              ),
              // Floating nav bar
              Positioned(
                bottom: 20,
                left: 16,
                right: 16,
                child: _buildFloatingNav(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFloatingNav() {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: RVColors.primary.withOpacity(0.3 + _navGlowCtrl.value * 0.1),
            blurRadius: 20 + _navGlowCtrl.value * 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  RVColors.surface.withOpacity(0.9),
                  RVColors.cardBg.withOpacity(0.95),
                ],
              ),
              border: Border.all(
                color: RVColors.borderGlow.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Row(
              children: List.generate(_navItems.length, (i) {
                final selected = i == _selectedTab;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onTabTap(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: selected
                            ? RVColors.primary.withOpacity(0.2)
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedScale(
                            scale: selected ? 1.2 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              _navItems[i].icon,
                              color: selected
                                  ? RVColors.accent
                                  : RVColors.textSecondary,
                              size: 22,
                              shadows: selected ? [
                                Shadow(
                                  color: RVColors.accent.withOpacity(0.5 + _navGlowCtrl.value * 0.3),
                                  blurRadius: 12,
                                ),
                              ] : null,
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                              color: selected ? RVColors.accent : RVColors.textSecondary,
                              letterSpacing: 0.5,
                            ),
                            child: Text(_navItems[i].label),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  DASHBOARD TAB
// ══════════════════════════════════════════════════════════════
class DashboardTab extends StatefulWidget {
  final Animation<double> anim;
  const DashboardTab({super.key, required this.anim});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab>
    with TickerProviderStateMixin {
  late AnimationController _earthCtrl;
  late AnimationController _shieldCtrl;
  late AnimationController _satelliteCtrl;
  late AnimationController _waveCtrl;
  late AnimationController _counterCtrl;
  late AnimationController _glowCtrl;

  @override
  void initState() {
    super.initState();
    _earthCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 12000))..repeat();
    _shieldCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat(reverse: true);
    _satelliteCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))..repeat();
    _waveCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))..repeat();
    _counterCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);

    Future.delayed(const Duration(milliseconds: 300), () => _counterCtrl.forward());
  }

  @override
  void dispose() {
    _earthCtrl.dispose();
    _shieldCtrl.dispose();
    _satelliteCtrl.dispose();
    _waveCtrl.dispose();
    _counterCtrl.dispose();
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_earthCtrl, _shieldCtrl, _satelliteCtrl, _waveCtrl, _counterCtrl, _glowCtrl]),
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            // Hero Card
            _buildHeroCard(),
            const SizedBox(height: 16),
            // Status Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildStatusCard(),
            ),
            const SizedBox(height: 16),
            // Quick Actions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildQuickActions(),
            ),
            const SizedBox(height: 16),
            // Network Activity Chart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildNetworkChart(),
            ),
            const SizedBox(height: 16),
            // Global Coverage
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildGlobalCoverage(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeroCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            RVColors.primary.withOpacity(0.4),
            RVColors.deepPurple,
            RVColors.surface,
          ],
        ),
        border: Border.all(
          color: RVColors.borderGlow.withOpacity(0.6),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: RVColors.primary.withOpacity(0.2 + _glowCtrl.value * 0.1),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Background earth hologram
            Positioned(
              right: -20,
              top: -20,
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: _EarthHologramPainter(_earthCtrl.value, alpha: 0.3),
                ),
              ),
            ),
            // Satellite
            Positioned.fill(
              child: CustomPaint(
                painter: _SatelliteOrbitPainter(_satelliteCtrl.value * 2 * math.pi, radius: 85, alpha: 0.5),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _LogoWidget(size: 44),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome back',
                              style: TextStyle(
                                color: RVColors.textSecondary,
                                fontSize: 12,
                              ),
                            ),
                            const Text(
                              'Alex Johnson',
                              style: TextStyle(
                                color: RVColors.textPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green.withOpacity(0.15),
                          border: Border.all(color: Colors.green.withOpacity(0.4)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                                boxShadow: [
                                  BoxShadow(color: Colors.green, blurRadius: 4 + _shieldCtrl.value * 4),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Protected',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Text(
                    'Connection Active',
                    style: TextStyle(
                      color: RVColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Frankfurt, Germany',
                    style: TextStyle(
                      color: RVColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _StatChip(label: '↑ 124 Mbps', color: RVColors.secondary),
                      const SizedBox(width: 8),
                      _StatChip(label: '↓ 218 Mbps', color: RVColors.accent),
                      const SizedBox(width: 8),
                      _StatChip(label: '12ms', color: Colors.green),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return _GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.security_rounded, color: RVColors.accent, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Security Status',
                style: TextStyle(
                  color: RVColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              _ScoreRing(score: 98, anim: _counterCtrl.value),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildSecurityRow(Icons.shield_outlined, 'Firewall', true)),
              const SizedBox(width: 16),
              Expanded(child: _buildSecurityRow(Icons.vpn_key_outlined, 'Encryption', true)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildSecurityRow(Icons.remove_red_eye_outlined, 'No-Logs', true)),
              const SizedBox(width: 16),
              Expanded(child: _buildSecurityRow(Icons.dns_outlined, 'DNS Leak', false, inverted: true)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityRow(IconData icon, String label, bool active, {bool inverted = false}) {
    final color = inverted ? Colors.red : (active ? Colors.green : Colors.red);
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(color: RVColors.textSecondary, fontSize: 12)),
        const Spacer(),
        Text(
          inverted ? 'None' : (active ? 'Active' : 'Inactive'),
          style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      _QuickAction(Icons.speed_rounded, 'Speed\nTest', RVColors.primary),
      _QuickAction(Icons.stars_rounded, 'Premium\nServers', RVColors.secondary),
      _QuickAction(Icons.security_rounded, 'Security\nCenter', RVColors.accent),
      _QuickAction(Icons.workspace_premium_rounded, 'Subscription', Colors.amber),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            color: RVColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: actions
              .map((a) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _QuickActionCard(action: a, glowValue: _glowCtrl.value),
                    ),
                  ))
              .toList()
            ..last = Expanded(
              child: _QuickActionCard(action: actions.last, glowValue: _glowCtrl.value),
            ),
        ),
      ],
    );
  }

  Widget _buildNetworkChart() {
    return _GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Network Activity',
                style: TextStyle(
                  color: RVColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Last 24h',
                style: TextStyle(color: RVColors.textSecondary, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: CustomPaint(
              size: const Size(double.infinity, 100),
              painter: _NetworkChartPainter(_waveCtrl.value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalCoverage() {
    return _GlassCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Global Coverage',
            style: TextStyle(
              color: RVColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _CoverageItem('85+', 'Countries', _counterCtrl.value),
              const SizedBox(width: 16),
              _CoverageItem('4,200+', 'Servers', _counterCtrl.value),
              const SizedBox(width: 16),
              _CoverageItem('10 Gbps', 'Speed', _counterCtrl.value),
            ],
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  SERVERS TAB
// ══════════════════════════════════════════════════════════════
class ServersTab extends StatefulWidget {
  final Animation<double> anim;
  const ServersTab({super.key, required this.anim});

  @override
  State<ServersTab> createState() => _ServersTabState();
}

class _ServersTabState extends State<ServersTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _mapCtrl;
  String _selectedRegion = 'All';
  final List<String> _regions = ['All', 'Europe', 'Asia', 'Americas', 'Middle East', 'Africa'];

  final List<_ServerInfo> _servers = [
    _ServerInfo('🇩🇪', 'Frankfurt', 'Germany', 12, 23, true, 'Europe'),
    _ServerInfo('🇳🇱', 'Amsterdam', 'Netherlands', 8, 45, true, 'Europe'),
    _ServerInfo('🇬🇧', 'London', 'United Kingdom', 15, 67, true, 'Europe'),
    _ServerInfo('🇯🇵', 'Tokyo', 'Japan', 48, 34, true, 'Asia'),
    _ServerInfo('🇸🇬', 'Singapore', 'Singapore', 32, 28, true, 'Asia'),
    _ServerInfo('🇺🇸', 'New York', 'United States', 22, 51, true, 'Americas'),
    _ServerInfo('🇺🇸', 'Los Angeles', 'United States', 28, 39, true, 'Americas'),
    _ServerInfo('🇧🇷', 'São Paulo', 'Brazil', 56, 72, false, 'Americas'),
    _ServerInfo('🇦🇪', 'Dubai', 'UAE', 38, 42, true, 'Middle East'),
    _ServerInfo('🇿🇦', 'Cape Town', 'South Africa', 95, 18, true, 'Africa'),
  ];

  @override
  void initState() {
    super.initState();
    _mapCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 6000))..repeat();
  }

  @override
  void dispose() {
    _mapCtrl.dispose();
    super.dispose();
  }

  List<_ServerInfo> get _filteredServers {
    if (_selectedRegion == 'All') return _servers;
    return _servers.where((s) => s.region == _selectedRegion).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _mapCtrl,
      builder: (context, _) {
        return Column(
          children: [
            // World map header
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _WorldMapPainter(_mapCtrl.value),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        const Text(
                          'Server Network',
                          style: TextStyle(
                            color: RVColors.textPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${_servers.length} servers across 6 regions',
                          style: TextStyle(color: RVColors.textSecondary, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Region filter
            SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _regions.length,
                itemBuilder: (ctx, i) {
                  final selected = _regions[i] == _selectedRegion;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedRegion = _regions[i]),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: selected
                            ? const LinearGradient(colors: RVColors.gradientPrimary)
                            : null,
                        color: selected ? null : RVColors.surface,
                        border: Border.all(
                          color: selected ? Colors.transparent : RVColors.borderGlow.withOpacity(0.4),
                        ),
                      ),
                      child: Text(
                        _regions[i],
                        style: TextStyle(
                          color: selected ? Colors.white : RVColors.textSecondary,
                          fontSize: 12,
                          fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            // Server list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                itemCount: _filteredServers.length,
                itemBuilder: (ctx, i) => _ServerCard(
                  server: _filteredServers[i],
                  delay: i * 50,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  PLANS TAB
// ══════════════════════════════════════════════════════════════
class PlansTab extends StatefulWidget {
  final Animation<double> anim;
  const PlansTab({super.key, required this.anim});

  @override
  State<PlansTab> createState() => _PlansTabState();
}

class _PlansTabState extends State<PlansTab>
    with TickerProviderStateMixin {
  late AnimationController _glowCtrl;
  late AnimationController _particleCtrl;
  bool _yearly = true;

  @override
  void initState() {
    super.initState();
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat(reverse: true);
    _particleCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000))..repeat();
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    _particleCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_glowCtrl, _particleCtrl]),
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Choose Your Plan',
                style: TextStyle(
                  color: RVColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Unlock the power of true privacy',
                style: TextStyle(color: RVColors.textSecondary, fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),
            // Billing toggle
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: RVColors.surface,
                  border: Border.all(color: RVColors.borderGlow.withOpacity(0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ToggleBtn(
                      label: 'Monthly',
                      selected: !_yearly,
                      onTap: () => setState(() => _yearly = false),
                    ),
                    _ToggleBtn(
                      label: 'Yearly  -40%',
                      selected: _yearly,
                      onTap: () => setState(() => _yearly = true),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _PlanCard(
                name: 'Free',
                price: '0',
                period: 'forever',
                features: [
                  '1 Device',
                  '2 Server locations',
                  '2GB / month',
                  'Basic encryption',
                ],
                color: RVColors.textSecondary,
                highlighted: false,
                glowValue: _glowCtrl.value,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _PlanCard(
                name: 'Pro',
                price: _yearly ? '6.99' : '9.99',
                period: _yearly ? '/month • billed yearly' : '/month',
                features: [
                  '5 Devices',
                  '50+ Server locations',
                  'Unlimited data',
                  'AES-256 encryption',
                  'No-logs policy',
                  'Kill switch',
                ],
                color: RVColors.secondary,
                highlighted: false,
                glowValue: _glowCtrl.value,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _PlanCard(
                name: 'Ultimate',
                price: _yearly ? '12.99' : '17.99',
                period: _yearly ? '/month • billed yearly' : '/month',
                features: [
                  'Unlimited Devices',
                  '85+ Countries, 4200+ Servers',
                  'Unlimited data',
                  'Military-grade encryption',
                  'No-logs policy',
                  'Kill switch',
                  'Dedicated IP',
                  'Priority support 24/7',
                  'Ad & malware blocker',
                ],
                color: RVColors.accent,
                highlighted: true,
                glowValue: _glowCtrl.value,
                particleValue: _particleCtrl.value,
              ),
            ),
          ],
        );
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  STATISTICS TAB
// ══════════════════════════════════════════════════════════════
class StatisticsTab extends StatefulWidget {
  final Animation<double> anim;
  const StatisticsTab({super.key, required this.anim});

  @override
  State<StatisticsTab> createState() => _StatisticsTabState();
}

class _StatisticsTabState extends State<StatisticsTab>
    with TickerProviderStateMixin {
  late AnimationController _chartCtrl;
  late AnimationController _radarCtrl;
  late AnimationController _counterCtrl;
  late AnimationController _glowCtrl;

  @override
  void initState() {
    super.initState();
    _chartCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..forward();
    _radarCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000))..repeat();
    _counterCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..forward();
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _chartCtrl.dispose();
    _radarCtrl.dispose();
    _counterCtrl.dispose();
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_chartCtrl, _radarCtrl, _counterCtrl, _glowCtrl]),
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 120),
          children: [
            const Text(
              'Analytics',
              style: TextStyle(
                color: RVColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            // Usage ring charts row
            Row(
              children: [
                Expanded(child: _buildCircleChart('Data Used', '72.4 GB', 0.72, RVColors.primary, _chartCtrl.value)),
                const SizedBox(width: 12),
                Expanded(child: _buildCircleChart('Session Time', '48h 22m', 0.54, RVColors.secondary, _chartCtrl.value)),
                const SizedBox(width: 12),
                Expanded(child: _buildCircleChart('Protection', '99.8%', 0.998, Colors.green, _chartCtrl.value)),
              ],
            ),
            const SizedBox(height: 16),
            // Radar scanner
            _GlassCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.radar, color: RVColors.accent, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Threat Radar',
                        style: TextStyle(color: RVColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: CustomPaint(
                          painter: _RadarScannerPainter(_radarCtrl.value, large: true),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ThreatRow('Malware Blocked', 847, Colors.red, _counterCtrl.value),
                            const SizedBox(height: 10),
                            _ThreatRow('Ads Blocked', 2341, Colors.orange, _counterCtrl.value),
                            const SizedBox(height: 10),
                            _ThreatRow('Trackers Blocked', 1203, Colors.amber, _counterCtrl.value),
                            const SizedBox(height: 10),
                            _ThreatRow('Intrusion Attempts', 12, Colors.red.shade300, _counterCtrl.value),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Line chart
            _GlassCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Usage Trend (7 days)',
                    style: TextStyle(color: RVColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 120,
                    child: CustomPaint(
                      size: const Size(double.infinity, 120),
                      painter: _LineChartPainter(_chartCtrl.value),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .map((d) => Text(d, style: TextStyle(color: RVColors.textSecondary, fontSize: 10)))
                        .toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Security metrics
            _GlassCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Security Metrics',
                    style: TextStyle(color: RVColors.textPrimary, fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  _MetricBar('Encryption Strength', 0.98, RVColors.primary, _chartCtrl.value),
                  const SizedBox(height: 12),
                  _MetricBar('Connection Stability', 0.92, RVColors.secondary, _chartCtrl.value),
                  const SizedBox(height: 12),
                  _MetricBar('Privacy Score', 0.97, RVColors.accent, _chartCtrl.value),
                  const SizedBox(height: 12),
                  _MetricBar('Server Response', 0.85, Colors.green, _chartCtrl.value),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCircleChart(String label, String value, double fill, Color color, double anim) {
    return _GlassCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: CustomPaint(
              painter: _CircleChartPainter(fill * anim, color),
              child: Center(
                child: Text(
                  '${(fill * anim * 100).toInt()}%',
                  style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: RVColors.textPrimary, fontSize: 11, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(color: RVColors.textSecondary, fontSize: 9), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  PROFILE TAB
// ══════════════════════════════════════════════════════════════
class ProfileTab extends StatefulWidget {
  final Animation<double> anim;
  const ProfileTab({super.key, required this.anim});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowCtrl;
  bool _notificationsOn = true;
  bool _darkMode = true;
  bool _biometrics = false;
  bool _autoConnect = true;

  @override
  void initState() {
    super.initState();
    _glowCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowCtrl,
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 60, 16, 120),
          children: [
            // User card
            _buildUserCard(),
            const SizedBox(height: 20),
            _SectionHeader('Membership'),
            _GlassCard(
              child: Column(
                children: [
                  _buildMembershipBadge(),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: RVColors.gradientPrimary),
                    ),
                    child: const Center(
                      child: Text(
                        'Upgrade to Ultimate',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionHeader('Devices'),
            _GlassCard(
              child: Column(
                children: [
                  _DeviceRow(Icons.phone_android_rounded, 'OnePlus 12 Pro', 'Current device'),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _DeviceRow(Icons.laptop_mac_rounded, 'MacBook Pro', '2 hours ago'),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _DeviceRow(Icons.tablet_mac_rounded, 'iPad Air', '3 days ago'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionHeader('Preferences'),
            _GlassCard(
              child: Column(
                children: [
                  _SwitchRow('Notifications', Icons.notifications_outlined, _notificationsOn,
                      (v) => setState(() => _notificationsOn = v)),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _SwitchRow('Dark Mode', Icons.dark_mode_outlined, _darkMode,
                      (v) => setState(() => _darkMode = v)),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _SwitchRow('Auto-Connect', Icons.bolt_rounded, _autoConnect,
                      (v) => setState(() => _autoConnect = v)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionHeader('Security'),
            _GlassCard(
              child: Column(
                children: [
                  _SwitchRow('Biometrics', Icons.fingerprint_rounded, _biometrics,
                      (v) => setState(() => _biometrics = v)),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _MenuRow('Change Password', Icons.lock_reset_rounded),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _MenuRow('Two-Factor Auth', Icons.verified_user_outlined),
                  const Divider(color: RVColors.borderGlow, height: 1),
                  _MenuRow('Privacy Settings', Icons.privacy_tip_outlined),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _GlassCard(
              child: _MenuRow('Sign Out', Icons.logout_rounded, color: Colors.red),
            ),
          ],
        );
      },
    );
  }

  Widget _buildUserCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [RVColors.primary.withOpacity(0.3), RVColors.deepPurple],
        ),
        border: Border.all(
          color: RVColors.borderGlow.withOpacity(0.5 + _glowCtrl.value * 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: RVColors.primary.withOpacity(0.2 + _glowCtrl.value * 0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(colors: RVColors.gradientPrimary),
              boxShadow: [
                BoxShadow(
                  color: RVColors.primary.withOpacity(0.5),
                  blurRadius: 16 + _glowCtrl.value * 8,
                ),
              ],
            ),
            child: const Icon(Icons.person_rounded, color: Colors.white, size: 36),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alex Johnson',
                  style: TextStyle(color: RVColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  'alex@noxvpn.io',
                  style: TextStyle(color: RVColors.textSecondary, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: RVColors.primary.withOpacity(0.2),
                    border: Border.all(color: RVColors.primary.withOpacity(0.4)),
                  ),
                  child: const Text(
                    'Pro Member',
                    style: TextStyle(color: RVColors.secondary, fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.edit_outlined, color: RVColors.textSecondary, size: 20),
        ],
      ),
    );
  }

  Widget _buildMembershipBadge() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(colors: RVColors.gradientPrimary),
          ),
          child: const Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pro Plan', style: TextStyle(color: RVColors.textPrimary, fontWeight: FontWeight.w700)),
              Text('Renews Dec 31, 2025', style: TextStyle(color: RVColors.textSecondary, fontSize: 12)),
            ],
          ),
        ),
        Text(
          '\$6.99/mo',
          style: TextStyle(color: RVColors.accent, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  REUSABLE WIDGETS
// ══════════════════════════════════════════════════════════════

class _LogoWidget extends StatelessWidget {
  final double size;
  const _LogoWidget({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: RVColors.primary.withOpacity(0.5),
            blurRadius: size * 0.3,
            spreadRadius: size * 0.05,
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/logo.jpg',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [RVColors.primary, RVColors.deepPurple],
              ),
            ),
            child: Center(
              child: Text(
                'R',
                style: TextStyle(
                  color: RVColors.accent,
                  fontSize: size * 0.45,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;

  const _GlassCard({required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: padding ?? const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: RVColors.gradientCard.map((c) => c.withOpacity(0.9)).toList(),
            ),
            border: Border.all(
              color: RVColors.borderGlow.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _NeonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final String hint;
  final IconData icon;
  final bool isFocused;
  final bool isPassword;
  final bool passwordVisible;
  final VoidCallback? onTogglePassword;
  final double glowValue;

  const _NeonTextField({
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.hint,
    required this.icon,
    required this.isFocused,
    this.isPassword = false,
    this.passwordVisible = false,
    this.onTogglePassword,
    required this.glowValue,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isFocused
              ? RVColors.accent.withOpacity(0.7 + glowValue * 0.3)
              : RVColors.borderGlow.withOpacity(0.3),
          width: isFocused ? 1.5 : 1,
        ),
        color: RVColors.cardBg,
        boxShadow: isFocused
            ? [
                BoxShadow(
                  color: RVColors.primary.withOpacity(0.3 + glowValue * 0.15),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        obscureText: isPassword && !passwordVisible,
        style: const TextStyle(color: RVColors.textPrimary, fontSize: 14),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: isFocused ? RVColors.accent : RVColors.textSecondary,
            fontSize: 12,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: RVColors.textSecondary.withOpacity(0.4), fontSize: 13),
          prefixIcon: Icon(icon,
              color: isFocused ? RVColors.accent : RVColors.textSecondary, size: 20),
          suffixIcon: isPassword
              ? IconButton(
                  onPressed: onTogglePassword,
                  icon: Icon(
                    passwordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: RVColors.textSecondary,
                    size: 18,
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}

class _NeonButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double glowValue;

  const _NeonButton({required this.label, required this.onTap, required this.glowValue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
            colors: [RVColors.primary, RVColors.accent],
          ),
          boxShadow: [
            BoxShadow(
              color: RVColors.primary.withOpacity(0.4 + glowValue * 0.2),
              blurRadius: 16 + glowValue * 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _GlassButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: RVColors.borderGlow.withOpacity(0.5)),
          color: RVColors.surface.withOpacity(0.5),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: RVColors.textSecondary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _ServerCard extends StatelessWidget {
  final _ServerInfo server;
  final int delay;

  const _ServerCard({required this.server, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: _GlassCard(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Text(server.flag, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(server.city,
                      style: const TextStyle(
                          color: RVColors.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                  Text(server.country,
                      style: TextStyle(color: RVColors.textSecondary, fontSize: 11)),
                ],
              ),
            ),
            _PingBadge(ping: server.ping),
            const SizedBox(width: 8),
            _LoadBar(load: server.load),
            const SizedBox(width: 12),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: server.online ? Colors.green : Colors.red,
                boxShadow: server.online
                    ? [BoxShadow(color: Colors.green, blurRadius: 6)]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PingBadge extends StatelessWidget {
  final int ping;
  const _PingBadge({required this.ping});

  Color get _color {
    if (ping < 20) return Colors.green;
    if (ping < 50) return Colors.amber;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _color.withOpacity(0.15),
        border: Border.all(color: _color.withOpacity(0.3)),
      ),
      child: Text(
        '${ping}ms',
        style: TextStyle(color: _color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _LoadBar extends StatelessWidget {
  final int load;
  const _LoadBar({required this.load});

  @override
  Widget build(BuildContext context) {
    final color = load < 50 ? Colors.green : (load < 80 ? Colors.amber : Colors.red);
    return Column(
      children: [
        Text('$load%', style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: RVColors.borderGlow.withOpacity(0.3),
          ),
          child: FractionallySizedBox(
            widthFactor: load / 100,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String name;
  final String price;
  final String period;
  final List<String> features;
  final Color color;
  final bool highlighted;
  final double glowValue;
  final double? particleValue;

  const _PlanCard({
    required this.name,
    required this.price,
    required this.period,
    required this.features,
    required this.color,
    required this.highlighted,
    required this.glowValue,
    this.particleValue,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: highlighted
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  RVColors.primary.withOpacity(0.4),
                  RVColors.deepPurple,
                  RVColors.surface,
                ],
              )
            : LinearGradient(colors: RVColors.gradientCard.map((c) => c.withOpacity(0.9)).toList()),
        border: Border.all(
          color: highlighted
              ? color.withOpacity(0.6 + glowValue * 0.3)
              : RVColors.borderGlow.withOpacity(0.3),
          width: highlighted ? 1.5 : 1,
        ),
        boxShadow: highlighted
            ? [
                BoxShadow(
                  color: color.withOpacity(0.25 + glowValue * 0.15),
                  blurRadius: 24 + glowValue * 12,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          if (highlighted && particleValue != null)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: CustomPaint(
                  painter: _MiniParticlesPainter(particleValue!),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (highlighted)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(colors: [Colors.amber, Colors.orange]),
                    ),
                    child: const Text(
                      '✦ MOST POPULAR',
                      style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1),
                    ),
                  ),
                if (highlighted) const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(name,
                        style: TextStyle(
                            color: color, fontSize: 20, fontWeight: FontWeight.w800)),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$$price',
                            style: TextStyle(
                              color: color,
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(period,
                    style: TextStyle(color: RVColors.textSecondary, fontSize: 12)),
                const SizedBox(height: 16),
                ...features.map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_rounded, color: color, size: 16),
                          const SizedBox(width: 8),
                          Text(f, style: const TextStyle(color: RVColors.textPrimary, fontSize: 13)),
                        ],
                      ),
                    )),
                const SizedBox(height: 16),
                GestureDetector(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: highlighted
                          ? LinearGradient(colors: [color, RVColors.accent])
                          : null,
                      border: highlighted
                          ? null
                          : Border.all(color: color.withOpacity(0.5)),
                      color: highlighted ? null : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        name == 'Free' ? 'Get Started' : 'Choose $name',
                        style: TextStyle(
                          color: highlighted ? Colors.white : color,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleBtn extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _ToggleBtn({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: selected ? const LinearGradient(colors: RVColors.gradientPrimary) : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : RVColors.textSecondary,
            fontSize: 13,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final Color color;
  const _StatChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color.withOpacity(0.15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}

class _ScoreRing extends StatelessWidget {
  final int score;
  final double anim;
  const _ScoreRing({required this.score, required this.anim});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: CustomPaint(
        painter: _CircleChartPainter(score / 100 * anim, Colors.green),
        child: Center(
          child: Text(
            '$score',
            style: const TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  _QuickAction(this.icon, this.label, this.color);
}

class _QuickActionCard extends StatelessWidget {
  final _QuickAction action;
  final double glowValue;
  const _QuickActionCard({required this.action, required this.glowValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            action.color.withOpacity(0.2),
            RVColors.surface,
          ],
        ),
        border: Border.all(color: action.color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(action.icon,
              color: action.color, size: 24,
              shadows: [Shadow(color: action.color.withOpacity(0.5 + glowValue * 0.3), blurRadius: 8)]),
          const SizedBox(height: 6),
          Text(
            action.label,
            style: TextStyle(color: RVColors.textSecondary, fontSize: 9),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _CoverageItem extends StatelessWidget {
  final String value;
  final String label;
  final double anim;
  const _CoverageItem(this.value, this.label, this.anim);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (b) => const LinearGradient(colors: [RVColors.secondary, RVColors.accent]).createShader(b),
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: RVColors.textSecondary, fontSize: 11)),
        ],
      ),
    );
  }
}

class _ThreatRow extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  final double anim;
  const _ThreatRow(this.label, this.count, this.color, this.anim);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(label, style: TextStyle(color: RVColors.textSecondary, fontSize: 11)),
        ),
        Text(
          '${(count * anim).toInt()}',
          style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _MetricBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final double anim;
  const _MetricBar(this.label, this.value, this.color, this.anim);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(color: RVColors.textSecondary, fontSize: 12)),
            Text('${(value * 100).toInt()}%', style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: RVColors.borderGlow.withOpacity(0.3),
          ),
          child: FractionallySizedBox(
            widthFactor: value * anim,
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                gradient: LinearGradient(colors: [color, RVColors.accent]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: RVColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _DeviceRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final String subtitle;
  const _DeviceRow(this.icon, this.name, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: RVColors.secondary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: RVColors.textPrimary, fontSize: 13, fontWeight: FontWeight.w600)),
                Text(subtitle, style: TextStyle(color: RVColors.textSecondary, fontSize: 11)),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: RVColors.textSecondary, size: 18),
        ],
      ),
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _SwitchRow(this.label, this.icon, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: RVColors.textSecondary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(label, style: const TextStyle(color: RVColors.textPrimary, fontSize: 14)),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: RVColors.accent,
              activeTrackColor: RVColors.primary.withOpacity(0.4),
              inactiveThumbColor: RVColors.textSecondary,
              inactiveTrackColor: RVColors.borderGlow.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  const _MenuRow(this.label, this.icon, {this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? RVColors.textPrimary;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: c, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: TextStyle(color: c, fontSize: 14))),
          Icon(Icons.chevron_right_rounded, color: RVColors.textSecondary, size: 18),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  CUSTOM PAINTERS
// ══════════════════════════════════════════════════════════════

class _Star {
  final double x, y, size, opacity, twinkleSpeed;
  _Star({required this.x, required this.y, required this.size, required this.opacity, required this.twinkleSpeed});
}

class _Particle {
  final double x, y, size, speed, opacity, angle;
  _Particle({required this.x, required this.y, required this.size, required this.speed, required this.opacity, required this.angle});
}

class _NavItem {
  final IconData icon;
  final String label;
  _NavItem({required this.icon, required this.label});
}

class _ServerInfo {
  final String flag, city, country, region;
  final int ping, load;
  final bool online;
  _ServerInfo(this.flag, this.city, this.country, this.ping, this.load, this.online, this.region);
}

class _StarsPainter extends CustomPainter {
  final List<_Star> stars;
  final double twinkle;
  _StarsPainter(this.stars, this.twinkle);

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(
            star.opacity * (0.5 + 0.5 * math.sin(twinkle * math.pi * star.twinkleSpeed)))
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
          Offset(star.x * size.width, star.y * size.height), star.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _EarthHologramPainter extends CustomPainter {
  final double rotation;
  final double alpha;
  _EarthHologramPainter(this.rotation, {this.alpha = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 * 0.9;

    // Outer glow
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          RVColors.primary.withOpacity(0.2 * alpha),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 1.3))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 1.3, glowPaint);

    // Earth body
    final earthPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.3),
        colors: [
          RVColors.primary.withOpacity(0.4 * alpha),
          RVColors.deepPurple.withOpacity(0.7 * alpha),
          Colors.black.withOpacity(0.5 * alpha),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, earthPaint);

    // Grid lines
    final gridPaint = Paint()
      ..color = RVColors.primary.withOpacity(0.35 * alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    canvas.save();
    canvas.clipPath(Path()..addOval(Rect.fromCircle(center: center, radius: radius)));

    // Horizontal lines (latitudes)
    for (int i = -4; i <= 4; i++) {
      final y = center.dy + (i / 4) * radius;
      final halfWidth = math.sqrt(math.max(0, radius * radius - (y - center.dy) * (y - center.dy)));
      canvas.drawLine(
          Offset(center.dx - halfWidth, y), Offset(center.dx + halfWidth, y), gridPaint);
    }

    // Vertical lines (longitudes) with rotation
    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * math.pi + rotation * math.pi * 2;
      final paint2 = Paint()
        ..color = RVColors.primary.withOpacity((0.2 + 0.15 * math.cos(angle)) * alpha)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5;
      final path = Path();
      for (double t = -1; t <= 1; t += 0.02) {
        final x = center.dx + radius * math.cos(angle) * math.sqrt(1 - t * t);
        final y = center.dy + radius * t;
        if (t == -1) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint2);
    }

    canvas.restore();

    // Edge glow
    final edgePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.transparent,
          RVColors.glow.withOpacity(0.3 * alpha),
        ],
        stops: const [0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, edgePaint);

    // Atmosphere
    final atmPaint = Paint()
      ..color = RVColors.primary.withOpacity(0.08 * alpha)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius + 8, atmPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _SatelliteOrbitPainter extends CustomPainter {
  final double angle;
  final double radius;
  final double alpha;
  _SatelliteOrbitPainter(this.angle, {this.radius = 130, this.alpha = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = radius;

    // Orbit path
    final orbitPaint = Paint()
      ..color = RVColors.secondary.withOpacity(0.15 * alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawOval(
        Rect.fromCenter(center: center, width: r * 2, height: r * 1.3), orbitPaint);

    // Satellite position
    final sx = center.dx + r * math.cos(angle);
    final sy = center.dy + r * 0.65 * math.sin(angle);
    final satOffset = Offset(sx, sy);

    // Satellite body
    final bodyPaint = Paint()..color = RVColors.secondary.withOpacity(0.9 * alpha);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromCenter(center: satOffset, width: 14, height: 8), const Radius.circular(2)),
      bodyPaint,
    );

    // Solar panels
    final panelPaint = Paint()..color = RVColors.accent.withOpacity(0.7 * alpha);
    canvas.drawRect(Rect.fromCenter(center: Offset(sx - 12, sy), width: 8, height: 4), panelPaint);
    canvas.drawRect(Rect.fromCenter(center: Offset(sx + 12, sy), width: 8, height: 4), panelPaint);

    // Trail
    final trailPaint = Paint()
      ..color = RVColors.accent.withOpacity(0.15 * alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    final trail = Path();
    for (double t = 0; t <= 0.4; t += 0.01) {
      final ta = angle - t;
      final tx = center.dx + r * math.cos(ta);
      final ty = center.dy + r * 0.65 * math.sin(ta);
      if (t == 0) trail.moveTo(tx, ty);
      else trail.lineTo(tx, ty);
    }
    canvas.drawPath(trail, trailPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _LightRaysPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi;
      final paint = Paint()
        ..shader = LinearGradient(
          colors: [
            RVColors.primary.withOpacity(0.25),
            Colors.transparent,
          ],
          begin: Alignment.center,
          end: Alignment.topRight,
        ).createShader(Rect.fromCircle(center: center, radius: size.width))
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..lineTo(
            center.dx + size.width * math.cos(angle),
            center.dy + size.width * math.sin(angle))
        ..lineTo(
            center.dx + size.width * math.cos(angle + 0.15),
            center.dy + size.width * math.sin(angle + 0.15))
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ParticlesPainter extends CustomPainter {
  final List<_Particle> particles;
  final double time;
  _ParticlesPainter(this.particles, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      final t = (time + p.speed) % 1.0;
      final x = (p.x + math.cos(p.angle) * t * 0.3) % 1.0;
      final y = (p.y + math.sin(p.angle) * t * 0.3) % 1.0;
      final opacity = p.opacity * (0.5 + 0.5 * math.sin(time * math.pi * 2 + p.angle));
      final paint = Paint()
        ..color = RVColors.primary.withOpacity(opacity)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x * size.width, y * size.height), p.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _FloatingSatellitesPainter extends CustomPainter {
  final double time;
  _FloatingSatellitesPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final positions = [
      [0.1, 0.2],
      [0.85, 0.15],
      [0.9, 0.7],
      [0.05, 0.8],
    ];
    for (int i = 0; i < positions.length; i++) {
      final bx = positions[i][0] * size.width;
      final by = positions[i][1] * size.height;
      final t = time + i * 0.25;
      final x = bx + math.cos(t * math.pi * 2) * 15;
      final y = by + math.sin(t * math.pi * 2) * 10;
      final c = Offset(x, y);

      final bodyPaint = Paint()..color = RVColors.primary.withOpacity(0.25);
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromCenter(center: c, width: 10, height: 6), const Radius.circular(2)),
        bodyPaint,
      );
      final panelPaint = Paint()..color = RVColors.secondary.withOpacity(0.2);
      canvas.drawRect(Rect.fromCenter(center: Offset(x - 8, y), width: 5, height: 3), panelPaint);
      canvas.drawRect(Rect.fromCenter(center: Offset(x + 8, y), width: 5, height: 3), panelPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _RadarScannerPainter extends CustomPainter {
  final double angle;
  final bool large;
  _RadarScannerPainter(this.angle, {this.large = false});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final r = size.width / 2;

    // Circles
    for (int i = 1; i <= 3; i++) {
      final paint = Paint()
        ..color = RVColors.primary.withOpacity(0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5;
      canvas.drawCircle(center, r * i / 3, paint);
    }

    // Cross lines
    final linePaint = Paint()
      ..color = RVColors.primary.withOpacity(0.2)
      ..strokeWidth = 0.5;
    canvas.drawLine(Offset(center.dx - r, center.dy), Offset(center.dx + r, center.dy), linePaint);
    canvas.drawLine(Offset(center.dx, center.dy - r), Offset(center.dx, center.dy + r), linePaint);

    // Sweep
    final sweepPaint = Paint()
      ..shader = SweepGradient(
        startAngle: angle * 2 * math.pi,
        endAngle: angle * 2 * math.pi + math.pi / 2,
        colors: [
          Colors.transparent,
          RVColors.accent.withOpacity(0.4),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: r))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, r, sweepPaint);

    // Dots
    if (large) {
      final dotPaint = Paint()..color = RVColors.accent;
      canvas.drawCircle(Offset(center.dx + r * 0.5, center.dy - r * 0.3), 2, dotPaint);
      canvas.drawCircle(Offset(center.dx - r * 0.4, center.dy + r * 0.5), 2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _WorldMapPainter extends CustomPainter {
  final double time;
  _WorldMapPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    // Subtle world map grid
    final paint = Paint()
      ..color = RVColors.primary.withOpacity(0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    for (int i = 0; i < 8; i++) {
      canvas.drawLine(
          Offset((i + 1) * size.width / 9, 0),
          Offset((i + 1) * size.width / 9, size.height),
          paint);
    }
    for (int i = 0; i < 4; i++) {
      canvas.drawLine(
          Offset(0, (i + 1) * size.height / 5),
          Offset(size.width, (i + 1) * size.height / 5),
          paint);
    }

    // Connection paths
    final serverPositions = [
      Offset(size.width * 0.42, size.height * 0.38),
      Offset(size.width * 0.5, size.height * 0.25),
      Offset(size.width * 0.75, size.height * 0.45),
      Offset(size.width * 0.25, size.height * 0.45),
      Offset(size.width * 0.6, size.height * 0.65),
    ];

    final pathPaint = Paint()
      ..color = RVColors.primary.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    for (int i = 0; i < serverPositions.length - 1; i++) {
      canvas.drawLine(serverPositions[i], serverPositions[i + 1], pathPaint);
    }

    // Server dots with pulse
    for (final pos in serverPositions) {
      final pulsePaint = Paint()
        ..color = RVColors.accent.withOpacity(0.15 + 0.1 * math.sin(time * 2 * math.pi))
        ..style = PaintingStyle.fill;
      canvas.drawCircle(pos, 8 + 4 * math.sin(time * 2 * math.pi), pulsePaint);

      final dotPaint = Paint()..color = RVColors.accent.withOpacity(0.7);
      canvas.drawCircle(pos, 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _NetworkChartPainter extends CustomPainter {
  final double time;
  _NetworkChartPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final uploadData = [0.3, 0.5, 0.4, 0.7, 0.6, 0.8, 0.5, 0.9, 0.7, 0.6, 0.8, 0.4];
    final downloadData = [0.5, 0.7, 0.6, 0.8, 0.9, 0.7, 0.8, 0.6, 0.9, 0.8, 0.7, 0.9];

    void drawLine(List<double> data, Color color) {
      final path = Path();
      final fillPath = Path();
      for (int i = 0; i < data.length; i++) {
        final x = (i / (data.length - 1)) * size.width;
        final wave = math.sin(time * 2 * math.pi + i * 0.5) * 0.05;
        final y = size.height - (data[i] + wave) * size.height;
        if (i == 0) {
          path.moveTo(x, y);
          fillPath.moveTo(x, size.height);
          fillPath.lineTo(x, y);
        } else {
          path.lineTo(x, y);
          fillPath.lineTo(x, y);
        }
      }
      fillPath.lineTo(size.width, size.height);
      fillPath.close();

      final fillPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withOpacity(0.3), Colors.transparent],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      canvas.drawPath(fillPath, fillPaint);

      final linePaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round;
      canvas.drawPath(path, linePaint);
    }

    drawLine(downloadData, RVColors.secondary);
    drawLine(uploadData, RVColors.accent);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _LineChartPainter extends CustomPainter {
  final double progress;
  _LineChartPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final data = [0.4, 0.6, 0.5, 0.8, 0.7, 0.9, 0.85];

    final path = Path();
    final fillPath = Path();
    final visibleCount = (data.length * progress).ceil();

    for (int i = 0; i < math.min(visibleCount, data.length); i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y = size.height - data[i] * size.height * 0.85;
      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        path.lineTo(x, y);
        fillPath.lineTo(x, y);
      }
    }

    fillPath.lineTo(size.width * progress, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [RVColors.primary.withOpacity(0.3), Colors.transparent],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fillPath, fillPaint);

    final paint = Paint()
      ..color = RVColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, paint);

    // Dots
    final dotPaint = Paint()..color = RVColors.accent;
    for (int i = 0; i < math.min(visibleCount, data.length); i++) {
      final x = (i / (data.length - 1)) * size.width;
      final y = size.height - data[i] * size.height * 0.85;
      canvas.drawCircle(Offset(x, y), 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _CircleChartPainter extends CustomPainter {
  final double value;
  final Color color;
  _CircleChartPainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final bgPaint = Paint()
      ..color = RVColors.borderGlow.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawCircle(center, radius, bgPaint);

    if (value > 0) {
      final arcPaint = Paint()
        ..shader = SweepGradient(
          startAngle: -math.pi / 2,
          endAngle: -math.pi / 2 + value * 2 * math.pi,
          colors: [color, RVColors.accent],
        ).createShader(Rect.fromCircle(center: center, radius: radius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        value * 2 * math.pi,
        false,
        arcPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _MiniParticlesPainter extends CustomPainter {
  final double time;
  final _rng = math.Random(42);
  _MiniParticlesPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(42);
    for (int i = 0; i < 20; i++) {
      final baseX = rng.nextDouble();
      final baseY = rng.nextDouble();
      final speed = rng.nextDouble() * 0.2 + 0.05;
      final angle = rng.nextDouble() * 2 * math.pi;
      final t = (time + rng.nextDouble()) % 1.0;
      final x = (baseX + math.cos(angle) * t * speed) % 1.0;
      final y = (baseY - t * speed * 0.5) % 1.0;
      final s = rng.nextDouble() * 2 + 0.5;
      final op = rng.nextDouble() * 0.3 + 0.1;
      final paint = Paint()
        ..color = RVColors.accent.withOpacity(op)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x * size.width, y * size.height), s, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
