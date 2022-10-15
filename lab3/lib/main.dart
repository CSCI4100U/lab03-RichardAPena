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
      title: 'Lab 3/4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lab 03 and 04'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class TweetWidget {

  String userShortName = "";
  String userLongName = "";
  String timeString = "";
  String description = "";
  String imageURL = "";
  int numComments = 0;
  int numRetweets = 0;
  int numLikes = 0;

  TweetWidget(this.userShortName, this.userLongName, this.timeString, this.description, this.imageURL, this.numComments, this.numRetweets, this.numLikes);

  Row build() {

    return Row(
      children: [
        // First column
        Column(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(imageURL)),
            // Image(image: imageURL)
          ],
        ),
        // Second column, TODO: Format
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    '$userLongName @$userShortName - $timeString'
                ),
                const Icon(Icons.expand_more),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      description,
                    textAlign: TextAlign.left,
                  ),
                )

              ],

            ),
            Row(
              children: [
                const Icon(Icons.chat_bubble_outline),
                Text('$numComments'),
                const Icon(Icons.repeat),
                Text('$numRetweets'),
                const Icon(Icons.favorite_border),
                Text('$numLikes'),
                const Icon(Icons.bookmark_border)
              ],
            )
          ],
        )
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  var tweets = [];
  TweetWidget tweet = new TweetWidget("userShortName", "userLongName", "timeString", "description", 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg', 0, 0, 0);

  void _incrementCounter() {
    setState(() {
      _counter++;
      tweets.add(tweet);
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      tweets.removeLast();
    });
  }

  @override
  Widget buiald(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            for (int i=0; i<tweets.length; i++)
              tweets[i].build(),

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          for (int i=0; i<tweets.length; i++)
            tweets[i].build(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
