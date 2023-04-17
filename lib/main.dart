import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqllite_example/dbhelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbhelper = Databasehelper.instance;

  void insertdata() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: 'kinjal',
      Databasehelper.columnage: 20,
    };
    final id = await dbhelper.insert(row);
    print(id);
  }

  void queryall() async {
    var allows = await dbhelper.queryall();
    allows.forEach((row) {
      print("row$row");
    });
  }

  void queryspecific() async {
    var allows = await dbhelper.queryspecific(18);
    log(allows.toString());
  }

  void delete() async {
    var id = await dbhelper.deletedata(2);
    log(id.toString());
  }

  void upadate() async {
    var id = await dbhelper.update(4);
    log(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SqlLite Example'),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: insertdata, child: Text('INSERT')),
            ElevatedButton(onPressed: queryall, child: Text('QUERY')),
            ElevatedButton(
                onPressed: queryspecific, child: Text('QUERY SPECIFIC')),
            ElevatedButton(onPressed: upadate, child: Text('UPDATE')),
            ElevatedButton(onPressed: delete, child: Text('DELETE')),
          ],
        ),
      ),
    );
  }
}
