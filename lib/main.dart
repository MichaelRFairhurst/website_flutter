import 'package:flutter/material.dart';
import 'package:scroll_animate/scroll_animate.dart';

void main() {
  runApp(const MikeSite());
}

class MikeSite extends StatelessWidget {
  const MikeSite({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mike's Website",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFreezeAnimation<double>(
            duration: 500,
            tween: Tween(begin: 120.0, end: 80),
            builder: (context, fontSize) {
              return Container(
                alignment: Alignment.center,
                height: screenSize.height,
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      "Mike Fairhurst",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontFamily: 'Playfair',
                      ),
                    ),
                    SizedBox(height: fontSize),
                    Text(
                      "Independent Software Engineer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize - 40,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              );
            },
          ),
          SliverFreezeAnimation<double>(
            duration: 500,
            tween: Tween(begin: screenSize.width, end: screenSize.width / 2 - 50),
            builder: (context, rightPaneOffset) {
              return Container(
                height: screenSize.height,
                padding: EdgeInsets.all(50),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        "assets/fluttercodeimg.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Text(
                        "[WORK]",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: rightPaneOffset,
                      width: screenSize.width / 2 - 50,
                      child: Container(
                        color: Colors.black,
                        padding: EdgeInsets.all(50),
                        child: FittedBox(
                          child: Text("""
flutter

dart

web

programming language design

consulting / development / deployment
""",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Ubuntu',
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SliverParallax(
            center: ParallaxScrollCenter.relativePx(400),
            mainAxisFactor: 0.8,
            offset: Offset(0, 130),
            child: Container(
              width: screenSize.width,
              alignment: Alignment.center,
              child: Text(
                "[ADVENTURE]",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          ),
          SliverFreezeAnimation<double>(
            tween: Tween(begin: 0.0, end: 120.0),
            duration: 400,
            builder: (context, borderThickness) {
              return Container(
                height: screenSize.height,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: borderThickness,
                    color: borderThickness == 0 ? Colors.transparent : Colors.black,
                  ),
                ),
              );
            },
          ),
          SliverFreezeAnimation<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: 400,
            builder: (context, opacity) {
              return Container(
                height: screenSize.height,
                width: screenSize.width,
                color: Colors.black,
                padding: EdgeInsets.only(top:50),
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: opacity,
                  child: Text(
                    "[PORTFOLIO]",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
              );
            },
          ),
          SliverParallax(
            center: ParallaxScrollCenter.absolutePx(0.0),
            mainAxisFactor: 0.1,
            child: Container(
              height: screenSize.height * 1.5,
              width: screenSize.width,
              child: Image.asset(
                "assets/indiancreek1.jpeg",
                fit: BoxFit.cover
              ),
            ),
          ),
        ],
      ),
    );
  }
}
