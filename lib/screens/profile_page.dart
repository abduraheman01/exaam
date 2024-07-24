import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _name;
  String? _mobile;
  String? _imageUrl;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    DocumentSnapshot userDoc = await _firestore.collection('users').doc(widget.username).get();
    if (userDoc.exists) {
      setState(() {
        _name = userDoc['name'];
        _mobile = userDoc['mobile'];
        _imageUrl = userDoc['image'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _imageUrl == null
                ? CircleAvatar(radius: 50, child: Icon(Icons.person))
                : CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(_imageUrl!),
                  ),
            SizedBox(height: 10),
            _name == null
                ? CircularProgressIndicator()
                : Text('Name: $_name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            _mobile == null
                ? CircularProgressIndicator()
                : Text('Mobile: $_mobile', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/updateProfile');
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
