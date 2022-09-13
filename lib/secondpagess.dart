import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathspuzzle1/listpage.dart';

import 'package:mathspuzzle1/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class secondpage extends StatefulWidget {
  int a;
  secondpage(this.a);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  String no = "";

  List ans = [
    "0",
    "10",
    "25",
    "6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    "2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
    "50",
    "34",
    "6",
    "41",
    "16",
    "126",
    "82",
    "14",
    "7",
    "132",
    "34",
    "48",
    "42",
    "288",
    "45",
    "4",
    "111",
    "47",
    "27",
    "87",
    "22",
    "253",
    "12",
    "38",
    "178",
    "1",
    "6",
    "10",
    "2",
    "20",
    "7",
    "511",
    "143547",
    "84",
    "11",
    "27",
    "3",
    "5",
    "39",
    "31",
    "10",
    "130",
    "22",
    "3",
    "14",
    "42",
    "164045",
    "11",
    "481",
    "86",
    "84",
    "13",
    "8"
  ];
  int? a;
  SharedPreferences? prefs;
  bool st = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharepreferance();
  }

  sharepreferance() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
    a = prefs!.getInt("cnt") ?? 1;
    print("=============$a");
    setState(() {
      st = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totlewidht = MediaQuery.of(context).size.width;
    double totleheight = MediaQuery.of(context).size.height;

    // double appbarheoght = kToolbarHeight;
    double stbarheight = MediaQuery.of(context).padding.top;
    double nvbarheight = MediaQuery.of(context).padding.bottom;
    double bodyheight = totleheight - stbarheight - nvbarheight;

    return st
        ? Scaffold(
      body: SafeArea(
          child: Container(
            height: bodyheight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("image/gameplaybackground.jpg"))),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          mydata.status[widget.a]=="skip";
                          print(mydata.status);
                          mydata.preferences!.setString("status${widget.a}", "skip");
                          setState(() {
                            widget.a++;
                          });
                          // print(widget.a);
                          mydata.preferences!.setInt("level", widget.a);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return secondpage(widget.a);
                          },));
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: totleheight * 0.010,
                            bottom: totleheight * 0.010),
                        height: totleheight * 0.065,
                        width: totlewidht * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/skip.png"))),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Puzzle ${widget.a+1}",
                        style: TextStyle(fontSize: totleheight * 0.025),
                      ),
                      height: totleheight * 0.10,
                      width: totlewidht * 0.40,
                      margin: EdgeInsets.only(
                          top: totleheight * 0.020,
                          bottom: totleheight * 0.020,
                          left: totlewidht * 0.050,
                          right: totlewidht * 0.050),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/level_board.png"))),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Fluttertoast.showToast(
                              msg: "${ans[a!]}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: totleheight * 0.010,
                            bottom: totleheight * 0.010),
                        height: totleheight * 0.065,
                        width: totlewidht * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/hint.png"))),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: totleheight * 0.45,
                      width: totlewidht * 0.80,
                      margin: EdgeInsets.only(
                          top: totleheight * 0.030,
                          left: totlewidht * 0.10,
                          bottom: totleheight * 0.080),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("image/p${widget.a+1}.png"))),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: totleheight * 0.12,
                      width: totlewidht * 1,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: totleheight * 0.040,
                                width: totlewidht * 0.45,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  no,
                                  style: TextStyle(
                                      fontSize: totleheight * 0.025),
                                ),
                                margin: EdgeInsets.all(totleheight * 0.010),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    no = no.substring(0, no.length - 1);
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.all(totleheight * 0.007),
                                  height: totleheight * 0.050,
                                  width: totlewidht * 0.12,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                          AssetImage("image/delete.png"))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (no != "") {
                                      if (no == ans[a!]) {
                                        String levelstatus = "" ;
                                        levelstatus= mydata.status[widget.a];
                                        if(levelstatus=="clear")
                                        {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return win(widget.a);
                                                },
                                              ));
                                        }
                                    else if(levelstatus=="skip")
                                        {
                                          mydata.status[widget.a]="clear";
                                          mydata.preferences!.setString("status${widget.a}", "clear");
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return win(widget.a);
                                                },
                                              ));
                                        }
                                    else
                                      {
                                        mydata.status[widget.a]="clear";
                                        mydata.preferences!.setString("status${widget.a}", "clear");
                                        setState(() {
                                          widget.a++;
                                        });
                                        mydata.preferences!.setInt("level", widget.a);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return win(widget.a);
                                              },
                                            ));
                                      }

                                      }
                                      else
                                      {
                                        Fluttertoast.showToast(
                                            msg: "Wrong",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0
                                        );
                                      }
                                    }
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(totleheight * 0.007),
                                  height: totleheight * 0.050,
                                  width: totlewidht * 0.30,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      border: Border.all(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: totleheight * 0.023,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  number("1");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("2");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("3");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("4");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("5");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("6");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "6",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("7");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "7",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("8");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "8",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("9");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "9",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  number("0");
                                },
                                child: Container(
                                  height: totleheight * 0.045,
                                  width: totlewidht * 0.09,
                                  margin: EdgeInsets.only(
                                      left: totlewidht * 0.009,
                                      top: totleheight * 0.004),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      border:
                                      Border.all(color: Colors.white38),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: totleheight * 0.023),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    )
        : Center(child: CircularProgressIndicator());
  }

  void number(String s) {
    setState(() {
      no = no + s;
    });
  }
}