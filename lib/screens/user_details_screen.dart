import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(user['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: ${user['email']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Phone: ${user['phone']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Address: ${user['address']['street']}, ${user['address']['city']}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}