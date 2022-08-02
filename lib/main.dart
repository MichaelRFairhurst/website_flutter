import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scroll_animate/scroll_animate.dart';
import 'package:video_player/video_player.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  late final VideoPlayerController quicksortVideoController;
  late final VideoPlayerController scrollAnimateVideoController;
  late final VideoPlayerController climateForestsVideoController;
  late final Future quicksortVideoFuture;
  late final Future scrollAnimateVideoFuture;
  late final Future climateForestsVideoFuture;

  @override
  void initState() {
    super.initState();
    
    quicksortVideoController = VideoPlayerController.asset("assets/quicksort.mp4");
    quicksortVideoFuture = quicksortVideoController.initialize();
    scrollAnimateVideoController = VideoPlayerController.asset("assets/scroll_animate.mp4");
    scrollAnimateVideoFuture = scrollAnimateVideoController.initialize();
    climateForestsVideoController = VideoPlayerController.asset("assets/climate_forests_map.mp4");
    climateForestsVideoFuture = climateForestsVideoController.initialize();
  }

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    bool isLandscape = screenSize.width > screenSize.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFreezeAnimation<double>(
            duration: 500,
            tween: Tween(begin: 120.0, end: 80),
            builder: (context, fontSize) {
              return AspectRatio(
                aspectRatio: max(screenSize.width / screenSize.height, 1),
                child: FittedBox(
                  child: Container(
                    width: max(1200, screenSize.width),
                    height: screenSize.height,
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        SelectableText(
                          "Mike Fairhurst",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontFamily: 'Playfair',
                          ),
                        ),
                        SizedBox(height: fontSize),
                        SelectableText(
                          "Independent Software Engineer",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize - 40,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: fontSize),
                        SelectableText(
                          "Portland, OR",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: (fontSize - 15) / 2,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          SliverFreezeAnimation<double>(
            duration: 500,
            tween: 
              isLandscape
                ? Tween(begin: screenSize.width, end: screenSize.width / 2 - 50)
                : Tween(begin: screenSize.height, end: screenSize.height / 2 - 12),
            builder: (context, paneOffset) {
              return Container(
                height: screenSize.height,
                padding: EdgeInsets.all(isLandscape ? 50 : 12),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Opacity(
                        opacity: isLandscape ? 1.0 : 0.8,
                        child: Image.asset(
                          "assets/fluttercodeimg.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: SelectableText(
                        "[WORK]",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ),
                    Positioned(
                      top: isLandscape ? 0 : paneOffset,
                      bottom: isLandscape ? 0 : null,
                      left: isLandscape ? paneOffset : 0,
                      right: isLandscape ? null : 0,
                      width: isLandscape ? screenSize.width / 2 - 50 : null,
                      height: isLandscape ? null : screenSize.height / 2 - 12,
                      child: Container(
                        color: Colors.black,
                        padding: EdgeInsets.all(50),
                        child: FittedBox(
                          child: SelectableText("""
flutter

dart

web

compilers

programming language design

consulting / development / deployment
""",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Rubik',
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          resumeItem("Facebook (2020-2021)", "Senior Software Engineer", screenSize),
          resumeItem("Google (2016-2020)", "Software Engineer, Official Dart/Flutter Analyzer", screenSize),
          resumeItem("... (2011-2016)", "Sprinklr, Postano, Manifest Web Design, Cinder, MediPro Direct", screenSize),
          SliverParallax(
            center: ParallaxScrollCenter.relativePx(400),
            mainAxisFactor: 0.8,
            offset: Offset(0, 130),
            child: Container(
              width: screenSize.width,
              padding: EdgeInsets.symmetric(horizontal: screenSize.width / 8),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                child: SelectableText(
                  "[ADVENTURE]",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontFamily: 'Rubik',
                  ),
                ),
              ),
            ),
          ),
          SliverFreezeAnimation<double>(
            tween: Tween(begin: 0.0, end: min(screenSize.width / 8, 120)),
            duration: 400,
            builder: (context, borderThickness) {
              return Container(
                height: max(screenSize.height, 700),
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
          ...makeZipper(
            [
              "Big rocks",
              "Small rocks",
              "Bolted rocks",
              "Cracked rocks",
              "Snowy stuff",
              "Icy stuff",
              "Van stuff",
            ],
            screenSize,
            isLandscape,
          ),
          SliverEntranceAnimation<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 1),
            curve: Curves.ease,
            entrancePolicy: EntrancePolicy.scrollBeyondBottomEdge(),
            builder: (context, opacity, _) {
              return SliverToBoxAdapter(child: Container(
                color: Colors.black,
                padding: EdgeInsets.symmetric(vertical:50),
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: opacity,
                  child: SelectableText(
                    "[PORTFOLIO]",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ),
              ));
            },
          ),
          SliverEnterExitCallback(
            onEnter: () {
              setState(() {
                if (quicksortVideoController.value.isInitialized) {
                  quicksortVideoController.play();
                }
                if (scrollAnimateVideoController.value.isInitialized) {
                  scrollAnimateVideoController.play();
                }
                if (climateForestsVideoController.value.isInitialized) {
                  climateForestsVideoController.play();
                }
              });
            },
            onExit: () {
              setState(() {
                quicksortVideoController.pause();
                scrollAnimateVideoController.pause();
                climateForestsVideoController.pause();
              });
            },
            child: SliverToBoxAdapter(
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.all(50),
                height: isLandscape ? screenSize.height - 150 : screenSize.height * 2,
                child: Flex(
                  direction: isLandscape ? Axis.horizontal : Axis.vertical,
                  children: <Widget>[
                    Flexible(
                      flex: isLandscape ? 2 : 1,
                      child: FutureBuilder(
                        future: quicksortVideoFuture,
                        builder: (context, snapshot) {
	                  if (snapshot.connectionState == ConnectionState.done) {
                            quicksortVideoController.setLooping(true);
                            quicksortVideoController.setVolume(0);
             
                            return AspectRatio(
                              aspectRatio: quicksortVideoController.value.aspectRatio,
                              child: VideoPlayer(quicksortVideoController),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 50, height: 100),
                    Flexible(
                      flex: isLandscape ? 1 : 2,
                      child: FutureBuilder(
                        future: scrollAnimateVideoFuture,
                        builder: (context, snapshot) {
	                  if (snapshot.connectionState == ConnectionState.done) {
                            scrollAnimateVideoController.setLooping(true);
                            scrollAnimateVideoController.setVolume(0);
             
                            return AspectRatio(
                              aspectRatio: scrollAnimateVideoController.value.aspectRatio,
                              child: VideoPlayer(scrollAnimateVideoController),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 50, height: 100),
                    Flexible(
                      flex: isLandscape ? 2 : 1,
                      child: FutureBuilder(
                        future: climateForestsVideoFuture,
                        builder: (context, snapshot) {
	                  if (snapshot.connectionState == ConnectionState.done) {
                            climateForestsVideoController.setLooping(true);
                            climateForestsVideoController.setVolume(0);
             
                            return AspectRatio(
                              aspectRatio: climateForestsVideoController.value.aspectRatio,
                              child: VideoPlayer(climateForestsVideoController),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 50, height: 100),
                    Flexible(
                      flex: isLandscape ? 1 : 2,
                      child: Image.asset(
                        "assets/oiltracker.jpg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    height: 200,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: SelectableText(
                      "Connect",
                      style: TextStyle(
                        fontFamily: 'Playfair',
                        fontSize: 70,
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Expanded(child: Flex(
                    direction: isLandscape ? Axis.horizontal : Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: SelectableText(
                            "Portland, OR",
                            style: TextStyle(
                              fontFamily: 'Playfair',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SelectableText(
                            "michaelrfairhurst@gmail.com",
                            style: TextStyle(
                              fontFamily: 'Playfair',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: SelectableText(
                            "instagram @mikeclimbingstuff",
                            style: TextStyle(
                              fontFamily: 'Playfair',
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),),
                ],
              ),
            ),
          ),
          SliverParallax(
            mainAxisFactor: 0.5,
            center: ParallaxScrollCenter.relativePx(-screenSize.height),
            offset: Offset(0, 100),
            child: Container(
              height: screenSize.height - 100,
              width: screenSize.width,
              child: Image.asset(
                "assets/mike_wallie.jpeg",
                alignment: Alignment.topRight,
                fit: BoxFit.cover
              ),
            ),
          ),
          SliverParallax(
            center: ParallaxScrollCenter.absolutePx(0.0),
            mainAxisFactor: 0.08,
            child: Container(
              height: screenSize.height * 1.6,
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

  List<Widget> makeZipper(List<String> texts, Size screenSize, bool isLandscape) {
    double offset = -screenSize.height - max(screenSize.height, 700) + 400;
    double crossAxisFactor = isLandscape ? -0.6 : -0.2;
    return texts.map((text) {
      offset += 50;
      crossAxisFactor *= -1.3;
      return SliverParallax(
        center: ParallaxScrollCenter.relativePx(offset),
        mainAxisFactor: 0.9,
        crossAxisFactor: crossAxisFactor,
        offset: Offset(0, screenSize.height - 250),
        child: Container(
          width: screenSize.width,
          alignment: Alignment.center,
          child: SelectableText(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget resumeItem(String header, String subheader, Size screenSize) =>
    SliverEntranceAnimation<double>(
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
      tween: Tween(begin: 0.0, end: 1.0),
      entrancePolicy: EntrancePolicy.scrollBeyondBottomEdge(),
      builder: (context, opacity, _) {
        return SliverToBoxAdapter(
          child: Transform.translate(
            offset: Offset(-screenSize.width, 0) * (1 - opacity),
            child: Opacity(
              opacity: opacity,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                margin: EdgeInsets.only(left: 150, right: 150, top: 150),
                alignment: Alignment.topCenter,
                color: Colors.black,
                child: FittedBox(
                  child: SelectableText.rich(
                    TextSpan(
                      text: header + "\n",
                      children: <TextSpan>[
                        TextSpan(
                          text: subheader,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Playfair',
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
}
