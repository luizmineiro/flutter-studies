import 'package:flutter/material.dart';
import 'package:forms/widgets/custom_text_field_widget.dart';
import 'package:forms/widgets/gender_dropdown_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //* chave responsavel pela validação do formulario
  final _formKey = GlobalKey<FormState>();

  final _nameTEC = TextEditingController();
  final _nameFN = FocusNode();

  final _emailTEC = TextEditingController();
  final _emailFN = FocusNode();

  final _passwordTEC = TextEditingController();
  final _passwordFN = FocusNode();

  String _gender = "Gênero";
  bool _genderHasError = false;

  bool _formSubmitted = false;

  void _onSubmitForm() {
    setState(() {
      _genderHasError = false;
      _formSubmitted = true;

      if (_gender == "Gênero") {
        _genderHasError = true;
      }

      if (_formKey.currentState!.validate() && !_genderHasError) {
        print("FORM VALIDO");
      } else {
        print("FORM INVALIDO");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forms App',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFieldWidget(
                  textEditingController: _nameTEC,
                  onFieldSubmited: (_) => _emailFN.requestFocus(),
                  focusNode: _nameFN,
                  label: "Nome",
                  validator: (String? name) {
                    if (name == null || name.isEmpty) {
                      return "Por favor, insira o nome";
                    }
                    if (name.length > 50) {
                      return "O seu nome deve conter 50 caracteres ou menos";
                    }
                    return null;
                    //* Parei no 26:52
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFieldWidget(
                  textEditingController: _emailTEC,
                  onFieldSubmited: (_) => _passwordFN.requestFocus(),
                  focusNode: _emailFN,
                  label: "Email",
                  validator: (String? email) {
                    if (email == null || email.isEmpty) {
                      return 'Por favor, insira um email';
                    }

                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email)) {
                      return 'Por favor insira um email valido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFieldWidget(
                  textEditingController: _passwordTEC,
                  onFieldSubmited: (_) => _onSubmitForm(),
                  focusNode: _passwordFN,
                  label: 'Senha',
                  validator: (String? password) {
                    if (password == null || password.isEmpty) {
                      return 'Por favor insira uma senha';
                    }

                    if (password.length < 6) {
                      return 'Por fafor, insira uma senha com pelo menos 6 caracteres';
                    }
                    return null;
                  },
                  isPassword: true,
                ),
                const SizedBox(height: 8),
                GenderDropdownWidget(
                  gender: _gender,
                  onChange: (String? gender) {
                    setState(() {
                      _gender = gender ?? "Gênero";
                    });
                  },
                  hasError: _genderHasError,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _onSubmitForm,
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
