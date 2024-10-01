import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var chase;
  List group = ['СПБГУ', 'Всшая Проба'];


  @override
  void initState() {
    super.initState();
  }

  void menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('MENU'), backgroundColor: Colors.black,),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (Remove) => false);
                    },
                      child: Text('Вернуться в начало', style: TextStyle(fontSize: 25),),
                    )
                  ]
              )
            ],
          ),
        );
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Олимпиады', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: menuOpen,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: group.length,
          itemBuilder: (BuildContext cont, int ind) {
            return Dismissible(
                key: Key(group[ind]),
                child: Card(
                  child: ListTile(
                    textColor: Colors.blue,
                    title: Text(group[ind]),
                    trailing: TextButton(
                      child: Text('Информация', style: TextStyle(color: Colors.green),),
                      onPressed: () {
                        showDialog(context: context, builder: (BuildContext cont) {
                          return AlertDialog(
                            title: Text('Информация', style: TextStyle(color: Colors.green),),
                            content: Text('Идет первый тур: 17 октябоя - 1 ноября'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK')
                              )
                            ],
                          );
                        });
                      },
                    ),
                  ),
                ),
              onDismissed: (direction) {
                  setState(() {
                    group.removeAt(ind);
                  });
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext cont) {
            return AlertDialog(
              title: Text('Добавить олимпиаду'),
              content: TextField(
                onChanged: (String buy) {
                  setState(() {
                    chase = buy;
                  });
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    group.add(chase);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Добавить')
                )
              ],
            );
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
