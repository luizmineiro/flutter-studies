import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_storage/models/hive_to_buy_model.dart';
import 'package:local_storage/repositories/sqflite/sqflite_to_buy_Local_data_repository.dart';
import 'controllers/storage_to_buy_list_controller.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HiveToBuyModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => StorageToBuyListController(
          SqfliteToBuyLocalDataRepository(),
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
