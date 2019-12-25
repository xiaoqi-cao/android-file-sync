import 'dart:io';

import 'package:flutter/material.dart';

import 'file_item_view.dart';

class FileListView extends StatefulWidget {
  const FileListView({
    Key key,
    this.directory,
  })  : assert(directory != null),
        super(key: key);

  final Directory directory;

  @override
  _FileListViewState createState() => _FileListViewState();
}

class _FileListViewState extends State<FileListView> {
  Directory _currentDir;
  List<FileSystemEntity> _files;

  @override
  void initState() {
    super.initState();
    _currentDir = widget.directory;
    _files = _currentDir.listSync();
  }

  String getFileName(int index) {
    return _files[index].path;
  }

  void _gotoSubDir(FileSystemEntity file) {
    setState(() {
      _currentDir = file as Directory;
      _files = _currentDir.listSync();
    });
  }

  void _gotoParentDir() {
    setState(() {
      _currentDir = _currentDir.parent;
      _files = _currentDir.listSync();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        title: Text("Folder: ${_currentDir.path}"),
        trailing:
            IconButton(icon: Icon(Icons.arrow_back), onPressed: _gotoParentDir),
      ),
      Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) => FileItemView(
            file: _files[index],
            onPressed: _gotoSubDir,
          ),
          separatorBuilder: (context, index) => Divider(color: Colors.green),
          itemCount: _files.length,
        ),
      ),
    ]);
  }
}
