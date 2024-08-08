import 'package:app_drive/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app_drive/login_page.dart';
import 'package:app_drive/register_page.dart';
import 'package:app_drive/account_page.dart';
import 'package:app_drive/My_page.dart';
import 'package:app_drive/insta_page.dart';
import 'package:app_drive/transaction_page.dart';
import 'package:app_drive/Beneficiary_page.dart';
import 'package:app_drive/transfomation_page.dart';
import 'package:app_drive/lists_file.dart';

void main() {
  runApp(const MyApp());
  // User user = User(id: '1', name: 'Comrade', email: 'test@gmail.com', age: 20);
  // User(id: '1', name: 'John Doe', email: 'john@email.com', age: 25);
  // User(id: '2', name: 'Jane Smith', email: 'jane@email.com', age: 30);
  // User(id: '3', name: 'Alice Johnson', email: 'alice@email.com', age: 28);
  //
  // // Converting the User instance to JSON
  // Map<String, dynamic> userJson = user.toJson();
  // print('User to JSON: $userJson');
  //
  // // Creating a User instance from JSON
  // User newUser = User.fromJson(userJson);
  // print('User from JSON: ${newUser.name}, ${newUser.email}, ${newUser.age}');

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remit Union',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
        '/register': (context) => const Register(),
        '/account': (context) => const Account(),
        '/my page': (context) => const Mypage(),
        '/instapage': (context) => Instapage(),
        '/transactionpage': (context) => TransactionPage(),
        '/Beneficiary': (context) => BeneficiaryListPage(),
        '/TransactionListScreen': (context) => TransactionListScreen(),
        '/UserListView': (context) => const UserListView(),




      },
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: false),
    );
  }
}
