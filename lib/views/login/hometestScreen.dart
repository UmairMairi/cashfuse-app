import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTestScreen extends StatelessWidget {
  const HomeTestScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }
          else if(snapshot.hasData)
            {

              return  Container(
                child: Text("Login Successfull"),
              );
            }
          else if(snapshot.hasError)
          {

            return  Container(
              child: Text("error"),
            );
          }
          else
            {
              return Container(
                child: Text("Something went wrong"),
              );
            }
        },
      ),
    );
  }
}
