
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_consol/Ui/auth/Posts/add_post.dart';
import 'package:firebase_consol/Ui/auth/Posts/post_scrren.dart';
import 'package:firebase_consol/Ui/auth/login_screen.dart';
import 'package:firebase_consol/Ui/firstor/add_firestor_data.dart';
import 'package:firebase_consol/Utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({Key? key}) : super(key: key);

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
final auth = FirebaseAuth.instance ;
  // final ref = FirebaseDatabase.instance.ref('Post');
// final searchFilter =TextEditingController();
final editcontroller = TextEditingController();
final firestore = FirebaseFirestore.instance.collection("User").snapshots();
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
        title: const Text("  Firestor"),
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
      
//       body: Column(
//         children: [
//           SizedBox(height: 18,),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: TextFormField(
//               controller: searchFilter,
//               decoration: InputDecoration(
//                 hintText: "serch",
//                 border: OutlineInputBorder(),
//               ),onChanged: (String value){
//                 setState(() {
            
                  

// }                );

//               },
              
//             ),
            
//           ),
          
//           Expanded(
//             child: FirebaseAnimatedList(
//                 query: ref,
//                 defaultChild: Text('Loading'),
//                 itemBuilder: (context, snapshot, animation, index){
//                   final title =snapshot.child('title').value.toString();
//                   if(searchFilter.text.isEmpty){
//                     return   ListTile(
//                     title: Text(snapshot.child('title').value.toString()),
//                     subtitle: Text(snapshot.child('id').value.toString()),
                
//             );
//                   }
//                   else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())){
//  return   ListTile(
//                     title: Text(snapshot.child('title').value.toString()),
//                     subtitle: Text(snapshot.child('id').value.toString()),
                
//             );
//                   }
//                   else{
//                     return Container();
//                   }
                  
//                 }
                  
                
            
