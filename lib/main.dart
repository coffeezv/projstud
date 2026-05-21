import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wiki_reader/go_router.dart';
import 'package:wiki_reader/summary.dart';
import 'package:wiki_reader/summary_adapter.dart';
import 'package:hive/hive.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SummaryAdapter());
  await Hive.deleteBoxFromDisk('summaryHiveBox');
  await Hive.openBox<Summary>('summaryhivebox');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}