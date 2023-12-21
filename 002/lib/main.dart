import 'package:flutter/material.dart';

void main() {
  runApp(MyMemoApp());
}

class MyMemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Memo', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                    onPressed: () {
                      print('clicked');
                    },
                    style: IconButton.styleFrom(foregroundColor: Colors.white),
                    icon: Icon(Icons.create)),
              ],
            ),
            body: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('item $index'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        print('delete $index');
                      },
                    ),
                  );
                })));
  }
}
