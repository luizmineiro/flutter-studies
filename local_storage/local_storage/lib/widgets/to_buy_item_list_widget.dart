import 'package:flutter/material.dart';
import 'package:local_storage/controllers/storage_to_buy_list_controller.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:provider/provider.dart';

class ToBuyItemListWidget extends StatelessWidget {
  final ToBuyModel toBuyModel;
  const ToBuyItemListWidget({super.key, required this.toBuyModel});

  @override
  Widget build(BuildContext context) {
    final toBuyListCtrl = Provider.of<StorageToBuyListController>(context);
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 7,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toBuyModel.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  toBuyModel.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () => toBuyListCtrl.onDeleteToBuyItem(toBuyModel.id),
            icon: const Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
          )
        ],
      ),
    );
  }
}
