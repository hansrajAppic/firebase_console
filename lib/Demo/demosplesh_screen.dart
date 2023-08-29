import 'dart:async';

import 'package:firebase_consol/Demo/demologin_screen.dart';
import 'package:flutter/material.dart';
class DemoSpleshInsta extends StatefulWidget {
  const DemoSpleshInsta({super.key});

  @override
  
  State<DemoSpleshInsta> createState() => _DemoSpleshInstaState();
}

class _DemoSpleshInstaState extends State<DemoSpleshInsta> {
  
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DemoLoginInsta()));
    });
  }
    
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 280,left: 120),
            child: Image.asset("assets/images/insta.png",height: 100,),
          ),
         SizedBox(height: 230,),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Image.asset("assets/images/meta1.png",height: 50,),
          )
        ]),
      
    );
  }
}