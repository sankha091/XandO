import 'package:flutter/material.dart';
import 'package:xando/colorsPage.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String displayXO1 = "";
  bool turn = true;
  List<String> displayXO = ["","","","","","","","",""];
  int _oScore = 0;
  int _xScore = 0;
  int _filledBoxes = 0;
  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: tertiary, letterSpacing: 3, fontSize: 16.5)
  );
  static var _xoStyle = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: tertiary, letterSpacing: 3, fontSize: 18.5)
  );
  static var myNewFont2 = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: tertiary, letterSpacing: 3,fontSize: 15)
  );
  String _underLineX = "";
  String _underLineO = "_______";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Column(
        children: [
          Expanded(
            child:Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          Text(
                            "Player X",
                            style: myNewFont,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            _xScore.toString(),
                            style: myNewFont,
                          ),
                          Text(
                            _underLineX,
                            style: myNewFont,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30,),
                          Text(
                            "Player O",
                            style: myNewFont,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            _oScore.toString(),
                            style: myNewFont,
                          ),
                          Text(
                            _underLineO,
                            style: myNewFont,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          SizedBox(height: 80,),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                itemCount: 9,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: tertiary,
                        )
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: _xoStyle,
                        ),
                      ),
                    ),
                  );
                  }
                  ),
            ),
          ),
          Expanded(
              child:Container(

              )
          ),
        ],
      ),
    );
  }

  //--------------Function called when a container is tapped------------------//
  void tapped(int index){
    setState(() {
      if (turn && displayXO[index] == ""){
        displayXO[index] = "O";
        _filledBoxes++;
        turn = false;
        _underLineX = "_______";
        _underLineO = "";
      }
      else if(!turn && displayXO[index] == ""){
        displayXO[index] = "X";
        _filledBoxes++;
        turn = true;
        _underLineX = "";
        _underLineO = "_______";
      }
      _checkWinner();
    });
  }

  //--------------Function to check winner------------------//
  void _checkWinner(){
    if(displayXO[0] == displayXO[1] && displayXO[1] == displayXO[2] && displayXO[0] != ""){
      if(displayXO[0] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[3] == displayXO[4] && displayXO[4] == displayXO[5] && displayXO[3] != ""){
      if(displayXO[3] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[6] == displayXO[7] && displayXO[7] == displayXO[8] && displayXO[6] != ""){
      if(displayXO[6] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[0] == displayXO[3] && displayXO[3] == displayXO[6] && displayXO[0] != ""){
      if(displayXO[0] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[1] == displayXO[4] && displayXO[4] == displayXO[7] && displayXO[1] != ""){
      if(displayXO[1] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[2] == displayXO[5] && displayXO[5] == displayXO[8] && displayXO[2] != ""){
      if(displayXO[2] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[0] == displayXO[4] && displayXO[4] == displayXO[8]&& displayXO[0] != ""){
      if(displayXO[0] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(displayXO[2] == displayXO[4] && displayXO[4] == displayXO[6] && displayXO[2] != ""){
      if(displayXO[2] == 'X') _showWinDialog('X');
      else _showWinDialog('O');
    }
    else if(_filledBoxes == 9){
      _showDrawDialog();
    }
  }

  //--------------Function to show winner dialog box------------------//
  void _showWinDialog(String Winner){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text(
              "Winner is: "+Winner,
              style: myNewFont,
            ),
            actions: [
              MaterialButton(
                onPressed:(){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Play Again",
                  style: myNewFont,
                ),
                color: secondary,
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: Text(
                  "Exit",
                  style: myNewFont,
                ),
                color: secondary,
              )
            ],
          );
        }
    );
    if (Winner == 'X'){
      setState(() {
        _xScore++;
      });
    }
    else if(Winner == 'O'){
      setState(() {
        _oScore++;
      });
    }
  }

  //--------------Function to show draw dialog box------------------//
  void _showDrawDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder:(BuildContext context){
          return AlertDialog(
            title: Text(
              "DRAW!!",
              style: myNewFont,
            ),
            actions: [
              MaterialButton(
                onPressed:(){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Play Again",
                  style: myNewFont,
                ),
                color: secondary,
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                child: Text(
                  "Exit",
                  style: myNewFont,
                ),
                color: secondary,
              )
            ],
          );
        }
    );
  }

  //--------------Function to clear the board after every game------------------//
  void _clearBoard() {
    _filledBoxes = 0;
    for (int i = 0 ; i < 9 ; i++){
      displayXO[i] = "";
      setState(() {
      });
    }
  }
}
