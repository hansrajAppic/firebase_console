import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_consol/Ui/auth/Posts/post_scrren.dart';
import 'package:firebase_consol/Utils/utils.dart';
import 'package:firebase_consol/Widgets/Round_button.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId ;
  const VerifyCodeScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false ;
  final verificationCodeController = TextEditingController();
  final auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Verfy'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 80,),
              TextFormField(
              controller: verificationCodeController,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '6 diget code'
              ),
            ),
            SizedBox(height: 80,),
            RoundButton(title: "Verfy",loading: loading, onTap: () async{  setState(() {
                loading = true ;
              });
              final credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: verificationCodeController.text.toString());
              try{
               
     await auth.signInWithCredential(credential);
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
              } catch(e){
                setState(() {
                  loading = false ;
                });
                   Utils().toastMessage(e.toString());
            }
  })
        

            ]),
      )
          
      
    );
  }
}
   