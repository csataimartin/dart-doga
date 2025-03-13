import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  late List<String> board;
  late String aktualisJatekos;
  late String nyertes;
  late bool dontetlen;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    board = List.generate(9, (_) => '');
    aktualisJatekos = 'X';
    nyertes = '';
    dontetlen = false;
  }

  void _handleTap(int index) {
    if (board[index] != '' || nyertes != '') return;

    setState(() {
      board[index] = aktualisJatekos;
      if (_checknyertes(aktualisJatekos)) {
        nyertes = aktualisJatekos;
      } else if (_checkDraw()) {
        dontetlen = true;
      } else {
        aktualisJatekos = aktualisJatekos == 'X' ? 'O' : 'X';
      }
    });
  }

  bool _checknyertes(String player) {
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] == player && board[i * 3 + 1] == player && board[i * 3 + 2] == player) {
        return true;
      }
      if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
        return true;
      }
    }
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }
    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }
    return false;
  }

  bool _checkDraw() {
    return board.every((cell) => cell != '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          nyertes != ''
              ? Text('Nyertes: $nyertes', style: const TextStyle(fontSize: 30))
              : dontetlen
                  ? const Text('Döntetlen', style: TextStyle(fontSize: 30))
                  : Text('Aktuális Játékos: $aktualisJatekos', style: const TextStyle(fontSize: 30)),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GridTile(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: MaterialButton(
                      onPressed: () => _handleTap(index),
                      child: Text(board[index], style: const TextStyle(fontSize: 40)),
                    ),
                  ),
                );
              },
            ),
          ),
          MaterialButton(
            child: const Text('Restart Game'),
            onPressed: () {
              setState(() {
                _initializeGame();
              });
            },
          ),
        ],
      ),
    );
  }
}