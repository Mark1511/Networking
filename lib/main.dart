import 'package:flutter/material.dart';
import 'user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Networking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          background: Colors.black,
          primary: Colors.white,
          surface: Colors.redAccent.shade700,
          onSurface: Colors.white,
          onSurfaceVariant: Colors.white,
          outlineVariant: Colors.red.shade900,
          seedColor: const Color.fromARGB(255, 255, 0, 0),
        ),
        useMaterial3: true,
      ),
      home: const UserListScreen(),
    );
  }
}
