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
            CircleAvatar(
                // backgroundImage: NetworkImage(imageURL)
                child: Text(userLongName[0]),
            ),
            // Image(image: imageURL)
          ],
        ),
        // Second column, TODO: Format
        Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                    '$userLongName\t@$userShortName - $timeString',
                    textAlign: TextAlign.left,
                ),
                const Icon(Icons.expand_more),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$description\n$imageURL',
                    textAlign: TextAlign.left,
                  ),
                ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(

                    image: NetworkImage(imageURL),
                  width: 100,
                  height: 100,

                )
              ],
            )
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // textDirection: TextDirection.rtl,
              children: [
                const Icon(Icons.chat_bubble_outline),
                Text('$numComments\t'),
                const Icon(Icons.repeat),
                Text('$numRetweets\t'),
                const Icon(Icons.favorite_border),
                Text('$numLikes\t'),
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
