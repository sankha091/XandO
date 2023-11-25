import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:xando/colorsPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xando/main_page.dart';

class flashScreen extends StatefulWidget {
  const flashScreen({super.key});

  @override
  State<flashScreen> createState() => _flashScreenState();
}

class _flashScreenState extends State<flashScreen> {

  var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: tertiary, letterSpacing: 3, fontSize: 25.5)
  );
  var playButtonStyle = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: backGround, fontSize: 25.5)
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 105,),
            Text(
              "CROSS",
              style: myNewFont,
            ),
            SizedBox(height: 7,),
            Text(
              "&",
              style: myNewFont,
            ),
            SizedBox(height: 7,),
            Text(
                "DOUGHNUTS",
                style: myNewFont,
            ),
            SizedBox(height: 70,),
            Container(
              child: AvatarGlow(
                endRadius: 170,
                glowColor: tertiary,
                duration: Duration(seconds: 1),
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: backGround,
                    child: Container(
                      child: Image.asset(
                        "assets/tictactoeicon.png",
                        color: tertiary,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    radius: 80,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage())
                  );
                },
                child: Container(
                  height: 75,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: tertiary),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: tertiary,
                  ),
                  child: Center(
                    child: Text(
                      "play",
                      style: playButtonStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
