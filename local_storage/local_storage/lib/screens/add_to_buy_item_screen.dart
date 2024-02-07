import 'package:flutter/material.dart';
import 'package:local_storage/controllers/to_buy_list_controller.dart';
import 'package:provider/provider.dart';

class AddToBuyItemScreen extends StatefulWidget {
  const AddToBuyItemScreen({super.key});

  @override
  State<AddToBuyItemScreen> createState() => _AddToBuyItemScreenState();
}

class _AddToBuyItemScreenState extends State<AddToBuyItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleTEC = TextEditingController();
  final _descriptionTEC = TextEditingController();

  void _onSubmitForm(ToBuyListController buyListController) {
    if (_formKey.currentState!.validate()) {
      buyListController.onAddToBuyItem(_titleTEC.text, _descriptionTEC.text);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final toBuyListCtrl = Provider.of<ToBuyListController>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEC,
                  decoration: const InputDecoration(
                    hintText: "Título",
                  ),
                  validator: (title) {
                    if (title == null || title.isEmpty) {
                      return 'Por favor, insira um titulo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descriptionTEC,
                  decoration: const InputDecoration(
                    hintText: "Descrição",
                  ),
                  validator: (description) {
                    if (description == null || description.isEmpty) {
                      return 'Por favor, insira uma descrição';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _onSubmitForm(toBuyListCtrl),
                  child: const Text("Adicionar Item"),
                )
              ],
            ),
          ),
        ));
  }
}
