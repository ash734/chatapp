import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/*
List<Map<String,dynamic>> = [
{
'email': test@gmail.com,
'id': ..,
},
{
'email': test@gmail.com,
'id': ..,
},
];
*/

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
// go through each individual user
        final user = doc.data();

// return user
        return user;
      }).toList();
    });
  }
}
