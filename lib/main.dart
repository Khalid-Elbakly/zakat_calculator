import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color color = Color(0xff12163b);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zakat Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff12163b),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: MyHomePage(title: 'Zakat Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double money = 2000;
  double gold=100;
  double zakat;
  double slider=50;
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
        backgroundColor: Color(0xff2b305f),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.3,
                      color: Colors.white30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("I have ${money.round().toString()} EGP",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60),),
                          Slider(value: money,min: 0,max: 500000,label: money.round().toString(),activeColor: Color(
                              0xFFD50D5A),inactiveColor: Color(0xFFD4125E), onChanged: (double NewValue){
                            setState(() {
                              money=NewValue;
                            });
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.3,
                      color: Colors.white30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Gold Price is",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60)),
                          Text(gold.round().toString(),style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60) ,),
                          Slider(min: 50, max: 2500,activeColor: Color(
                              0xFF007580),inactiveColor: Color(0xFF007580),value: gold, onChanged: (double newValue){
                            setState(() {
                              gold=newValue;
                            });
                          }),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.3,
                      color: Colors.white30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("Your Zakat is ",style: TextStyle(fontSize: 40,color: Color(
                            0xffffc93c),fontWeight: FontWeight.bold),),
                          Text(zakat.toString(),style: TextStyle(fontSize: 40,color: Color(
                              0xffffc93c),fontWeight: FontWeight.bold))
                     ] ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white30,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              child: ElevatedButton(
                onPressed: (){
                setState(() {
                  calc(money.round());
                });
              },child: Text("Calculate"),),
            ),
          ),
        ],
      )
    );
  }
  int calc(int money){
      if(money<gold*85){
        zakat = 0;
      }else{
        zakat = money/40;
      }
    }
  }

