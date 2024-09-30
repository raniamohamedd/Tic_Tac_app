import 'package:flutter/material.dart';
import 'package:flutter_application_9/game_logic.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String activeplayer = 'O';
  bool gameover = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool isswitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.blue,
              value: isswitched,
              onChanged: (bool newv) {
                setState(() {
                  isswitched = newv;
                });
              },
              title: const Text(
                'Turn on/off two players',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'it\'s $activeplayer turn'.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 52,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1,
              padding: const EdgeInsets.all(16),
              children: List.generate(
                  9,
                  (i) => InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: gameover ? null : () => ontap(i),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).shadowColor,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                              child: Text(
                            Player.playerx.contains(i)
                                ? 'X'
                                : Player.playero.contains(i)
                                    ? 'O'
                                    : '',
                            style: TextStyle(
                                fontSize: 52,
                                color: Player.playerx.contains(i)
                                    ? Colors.blue
                                    : Colors.pink),
                          )),
                        ),
                      )),
            )),
            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  Player.playerx = [];
                  Player.playero = [];
                  activeplayer = 'O';
                  gameover = false;
                  turn = 0;
                  result = '';
                });
              },
              icon: const Icon(
                Icons.replay,
              ),
              label: const Text(
                'Repeat the game',
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).splashColor,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  ontap(int i) async {
    if ((Player.playerx.isEmpty || !Player.playerx.contains(i)) &&
        (Player.playero.isEmpty || !Player.playero.contains(i))) {
      game.playgame(i, activeplayer);
      update();
      if (!isswitched && !gameover && turn != 9) {
        await game.autoplay(activeplayer);
        update();
      }
    }
  }

  void update() {
    setState(() {
      activeplayer = activeplayer == 'X' ? 'O' : 'X';
      turn++;

      String winner = game.checxwinner();

      if (winner != '') {
        result = '$winner is the winner';
        gameover = true;
      } else if (!gameover && turn == 9) {
        result = 'its draw!';
      }
    });
  }
}
