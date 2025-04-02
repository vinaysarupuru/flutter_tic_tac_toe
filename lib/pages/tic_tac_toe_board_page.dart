import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/tic_tac_toe_notifier.dart';
import '../widgets/tic_tac_toe_cell_widget.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({super.key});

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(right: 16.0),
                icon: Icon(
                  Provider.of<ThemeProvider>(context).themeMode ==
                          ThemeMode.dark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  ).toggleTheme();
                },
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Center(
            child: Consumer<TicTacToeData>(
              builder: (context, gameData, child) {
                final screenWidth = MediaQuery.of(context).size.width;
                final isLargeScreen = screenWidth > 600;
                final boardSize = isLargeScreen ? 400.0 : screenWidth - 32;

                if (gameData.winner != null && gameData.confettiActive) {
                  _controllerCenter.play();
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   gameData.confettiActive = false;
                  //   _controllerCenter.stop();
                  // });
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ConfettiWidget(
                      confettiController: _controllerCenter,
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop:
                          false, // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pink,
                      ], // manually specify the colors to be used
                      emissionFrequency: 0.05,
                      numberOfParticles: 50,
                      gravity: 0.2,
                    ),
                    Container(
                      width: boardSize,
                      height: boardSize,
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return TicTacToeCell(index: index);
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    if (gameData.winner != null)
                      Text(
                        'Winner: ${gameData.winner}',
                        style: TextStyle(
                          fontSize: isLargeScreen ? 24.0 : 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      )
                    else if (gameData.isDraw)
                      const Text(
                        'It\'s a Draw!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )
                    else
                      Text(
                        'Current Player: ${gameData.currentPlayer}',
                        style: TextStyle(fontSize: isLargeScreen ? 24.0 : 20.0),
                      ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: isLargeScreen ? 32 : 24,
                          vertical: isLargeScreen ? 16 : 12,
                        ),
                        textStyle: TextStyle(fontSize: isLargeScreen ? 20 : 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Provider.of<TicTacToeData>(
                          context,
                          listen: false,
                        ).resetBoard();
                        _controllerCenter.stop();
                      },
                      child: const Text('Reset Game'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
