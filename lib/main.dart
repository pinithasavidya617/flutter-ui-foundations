import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = 20;
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _counter = 30;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              color: Colors.grey[350],
              child: Center(
                child: Text("Welcome to Flutter !", style: TextStyle(fontSize: 40)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80.0,
              color: Colors.yellow[600],
              child: Center(
                child: Text("Hello, Flutter", style: TextStyle(fontSize: 35, color: Colors.white)),
              ),
            ),

            Container(
              height: 80.0,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text("Item 1"),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text("Item 2"),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    // flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: Center(
                      child: Text("Item 3"),
                    ),),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: MyWidget(),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 5
                    )
                  ],
                gradient: LinearGradient(colors: [
                  Colors.pink,
                  Colors.blue
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
              ),
              height: 80.0,
              margin: EdgeInsets.symmetric(vertical: 20.00, horizontal: 20.00),
              child: Center(
                child: Text("First Widget", style: TextStyle(fontSize: 35, color: Colors.white )),
              ),
            ),
            SizedBox(height: 10,),

            Container(
              height: 80.0,
              color: Colors.green[600],
              child: Center(
                child: Text("Second Widget emilio aa aa aa", style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis
                )),
              ),
            ),
            Container(
              child: Center(
                child: Text('Incrementer $_counter' ),
              ),
            ),
            Spacer(),
            Container(
              height: 80.0,
              color: Colors.grey[600],
              child: Center(
                child: Text("Footer Text", style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.green,
                    decorationThickness: 5,
                    decorationStyle: TextDecorationStyle.dashed)),
              ),
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      child: Icon(Icons.add),
    ),
    );


  }
}

class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text("My Widget"),
    );
  }
}

class MyFirstWidget extends StatelessWidget{
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Text("My Widget"),
    );
  }
}