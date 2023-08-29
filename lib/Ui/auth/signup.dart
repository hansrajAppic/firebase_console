import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_consol/Ui/auth/login_screen.dart';
import 'package:firebase_consol/Utils/utils.dart';
import 'package:firebase_consol/Widgets/Round_button.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  
final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   final  _auth = FirebaseAuth.instance;
bool loading = false;
void signUp(){
     _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
                          setState(() {
                             loading =true ;
                          });

                        }).onError((error, stackTrace) { Utils().toastMessage(error.toString());
                       setState(() {
                          loading = false ;
                       });
                      
      


                        });
                        
                     
}

   void dispose() {
    
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,
          automaticallyImplyLeading: false,
          title: Center(child: Text('SignUp')),
        ),
        body:  Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  loading: loading,
                  title: ('Sign up'),
                    onTap:  (){
                      if(_formKey.currentState!.validate()){
                     
                      signUp();
                    
  }}),
                  SizedBox(height: 25,),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder:(context) => LoginScreen())
                        );
                      },
                          child: Text('Login'))
                    ],
                  ),
             
            ]),
        ),
      ),
        
    )
    );
  }
}