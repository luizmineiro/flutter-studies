// import 'package:flutter/material.dart';

// void main() {
//   runApp(const WidgetInicializador());
// }

// class WidgetInicializador extends StatelessWidget {
//   const WidgetInicializador({super.key});

//   @override
//   //* BuildContext serve para Widget saber onde esta localizado na arvore
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeWidget(),
//     );
//   }
// }

// class HomeWidget extends StatelessWidget {
//   const HomeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }

// O que é estado?
// Estado são dados que são usados no seu aplicativo

//Exemplo:
// Saber se um usuario esta logado ou não
// Saber qual widget deve ser usado na tela

//* ciclo de vida é quando temos metodos que serão executados antes de construirmos nosso widget

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key}) {
    print("Construtor do Myapp");
  }

  @override
  State<MyApp> createState() {
    print("Invocando metodo createState");
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _contador = 0;

  void onPress() {
    setState(() {
      _contador++;
    });
  }

  @override
  void initState() {
    print("Inicializando o estado invocado!!!");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("Did Change Dependencies invocado !!!");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("Dispose invocado");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contador"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_contador.toString()),
              ElevatedButton(
                onPressed: onPress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text("Incrementar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
