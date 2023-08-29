import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_consol/Ui/auth/Posts/add_post.dart';
import 'package:firebase_consol/Ui/auth/Posts/post_scrren.dart';
import 'package:firebase_consol/Ui/auth/login_screen.dart';
import 'package:firebase_consol/Ui/firstor/firstor_list_scrren.dart';
import 'package:flutter/material.dart';

class Splesh_Services{
  void isLogin(BuildContext context){
     final auth = FirebaseAuth.instance;
        final user =  auth.currentUser ;
         if(user != null){
Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) =>FireStoreScreen()))
      );
     
    }else{
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
      );
    }
  }

}