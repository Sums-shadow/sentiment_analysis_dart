import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sentiment = Sentiment();
  TextEditingController controller=TextEditingController();
var sentimentRes;

  void _incrementCounter() {

    setState(() {
     sentimentRes= sentiment.analysis(controller.text,
          emoji: true, languageCode: LanguageCode.french);

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         title: Text("Sentiment Analysis"),
      ),
      body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: controller,
              ),
            ),
             Opacity(
               opacity: 0,
               child: Text(
                '$sentimentRes',
            ),
             ),
            if(sentimentRes!=null)
            Image.asset( sentimentRes["score"]>0? "assets/happy.gif": sentimentRes["score"]==0? "assets/perplex.gif" : "assets/sad.gif")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
