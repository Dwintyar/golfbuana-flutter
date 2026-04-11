import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1)); // TODO: Supabase auth
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.network(
              'https://images.unsplash.com/photo-1587174486073-ae5e5cff23aa?w=800',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1a2a1a), Color(0xFF0d1a0d)],
                  ),
                ),
              ),
            ),
          ),

          // Dark overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x88000000),
                  Color(0xCC000000),
                  Color(0xEE000000),
                ],
                stops: [0.0, 0.4, 1.0],
              ),
            ),
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 48),

                  // Logo
                  _buildLogo(),

                  const SizedBox(height: 16),

                  // Title
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                      children: [
                        TextSpan(
                          text: 'Golf',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Buana',
                          style: TextStyle(color: Color(0xFF66BB6A)),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Meet, Connect, Compete',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      letterSpacing: 0.3,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Email field
                  _buildTextField(
                    controller: _emailController,
                    hint: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 12),

                  // Password field
                  _buildTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    obscure: _obscurePassword,
                    suffix: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.white54,
                        size: 20,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign In button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E7D32),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 0,
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Divider
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.white30)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or sign in with',
                          style: TextStyle(color: Colors.white54, fontSize: 13),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white30)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Social buttons
                  Row(
                    children: [
                      Expanded(child: _buildSocialButton(
                        label: 'Google',
                        icon: _googleIcon(),
                        enabled: true,
                        onTap: () {},
                      )),
                      const SizedBox(width: 10),
                      Expanded(child: _buildSocialButton(
                        label: 'Facebook',
                        icon: const Icon(Icons.facebook, color: Colors.white38, size: 18),
                        enabled: false,
                        comingSoon: true,
                      )),
                      const SizedBox(width: 10),
                      Expanded(child: _buildSocialButton(
                        label: 'LinkedIn',
                        icon: const Icon(Icons.business, color: Colors.white38, size: 18),
                        enabled: false,
                        comingSoon: true,
                      )),
                    ],
                  ),

                  const SizedBox(height: 28),

                  // Sign Up
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                      children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: Color(0xFF66BB6A),
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Privacy policy
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white54, fontSize: 11),
                      children: [
                        const TextSpan(text: 'By signing in, you agree to our '),
                        TextSpan(
                          text: 'Kebijakan Privasi',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white70,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(text: ' kami'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // How it works
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white54, fontSize: 12),
                      children: [
                        const TextSpan(text: 'Baru di GolfBuana? '),
                        TextSpan(
                          text: 'Pelajari cara kerjanya →',
                          style: const TextStyle(
                            color: Color(0xFF66BB6A),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      width: 80,
      height: 80,
      child: CustomPaint(painter: _HexLogoPainter()),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscure = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: const Color(0x55000000),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.15)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.15)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: const BorderSide(color: Color(0xFF66BB6A), width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        suffixIcon: suffix,
      ),
    );
  }

  Widget _buildSocialButton({
    required String label,
    required Widget icon,
    required bool enabled,
    bool comingSoon = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0x44000000),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(enabled ? 0.25 : 0.1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (comingSoon)
              const Text(
                'Coming soon',
                style: TextStyle(color: Colors.white38, fontSize: 8),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    color: enabled ? Colors.white : Colors.white38,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _googleIcon() {
    return const Text('G', style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Color(0xFF4285F4),
    ));
  }
}

// Hexagon logo painter matching GolfBuana logo
class _HexLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = size.width * 0.18;

    void drawHex(double x, double y, Color color) {
      final path = Path();
      for (int i = 0; i < 6; i++) {
        final angle = (i * 60 - 30) * 3.14159 / 180;
        final px = x + r * cos(angle);
        final py = y + r * sin(angle);
        if (i == 0) {
          path.moveTo(px, py);
        } else {
          path.lineTo(px, py);
        }
      }
      path.close();
      canvas.drawPath(path, Paint()..color = color);
    }

    // Hexagon cluster matching logo
    drawHex(cx - r * 1.1, cy - r * 0.6, const Color(0xFFBDBDBD)); // top-left gray
    drawHex(cx + r * 0.1, cy - r * 1.2, const Color(0xFF9E9E9E)); // top gray
    drawHex(cx + r * 1.1, cy - r * 0.6, const Color(0xFF757575)); // top-right dark
    drawHex(cx - r * 0.5, cy + r * 0.6, const Color(0xFF9E9E9E)); // bottom-left
    drawHex(cx + r * 0.7, cy + r * 0.6, const Color(0xFF4CAF50)); // bottom-right GREEN
  }

  double cos(double rad) => _cos(rad);
  double sin(double rad) => _sin(rad);

  double _cos(double x) {
    double result = 1;
    double term = 1;
    for (int i = 1; i <= 10; i++) {
      term *= -x * x / (2 * i * (2 * i - 1));
      result += term;
    }
    return result;
  }

  double _sin(double x) {
    double result = x;
    double term = x;
    for (int i = 1; i <= 10; i++) {
      term *= -x * x / ((2 * i + 1) * (2 * i));
      result += term;
    }
    return result;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}