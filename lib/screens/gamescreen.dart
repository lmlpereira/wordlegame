import 'package:flutter/material.dart';
import 'package:wordlegame/utils/game_logic.dart';
import 'package:wordlegame/widgets/gamekeyboard.dart';

class GameScreen extends StatefulWidget{
  const GameScreen({super.key});


  @override
  State<GameScreen> createState() => _GameScreenState();

}

class _GameScreenState extends State<GameScreen> {

  WordleGame _game = WordleGame();
  
  @override
  void initState() {
    super.initState();

    WordleGame.initGame();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Wordle", style: TextStyle(color: Colors.white, fontSize: 36.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 20.0,),
          Gamekeyboard(_game),



        ],
      ),
    );
  }


}