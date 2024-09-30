import 'dart:math';

class Player {
  static const X = 'X';
  static const O = 'O';
  static const empty = '';
  static List<int> playerx = [];
  static List<int> playero = [];
}

extension containall on List {
  bool containalll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    }
    return contains(x) && contains(y) && contains(z);
  }
}

class Game {
  void playgame(int index, String activeplayer) {
    if (activeplayer == 'X') {
      Player.playerx.add(index);
    } else
    {  Player.playero.add(index);}
  }

  String checxwinner() {
    String winner = '';

    if (Player.playerx.containalll(0, 1, 2) ||
        Player.playerx.containalll(3, 4, 5) ||
        Player.playerx.containalll(6, 7, 8) ||
        Player.playerx.containalll(0, 3, 6) ||
        Player.playerx.containalll(1, 4, 7) ||
        Player.playerx.containalll(2, 5, 8) ||
        Player.playerx.containalll(1, 4, 8) ||
        Player.playerx.containalll(2, 4, 6))
      winner = 'X';
    else if (Player.playero.containalll(0, 1, 2) ||
        Player.playero.containalll(3, 4, 5) ||
        Player.playero.containalll(6, 7, 8) ||
        Player.playero.containalll(0, 3, 6) ||
        Player.playero.containalll(0, 4, 8) ||
        Player.playero.containalll(1, 4, 7) ||
        Player.playero.containalll(2, 5, 8) ||
        Player.playero.containalll(2, 4, 6))
      winner = 'O';
    else
      winner = '';

    return winner;
  }

  Future autoplay(activeplayer) async {
    int index = 0;
    List<int> emptycell = [];
    for (var i = 0; i < 9; i++) {
      if (!(Player.playero.contains(i) || Player.playerx.contains(i)))
        emptycell.add(i);
    }

    if (Player.playero.containalll(0, 1) && emptycell.contains(2))
      index = 2;
    else if (Player.playero.containalll(3, 4) && emptycell.contains(5)) {
      index = 5;
    } else if (Player.playero.containalll(6, 7) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.playero.containalll(0, 3) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.playero.containalll(1, 4) && emptycell.contains(7)) {
      index = 7;
    } else if (Player.playero.containalll(2, 5) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.playero.containalll(1, 4) && emptycell.contains(8)) {
      index = 8;
    } else if (Player.playero.containalll(2, 4) && emptycell.contains(6)) {
      index = 6;
    } else {
      Random random = Random();
      int randomindex = random.nextInt(emptycell.length);
      index = emptycell[randomindex];
    }
    playgame(index, activeplayer);
  }
}