//                 )
//           )
//         ]),
body: Column(children: [
  // Expanded(child: StreamBuilder(stream: ref.onValue,
  //   builder:(context, AsyncSnapshot<DatabaseEvent> snapshot) {
  //   return ListView.builder(
  //     itemBuilder: (BuildContext context, index) {
  //     return ListTile(
  //       title: Text("Abcd"),
  //     );

      
  //   } );
  // })),
const SizedBox(height: 10,),
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 10),
//   child:   TextFormField(controller: searchFilter,
//     decoration:  const InputDecoration(
  
//     hintText: "Search",
  
//     border: OutlineInputBorder(),
  
//   ),onChanged: (String value){
//     setState(() {
      
//     });

//   },
//   ),
 
// ),
  //  Expanded(
  //           child: FirebaseAnimatedList(
  //               query: ref,
  //                defaultChild: const Text('Loading'),
  //               itemBuilder: (context, snapshot, animation, index){
  //                  final title =snapshot.child('title').value.toString();
  //                 if(searchFilter.text.isEmpty){
  //                    return   ListTile(
  //                   title: Text(snapshot.child('title').value.toString()),
  //                  subtitle: Text(snapshot.child('id').value.toString()),
  //                  trailing: PopupMenuButton(
  //                   icon: const Icon(Icons.more_vert),
  //                   itemBuilder: (context)=>[
  //                      PopupMenuItem(value: 1,

  //                   child: ListTile(onTap: (){
  //                 Navigator.pop(context);
  //                showMyDialog(title,snapshot.child('id').value.toString());
  //                   },


  //                     leading: Icon(Icons.more_vert),
  //                  title: Text("edit"),)
  //                  ),
  //                     PopupMenuItem(value: 1,
  //                   child: ListTile(onTap: (){
  //                     Navigator.pop(context);
  //                     ref.child(snapshot.child('id').value.toString()).remove();
  //                   },

  //                     leading: Icon(Icons.delete_outline),
  //                  title: Text("Delet"),)
  //                  ),
                   
  //                  ],),
                   
                   
                
  //                   );
  //                 }else if( title.toLowerCase().contains(searchFilter.text.toLowerCase())){ return   ListTile(
  //                   title: Text(snapshot.child('title').value.toString()),
  //                  subtitle: Text(snapshot.child('id').value.toString()),
                
  //                   );

  //                 }
  //                 else{
  //                   return Container();
  //                 }
            
                   
  //                 }))
  StreamBuilder <QuerySnapshot>(
    stream: firestore,
    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState==ConnectionState.waiting)
      return CircularProgressIndicator();
      if(snapshot.hasError)
         return Text("Some error");
      return  
  Expanded(
    child: ListView.builder(itemCount: snapshot.data!.docs.length,
      itemBuilder: (BuildContextcontext,index){
      return ListTile(
        title: Text(snapshot.data!.docs[index]["title"].toString()),
      );
  
   
      
  
  //     return  ListView.builder(itemCount:  10,
  //     itemBuilder: (BuildContextcontext,index){
  //       // if (snapshot.connectionState==ConnectionState.waiting)
  //       // return CircularProgressIndicator();
  //       // if(snapshot.hasError)
  //       // return Text("Some error");
         
  //     return Expanded(
  //   child: ListView.builder(
  //     itemCount: snapshot.data!.docs.length,
  //     itemBuilder: (BuildContextcontext,index){
  //     return ListTile(
  //       title: Text( snapshot.data!.docs[index]["title"].id.toString()),
  //     );
  
  //   }),
  // );
  //   });
  // // Expanded(
  // //   child: ListView.builder(itemCount:  10,
  // //     itemBuilder: (BuildContextcontext,index){
  // //     return ListTile(
  // //       title: Text("asssf"),
  // //     );
  
  // //  });
  // )

    })
    
  
    );
  }
    )]),
  
              floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFireStoreDataScreen()));
        } ,
        child: const Icon(Icons.add),
      ),
 
      //               trailing:  PopupMenuButton(
      //                   color: Colors.white,
      //                   elevation: 4,
      //                   padding: EdgeInsets.zero,
      //                   shape: const RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.all(Radius.circular(2))),
      //                   icon: Icon(Icons.more_vert,),
      //                   itemBuilder: (context) => [
      //                     PopupMenuItem(
      //                       value: 1,
      //                       child: PopupMenuItem(
      //                         value: 2,
      //                         child:  ListTile(
      //                           onTap: (){
      //                             Navigator.pop(context);

      //                             ref.child(snapshot.child('id').value.toString()).update(
      //                                 {
      //                                   'title' : 'nice world'
      //                                 }).then((value){

      //                             }).onError((error, stackTrace){
      //                               Utils().toastMessage(error.toString());
      //                             });

      //                           },
      //                           leading: Icon(Icons.edit),
      //                           title: Text('Edit'),
      //                         ),
      //                       ),
      //                     ),
      //                     PopupMenuItem(
      //                       value: 2,
      //                       child:  ListTile(
      //                         onTap: (){
      //                           Navigator.pop(context);

      //                           // ref.child(snapshot.child('id').value.toString()).update(
      //                           //     {
      //                           //       'ttitle' : 'hello world'
      //                           //     }).then((value){
      //                           //
      //                           // }).onError((error, stackTrace){
      //                           //   Utils().toastMessage(error.toString());
      //                           // });
      //                           ref.child(snapshot.child('id').value.toString()).remove().then((value){

      //                           }).onError((error, stackTrace){
      //                             Utils().toastMessage(error.toString());
      //                           });
      //                         },
      //                         leading: Icon(Icons.delete_outline),
      //                         title: Text('Delete'),
      //                       ),
      //                     ),
      //                   ]),
      //             );
      //           }
      //       ),
      //     ),
      //   ],
      // ),
  
  
    
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
        // ref.child(id).update({
        //   "title":editcontroller.text.toLowerCase()

        // }).then((value) {
        //   Utils().toastMessage("Post Update");

        // }).onError((error, stackTrace) {
        //   Utils().toastMessage(error.toString());
        // });
          }, child: Text("update"))
        ],
      );
    });
}

}







































