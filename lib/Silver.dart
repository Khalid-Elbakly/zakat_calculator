import 'package:flutter/material.dart';

class Silver extends StatefulWidget {
  @override
  _silverState createState() => _silverState();
}

class _silverState extends State<Silver> {
  var Controller = TextEditingController();
  double silver = 100;
  double zakat = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("حساب زكاة الفضة"),
          backgroundColor: Color(0xff2b305f)),
      backgroundColor: Color(0xff12163b) ,
      body: Column(
        children: [
          Expanded(
            flex: 9,
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
                              child: Text(":عدد جرامات الفصة التي لديك",style: TextStyle(fontSize: 25,color: Colors.white60,),)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10,0,10,20) ,
                            child: TextField(
                              style: TextStyle(color: Colors.white60,fontSize: 20),
                              cursorColor: Colors.white60,
                              decoration: InputDecoration(
                                fillColor: Colors.redAccent,
                                contentPadding: EdgeInsets.all(10),
                                helperStyle: TextStyle(color: Colors.white60),
                                hintText: "أدخل عدد جرامات الذهب التي لديك",
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
                          Text("حدد سعر الفضة اليوم",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60)),
                          Text(silver.round().toString(),style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white60) ,),
                          Slider(value: silver,max: 5000,min: 100,activeColor: Color(
                              0xFF007580),inactiveColor: Color(0xFF007580), onChanged: (d){
                            setState(() {
                              silver = d;
                            });
                          })
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
                          children: [Text("زكاتك من الفضة",style: TextStyle(fontSize: 40,color: Color(
                              0x99FFFFFF),fontWeight: FontWeight.bold),),
                            Text(zakat.toString(),style: TextStyle(fontSize: 40,color: Color(
                                0x99FFFFFF),fontWeight: FontWeight.bold))
                          ] ),
                    )
                  ],
                )
            ),
          ),
          Expanded(
              flex: 1,
              child: ElevatedButton(onPressed: (){
                calc(silver);
              }, child: Text("احسب")))
        ],
      ),
    );
  }
  void calc(double GramsOfSilver){
    setState(() {
      if(GramsOfSilver<595) zakat = 0;
      zakat = GramsOfSilver/40;
    });
  }
}
