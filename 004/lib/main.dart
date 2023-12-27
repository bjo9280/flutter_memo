import 'package:flutter/material.dart';

void main() {
  runApp(MyMemoApp());
}

// MyMemoApp 클래스: StatelessWidget을 상속하는 메모 앱의 진입점
class MyMemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp을 반환
    return MaterialApp(
      home: MyMemoAppPage(), // 홈 페이지로 _MyMemoApp 사용
    );
  }
}

// _MyMemoApp 클래스: StatefulWidget을 상속하는 메모 앱의 홈 페이지
class MyMemoAppPage extends StatefulWidget {
  @override
  State<MyMemoAppPage> createState() => _MyMemoAppPageState();
}

// _MyMemoAppState 클래스: _MyMemoApp의 상태를 관리하는 State 클래스
class _MyMemoAppPageState extends State<MyMemoAppPage> {
  List<String> items = ['Item 0', 'Item 1', 'Item 2']; // 메모 아이템 목록

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          // 메모 추가 버튼
          IconButton(
            onPressed: () {
              setState(() {
                items.add('New Item'); // 새로운 아이템 추가
                print(items);
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
          // 각 메모 아이템을 나타내는 ListTile
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  items.removeAt(index); // 아이템 삭제
                  print(items);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
