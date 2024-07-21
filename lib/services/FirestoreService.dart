import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(User user) async {
    try {
      await _db.collection('users').add(user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<List<User>> fetchUsers() async {
    try {
      final snapshot = await _db.collection('users').get();
      return snapshot.docs.map((doc) => User.fromMap(doc.data())).toList();
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }

  Future<User?> getUser(String userName) async {
    try {
      final snapshot = await _db.collection('users').where('userName', isEqualTo: userName).get();
      if (snapshot.docs.isEmpty) return null;
      return User.fromMap(snapshot.docs.first.data());
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }
}

