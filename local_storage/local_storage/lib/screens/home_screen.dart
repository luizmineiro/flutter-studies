import 'package:flutter/material.dart';
import 'package:local_storage/controllers/to_buy_list_controller.dart';
import 'package:provider/provider.dart';

import 'add_to_buy_item_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toBuyListCtrl = Provider.of<ToBuyListController>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value: toBuyListCtrl,
                    child: const AddToBuyItemScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
