import 'package:flutter/material.dart';
import 'package:tic_tac_game/game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Game game = Game();
  String player = 'X';
  bool gameOver = false;
  String resault = '';
  bool SwitchValue = false;
  int turn = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'XO Game',
          style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF00061a),
      ),
      backgroundColor: const Color(0xFF00061a),
      drawer: Drawer(
        backgroundColor: const Color(0xFF00061a),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: SwitchListTile.adaptive(
            title: const Text(
              'Turn ON/OFF Tow player',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            value: SwitchValue,
            onChanged: (bool onChangedValue) {
              setState(() {
                SwitchValue = onChangedValue;
              });
            },
            activeColor: Colors.greenAccent,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                turn < 9 ? 'It\'s $player turn' : '',
                style: const TextStyle(fontSize: 32, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: GridView.count(
                  padding: EdgeInsets.all(10),
                  mainAxisSpacing: 8.0,
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.0,
                  children: List.generate(
                      9,
                      (index) => InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: (() {
                              gameOver ? null : _onTapFuction(index);
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.deepPurpleAccent,
                              ),
                              child: Center(
                                child: Text(
                                  Player.playerX.contains(index)
                                      ? 'X'
                                      : Player.playerO.contains(index)
                                          ? 'O'
                                          : '',
                                  style: TextStyle(
                                      fontSize: 55,
                                      color: Player.playerX.contains(index)
                                          ? Colors.blueAccent
                                          : Colors.pinkAccent),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              Text(
                resault == 'X' || resault == 'O'
                    ? '$resault is The Winner!'
                    : turn == 9
                        ? 'It\'s Draw ^_^'
                        : '',
                style: const TextStyle(fontSize: 32, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    turn = 0;
                    Player.playerX = [];
                    Player.playerO = [];
                    player = 'X';
                    gameOver = false;
                    resault = '';
                  });
                },
                icon: const Icon(Icons.replay),
                label: const Text('Restart the game'),
                //child: Text('Restart the game'),
                style: ButtonStyle(
                  // alignment: Alignment.bottomCenter,
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onTapFuction(int index) async {
    !Player.playerX.contains(index) && !Player.playerO.contains(index)
        ? game.playGame(index, player)
        : null;
    setState(() {
      turn++;
      player == 'X' ? player = 'O' : player = 'X';
      if (game.Winner() == 'X' || game.Winner() == 'O') {
        setState(() {
          resault = game.Winner();
          gameOver = true;
        });
      }
    });

    if (!SwitchValue && !gameOver && turn < 9) {
      await game.autoPlay(player);
      if (game.Winner() == 'X' || game.Winner() == 'O') {
        setState(() {
          resault = game.Winner();
          gameOver = true;
        });
      }
      setState(() {
        player == 'X' ? player = 'O' : player = 'X';
        turn++;
      });
    }
    if (turn == 9) {
      gameOver = true;
    }
  }
}
