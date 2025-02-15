import 'package:flutter/material.dart';

import '../colortheme.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(Icons.favorite, size: 80, color: AppColors.accent),
                    SizedBox(height: 8),
                    Text(
                      'Typing Tutor',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SectionCard(
                title: 'Meet Our Team',
                content: [
                  'Developed by: Harsh Vekariya(23010101297)',
                  'Mentored by: Prof. Mehul Bhundiya (Computer Engineering Department, School of Computer Science)',
                  'Explored by: ASWDC, School Of Computer Science, School of Computer Science',
                  'Eulogized by: Darshan University, Rajkot, Gujarat - INDIA',
                ],
                backgroundColor: AppColors.background,
                titleColor: AppColors.textPrimary,
              ),
              SectionCard(
                title: 'About ASWDC',
                content: [
                  'ASWDC is Application, Software and Website Development Center @ Darshan University run by Students and Staff of School Of Computer Science.',
                  'Sole purpose of ASWDC is to bridge the gap between university curriculum & industry demands.',
                  'Students learn cutting-edge technologies, develop real-world applications & experience a professional environment @ ASWDC under the guidance of industry experts & faculty members.',
                ],
                backgroundColor: AppColors.background,
                titleColor: AppColors.textPrimary,
              ),
              SectionCard(
                title: 'Contact Us',
                content: [
                  'Email: aswdc@darshan.ac.in',
                  'Phone: +91-9727747317',
                  'Website: www.darshan.ac.in',
                ],
                backgroundColor: AppColors.background,
                titleColor: AppColors.textPrimary,
              ),
              SectionCard(
                title: 'More Options',
                content: [
                  'Share App',
                  'More Apps',
                  'Rate Us',
                  'Like us on Facebook',
                  'Check for Updates',
                ],
                backgroundColor: AppColors.background,
                titleColor: AppColors.textPrimary,
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      '© 2025 Darshan University',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'All Rights Reserved - Privacy Policy',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.textPrimary),
                    ),
                    Text(
                      'Made with ❤️ in India',
                      style:
                          TextStyle(fontSize: 14, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final List<String> content;
  final Color backgroundColor;
  final Color titleColor;

  SectionCard({
    required this.title,
    required this.content,
    required this.backgroundColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            SizedBox(height: 8),
            ...content.map((text) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
