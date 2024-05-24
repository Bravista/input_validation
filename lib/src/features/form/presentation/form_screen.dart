import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  final emailController = TextEditingController();
  final passwortController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // (keine)

  // Konstruktor
  FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: formKey,
            child: Column(children: [
              const SizedBox(
                height: 250,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: validateEmail,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: passwortController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Passwort"),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: validatePw,
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    // Die Form ist valide
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Eingaben sind korrekt!'),
                      ),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FormScreen()));
                  } else {
                    // Die Form ist nicht valide
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Bitte korrigiere deine Eingaben.')),
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email darf nicht leer sein";
    } else if (input.length <= 5) {
      return "Email muss mindestens aus 6 Zeichen bestehen";
    } else if (!input.contains("@")) {
      return "Email muss @ enthalten";
    } else if (!(input.endsWith(".com") || input.endsWith(".de"))) {
      return "Email muss mit .com oder .de enden";
    }
    return null;
  }
}

String? validatePw(String? input) {
  if (input == null || input.isEmpty) {
    return "Passwort darf nicht leer sein";
  } else if (input.length < 6 || input.length > 12) {
    return "Passwort muss zwischen 6 und 12 Zeichen lang sein";
  }
  return null;
}