//  final auth = FirebaseAuth.instance ;
// //   final ref = FirebaseDatabase.instance.ref('Post');
// // final searchFilter =TextEditingController();
// final editcontroller = TextEditingController();
//      var snapshot;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
    

//   }
  

//   @override
//   Widget build(BuildContext context) {



//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Post'),
//         actions: [
//           IconButton(onPressed: (){
//             auth.signOut().then((value){
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const LoginScreen()));
//             }).onError((error, stackTrace){
//               Utils().toastMessage(error.toString());
//             });
//           }, icon: const Icon(Icons.logout_outlined),),
//           const SizedBox(width: 10,)
//         ],
//       ),
      
// //       body: Column(
// //         children: [
// //           SizedBox(height: 18,),
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 15),
// //             child: TextFormField(
// //               controller: searchFilter,
// //               decoration: InputDecoration(
// //                 hintText: "serch",
// //                 border: OutlineInputBorder(),
// //               ),onChanged: (String value){
// //                 setState(() {
            
                  

// // }                );

// //               },
              
// //             ),
            
// //           ),
          
// //           Expanded(
// //             child: FirebaseAnimatedList(
// //                 query: ref,
// //                 defaultChild: Text('Loading'),
// //                 itemBuilder: (context, snapshot, animation, index){
// //                   final title =snapshot.child('title').value.toString();
// //                   if(searchFilter.text.isEmpty){
// //                     return   ListTile(
// //                     title: Text(snapshot.child('title').value.toString()),
// //                     subtitle: Text(snapshot.child('id').value.toString()),
                
// //             );
// //                   }
// //                   else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())){
// //  return   ListTile(
// //                     title: Text(snapshot.child('title').value.toString()),
// //                     subtitle: Text(snapshot.child('id').value.toString()),
                
// //             );
// //                   }
// //                   else{
// //                     return Container();
// //                   }
                  
// //                 }
                  
                
            
// //                 )
// //           )
// //         ]),
// body: Column(children: [
//   // Expanded(child: StreamBuilder(stream: ref.onValue,
//   //   builder:(context, AsyncSnapshot<DatabaseEvent> snapshot) {
//   //   return ListView.builder(
//   //     itemBuilder: (BuildContext context, index) {
//   //     return ListTile(
//   //       title: Text("Abcd"),
//   //     );

      
//   //   } );
//   // })),
// const SizedBox(height: 10,),
// // Padding(
// //   padding: const EdgeInsets.symmetric(horizontal: 10),
// //   child:   TextFormField(controller: searchFilter,
// //     decoration:  const InputDecoration(
  
// //     hintText: "Search",
  
// //     border: OutlineInputBorder(),
  
// //   ),onChanged: (String value){
// //     setState(() {
      
// //     });

// //   },
// //   ),
 
// // ),
//    Expanded(
//     child: ListView.builder(itemCount: 10,
//       itemBuilder: (BuildContext context, index){
//       return ListTile(
//         title: Text("assdf"),
//       );

//     })
//    )

//             // child: FirebaseAnimatedList(
//             //     query: ref,
//             //      defaultChild: const Text('Loading'),
//             //     itemBuilder: (context, snapshot, animation, index){
//             //        final title =snapshot.child('title').value.toString();
//             //       if(searchFilter.text.isEmpty){
//             //          return   ListTile(
//             //         title: Text(snapshot.child('title').value.toString()),
//             //        subtitle: Text(snapshot.child('id').value.toString()),
//             //        trailing: PopupMenuButton(
//             //         icon: const Icon(Icons.more_vert),
//             //         itemBuilder: (context)=>[
//             //            PopupMenuItem(value: 1,

