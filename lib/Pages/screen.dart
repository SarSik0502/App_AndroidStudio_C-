import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('UnLimit', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {
                  Navigator.pushReplacementNamed(context, '/todo');
                },
                icon: Icon(Icons.not_started_outlined, size: 50,),
                splashColor: Colors.black,
                ),
              ]
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Text('Войти', style: TextStyle(fontSize: 30),),
              ]
            )
          ],
        ),
    );
  }
}
