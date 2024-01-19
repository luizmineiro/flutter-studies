import 'package:flutter/material.dart';

class GenderDropdownWidget extends StatelessWidget {
  final String gender;
  final void Function(String? s) onChange;
  final bool hasError;
  const GenderDropdownWidget({
    super.key,
    required this.gender,
    required this.onChange,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: hasError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: DropdownButton<String>(
              style: const TextStyle(fontSize: 18, color: Colors.black),
              borderRadius: BorderRadius.circular(12),
              isExpanded: true,
              value: gender,
              items: const [
                DropdownMenuItem(
                  value: 'Gênero',
                  child: Text('Gênero'),
                ),
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Masculino'),
                ),
                DropdownMenuItem(
                  value: 'Famele',
                  child: Text('Feminino'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Outro'),
                ),
              ],
              underline: const SizedBox.shrink(),
              onChanged: onChange,
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              "Por favor, selecione seu gênero",
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
