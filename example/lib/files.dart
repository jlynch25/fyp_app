import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String?> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<Directory?> localDir(String dirPath) async {
  // final localPath = await Mylib.localPath;
  final localPath = await getApplicationDocumentsDirectory();
  new Directory('${localPath.path}/tmp').create(recursive: true);
  new Directory('${localPath.path}/$dirPath').create(recursive: true);
  return Directory('${localPath.path}/$dirPath');
}

Future<String?> blockchainExists() async {
  final path = await localDir('tmp/blocks_3000');
  if (path!.existsSync()) {
    final lockfile = File('$path/LOCK');
    if (lockfile.existsSync()) {
      lockfile.deleteSync();
    }
    return "true";
  } else {
    return "false";
  }
}
