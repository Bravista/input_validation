import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  // Attribute
  // (keine)

  // Konstruktor
  const FormScreen({super.key});

  // Methoden
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          child: Column(children: [
            const SizedBox(
              height: 220,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Email"),
              ),
              autovalidateMode: AutovalidateMode.always,
              validator: validateEmail,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Passwort"),
              ),
              autovalidateMode: AutovalidateMode.always,
              validator: validatePw,
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ]),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    // TODO: implementiere hier die Logik, die im Task Sheet beschrieben ist
    if (input == null || input.isEmpty) {
      return "Email darf nicht leer sein";
    } else if (input.length < 6) {
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
  // TODO: implementiere hier die Logik, die im Task Sheet beschrieben ist
  if (input == null || input.isEmpty) {
    return "Passwort darf nicht leer sein";
  } else if (input.length < 6 || input.length > 12) {
    return "Passwort muss zwischen 6 und 12 Zeichen lang sein";
  }
  return null;
}
