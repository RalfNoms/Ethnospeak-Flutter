
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore dependency

class DatabaseServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to insert user data into Firestore
  Future<void> insertUsers(Map<String, dynamic> usersInfoMap, String id) async {
    await _firestore.collection('Users').doc(id).set(usersInfoMap);
  }

  // Method to fetch user data from Firestore
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    DocumentSnapshot userDoc = await _firestore.collection('Users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.data() as Map<String, dynamic>?;
    }
    return null;
  }

  // Method to update a specific field in Firestore
   Future<void> updateUserFields(String userId, Map<String, dynamic> updatedFields) async {
    try {
      await _firestore.collection('Users').doc(userId).update(updatedFields);
    } catch (error) {
      print("Error updating user fields: $error");
      throw Exception("Failed to update user fields");
    }
  }
}

