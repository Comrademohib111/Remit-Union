import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Colors.redAccent),
      appBar: AppBar(
        title: const Text('Account'),
        leading:  IconButton( icon:  const Icon(Icons.arrow_back), onPressed: () {
          Navigator.of(context).pop();
        },hoverColor: Colors.amberAccent,),
      ),
      body: ListView(
        children:  [
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Security notifications'),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          const ListTile(
            leading: Icon(Icons.vpn_key),
            title: Text('Passkeys'),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Email address'),
          ),
          const ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Two-step verification'),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('Change number'),
          ),
          const ListTile(
            leading: Icon(Icons.info),
            title: Text('Request account info'),
          ),
          const ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Add account'),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete account'),
          ),
        ],
      ),
    );
  }
}
