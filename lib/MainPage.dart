import 'package:flutter/material.dart';
import 'package:zakat_calculator/Gold.dart';
import 'package:zakat_calculator/Money.dart';
import 'package:zakat_calculator/Silver.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية"),
        backgroundColor: Color(0xff2b305f),),
      backgroundColor: Color(0xff12163b) ,
      body: Padding(
        padding: EdgeInsets.fromLTRB(5,20,5,20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_){return Money();}));},
                    child: Text("زكاة المال",style: TextStyle(color: Color(0x99FFFFFF)),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white30,
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 1,
                child: ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_){return Gold();}));},
                  child: Text("زكاة الذهب",style: TextStyle(color: Color(0x99FFFFFF)),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white30,
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 1,
                child: ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (_){return Silver();}));},
                  child: Text("زكاة الفضة",style: TextStyle(color: Color(0x99FFFFFF)),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white30,
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20)
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
