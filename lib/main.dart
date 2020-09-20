import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kedai_kopi/DetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Menu'),
    );
  }
}

class Serve {
  final String category;
  final String title;
  final int price;
  final String image;
  final String tag;
  Serve({this.category, this.title, this.price, this.image, this.tag});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Serve> serving = [
    Serve(
      category: "minuman",
      title: "Espresso",
      price: 20000,
      image: 'assets/images/one.jpg',
      tag: '1',
    ),
    Serve(
      category: "minuman",
      title: "Machiato",
      price: 50000,
      image: 'assets/images/one.jpg',
      tag: '2',
    ),
    Serve(
      category: "minuman",
      title: "Capuccino",
      price: 30000,
      image: 'assets/images/one.jpg',
      tag: '3',
    ),
    Serve(
      category: "minuman",
      title: "Cupertino",
      price: 15000,
      image: 'assets/images/one.jpg',
      tag: '4',
    ),
    Serve(
      category: "minuman",
      title: "Juice",
      price: 20000,
      image: 'assets/images/one.jpg',
      tag: '5',
    ),
    Serve(
      category: "minuman",
      title: "Blass",
      price: 20000,
      image: 'assets/images/one.jpg',
      tag: '6',
    ),
    Serve(
      category: "minuman",
      title: "Bliss",
      price: 20000,
      image: 'assets/images/one.jpg',
      tag: '7',
    ),
    Serve(
      category: "minuman",
      title: "Hi",
      price: 20000,
      image: 'assets/images/one.jpg',
      tag: '8',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: null,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
            color: Colors.black,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: serving.length,
        padding: EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return Hero(
            tag: serving[index].tag,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailPage()));
              },
              child: Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      serving[index].image,
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[400],
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                serving[index].category,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                serving[index].title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Rp." + serving[index].price.toString() + ",-",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
