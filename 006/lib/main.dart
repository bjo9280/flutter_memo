import 'package:flutter/material.dart';

void main() {
  runApp(MyMemoApp());
}

class MyMemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMemoAppPage(),
    );
  }
}

class MyMemoAppPage extends StatefulWidget {
  @override
  State<MyMemoAppPage> createState() => _MyMemoAppPageState();
}

class _MyMemoAppPageState extends State<MyMemoAppPage> {
  List<String> items = ['Item 0', 'Item 1', 'Item 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MemoInputPage()),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    items.add(value); // Add the new item
                  });
                }
              });
            },
            style: IconButton.styleFrom(foregroundColor: Colors.white),
            icon: Icon(Icons.create),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

// MemoInputPage: 메모를 추가하는 페이지를 나타내는 StatelessWidget
class MemoInputPage extends StatelessWidget {
  // 텍스트 필드의 상태를 관리하는 컨트롤러
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Memo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter Memo'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Pass the entered text back to the calling page
                Navigator.pop(context, _textController.text);
              },
              child: Text('Add Memo'),
            ),
          ],
        ),
      ),
    );
  }
}
