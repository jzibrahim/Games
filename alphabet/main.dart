import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Alphabet',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
        // Notice that the counter didn't reset back to zero -- the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: new MyHomePage(title: 'Alphabet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

enum Mode { NAME_UPPER, NAME_LOWER, WORD }

class Letter {
  static List<Color> color = [
    Colors.blue,
    Colors.blueGrey,
    Colors.red,
    Colors.green
  ];

  final String name;
  final String word;
  final int index;
  Mode mode = Mode.NAME_UPPER;

  final TextStyle letterStyle;
  final TextStyle wordStyle;

  Letter(this.name, this.word, this.index)
      : letterStyle = new TextStyle(
      color: color[index % color.length],
      fontWeight: FontWeight.bold,
      fontSize: 80.0),
        wordStyle = new TextStyle(
            color: color[index % color.length],
            fontWeight: FontWeight.bold,
            fontSize: 24.0);

  String get text {
    switch (mode) {
      case Mode.NAME_UPPER:
        return name;
      case Mode.NAME_LOWER:
        return name.toLowerCase();
      case Mode.WORD:
        return word;
    }
    return name;
  }

  TextStyle get style => (mode == Mode.WORD) ? wordStyle : letterStyle;

  Mode get nextMode {
    switch (mode) {
      case Mode.NAME_UPPER:
        return Mode.NAME_LOWER;
      case Mode.NAME_LOWER:
        return Mode.WORD;
      case Mode.WORD:
        return Mode.NAME_UPPER;
    }
    return Mode.NAME_UPPER;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Letter> alphabet = [
    new Letter('A', 'apple', 0),
    new Letter('B', 'bumblebee', 1),
    new Letter('C', 'cat', 2),
    new Letter('D', 'dog', 3),
    new Letter('E', 'elephant', 4),
    new Letter('F', 'fish', 5),
    new Letter('G', 'gorilla', 6),
    new Letter('H', 'house', 7),
    new Letter('I', 'igloo', 8),
    new Letter('J', 'jaguar', 9),
    new Letter('K', 'kangaroo', 10),
    new Letter('L', 'lion', 11),
    new Letter('M', 'mouse', 12),
    new Letter('N', 'nest', 13),
    new Letter('O', 'octopus', 14),
    new Letter('P', 'pig', 15),
    new Letter('Q', 'quail', 16),
    new Letter('R', 'rabbit', 17),
    new Letter('S', 'seal', 18),
    new Letter('T', 'turtle', 19),
    new Letter('U', 'umbrella', 20),
    new Letter('V', 'violin', 21),
    new Letter('W', 'watermellon', 22),
    new Letter('X', 'x-ray', 23),
    new Letter('Y', 'yak', 24),
    new Letter('Z', 'zebra', 25)
  ];

// The images are saved with names pic1.jpg, pic2.jpg...pic30.jpg.
// The List.generate constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) {
    List<Container> containers =
    new List<Container>.generate(count, (int index) {
      return new Container(
          child: new Center(
              child: new GestureDetector(
                  onTap: () {
                    setState(() {
                      alphabet[index].mode = alphabet[index].nextMode;
                    });
                  },
                  child: new Text(alphabet[index].text,
                      style: alphabet[index].style))));
    });
    return containers;
  }

  Widget buildGrid() {
    return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(alphabet.length));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: buildGrid(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
