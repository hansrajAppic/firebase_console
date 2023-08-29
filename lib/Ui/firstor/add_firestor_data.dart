// import 'package:firebase_consol/Utils/utils.dart';
// import 'package:firebase_consol/Widgets/Round_button.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// class AddFireStoreData extends StatefulWidget {
//   const AddFireStoreData({Key? key}) : super(key: key);

//   @override
//   State<AddFireStoreData> createState() => AddFireStorData();
// }

// class AddFireStorData extends State<AddFireStoreData> {

//   final postController =TextEditingController();
//   bool loading = false ;
//   final databaseRef = FirebaseDatabase.instance.ref('Post');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add FireStor Data'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 30,
//             ),

//             TextFormField(
//               maxLines: 4,
//               controller: postController,
//               decoration: InputDecoration(
//                 hintText: 'What is in your mind?' ,
//                 border: OutlineInputBorder()
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             RoundButton(
//                 title: 'Add',
//                 loading: loading,
//                 onTap: (){
//                   setState(() {
//                     loading = true ;
//                   });


//                   String id  = DateTime.now().millisecondsSinceEpoch.toString() ;
//                   databaseRef.child(id).set({
//                     'title' : postController.text.toString() ,
//                     'id' : DateTime.now().millisecondsSinceEpoch.toString()
//                   }).then((value){
//                     Utils().toastMessage('Post added');
//                     setState(() {
//                       loading = false ;
//                     });
//                   }).onError((error, stackTrace){
//                     Utils().toastMessage(error.toString());
//                     setState(() {
//                       loading = false ;
//                     });
//                   });
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_consol/Utils/utils.dart';
import 'package:firebase_consol/Widgets/Round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';



class AddFireStoreDataScreen extends StatefulWidget {
  const AddFireStoreDataScreen({Key? key}) : super(key: key);

  @override
  State<AddFireStoreDataScreen> createState() => _AddFireStoreDataScreenState();
}

class _AddFireStoreDataScreenState extends State<AddFireStoreDataScreen> {

  final postController =TextEditingController();
  bool loading = false ;
  //  final databaseRef = FirebaseDatabase.instance.ref('Post');
final firestore = FirebaseFirestore.instance.collection("User");
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('  Add Firestore Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: 'What is in your mind?' ,
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'Add',
              loading: loading,

              onTap: (){
                setState(() {
                      loading = true ;
                    });
                    String id =DateTime.now().millisecond.toString();
                    firestore.doc(id).set({
"title":postController.text.toString(),
"id":id
                    }).then((value) {
                       setState(() {
                      loading = false ;
                    });
                     Utils().toastMessage("post add");
                    }).onError((error, stackTrace) {
                       setState(() {
                      loading =false ;
                    });
                      Utils().toastMessage(error.toString());
                    });
                    //  String id =DateTime.now().millisecond.toString();
//                  databaseRef.child(id).//DateTime.now().millisecond.toString()).
//                 set({
//                   "title":postController.text.toString(),
//                   "id":id
//                   // "id":DateTime.now().millisecond.toString(),
//                 }).then((value) {
// Utils().toastMessage("Post Add");
//  setState(() {
//                       loading = false ;
//                     });
//                   }).onError((error, stackTrace) {
//                     Utils().toastMessage(error.toString());
                  
//                   setState(() {
                    // loading = false ;
                  

                
            // title: 'Add',
                // // loading: loading,
                //  onTap: (){
                //   // setState(() {
                //   //     loading = true ;
                //   //   });
                //   databaseRef.child("1").set({
                //     "title":postController.toString(),
                    // // "id":1,DateTime.now().millisecond.toString())
                    // "descr":postController.text.toString(),
                    // "id":1,
                    // DateTime.now().millisecond.toString()

                    // "id":DateTime.now().millisecond.toString()
//                   }).then((value) {
// Utils().toastMessage("Post Add");
//  setState(() {
//                       loading = false ;
//                     });
//                   }).onError((error, stackTrace) {
//                     Utils().toastMessage(error.toString());
//                   });
//                   setState(() {
//                     loading = false ;
//                   });


          //         String id  = DateTime.now().millisecondsSinceEpoch.toString() ;
          //         databaseRef.child(id).set({
          //           'title' : postController.text.toString() ,
          //           'id' : DateTime.now().millisecondsSinceEpoch.toString()
          //         }).then((value){
          //           Utils().toastMessage('Post added');
          //           setState(() {
          //             loading = false ;
          //           });
          //         }).onError((error, stackTrace){
          //           Utils().toastMessage(error.toString());
          //           setState(() {
          //             loading = false ;
          //           });
          //         });
          //   })
                    // ],
                  
  })]),
      ),
    );
  }


}

