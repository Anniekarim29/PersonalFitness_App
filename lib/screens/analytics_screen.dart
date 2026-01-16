import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Analytics",
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
            FadeInLeft(
              child: Text(
                "Weekly Activity",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Weekly Chart placeholder
            FadeInUp(
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildBar(0.4, "Mon"),
                    _buildBar(0.7, "Tue"),
                    _buildBar(0.5, "Wed"),
                    _buildBar(0.9, "Thu", isActive: true),
                    _buildBar(0.6, "Fri"),
                    _buildBar(0.3, "Sat"),
                    _buildBar(0.8, "Sun"),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            FadeInLeft(
              delay: const Duration(milliseconds: 200),
              child: Text(
                "Statistics",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Stats Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.1,
              children: [
                _buildStatCard(Icons.local_fire_department, "Calories", "1,240 kcal", Colors.orange),
                _buildStatCard(Icons.directions_walk, "Steps", "8,432", Colors.cyanAccent),
                _buildStatCard(Icons.water_drop, "Water Intake", "2.5 L", Colors.blue),
                _buildStatCard(Icons.bed, "Sleep", "7h 20m", Colors.purpleAccent),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(double heightFactor, String label, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 120 * heightFactor,
          width: 30,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFFFF0040) : Colors.white10,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, String title, String value, Color color) {
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
