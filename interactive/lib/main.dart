import 'package:flutter/material.dart';
import 'theme/app_theme.dart'; // Importas tu nuevo tema
import 'screens/home_screen.dart';

void main() {
  runApp(const SeniorConnectApp());
}

class SeniorConnectApp extends StatelessWidget {
  const SeniorConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senior Connect',
      
      // AQUÍ USAS EL THEME QUE CREAMOS
      theme: AppTheme.lightTheme, 
      
      home: const HomeScreen(),
    );
  }
}