import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/screens/explore_screen.dart';
import 'package:fitness_app/screens/analytics_screen.dart';
import 'package:fitness_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  int _currentTab = 0;

  final List<Map<String, dynamic>> _workouts = [
    {
      "title": "Full Body\nDestroyer",
      "subtitle": "45 Min • High Intensity",
      "image": "assets/full body destroyer.jpeg",
      "color": const Color(0xFFFF0040),
    },
    {
      "title": "Cardio\nBlast",
      "subtitle": "30 Min • Endurance",
      "image": "assets/cardio blast.jpeg",
      "color": Colors.blueAccent,
    },
    {
      "title": "Strength\nMaster",
      "subtitle": "60 Min • Power",
      "image": "assets/strength.jpeg",
      "color": Colors.orangeAccent,
    },
    {
      "title": "Yoga\nFlow",
      "subtitle": "40 Min • Flexibility",
      "image": "assets/youga flow.jpeg",
      "color": Colors.purpleAccent,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if(_currentPage < _workouts.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500), 
        curve: Curves.easeOutCubic
      );
    }
  }

  void _prevPage() {
    if(_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500), 
        curve: Curves.easeOutCubic
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildBody(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentTab) {
      case 0:
        return _buildHomeContent();
      case 1:
        return const ExploreScreen();
      case 2:
        return const AnalyticsScreen();
      case 3:
        return const ProfileScreen();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Container(
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        FadeInDown(
                          delay: const Duration(milliseconds: 200),
                          child: Text(
                            "Ready to Workout?",
                            style: GoogleFonts.poppins(
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

              const SizedBox(height: 10),

              // Categories Title with Nav buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FadeInLeft(
                  delay: const Duration(milliseconds: 600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Featured Workouts",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      
                      // Navigation Buttons
                      Row(
                        children: [
                          IconButton(
                            onPressed: _prevPage,
                            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                            color: Colors.white70,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white10,
                              padding: const EdgeInsets.all(12)
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: _nextPage,
                            icon: const Icon(Icons.arrow_forward_ios_rounded, size: 20),
                            color: const Color(0xFFFF0040),
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFFF0040).withOpacity(0.1),
                              padding: const EdgeInsets.all(12)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Carousel PageView
              SizedBox(
                height: 400,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _workouts.length,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildWorkoutCard(
                      index: index,
                      data: _workouts[index],
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Daily Progress Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 700),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Daily Progress",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "See All",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: const Color(0xFFFF0040),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildStatItem("Calories", "890", "Kcal", Icons.local_fire_department_rounded, Colors.orangeAccent),
                            _buildDivider(),
                            _buildStatItem("Time", "45", "Min", Icons.timer_rounded, Colors.blueAccent),
                             _buildDivider(),
                            _buildStatItem("Heart Rate", "105", "Bpm", Icons.favorite_rounded, const Color(0xFFFF0040)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Extra space for bottom nav
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return FadeInUp(
      delay: const Duration(milliseconds: 800),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             _buildNavItem(Icons.home_filled, 0),
             _buildNavItem(Icons.explore_outlined, 1),
             _buildNavItem(Icons.analytics_outlined, 2),
             _buildNavItem(Icons.person_outline, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentTab = index;
        });
      },
      child: Icon(
        icon, 
        color: _currentTab == index ? const Color(0xFFFF0040) : Colors.white38, 
        size: 30
      ),
    );
  }

  Widget _buildWorkoutCard({required int index, required Map<String, dynamic> data}) {
    // Calculate scale for carousel effect
    double scale = 1.0;
    // We can use a simple logic here or just rely on viewportFraction for spacing.
    // For a 3D effect, we'd wrap in AnimatedBuilder with pageController, but for simplicity
    // and performance, let's stick to a clean card design first.
    
    return AnimatedPadding(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: _currentPage == index ? 0 : 30, // transform effect
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(data['image']),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black45,
              BlendMode.darken,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: (data['color'] as Color).withOpacity(0.4),
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
                Colors.black.withOpacity(0.9),
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
                  color: data['color'],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Pro",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data['title'],
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                data['subtitle'],
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
               const SizedBox(height: 20),
               // Action Button
               Row(
                 children: [
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       color: Colors.white24,
                       shape: BoxShape.circle,
                       ),
                     child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30),
                   ),
                   const SizedBox(width: 15),
                   Text(
                      "Start Now",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                   )
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, String unit, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: " $unit",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.white10,
    );
  }
}
