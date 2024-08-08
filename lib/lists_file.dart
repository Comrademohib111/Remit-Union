import 'package:flutter/material.dart';

class User {
  final String id;
  String name;
  String email;
  int age;

  User({required this.id, required this.name, required this.email, required this.age,});
}

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<User> sampleUsers = [
    User(id: '1', name: 'Comrade', email: 'test@gmail.com', age: 20),
    User(id: '2', name: 'John Doe', email: 'john@email.com', age: 25),
    User(id: '3', name: 'Jane Smith', email: 'jane@email.com', age: 30),
    User(id: '4', name: 'Alice Johnson', email: 'alice@email.com', age: 28),
    User(id: '5', name: 'Comrade', email: 'test@gmail.com', age: 20),
    User(id: '6', name: 'John Doe', email: 'john@email.com', age: 25),
    User(id: '7', name: 'Jane Smith', email: 'jane@email.com', age: 30),
    User(id: '8', name: 'Alice Johnson', email: 'alice@email.com', age: 28),    User(id: '1', name: 'Comrade', email: 'test@gmail.com', age: 20),
    User(id: '9', name: 'John Doe', email: 'john@email.com', age: 25),
    User(id: '10', name: 'Jane Smith', email: 'jane@email.com', age: 30),
    User(id: '11', name: 'Alice Johnson', email: 'alice@email.com', age: 28),    User(id: '1', name: 'Comrade', email: 'test@gmail.com', age: 20),
    User(id: '12', name: 'John Doe', email: 'john@email.com', age: 25),
    User(id: '13', name: 'Jane Smith', email: 'jane@email.com', age: 30),
    User(id: '14', name: 'Alice Johnson', email: 'alice@email.com', age: 28),
    // Other users...
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  List<User> get _filteredUsers {
    if (_searchQuery.isEmpty) {
      return sampleUsers;
    } else {
      return sampleUsers.where((user) {
        return user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.email.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  void _addUser(User user) {
    setState(() {
      sampleUsers.add(user);
    });
  }

  void _deleteUser(int index) {
    setState(() {
      sampleUsers.removeAt(index);
    });
  }

  void _showAddUserDialog() {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _ageController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                final name = _nameController.text;
                final email = _emailController.text;
                final age = int.tryParse(_ageController.text) ?? 0;

                if (name.isNotEmpty && email.isNotEmpty && age > 0) {
                  _addUser(User(id: DateTime.now().toString(), name: name, email: email, age: age));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _duplicateUser(User user) {
    final newUser = User(
      id: DateTime.now().toString(),
      name: user.name,
      email: user.email,
      age: user.age,
    );
    _addUser(newUser);
  }

  void _updateUserDetails(User user) {
    final _nameController = TextEditingController(text: user.name);
    final _emailController = TextEditingController(text: user.email);
    final _ageController = TextEditingController(text: user.age.toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update User Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                final updatedName = _nameController.text;
                final updatedEmail = _emailController.text;
                final updatedAge = int.tryParse(_ageController.text) ?? user.age;

                if (updatedName.isNotEmpty && updatedEmail.isNotEmpty && updatedAge > 0) {
                  setState(() {
                    user.name = updatedName;
                    user.email = updatedEmail;
                    user.age = updatedAge;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return UserListItem(
                  user: _filteredUsers[index],
                  onDelete: () => _deleteUser(index),
                  onAdd: () => _duplicateUser(_filteredUsers[index]),
                  onAddit: () => _updateUserDetails(_filteredUsers[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUserDialog,
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onDelete;
  final VoidCallback onAdd;
  final VoidCallback onAddit;

  const UserListItem({
    super.key,
    required this.user,
    required this.onDelete,
    required this.onAdd,
    required this.onAddit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(user.email),
                const SizedBox(height: 8),
                Text('Age: ${user.age}'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onAddit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
