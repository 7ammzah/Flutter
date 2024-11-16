import 'dart:math';

class Game {
  void playGame(int index, String player) {
    player == 'X' ? Player.playerX.add(index) : Player.playerO.add(index);
  }

  String Winner() {
    String winner = '';
    if (Player.playerX.contain(0, 1, 2) ||
        Player.playerX.contain(3, 4, 5) ||
        Player.playerX.contain(6, 7, 8) ||
        Player.playerX.contain(0, 3, 6) ||
         Player.playerX.contain(1, 4, 7) ||
          Player.playerX.contain(2, 5, 8)||
        Player.playerX.contain(0, 4, 8) ||
        Player.playerX.contain(2, 4, 6))
      winner = 'X';
    else if (Player.playerO.contain(0, 1, 2) ||
        Player.playerO.contain(3, 4, 5) ||
        Player.playerO.contain(6, 7, 8) ||
        Player.playerO.contain(0, 3, 6) ||
         Player.playerO.contain(1, 4, 7) ||
          Player.playerO.contain(2, 5, 8)||
        Player.playerO.contain(0, 4, 8) ||
        Player.playerO.contain(2, 4, 6)) winner = 'O';
    return winner;
  }

  List emptyCells = [];
  Future<void> autoPlay(String player) async {
    int i = 0;
    emptyCells = [];
    for (int i = 0; i < 9; i++) {
      !(Player.playerX.contains(i) || Player.playerO.contains(i))
          ? emptyCells.add(i)
          : null;
    }
    if (Player.playerX.contain(0, 1) && emptyCells.contains(2)) {
      i = 2;
    } else if (Player.playerX.contain(0, 2) && emptyCells.contains(1)) {
      i = 1;
    } else if (Player.playerX.contain(1, 2) && emptyCells.contains(0)) {
      i = 0;
    } else if (Player.playerX.contain(3, 4) && emptyCells.contains(5)) {
      i = 5;
    } else if (Player.playerX.contain(3, 5) && emptyCells.contains(4)) {
      i = 4;
    } else if (Player.playerX.contain(4, 5) && emptyCells.contains(3)) {
      i = 3;
    } else if (Player.playerX.contain(6, 7) && emptyCells.contains(8)) {
      i = 8;
    } else if (Player.playerX.contain(6, 8) && emptyCells.contains(7)) {
      i = 7;
    } else if (Player.playerX.contain(7, 8) && emptyCells.contains(6)) {
      i = 6;
    } else if (Player.playerX.contain(0, 4) && emptyCells.contains(8)) {
      i = 8;
    } else if (Player.playerX.contain(0, 8) && emptyCells.contains(4)) {
      i = 4;
    } else if (Player.playerX.contain(4, 8) && emptyCells.contains(0)) {
      i = 0;
    } else if (Player.playerX.contain(2, 4) && emptyCells.contains(6)) {
      i = 6;
    } else if (Player.playerX.contain(2, 6) && emptyCells.contains(4)) {
      i = 4;
    } else if (Player.playerX.contain(4, 6) && emptyCells.contains(2)) {
      i = 2;
    } else {
      Random random = Random();
      i = emptyCells[random.nextInt(emptyCells.length)];
    }
    playGame(i, player);
  }
}

extension checkWinner on List {
  bool contain(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Player {
  static List playerX = [];
  static List playerO = [];
}
