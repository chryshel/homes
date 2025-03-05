import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    print('dir before : $dir');
    dir = dir.replaceAll('/test', '');
    print('dir after : $dir');
  }
  print('dir final : $dir/test/$name');
  return File('$dir/test/$name').readAsStringSync();
}
