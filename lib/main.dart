import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/patient_details.dart';
import 'pages/splashscreen.dart';
import 'pages/splashscreen_02.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://uztzqpkciyvodshnyfui.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV6dHpxcGtjaXl2b2RzaG55ZnVpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkwMzc3NTUsImV4cCI6MjAyNDYxMzc1NX0.E7-OX2J9Sk1stD0yPzFfSJnh04HrpIjwpDJZYvij-FU',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 75, 58, 183)),
        useMaterial3: true,
      ),
      home: PatientDetailWidget(
        patientName: '',
        patientSpecialty: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
