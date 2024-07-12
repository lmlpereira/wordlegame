import 'package:flutter/material.dart';
import 'package:wordlegame/utils/game_logic.dart';
import 'package:wordlegame/widgets/gameboard.dart';

class Gamekeyboard extends StatefulWidget{
  Gamekeyboard(this.game,{super.key});

  WordleGame game;

  @override
  State<Gamekeyboard> createState() => _GamekeyboardState();
}


class _GamekeyboardState extends State<Gamekeyboard> {

  List row1 = "QWERTYUIOP".split("");
  List row2 = "ASDFGHJKL".split("");
  List row3 = ["DEL", "Z", "X", "C", "V", "B", "N", "M", "SUBMIT"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(WordleGame.game_message, style: TextStyle(color: Colors.white, ),),
        SizedBox(height: 20.0,),
        GameBoard(widget.game),
        SizedBox(height: 40.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row1.map((e){
            return InkWell(
              onTap: (){
                debugPrint(e);

                if(widget.game.letterid < 5){
                  
                  setState(() {
                    widget.game.insertWord(widget.game.letterid, Letter(e,0));
                  widget.game.letterid ++;
                  });
                }

              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300
                ),
                child: Text("${e}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row2.map((e){
            return InkWell(
              onTap: (){
                debugPrint(e);

                if(widget.game.letterid < 5){
                  
                  setState(() {
                    widget.game.insertWord(widget.game.letterid, Letter(e,0));
                  widget.game.letterid ++;
                  });
                }

              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300
                ),
                child: Text("${e}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: row3.map((e){
            return InkWell(
              onTap: (){
                debugPrint(e);

                if(e == "DEL"){
                  if(widget.game.letterid > 0){
                    setState(() {
                      widget.game.insertWord(widget.game.letterid -1, Letter("",0));
                      widget.game.letterid --;

                    });
                  }
                }
                else if (e == "SUBMIT"){
                  if(widget.game.letterid >= 5){
                    String guess = widget.game.wordleBoard[widget.game.rowid].map((e) => e.letter).join();
                    
                    if(widget.game.checkWordExist(guess)){
                      if(guess == WordleGame.game_guess){

                        setState(() {
                          WordleGame.game_message = "Congratulations, You're the best!";
                          widget.game.wordleBoard[widget.game.rowid].forEach((element){element.code = 1;});

                        });

                      }else{
                        int listLength = guess.length;
                        for (int i = 0; i<listLength; i++){
                          String char = guess[i];
                          if(WordleGame.game_guess.contains(char)){
                            if(WordleGame.game_guess[i] == char){
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowid][i].code = 1;
                              });
                            }else{
                              setState(() {
                                widget.game.wordleBoard[widget.game.rowid][i].code = 2;
                              });
                            }
                          }
                        }
                        widget.game.rowid ++;
                        widget.game.letterid = 0;
                      } 
                    }else{
                      WordleGame.game_message = "The word does not exist, try again";
                    }
                    
                    

                  }

                }else{
                  if(widget.game.letterid < 5){
                    
                    setState(() {
                      widget.game.insertWord(widget.game.letterid, Letter(e,0));
                    widget.game.letterid ++;
                    });
                  }

                }

                

              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.grey.shade300
                ),
                child: Text("${e}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}