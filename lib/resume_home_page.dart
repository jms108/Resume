import 'package:flutter/material.dart';
import 'education_page.dart';
import 'experience_page.dart';
import 'personal_info_page.dart';
import 'skills_page.dart';

class ResumeHomePage extends StatelessWidget {
  const ResumeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width to decide layout
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "Resume",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: screenWidth < 600
            // Single-column layout for smaller screens
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildContent(context),
              )
            // Two-column layout for larger screens
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Left Section with Profile and Navigation
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _buildContent(context),
                    ),
                  ),
                  // Right Section Placeholder
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Select a section to view details',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // Content to display in the navigation and profile area
  List<Widget> _buildContent(BuildContext context) {
    return [
      // Profile Picture
      const CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('lib/assets/profile.jpg'),
      ),
      const SizedBox(height: 16),

      // Name and Contact Info
      const Text(
        'JANNATUL MAOUA SAIMA',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const Text('+8801234567890'),
      const Text('jms1csecu@gmail.com'),
      const Divider(height: 30, thickness: 1),
      const SizedBox(height: 16),

      // Navigation Buttons
      _buildMenuItem(context, 'Personal Info', const PersonalInfoPage()),
      _buildMenuItem(context, 'Skills', const SkillsPage()),
      _buildMenuItem(context, 'Education', const EducationPage()),
      _buildMenuItem(context, 'Experience', const ExperiencePage()),
    ];
  }

  // Menu Item Button Builder
  Widget _buildMenuItem(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, //button color
          foregroundColor: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
