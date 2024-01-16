import 'package:flutter/material.dart';
import 'package:navegacao_flutter/screens/book_details_screen.dart';
import 'package:navegacao_flutter/widgets/title_row_widget.dart';

class BooksScreens extends StatelessWidget {
  const BooksScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exemplo de Navegação: Livros',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          TitleRowWidget(
            title: "Titulo do livro 1",
            labelButton: "Detalhes",
            onPressButton: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BookDetailsScreen(),
                settings: const RouteSettings(
                  arguments: {
                    'titulo': 'Livro 1',
                    'descricao': 'Essa é uma breve descrição do livro 1...'
                  },
                ),
              ),
            ),
          ),
          TitleRowWidget(
            title: "Titulo do livro 2",
            labelButton: "Detalhes",
            onPressButton: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BookDetailsScreen(),
                settings: const RouteSettings(
                  arguments: {
                    'titulo': 'Livro 2',
                    'descricao': 'Essa é uma breve descrição do livro 2...'
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
