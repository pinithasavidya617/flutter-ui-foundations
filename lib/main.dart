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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // print('increment click $_counter');
    // _counter++;
    // print('increment click $_counter');

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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