
import 'package:flutter/material.dart';
import 'package:mathspuzzle1/listpage.dart';
import 'package:mathspuzzle1/secondpagess.dart';

class three extends StatefulWidget {
  const three({Key? key}) : super(key: key);

  @override
  State<three> createState() => _threeState();
}

class _threeState extends State<three> {
  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;

    double stbarheight = MediaQuery.of(context).padding.top;
    double nvbarheight = MediaQuery.of(context).padding.bottom;
    double bodyheight = th - stbarheight - nvbarheight;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: bodyheight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              height: th * 0.10,
              width: tw * 1,
              margin: EdgeInsets.all(15),
              child: Center(
                child: Text(
                  "Select Puzzle",
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Container(
                height: th * 0.75,
                width: tw * 1,
                child: GridView.builder(
                    itemCount: mydata.status.length,
                    itemBuilder: (context, index) {
                      String lev = mydata.status[index];
                      int ass = mydata.preferences!.getInt("level") ?? 0;
                      if (lev == "clear") {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return secondpage(index);
                            },));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image:
                                    DecorationImage(image: AssetImage("image/tick.png"))),
                            child: Center(child: Text("${index+1}",style: TextStyle(fontSize: th * 0.025))),
                          ),
                        );
                      }
                      else if(lev=="skip")
                      {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                              return secondpage(index);
                            },));
                          },
                          child: Container(
                            child: Center(child: Text("${index+1}",style: TextStyle(fontSize: th * 0.025))),
                          ),
                        );
                      }
                      else
                      {
                        if(ass==index)
                        {
                          return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return secondpage(index);
                              },));
                            },
                            child: Container(
                              child: Center(child: Text("${index+1}",style: TextStyle(fontSize: th * 0.025),)),
                            ),
                          );
                        }
                        else
                        {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("image/lock.png")
                              )
                            ),
                          );
                        }
                      }
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
