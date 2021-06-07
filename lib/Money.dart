import 'package:flutter/material.dart';
import 'package:zakat_calculator/MainPage.dart';

class Money extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<Money> {
  double money = 0;
  double gold=100;
  double zakat=0;
  double slider=50;
  var Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2b305f),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("حساب زكاة المال"),
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
                            Padding(
                                padding: EdgeInsets.fromLTRB(0,30,0,0),
                                child: Text(":لديك من المال",style: TextStyle(fontSize: 30,color: Colors.white60,),)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10,0,10,20) ,
                              child: TextField(
                                style: TextStyle(color: Colors.white60,fontSize: 20),
                                cursorColor: Colors.white60,
                                decoration: InputDecoration(
                                  fillColor: Colors.redAccent,
                                  contentPadding: EdgeInsets.all(10),
                                  helperStyle: TextStyle(color: Colors.white60),
                                  hintText: "أدخل المبلغ الذي لديك",
                                  hintStyle: TextStyle(color: Colors.white60,fontSize: 20),
                                ),
                                controller: Controller,
                                keyboardType: TextInputType.phone,
                              ),
                            )
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
                            Text("حدد سعر الذهب اليوم",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60)),
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
                            children: [Text("زكاتك من المال",style: TextStyle(fontSize: 40,color: Color(
                                0x99FFFFFF),fontWeight: FontWeight.bold),),
                              Text(zakat.toString(),style: TextStyle(fontSize: 40,color: Color(
                                  0x99FFFFFF),fontWeight: FontWeight.bold))
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
                      money = double.parse(Controller.text);
                      calc(money.round());
                    });
                  },child: Text("احسب"),),
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

