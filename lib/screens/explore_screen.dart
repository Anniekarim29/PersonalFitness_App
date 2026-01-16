import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Explore",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            FadeInDown(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search workouts...",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                    border: InputBorder.none,
                    icon: const Icon(Icons.search, color: Color(0xFFFF0040)),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Categories
            FadeInLeft(
              delay: const Duration(milliseconds: 200),
              child: Text(
                "Categories",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                   _buildCategoryChip("Yoga", true),
                   _buildCategoryChip("HIIT", false),
                   _buildCategoryChip("Strength", false),
                   _buildCategoryChip("Cardio", false),
                   _buildCategoryChip("Boxing", false),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Featured Workouts
            FadeInLeft(
              delay: const Duration(milliseconds: 400),
              child: Text(
                "Featured Workouts",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            _buildWorkoutCard("Full Body Burn", "45 min • Advanced", "assets/screenshot_1.png"),
            const SizedBox(height: 15),
            _buildWorkoutCard("Morning Yoga", "20 min • Beginner", "assets/screenshot_1.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFF0040) : Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: isActive ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(String title, String subtitle, String image) {
    return FadeInUp(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
