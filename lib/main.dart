import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'providers/theme_provider.dart';
import 'providers/tic_tac_toe_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: ChangeNotifierProvider<TicTacToeData>(
        create: (context) => TicTacToeData(),
        builder: (context, child) => const TicTacToeApp(),
      ),
    ),
  );
}
