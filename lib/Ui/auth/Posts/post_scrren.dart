import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_consol/Ui/auth/Posts/add_post.dart';
import 'package:firebase_consol/Ui/auth/login_screen.dart';
import 'package:firebase_consol/Utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';



class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth = FirebaseAuth.instance ;
  final ref = FirebaseDatabase.instance.ref('Post');
final searchFilter =TextEditingController();
final editcontroller = TextEditingController();
     var snapshot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    

  }
  

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: const Icon(Icons.logout_outlined),),
          const SizedBox(width: 10,)
        ],
      ),

body: Column(children: [
  
const SizedBox(height: 10,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child:   TextFormField(controller: searchFilter,
    decoration:  const InputDecoration(
  
    hintText: "Search",
  
    border: OutlineInputBorder(),
  
  ),onChanged: (String value){
    setState(() {
      
    });

  },
  ),
 
),
   Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                 defaultChild: const Text('Loading'),
                itemBuilder: (context, snapshot, animation, index){
                   final title =snapshot.child('title').value.toString();
                  if(searchFilter.text.isEmpty){
                     return   ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                   subtitle: Text(snapshot.child('id').value.toString()),
                   trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context)=>[
                       PopupMenuItem(value: 1,

                    child: ListTile(onTap: (){
                  Navigator.pop(context);
                 showMyDialog(title,snapshot.child('id').value.toString());
                    },


                      leading: Icon(Icons.more_vert),
                   title: Text("edit"),)
                   ),
                      PopupMenuItem(value: 1,
                    child: ListTile(onTap: (){
                      Navigator.pop(context);
                      ref.child(snapshot.child('id').value.toString()).remove();
                    },

                      leading: Icon(Icons.delete_outline),
                   title: Text("Delet"),)
                   ),
                   
                   ],),
                   
                   
                
                    );
                  }else if( title.toLowerCase().contains(searchFilter.text.toLowerCase())){ return   ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                   subtitle: Text(snapshot.child('id').value.toString()),
                
                    );

                  }
                  else{
                    return Container();
                  }
            
                   
                  }))
]),
  
              floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPostScreen()));
        } ,
        child: const Icon(Icons.add),
      ),
 
      
  
    
    );
  }

Future<void> showMyDialog( String title, String id)async{
  editcontroller.text = title;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Update"),
        content: Container(
          child:TextField(
            controller: editcontroller,
            decoration: InputDecoration(
              hintText: "Edit"
            ),
          )
        ),
        actions: [
          TextButton(onPressed: (){
        Navigator.pop(context);
          }, child: Text("cancel")),
           TextButton(onPressed: (){
        Navigator.pop(context);
        ref.child(id).update({
          "title":editcontroller.text.toLowerCase()

        }).then((value) {
          Utils().toastMessage("Post Update");

        }).onError((error, stackTrace) {
          Utils().toastMessage(error.toString());
        });
          }, child: Text("update"))
        ],
      );
    });
}

}