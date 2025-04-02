import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tic_tac_toe_notifier.dart';

class TicTacToeCell extends StatelessWidget {
  const TicTacToeCell({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;
    return Consumer<TicTacToeData>(
      builder: (context, gameData, child) {
        return GestureDetector(
          onTap: () => gameData.makeMove(index),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                gameData.board[index],
                style: TextStyle(
                  fontSize: isLargeScreen ? 48.0 : 32.0,
                  color:
                      gameData.board[index] == 'X'
                          ? Colors.blue
                          : Colors.orange,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
