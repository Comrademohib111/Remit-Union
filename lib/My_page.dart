import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.blueAccent),
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: (Colors.red),
          onPressed: () {
            Navigator.pushNamed(context, '/register');          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg'),

              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'Comrade Mohib',
                border: InputBorder.none,
              ),

              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Allah pak please please please fulfill my all hopes and dreams (Ameen) ',
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

