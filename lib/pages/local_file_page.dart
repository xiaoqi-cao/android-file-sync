import 'dart:io';

import 'package:file_manager/views/file_list_view.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LocalFilePage extends StatefulWidget {
  @override
  _LocalFilePageState createState() => _LocalFilePageState();
}

class _LocalFilePageState extends State<LocalFilePage> {
  Directory _directory;

  @override
  void initState() {
    super.initState();
    initRootDir();
  }

  Future<void> initRootDir() async {
    Directory directory = await getApplicationDocumentsDirectory();
    setState(() {
      _directory = directory;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_directory == null) {
      return Center(
        child: Text("Loading..."),
      );
    } else {
      return FileListView(
        directory: _directory,
      );
    }
  }
}
