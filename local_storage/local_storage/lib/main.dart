import 'package:flutter/material.dart';
import 'package:local_storage/repositories/shared_preferences/shared_preferences_to_buy_local_data_repository.dart';
import 'controllers/storage_to_buy_list_controller.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
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
          SharedPreferencesToBuyLocalDataRepository()
        ),
        child: const HomeScreen(),
      ),
    );
  }
}
