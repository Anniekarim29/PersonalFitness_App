import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: Colors.white70),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Profile Header
            FadeInDown(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFFFF0040), width: 2),
                        ),
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage("assets/screenshot_1.png"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF0040),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Annie Karim",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Professional Athlete",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFFFF0040),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Stats Row
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem("68", "Weight"),
                    Container(width: 1, height: 30, color: Colors.white10),
                    _buildStatItem("175", "Height"),
                    Container(width: 1, height: 30, color: Colors.white10),
                    _buildStatItem("24", "Age"),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Options List
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Column(
                children: [
                  _buildProfileOption(Icons.person_outline, "Edit Profile"),
                  _buildProfileOption(Icons.fitness_center, "My Workouts"),
                  _buildProfileOption(Icons.workspace_premium, "Premium Plan"),
                  _buildProfileOption(Icons.notifications_none, "Notifications"),
                  _buildProfileOption(Icons.privacy_tip_outlined, "Security"),
                  const SizedBox(height: 20),
                  _buildProfileOption(Icons.logout, "Log Out", isDestructive: true),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900]!.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDestructive ? Colors.red.withOpacity(0.1) : Colors.cyanAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: isDestructive ? Colors.redAccent : Colors.cyanAccent, size: 22),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: isDestructive ? Colors.redAccent : Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.white24),
        onTap: () {},
      ),
    );
  }
}
