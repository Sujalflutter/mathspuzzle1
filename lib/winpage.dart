import 'package:flutter/material.dart';
import 'package:mathspuzzle1/main.dart';

// import 'package:mathspuzzle1/secondpage.dart';
import 'package:mathspuzzle1/secondpagess.dart';

class win extends StatefulWidget {
  int a;

  win(this.a);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;

    double stbarheight = MediaQuery.of(context).padding.top;
    double nvbarheight = MediaQuery.of(context).padding.bottom;
    double bodyhright = th - stbarheight - nvbarheight;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: bodyhright,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("image/background.jpg"))),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: th * 0.10,
                    width: tw * 1,
                    child: Center(
                        child: Text(
                      "PUZZLE COMPLETED",
                      style: TextStyle(color: Colors.blue, fontSize: th * 0.03),
                    )),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: th * 0.30,
                    width: tw * 0.50,
                    margin: EdgeInsets.only(left: tw * 0.25),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("image/trophy.png"))),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secondpage(widget.a);
                          },
                        ));
                      });
                    },
                    child: Container(
                      height: th * 0.05,
                      width: tw * 0.45,
                      margin: EdgeInsets.only(top: th * 0.05, left: tw * 0.27),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white, Colors.grey]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "CONTINUE",
                        style:
                            TextStyle(color: Colors.black, fontSize: th * 0.03),
                      )),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return first();
                          },
                        ));
                      });
                    },
                    child: Container(
                      height: th * 0.05,
                      width: tw * 0.45,
                      margin: EdgeInsets.only(top: th * 0.05, left: tw * 0.27),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white, Colors.grey]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "MAIN MENU",
                        style:
                            TextStyle(color: Colors.black, fontSize: th * 0.03),
                      )),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: th * 0.05,
                    width: tw * 0.45,
                    margin: EdgeInsets.only(top: th * 0.05, left: tw * 0.27),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "BUY PRO",
                      style:
                          TextStyle(color: Colors.black, fontSize: th * 0.03),
                    )),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: th * 0.10,
                    width: tw * 1,
                    margin: EdgeInsets.only(top: th * 0.002),
                    child: Center(
                        child: Text(
                      "SHARE THIS PUZZLE",
                      style: TextStyle(color: Colors.blue, fontSize: tw * 0.06),
                    )),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: th * 0.05,
                    width: tw * 0.10,
                    margin: EdgeInsets.only(left: tw * 0.45),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey],
                            begin: Alignment.topCenter),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share,
                            color: Colors.black, size: th * 0.035)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
