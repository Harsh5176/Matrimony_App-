import 'package:flutter/material.dart';


import '../Dashboard/BottomNaviBar.dart';
import '../colortheme.dart';


class Languagepage extends StatefulWidget {
  const Languagepage({super.key});

  @override
  State<Languagepage> createState() => _LanguagepageState();
}

class _LanguagepageState extends State<Languagepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                color: AppColors.background,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Newimages/Language_Image (2).png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                    SizedBox(height: 30),
                    Text(
                      "Select your Language",
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Dropdownmanu(),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => BottomNaviBar()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Dropdownmanu extends StatefulWidget {
  @override
  _DropdownmanuState createState() => _DropdownmanuState();
}

class _DropdownmanuState extends State<Dropdownmanu> {
  String? selectedLanguage;
  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Portuguese',
    'Chinese',
    'Japanese',
    'Korean',
    'Hindi',
    'Arabic',
    'Russian',
    'Bengali',
    'Tamil',
    'Telugu',
    'Urdu',
    'Greek',
    'Latin',
    'Dutch',
    'Swedish',
    'Norwegian',
    'Finnish',
    'Danish',
    'Polish',
    'Czech',
    'Hungarian',
    'Turkish',
    'Thai',
    'Vietnamese',
    'Malay',
    'Indonesian',
    'Filipino',
    'Swahili',
    'Zulu',
    'Afrikaans',
    'Hebrew',
    'Persian',
    'Pashto',
    'Sinhala',
    'Nepali',
    'Burmese',
    'Khmer',
    'Lao',
    'Uzbek',
    'Kazakh',
    'Azerbaijani',
    'Armenian',
    'Georgian',
    'Marathi',
    'Gujarati',
    'Punjabi',
    'Kannada',
    'Somali',
    'Amharic'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedLanguage,
      hint: Text('Choose a language', style: TextStyle(color: AppColors.textPrimary)),
      dropdownColor: AppColors.background,
      style: TextStyle(color: AppColors.textPrimary, fontSize: 18),
      icon: Icon(Icons.arrow_drop_down, color: AppColors.primary),
      underline: SizedBox(),
      items: languages.map((String language) {
        return DropdownMenuItem<String>(
          value: language,
          child: Text(language),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedLanguage = newValue;
        });
      },
    );
  }
}
