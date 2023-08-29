import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_consol/Ui/auth/Posts/post_scrren.dart';
import 'package:firebase_consol/Ui/auth/login_with_phone.dart';
import 'package:firebase_consol/Ui/auth/signup.dart';
import 'package:firebase_consol/Utils/utils.dart';
import 'package:firebase_consol/Widgets/Round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  
final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   bool loading = false ;
  final _auth = FirebaseAuth.instance ;

   void dispose() {
    
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }
  void login(){
    setState(() {
      loading = true ;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text.toString()).then((value){
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PostScreen())
      );
      setState(() {
        loading = false ;
      });
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      SystemNavigator.pop();
      return true;
    },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            title: Center(child: Text('Login')),
          ),
          body:  Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(
                height: 54,
              ),
                  TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: const  InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.alternate_email)
                              ),
                             validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Check email';
                    }
                    return null;
                  },
                            ),
                             const SizedBox(height: 10,),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              obscureText: true,
                              decoration: const  InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock_open)
                              ),
                              validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter check password';
                    }
                    return null;
                  },
                            ),
              
                        
                    
              SizedBox(height: 48,),
                RoundButton(
                      title: 'Login',
                      loading:  loading,
                    
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                           login();
                        }
                      },
                    ),
                    SizedBox(height: 25,),
                       Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder:(context) => SignUpScreen())
                          );
                        },
                            child: Text('Sign up')),
                           
                       
          
                      ],
                    ),
                     SizedBox(height: 30,),
                 InkWell(                       
                    onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>LoginWithPhoneNumber()));
                   },
                    child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black
                        )
                    ),
                    child: Center(
                      child: Text('Login with phone'),
                    ),
                   ),
                  )
               
              ]),
          ),
        ),
          
      )
      ),
    );
  }
}