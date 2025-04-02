import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/tic_tac_toe_board_page.dart';
import 'providers/theme_provider.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic-Tac-Toe',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF3949AB),
          secondary: const Color(0xFFFF6E40),
          tertiary: const Color(0xFF00BFA5),

          surface: Colors.white,
        ),
        useMaterial3: true,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3949AB),
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF6E40),
            foregroundColor: Colors.white,
            elevation: 3,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardColor: Colors.white,
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
          shadowColor: Colors.black26,
        ),
        scaffoldBackgroundColor: Colors.grey[50],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF212121), fontSize: 16),
          titleLarge: TextStyle(
            color: Color(0xFF212121),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF3949AB), size: 24),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepOrange,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFFF6E40),
          secondary: const Color(0xFF536DFE),
          tertiary: const Color(0xFF64FFDA),

          surface: const Color(0xFF1E1E1E),
        ),
        useMaterial3: true,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF6E40),
          elevation: 2,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color(0xFF1E1E1E),
          shadowColor: Colors.black45,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFFE0E0E0), fontSize: 16),
          titleLarge: TextStyle(
            color: Color(0xFFE0E0E0),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF536DFE),
            foregroundColor: Colors.white,
            elevation: 3,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFFF6E40), size: 24),
      ),
      home: const TicTacToeBoard(),
    );
  }
}
