// Apenas a estrutura do MaterialApp

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api Games",
      theme: ThemeData(
        primaryColor: Colors.red,
      ),

      // navegação do MODULAR é muito importante adicionarmos o navigatorKey:
      navigatorKey: Modular.navigatorKey,
      initialRoute: '/',

      // Responsável por gerar rotas dinamicas
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
