import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //TO add Icon

  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(
    Icons.edit,
    size: 80,
  );

  bool isCrossed = true;
  String message = '';
  List<String> gameState = [''];

  //Initialize nine empty boxes
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

  //Play Game
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCrossed) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCrossed = !isCrossed;
        checkWin();
      });
    }
  }

  //reset game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = '';
    });
  }

  //To get an icon
  getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
      case ('circle'):
        return circle;
    }
  }

  //to Checkwin
  checkWin() {
    if((gameState[0] != "empty")&&
    (gameState[0]==gameState[1])&&
    (gameState[1]==gameState[2])){
      setState(() {
        this.message = this.gameState[0] + '  wins';
      });
    }else if((gameState[3] != "empty")&&
    (gameState[3]==gameState[4])&&
    (gameState[4]==gameState[5])){
      setState(() {
        this.message = this.gameState[0] + '  wins';
      });
    }else if((gameState[6] != "empty")&&
    (gameState[6]==gameState[7])&&
    (gameState[7]==gameState[8])){
      setState(() {
        this.message = this.gameState[6] + '  wins';
      });
    }else if((gameState[0] != "empty")&&
    (gameState[0]==gameState[3])&&
    (gameState[3]==gameState[6])){
      setState(() {
        this.message = this.gameState[0] + '  wins';
      });
    }else if((gameState[1] != "empty")&&
    (gameState[1]==gameState[4])&&
    (gameState[4]==gameState[7])){
      setState(() {
        this.message = this.gameState[1] + '  wins';
      });
    }else if((gameState[2] != "empty")&&
    (gameState[2]==gameState[5])&&
    (gameState[5]==gameState[8])){
      setState(() {
        this.message = this.gameState[8] + '  wins';
      });
    }else if((gameState[0] != "empty")&&
    (gameState[0]==gameState[4])&&
    (gameState[4]==gameState[8])){
      setState(() {
        this.message = this.gameState[0] + '  wins';
      });
    }else if((gameState[2] != "empty")&&
    (gameState[2]==gameState[4])&&
    (gameState[4]==gameState[6])){
      setState(() {
        this.message = this.gameState[2] + 'win';
      });
    }else if(!gameState.contains("empty")){
      setState(() {
        message = 'Game Draw';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: gameState.length,
                  itemBuilder: (context, i) => SizedBox(
                        width: 100,
                        height: 100,
                        child: MaterialButton(
                          onPressed: () {
                            this.playGame(i);
                          },
                          child: getIcon(this.gameState[i]),
                        ),
                      ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55, color: Colors.greenAccent),),
          ),

          Container(
            child: MaterialButton(
              onPressed: () => resetGame(),
              color: Colors.blue,
              child: Text(
                "Reset Game",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
