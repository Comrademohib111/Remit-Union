import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Yes'),
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
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.teal,
              padding:  EdgeInsets.all(16.0),
              child:  Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child:ClipOval(
                      //radius: 40,
                      // borderRadius: BorderRadius.circular(50.0),
                      // backgroundImage:  const AssetImage('assets/images/profile.png'),
                      child: Image.asset('assets/images/img_1.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,),
                  )),
                 const SizedBox(height: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comrade Mohib ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'test321@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.verified,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text('Account information'),
              subtitle: const Text('Receive exclusive offer via Email & SMS'),
              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {
                Navigator.pushNamed(context, '/account');
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_center),
              title: const Text('List view page'),
              subtitle: const Text('information Name, email and User Id'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle tap
                Navigator.pushNamed(context, '/UserListView');

              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Instagram Page'),
              subtitle: const Text('Connect to the Insta.page'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle tap
                Navigator.pushNamed(context, '/instapage');

              },
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Transfomation page'),
              subtitle: const Text('Receive exclusive offer via Email & SMS'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {

                // Handle tap
                Navigator.pushNamed(context, '/TransactionListScreen');

              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Transaction Notification'),
              subtitle: const Text('Receive exclusive offer via Email & SMS'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/transactionpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_box_outlined),
              title: const Text('BeneficiaryListPage'),
              subtitle: const Text('Manage your notifications and message'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/Beneficiary');

                //Handle tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              subtitle: const Text('Information about remit union'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {

                Navigator.pushNamed(context, '/my page');
                // Handle tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.power_settings_new_outlined, color: Colors.red),
              title: const Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                _showLogoutDialog(context);

              },
            ),
          ],
        ),
      ),
    );
  }
}


