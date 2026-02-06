import 'package:flutter/material.dart';
// Core Flutter Material UI library

void main() {
  runApp(const MyApp());
  // Entry point of the Flutter app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // Removes the DEBUG banner (easy to forget)

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        // Seed-based dynamic color generation
      ),

      home: const MyHomePage(title: 'Flutter Demo'),
      // First screen of the app
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // Immutable data coming FROM parent → important concept

  @override
  State<MyHomePage> createState() => _MyHomePageState();
// Connects widget with its mutable State
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // State variable → changes trigger UI rebuild

  void _incrementCounter() {
    setState(() {
      _counter++;
      // setState tells Flutter: "Rebuild UI with new data"
    });
  }

  @override
  void initState() {
    super.initState();
    // Always call super.initState()

    _counter = 20;
    // Runs ONCE when widget is first created
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Called when parent rebuilds with same widget type

    _counter = 30;
    // Use this ONLY when reacting to parent data changes
  }

  @override
  Widget build(BuildContext context) {
    // build() runs MANY times → must be fast & side-effect free

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Accessing inherited theme via context

        centerTitle: true,
        title: Text(
          widget.title,
          // Access parent widget data using `widget`

          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),

      body: Container(
        child: Column(
          children: [

            // ---------- Simple layout container ----------
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              color: Colors.grey[350],
              child: Center(
                child: Text(
                  "Welcome to Flutter !",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),

            SizedBox(height: 20),
            // SizedBox is preferred over empty Container for spacing

            Container(
              height: 80.0,
              color: Colors.yellow[600],
              child: Center(
                child: Text(
                  "Hello, Flutter",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),

            // ---------- Row + Expanded = responsive layout ----------
            Container(
              height: 80.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Center(child: Text("Item 1")),
                    ),
                  ),

                  SizedBox(width: 5),

                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(child: Text("Item 2")),
                    ),
                  ),

                  SizedBox(width: 5),

                  Expanded(
                    flex: 2,
                    // flex controls space ratio (very important concept)

                    child: Container(
                      color: Colors.green,
                      child: Center(child: Text("Item 3")),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Container(
              child: MyWidget(),
              // Reusable custom widget
            ),

            // ---------- Decoration + Gradient + Shadow ----------
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              height: 80.0,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Center(
                child: Text(
                  "First Widget",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 10),

            Container(
              height: 80.0,
              color: Colors.green[600],
              child: Center(
                child: Text(
                  "Second Widget emilio aa aa aa",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                    // Prevents text overflow crash
                  ),
                ),
              ),
            ),

            Container(
              child: Center(
                child: Text('Incrementer $_counter'),
                // UI automatically updates when _counter changes
              ),
            ),

            Spacer(),
            // Pushes footer to bottom (important layout trick)

            Container(
              height: 80.0,
              color: Colors.grey[600],
              child: Center(
                child: Text(
                  "Footer Text",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green,
                    decorationThickness: 5,
                    decorationStyle: TextDecorationStyle.dashed,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        // Calls setState → rebuilds UI

        child: Icon(Icons.add),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("My Widget"),
      // StatelessWidget → no internal state
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("My Widget"),
    );
  }
}