//             //         child: ListTile(onTap: (){
//             //       Navigator.pop(context);
//             //      showMyDialog(title,snapshot.child('id').value.toString());
//             //         },


//             //           leading: Icon(Icons.more_vert),
//             //        title: Text("edit"),)
//             //        ),
//             //           PopupMenuItem(value: 1,
//             //         child: ListTile(onTap: (){
//             //           Navigator.pop(context);
//             //           ref.child(snapshot.child('id').value.toString()).remove();
//             //         },

//             //           leading: Icon(Icons.delete_outline),
//             //        title: Text("Delet"),)
//             //        ),
                   
//             //        ],),
                   
                   
                
//             //         );
//             //       }else if( title.toLowerCase().contains(searchFilter.text.toLowerCase())){ return   ListTile(
//             //         title: Text(snapshot.child('title').value.toString()),
//             //        subtitle: Text(snapshot.child('id').value.toString()),
                
//             //         );

//             //       }
//             //       else{
//             //         return Container();
//             //       }
            
                   
//             //       }))
// ]),
  
//               floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPostScreen()));
//         } ,
//         child: const Icon(Icons.add),
//       ),
 
//       //               trailing:  PopupMenuButton(
//       //                   color: Colors.white,
//       //                   elevation: 4,
//       //                   padding: EdgeInsets.zero,
//       //                   shape: const RoundedRectangleBorder(
//       //                       borderRadius: BorderRadius.all(Radius.circular(2))),
//       //                   icon: Icon(Icons.more_vert,),
//       //                   itemBuilder: (context) => [
//       //                     PopupMenuItem(
//       //                       value: 1,
//       //                       child: PopupMenuItem(
//       //                         value: 2,
//       //                         child:  ListTile(
//       //                           onTap: (){
//       //                             Navigator.pop(context);

//       //                             ref.child(snapshot.child('id').value.toString()).update(
//       //                                 {
//       //                                   'title' : 'nice world'
//       //                                 }).then((value){

//       //                             }).onError((error, stackTrace){
//       //                               Utils().toastMessage(error.toString());
//       //                             });

//       //                           },
//       //                           leading: Icon(Icons.edit),
//       //                           title: Text('Edit'),
//       //                         ),
//       //                       ),
//       //                     ),
//       //                     PopupMenuItem(
//       //                       value: 2,
//       //                       child:  ListTile(
//       //                         onTap: (){
//       //                           Navigator.pop(context);

//       //                           // ref.child(snapshot.child('id').value.toString()).update(
//       //                           //     {
//       //                           //       'ttitle' : 'hello world'
//       //                           //     }).then((value){
//       //                           //
//       //                           // }).onError((error, stackTrace){
//       //                           //   Utils().toastMessage(error.toString());
//       //                           // });
//       //                           ref.child(snapshot.child('id').value.toString()).remove().then((value){

//       //                           }).onError((error, stackTrace){
//       //                             Utils().toastMessage(error.toString());
//       //                           });
//       //                         },
//       //                         leading: Icon(Icons.delete_outline),
//       //                         title: Text('Delete'),
//       //                       ),
//       //                     ),
//       //                   ]),
//       //             );
//       //           }
//       //       ),
//       //     ),
//       //   ],
//       // ),
  
    
//     );
//   }
// }

// Future<void> showMyDialog( String title, String id)async{
//   editcontroller.text = title;
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Update"),
//         content: Container(
//           child:TextField(
//             controller: editcontroller,
//             decoration: InputDecoration(
//               hintText: "Edit"
//             ),
//           )
//         ),
//         actions: [
//           TextButton(onPressed: (){
//         Navigator.pop(context);
//           }, child: Text("cancel")),
//            TextButton(onPressed: (){
//         Navigator.pop(context);
//         ref.child(id).update({
//           "title":editcontroller.text.toLowerCase()

//         }).then((value) {
//           Utils().toastMessage("Post Update");

