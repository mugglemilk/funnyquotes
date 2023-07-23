import 'dart:core';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const
      //var quote = 'to the end \n of the day';
      List<String> quoteList = [
    'to the end \n of the day.',
    'i dun care BOSTON. \n i dun care USA. \n but i care just my life.',
    'finally graduated. \n going to unfollow \n and block all at them tonight.',
    'i look better in person.',
    'you are all \n gonna regret not dating me \n in high school.',
  ];
  List colors = [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.brown,
    Colors.red,
    Colors.pink,
  ];

  Random rand = Random();
  var quote = quoteList[0];

  String previousWord = "";
  var previousColor = Colors.black;

  void handleClickGo() {
    setState(() {
      var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex];

      if (quote == previousWord) {
        randomIndex = rand.nextInt(quoteList.length);
        quote = quoteList[randomIndex];
      }
      previousWord = quote;
    });
  }

  Color randomGenerator() {
    Color colorA = colors[rand.nextInt(colors.length)];
    if (colorA == previousColor) {
      colorA = colors[rand.nextInt(colors.length)];
    }
    previousColor = colorA;
    return colorA;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FunnyQuotes')),
      floatingActionButton: FloatingActionButton(
          onPressed: handleClickGo, child: const Text('Next Quote', textAlign: TextAlign.center,)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              color: randomGenerator(),
              fontSize: 20,
              //fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('color', colors));
  }
}
