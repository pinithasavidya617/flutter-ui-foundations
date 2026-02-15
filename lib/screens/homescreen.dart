import 'package:flutter/material.dart';

import '../main.dart';

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
  String _counterType = 'NA';
  Color _counterColor = Colors.black;

  // State variable → changes trigger UI rebuild

  void _incrementCounter() {
    setState(() {
      _counter++;
      // setState tells Flutter: "Rebuild UI with new data"
    });
  }

  void _incrementButtonCounter() {
    setState(() {
      _counter++;
      // setState tells Flutter: "Rebuild UI with new data"
      if (_counter % 2 == 0) {
        _counterType = 'Even';
        _counterColor = Colors.red;
      } else {
        _counterType = 'Odd';
        _counterColor = Colors.green;
      }
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

    if (oldWidget.title != widget.title) {
      // Only update if parent data actually changed
      setState(() {
        _counter = 30;
      });
    }
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
              height: 60.0,
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
              height: 60.0,
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
              height: 50.0,
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

            GestureDetector(onTap: _incrementCounter, child: MyWidget()),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.red,
                  padding: EdgeInsets.all(15)),
              onPressed: _incrementButtonCounter,
              child: const SizedBox(
                width: 100,
                height: 20,
                child: Text('Elevated Button'),
              ),
            ),
            TextButton(
              onPressed: () => {},
              child: const SizedBox(
                width: 100,
                height: 20,
                child: Text('Text Button'),
              ),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
            MyButton(
              onTap: _incrementButtonCounter,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: _counterColor)),

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
              height: 60.0,
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
              height: 50.0,
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

            Container(
              child: Center(
                child: Text('This number is $_counterType'),
              ),
            ),

            Spacer(),
            // Pushes footer to bottom (important layout trick)

            Container(
              height: 50.0,
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
        onPressed: _incrementButtonCounter,
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
      height: 20,
      width: 200,
      color: Colors.blue,
      // StatelessWidget → no internal state
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: () => {print('On Double Tap')},
      onLongPress: () => {print('On Long press')},
      child: Container(
        child: Text("My Button"),
        width: 80,
        height: 30,
        color: Colors.green,
      ),
    );
  }
}