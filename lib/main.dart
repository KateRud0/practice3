import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContentSwitcherScreen(),
    );
  }
}

class ContentSwitcherScreen extends StatefulWidget {
  @override
  _ContentSwitcherScreenState createState() => _ContentSwitcherScreenState();
}

class _ContentSwitcherScreenState extends State<ContentSwitcherScreen> {
  int _currentIndex = 0;

  List<Widget> _contentWidgets = [
    TextWidget(),
    ImageWidget(),
    ButtonWidget(),
    ListWidget(),
    ContainerWidget(),
  ];

  void _changeContent(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content Switcher'),
      ),
      body: Center(
        child: _contentWidgets[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeContent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            label: 'Button',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
            backgroundColor: Colors.orangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_square),
            label: 'Container',
            backgroundColor: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chipi-chipi Chapa-chapa!',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/chipichipichapachapa.gif'
        // width: 200,
        // height: 200,
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Вы нажали на кнопку!'),
            ),
          );// Add button functionality here
        },
        child: Text('Кнопка'),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Container',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
