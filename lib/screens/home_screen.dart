import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color(0xFF1A1A1A),
              Color(0xFF2C030B),
              Colors.black,
            ],
            stops: [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInDown(
                          child: Text(
                            "Hello, Fighter",
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        FadeInDown(
                          delay: const Duration(milliseconds: 200),
                          child: Text(
                            "Ready to Workout?",
                            style: GoogleFonts.outfit(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    FadeInDown(
                      delay: const Duration(milliseconds: 400),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0040).withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFFF0040)),
                        ),
                        child: const Icon(Icons.notifications_none, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Search Bar
              FadeInLeft(
                delay: const Duration(milliseconds: 600),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.white38),
                        const SizedBox(width: 15),
                        Text(
                          "Search workout...",
                          style: GoogleFonts.outfit(color: Colors.white38),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Categories Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FadeInLeft(
                  delay: const Duration(milliseconds: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured Workouts",
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          color: const Color(0xFFFF0040),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Categories List
              SizedBox(
                height: 320,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 24),
                  children: [
                    _buildWorkoutCard(
                      title: "Full Body\nDestroyer",
                      subtitle: "45 Min • High Intensity",
                      imageAsset: "assets/background.jpg", // Using background as placeholder
                      delay: 1000,
                    ),
                    _buildWorkoutCard(
                      title: "Cardio\nBlast",
                      subtitle: "30 Min • Endurance",
                       imageAsset: "assets/background.jpg",
                      delay: 1200,
                      color: Colors.blueAccent, 
                    ),
                     _buildWorkoutCard(
                      title: "Strength\nMaster",
                      subtitle: "60 Min • Power",
                       imageAsset: "assets/background.jpg",
                      delay: 1400,
                      color: Colors.orangeAccent
                    ),
                  ],
                ),
              ),

              const Spacer(),
              
              // Bottom Nav (Visual Only)
              FadeInUp(
                delay: const Duration(milliseconds: 1600),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                       Icon(Icons.home_filled, color: Color(0xFFFF0040), size: 30),
                       Icon(Icons.explore_outlined, color: Colors.white38, size: 30),
                       Icon(Icons.analytics_outlined, color: Colors.white38, size: 30),
                       Icon(Icons.person_outline, color: Colors.white38, size: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String subtitle, 
    required String imageAsset,
    required int delay,
    Color color = const Color(0xFFFF0040),
  }) {
    return FadeInRight(
      delay: Duration(milliseconds: delay),
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(imageAsset),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Pro",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: GoogleFonts.outfit(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
               const SizedBox(height: 15),
               // Action Button
               Row(
                 children: [
                   Container(
                     height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                       color: Colors.white24,
                       shape: BoxShape.circle,
                     ),
                     child: const Icon(Icons.play_arrow_rounded, color: Colors.white),
                   ),
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }
}
