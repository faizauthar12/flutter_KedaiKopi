import 'package:flutter/material.dart';
import 'main.dart';

import 'Animation/FadeAnimation.dart';

class DetailPage extends StatefulWidget {
  final Serve serve;
  DetailPage({Key key, this.serve}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // isSelected boolean for penyajian, Panas as the default selected button
  List<bool> isSelected;
  @override
  void initState() {
    super.initState();
    isSelected = [
      true,
      false,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.serve.tag,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.serve.image), fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 10,
                    offset: Offset(0, 10),
                  ),
                ]),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: FadeAnimation(
                    1,
                    Container(
                      padding: EdgeInsets.only(left: 35, bottom: 20, right: 35),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            widget.serve.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rp." + widget.serve.price.toString() + ",-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Penyajian",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Spacer(),
                              ToggleButtons(
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    margin: EdgeInsets.only(right: 5, left: 5),
                                    child: Center(
                                      child: Text(
                                        "Panas",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    margin: EdgeInsets.only(right: 5, left: 5),
                                    child: Center(
                                      child: Text(
                                        "Dingin",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                                onPressed: (int index) {
                                  setState(() {
                                    // create OR logic gates
                                    for (int buttonIndex = 0;
                                        buttonIndex < isSelected.length;
                                        buttonIndex++) {
                                      if (buttonIndex == index) {
                                        isSelected[buttonIndex] = true;
                                      } else {
                                        isSelected[buttonIndex] = false;
                                      }
                                    }
                                  });
                                },
                                // cosmetic for toggle button
                                borderRadius: BorderRadius.circular(10),
                                renderBorder: false,
                                fillColor: Colors.white,
                                color: Colors.white,
                                selectedColor: Colors.black,
                                selectedBorderColor: Colors.white,
                                isSelected: isSelected,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          RaisedButton(
                            onPressed: () {
                              // dialog to get receipt
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Rincian"),
                                  content: Text("Kamu yakin ingin membeli " +
                                      widget.serve.title +
                                      " dengan penyajian pilihan penyajian yang kamu inginkan?"),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes")),
                                  ],
                                ),
                                barrierDismissible: true,
                              );
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Pesan Sekarang",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
