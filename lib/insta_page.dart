import 'package:flutter/material.dart';

class Instapage extends StatefulWidget {
  @override
  _InstapageScreenState createState() => _InstapageScreenState();
}

class _InstapageScreenState extends State<Instapage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pronounsController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        // Implement camera functionality
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Comrade Mohib',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                hintText: 'Comrade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: pronounsController,
              decoration: const InputDecoration(
                labelText: 'Pronouns',
                hintText: 'Pronoun',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: 'Bio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: gender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
              ),
              items: <String>['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement save functionality
              },
              child: const Text('Save'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implement switch to professional account functionality
              },
              child: const Text('Switch to Another account'),
            ),
          ],
        ),
      ),
    );
  }
}
