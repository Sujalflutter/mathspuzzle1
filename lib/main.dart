
import 'package:flutter/material.dart';
import 'package:mathspuzzle1/listpage.dart';
import 'package:mathspuzzle1/secondpagess.dart';
import 'package:mathspuzzle1/threepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
  ));
}

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  int ?a;
  bool st=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shareprefs();
  }

  shareprefs()
  async {
    // Obtain shared preferences.
    mydata.preferences = await SharedPreferences.getInstance();

    a=mydata.preferences!.getInt("level")??0;
    setState(() {
      st=true;
    });


    for(int i=0;i<=75;i++)
    {
      String levelstatus="";
      levelstatus= mydata.preferences!.getString("status$i")??"pandding";
      mydata.status.add(levelstatus);
      print(mydata.status);
    }
  }

  @override
  Widget build(BuildContext context) {
    double th = MediaQuery.of(context).size.height;
    double tw = MediaQuery.of(context).size.width;

    // double appbarheight = kToolbarHeight;
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
              Row(
                children: [
                  Container(
                    height: th * 0.10,
                    width: tw * 1,
                    child: Center(
                        child: Text(
                          "Maths Puzzles",
                          style: TextStyle(color: Colors.blue, fontSize: th * 0.03),
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: th * 0.70,
                    width: tw * 1,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return secondpage(a!);
                                },));
                              },
                              child: Container(
                                margin: EdgeInsets.all(th * 0.010),
                                child: Text(
                                  "CONTINUE",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(color: Colors.white, fontSize: th * 0.05),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return three();
                                },));
                              },
                              child: Container(
                                margin: EdgeInsets.all(th * 0.010),
                                child: Text(
                                  "PUZZLES",
                                  textAlign: TextAlign.center,
                                  style:
                                  TextStyle(color: Colors.white, fontSize: th * 0.05),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(th * 0.010),
                              child: Text(
                                "BUY PRO",
                                textAlign: TextAlign.center,
                                style:
                                TextStyle(color: Colors.white, fontSize: th * 0.05),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/blackboard_main_menu.png"),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: th * 0.05,
                    width: tw * 0.10,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(th * 0.05),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey],
                            begin: Alignment.topCenter),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: IconButton(onPressed: () {

                    }, icon: Icon(Icons.share,color: Colors.black,size: th * 0.035)),
                  ),
                  Container(
                    height: th * 0.05,
                    width: tw * 0.10,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(th * 0.05),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white, Colors.grey],
                            begin: Alignment.topCenter),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    child: IconButton(onPressed: () {

                    }, icon: Icon(Icons.email_outlined,color: Colors.black,size: th * 0.035,)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
