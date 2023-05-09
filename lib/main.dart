import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        // children: [
        //   const Text("Hey, Bob",
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 31,
        //       )),
        //   const Text("What are you in the mood for?",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 17,
        //       )),
        //   Text(appState.current.asLowerCase),
        // ],
        children: [
          Align(alignment: Alignment.topLeft, child: [
            const Text("Hey, Bob",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 31,
                )),
            const Text("What are you in the mood for?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                )),
            Text(appState.current.asLowerCase),
          ])
        ],
      ),
    );
  }
}
