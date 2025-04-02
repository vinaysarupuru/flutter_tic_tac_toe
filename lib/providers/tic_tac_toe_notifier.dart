import 'package:flutter/material.dart';

class TicTacToeData extends ChangeNotifier {
  List<String> board = List.generate(9, (index) => "");
  String currentPlayer = "X";
  String? winner;
  bool isDraw = false;

  void makeMove(int index) {
    if (board[index] == "" && winner == null && !isDraw) {
      board[index] = currentPlayer;
      _checkWinner();
      _checkDraw();
      if (winner == null && !isDraw) {
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      }
      notifyListeners();
    }
  }

  void _checkWinner() {
    const winningPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8], // Rows
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8], // Columns
      [0, 4, 8],
      [2, 4, 6], // Diagonals
    ];

    for (var position in winningPositions) {
      String p1 = board[position[0]];
      String p2 = board[position[1]];
      String p3 = board[position[2]];
      if (p1 != "" && p1 == p2 && p2 == p3) {
        winner = p1;
        break;
      }
    }
  }

  void _checkDraw() {
    if (!board.contains("") && winner == null) {
      isDraw = true;
    }
  }

  void resetBoard() {
    board = List.generate(9, (index) => "");
    currentPlayer = "X";
    winner = null;
    isDraw = false;
    notifyListeners();
  }
}
