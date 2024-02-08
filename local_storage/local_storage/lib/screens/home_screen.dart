import 'package:flutter/material.dart';
import 'package:local_storage/controllers/storage_to_buy_list_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/to_buy_item_list_widget.dart';
import 'add_to_buy_item_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final toBuyListCtrl = Provider.of<StorageToBuyListController>(context);
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Lista de compras",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      body: toBuyListCtrl.toBuyList.isEmpty
          ? const Center(
              child: Text(
                "Você ainda não possui nenhum item na lista de compras",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: toBuyListCtrl.toBuyList.length,
              itemBuilder: (_, index) => ToBuyItemListWidget(
                toBuyModel: toBuyListCtrl.toBuyList[index],
              ),
            ),
    );
  }
}
