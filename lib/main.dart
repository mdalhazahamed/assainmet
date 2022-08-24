import 'dart:io';

import 'package:database/assainment.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
Directory document = await getApplicationDocumentsDirectory();
Hive.init(document.path);
await Hive.openBox<String> ("users");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home:Assainment() ,
    );
  }
}
