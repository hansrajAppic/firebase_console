import 'package:firebase_consol/Ui/auth/Posts/add_post.dart';
import 'package:firebase_consol/Ui/auth/Posts/post_scrren.dart';
import 'package:firebase_consol/Ui/auth/login_screen.dart';
import 'package:firebase_consol/Ui/firstor/add_firestor_data.dart';
import 'package:firebase_consol/Ui/firstor/firstor_list_scrren.dart';
import 'package:firebase_consol/Ui/splesh_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    app = await Firebase.initializeApp();
    auth = FirebaseAuth.instanceFor(app: app);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  FireStoreScreen(),
      
    );
  }
}