//         }).onError((error, stackTrace) {
//           Utils().toastMessage(error.toString());
//         });
//           }, child: Text("update"))
//         ],
//       );
//     });
// }

















// // //   final auth = FirebaseAuth.instance ;
// // //   final ref = FirebaseDatabase.instance.ref('Post');


// // //   @override
// // //   void initState() {
 
// // //     super.initState();

// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(backgroundColor: Colors.purple,
// // //         title: Text('Fir'),
// // //         actions: [
// // //           IconButton(onPressed: (){
// // //             auth.signOut().then((value){
// // //               Navigator.push(context,
// // //                   MaterialPageRoute(builder: (context) => LoginScreen()));
// // //             }).onError((error, stackTrace){
// // //               Utils().toastMessage(error.toString());
// // //             });
// // //           }, icon: Icon(Icons.logout_outlined),),
// // //           SizedBox(width: 10,)
// // //         ],
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Expanded(
// // //             child: FirebaseAnimatedList(
// // //                 query: ref,
// // //                 defaultChild: Text('Loading'),
// // //                 itemBuilder: (context, snapshot, animation, index){
// // //                    final title = snapshot.child("title").value.toString();
// // //                    var serarchFilter;
// // //                    if(serarchFilter.text.isEmpty){
// // //                     return ListTile(
// // //                       title: Text(snapshot.child('title').value.toString()),
// // //                       subtitle: Text(snapshot.child('id').value.toString()),
// // //                     );

// // //                    }
// // //                    else if(serarchFilter.text.toLowerCase().contains(title.toLowerCase().toLowerCase())){

// // //                    }
                
// // //                   return ListTile(
// // //                       title: Text(snapshot.child('title').value.toString()),
// // //                       subtitle: Text(snapshot.child('id').value.toString()),
// // //                     );
// // //                 }
               























                
// // //       //               final title = snapshot.child("title").value.toString();
// // //       //               trailing:  PopupMenuButton(
                        
// // //       //                   padding: EdgeInsets.zero,
// // //       //                   shape: const RoundedRectangleBorder(
// // //       //                       borderRadius: BorderRadius.all(Radius.circular(2))),
// // //       //                   icon: Icon(Icons.more_vert,),
// // //       //                   itemBuilder: (context) => [
// // //       //                     PopupMenuItem(
// // //       //                       value: 1,
// // //       //                       child: PopupMenuItem(
// // //       //                         value: 2,
// // //       //                         child:  ListTile(
// // //       //                           onTap: (){
// // //       //                             Navigator.pop(context);

// // //       //                             ref.child(snapshot.child('id').value.toString()).update(
// // //       //                                 {
// // //       //                                   'title' : 'nice world'
// // //       //                                 }).then((value){

// // //       //                             }).onError((error, stackTrace){
// // //       //                               Utils().toastMessage(error.toString());
// // //       //                             });

// // //       //                           },
// // //       //                           leading: Icon(Icons.edit),
// // //       //                           title: Text('Edit'),
// // //       //                         ),
// // //       //                       ),
// // //       //                     ),
// // //       //                     PopupMenuItem(
// // //       //                       value: 2,
// // //       //                       child:  ListTile(
// // //       //                         onTap: (){
// // //       //                           Navigator.pop(context);

// // //       //                           // ref.child(snapshot.child('id').value.toString()).update(
// // //       //                           //     {
// // //       //                           //       'ttitle' : 'hello world'
// // //       //                           //     }).then((value){
// // //       //                           //
// // //       //                           // }).onError((error, stackTrace){
// // //       //                           //   Utils().toastMessage(error.toString());
// // //       //                           // });
// // //       //                           ref.child(snapshot.child('id').value.toString()).remove().then((value){

// // //       //                           }).onError((error, stackTrace){
// // //       //                             Utils().toastMessage(error.toString());
// // //       //                           });
// // //       //                         },
// // //       //                         leading: Icon(Icons.delete_outline),
// // //       //                         title: Text('Delete'),
// // //       //                       ),
// // //       //                     ),
// // //       //                   ]),
// // //       //             );
// // //       //           }
// // //       //       ),
// // //       //     ),
// // //       //   ],
// // //       // ),
// // //       // floatingActionButton: FloatingActionButton(
// // //       //   onPressed: (){
// // //       //     Navigator.push(context, MaterialPageRoute(builder: (context) => AddFireStoreData()));
// // //       //   } ,
// // //       //   child: Icon(Icons.add),
// // //       // ),
// // //                 )
// // //           )])
// // //             );
// // //   }

// // // }
// // final auth = FirebaseAuth.instance ;
// // //   final ref = FirebaseDatabase.instance.ref('Post');
// // // final searchFilter =TextEditingController();
// //      var snapshot;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
    

// //   }
  

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Post'),
// //         actions: [
// //           IconButton(onPressed: (){
// //             auth.signOut().then((value){
// //               Navigator.push(context,
// //                   MaterialPageRoute(builder: (context) => LoginScreen()));
// //             }).onError((error, stackTrace){
// //               Utils().toastMessage(error.toString());
// //             });
// //           }, icon: Icon(Icons.logout_outlined),),
// //           SizedBox(width: 10,)
// //         ],
// //       ),
      
// // //       body: Column(
// // //         children: [
// // //           SizedBox(height: 18,),
// // //           Padding(
// // //             padding: EdgeInsets.symmetric(horizontal: 15),
// // //             child: TextFormField(
// // //               controller: searchFilter,
// // //               decoration: InputDecoration(
// // //                 hintText: "serch",
// // //                 border: OutlineInputBorder(),
// // //               ),onChanged: (String value){
// // //                 setState(() {
            
                  

// // // }                );

// // //               },
              
// // //             ),
            
// // //           ),
          
// // //           Expanded(
// // //             child: FirebaseAnimatedList(
// // //                 query: ref,
// // //                 defaultChild: Text('Loading'),
// // //                 itemBuilder: (context, snapshot, animation, index){
// // //                   final title =snapshot.child('title').value.toString();
// // //                   if(searchFilter.text.isEmpty){
// // //                     return   ListTile(
// // //                     title: Text(snapshot.child('title').value.toString()),
// // //                     subtitle: Text(snapshot.child('id').value.toString()),
                
// // //             );
// // //                   }
// // //                   else if(title.toLowerCase().contains(searchFilter.text.toLowerCase().toLowerCase())){
// // //  return   ListTile(
// // //                     title: Text(snapshot.child('title').value.toString()),
// // //                     subtitle: Text(snapshot.child('id').value.toString()),
                
// // //             );
// // //                   }
// // //                   else{
// // //                     return Container();
// // //                   }
                  
// // //                 }
                  
                
            
// // //                 )
// // //           )
// // //         ]),
// // // body: Column(children: [
// // //   // Expanded(child: StreamBuilder(stream: ref.onValue,
// // //   //   builder:(context, AsyncSnapshot<DatabaseEvent> snapshot) {
// // //   //   return ListView.builder(
// // //   //     itemBuilder: (BuildContext context, index) {
// // //   //     return ListTile(
// // //   //       title: Text("Abcd"),
// // //   //     );

      
// // //   //   } );
// // //   // })),
// // // SizedBox(height: 10,),
// // // Padding(
// // //   padding: const EdgeInsets.symmetric(horizontal: 10),
// // //   child:   TextFormField(controller: searchFilter,
// // //     decoration:  InputDecoration(
  
// // //     hintText: "Search",
  
// // //     border: OutlineInputBorder(),
  
// // //   ),onChanged: (String value){
// // //     setState(() {
      
// // //     });

// // //   },
// // //   ),
 
// // // ),
// // //    Expanded(
// // //             child: FirebaseAnimatedList(
// // //                 query: ref,
// // //                  defaultChild: Text('Loading'),
// // //                 itemBuilder: (context, snapshot, animation, index){
// // //                    final title =snapshot.child('title').value.toString();
// // //                   if(searchFilter.text.isEmpty){
// // //                      return   ListTile(
// // //                     title: Text(snapshot.child('title').value.toString()),
// // //                    subtitle: Text(snapshot.child('id').value.toString()),
// // //                    trailing: PopupMenuButton(
// // //                     icon: Icon(Icons.more),
// // //                     itemBuilder: (context)=>[
// // //                       PopupMenuItem(value: 1,
// // //                     child: ListTile(leading: Icon(Icons.edit),
// // //                    title: Text("edit"),))],),
                   
                
// // //                     );
// // //                   }else if( title.toLowerCase().contains(searchFilter.text.toLowerCase())){ return   ListTile(
// // //                     title: Text(snapshot.child('title').value.toString()),
// // //                    subtitle: Text(snapshot.child('id').value.toString()),
                
// // //                     );

// // //                   }
// // //                   else{
// // //                     return Container();
// // //                   }
            
                   
// // //                   }))
// // // ]),
  
// // //               floatingActionButton: FloatingActionButton(
// // //         onPressed: (){
// // //           Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
// // //         } ,
// // //         child: Icon(Icons.add),
// // //       ),
 
// // //       //               trailing:  PopupMenuButton(
// // //       //                   color: Colors.white,
// // //       //                   elevation: 4,
// // //       //                   padding: EdgeInsets.zero,
// // //       //                   shape: const RoundedRectangleBorder(
// // //       //                       borderRadius: BorderRadius.all(Radius.circular(2))),
// // //       //                   icon: Icon(Icons.more_vert,),
// // //       //                   itemBuilder: (context) => [
// // //       //                     PopupMenuItem(
// // //       //                       value: 1,
// // //       //                       child: PopupMenuItem(
// // //       //                         value: 2,
// // //       //                         child:  ListTile(
// // //       //                           onTap: (){
// // //       //                             Navigator.pop(context);

// // //       //                             ref.child(snapshot.child('id').value.toString()).update(
// // //       //                                 {
// // //       //                                   'title' : 'nice world'
// // //       //                                 }).then((value){

// // //       //                             }).onError((error, stackTrace){
// // //       //                               Utils().toastMessage(error.toString());
// // //       //                             });

// // //       //                           },
// // //       //                           leading: Icon(Icons.edit),
// // //       //                           title: Text('Edit'),
// // //       //                         ),
// // //       //                       ),
// // //       //                     ),
// // //       //                     PopupMenuItem(
// // //       //                       value: 2,
// // //       //                       child:  ListTile(
// // //       //                         onTap: (){
// // //       //                           Navigator.pop(context);

// // //       //                           // ref.child(snapshot.child('id').value.toString()).update(
// // //       //                           //     {
// // //       //                           //       'ttitle' : 'hello world'
// // //       //                           //     }).then((value){
// // //       //                           //
// // //       //                           // }).onError((error, stackTrace){
// // //       //                           //   Utils().toastMessage(error.toString());
// // //       //                           // });
// // //       //                           ref.child(snapshot.child('id').value.toString()).remove().then((value){

// // //       //                           }).onError((error, stackTrace){
// // //       //                             Utils().toastMessage(error.toString());
// // //       //                           });
// // //       //                         },
// // //       //                         leading: Icon(Icons.delete_outline),
// // //       //                         title: Text('Delete'),
// // //       //                       ),
// // //       //                     ),
// // //       //                   ]),
// // //       //             );
// // //       //           }
// // //       //       ),
// // //       //     ),
// // //       //   ],
// // //       // ),
  
    
// // //     );
// // //   }
// // // }
// // // body: Column(
// // //   children: [
    
// // //   ],
// // // ));
// // //   }}
