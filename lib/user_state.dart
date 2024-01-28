import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_todo/screens/auth/login.dart';
import 'package:learning_todo/screens/tasks_screen.dart';



class UserState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.data == null) {
            print('user is not signed in yet');
            return Login();
          } else if (userSnapshot.hasData) {
            print('user is already signed in');
            return TasksScreen();
          } else if (userSnapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text('An error has been occured in initialization'),
              ),
            );
          } else if (userSnapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
          return Scaffold(
            body: Center(
              child: Text('Something went wrong '),
            ),
          );
        });
  }
}
