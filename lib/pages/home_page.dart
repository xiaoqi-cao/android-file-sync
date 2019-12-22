import 'package:flutter/material.dart';

import 'local_file_page.dart';
import 'remote_file_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [LocalFilePage(), RemoteFilePage()];

  void onChangePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: onChangePage,
        itemBuilder: (context, index) => _pages[_pageIndex],
        itemCount: _pages.length,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("本地")),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), title: Text("远程"))
        ],
        currentIndex: _pageIndex,
        onTap: onChangePage,
        selectedItemColor: Colors.green,
      ),
    );
  }
}
