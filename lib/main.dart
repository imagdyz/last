import 'package:flutter/material.dart';

// Auth Flow
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/doctor/audio_call.dart';
import 'screens/doctor/book_appointment.dart';
import 'screens/doctor/chat_list.dart';
import 'screens/doctor/chat_screen.dart';
// Doctor Flow
import 'screens/doctor/doctor_home.dart';
import 'screens/doctor/doctor_list.dart';
import 'screens/doctor/doctor_profile.dart';
// 5-Step Flow
import 'screens/steps/step1_welcome.dart';
import 'screens/steps/step2_organ_symptoms.dart';
import 'screens/steps/step2_symptoms.dart';
import 'screens/steps/step3_conditions.dart';
import 'screens/steps/step4_result.dart';
import 'screens/steps/step5_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stomach Support',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Adjust initial route as needed
      routes: {
        // Auth Flow
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),

        // 5-Step Flow
        '/step1': (context) => const Step1Welcome(),
        '/step2': (context) => const Step2Symptoms(),
        '/step2_organ_symptoms': (context) => Step2OrganSymptoms(
          arguments:
              ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>?,
        ),
        '/step3': (context) => const Step3Conditions(),
        '/step4': (context) => const Step4Result(),
        '/step5': (context) => const Step5Details(),

        // Doctor Flow
        '/doctor': (context) => const DoctorHome(),
        '/doctor/list': (context) => const DoctorList(),
        '/doctor/profile': (context) => const DoctorProfile(),
        '/doctor/book': (context) => const BookAppointment(),
        '/doctor/chat_list': (context) =>
            const ChatList(), // Usually navigates from some tab, though not fully hooked up in TopNav
        '/doctor/chat': (context) => const ChatScreen(),
        '/doctor/call': (context) => const AudioCall(),
      },
      // Catch-all or undefined routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      },
    );
  }
}
