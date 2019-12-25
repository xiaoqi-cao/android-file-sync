import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';

typedef FileItemCallback = void Function(FileSystemEntity file);

class FileItemView extends StatelessWidget {
  const FileItemView({
    Key key,
    this.file,
    @required this.onPressed,
  })
      : assert(file != null),
        super(key: key);

  final FileSystemEntity file;
  final FileItemCallback onPressed;

  Widget getTrailingIcon() {
    if (file is Directory) {
      return Icon(Icons.navigate_next);
    }
    return null;
  }

  void _onTap() {
    onPressed(file);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.folder),
      title: Text(file.path),
      trailing: getTrailingIcon(),
      onTap: _onTap,
    );
  }
}
