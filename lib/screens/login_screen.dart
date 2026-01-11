import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                
                // Runner Icon
                FadeInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Icon(
                      Icons.directions_run_rounded, 
                      size: 60, 
                      color: Color(0xFFFF0040)
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Title
                FadeInUp(
                  duration: const Duration(milliseconds: 1200),
                  child: Text(
                    "Welcome to\nFitnessa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                FadeInUp(
                  duration: const Duration(milliseconds: 1400),
                  child: Text(
                    "Get started with Fitnessa\npersonal trainers at your doorstep.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Pagination Dots
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(true),
                      const SizedBox(width: 8),
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(false),
                    ],
                  ),
                ),
                
                const SizedBox(height: 50),
                
                // Buttons
                FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: Row(
                    children: [
                      // Login Button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                             Navigator.pushReplacement(
                              context, 
                              MaterialPageRoute(builder: (context) => const HomeScreen())
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFFF0040)),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Login",
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              color: const Color(0xFFFF0040),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Sign Up Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF0040),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.outfit(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFF0040) : Colors.white24,
        shape: BoxShape.circle,
      ),
    );
  }
}
