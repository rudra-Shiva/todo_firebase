import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning_todo/user_state.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Center(
                  child: Text('App is being initialized'),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text(snapshot.error.toString()),),
                    const Center(
                      child: Text('An error has been occured in main'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter workos',
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEDE7DC),
            primarySwatch: Colors.blue,
          ),
          home: UserState(),
        );
      },
    );
  }
}
