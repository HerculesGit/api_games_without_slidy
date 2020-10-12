import 'package:api_games/app/app_widget.dart';
import 'package:api_games/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

/*
tipar eh bom pois o modular ainda esta em devensolvimento


*/
class AppModule extends MainModule {
  // Responsavel pela ingecao de dependencia
  @override
  List<Bind> get binds => [
        // Esses sao as dependencias injetadas
        Bind((i) => AppController()),
      ];

  // Responsavel por configurar as rotas nomeadas do projeto
  @override
  List<ModularRouter> get routers => [
        // Rota inicial do app eh onde tem o app_module, precisamos colocar o
        // Modular.initialRout e o module eh o proximo modulo
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  // Responsavel por dizer qual sera o widget principal do meu modulo,
  // no caso, AppWiget, que chamara a rota inicial '/'
  @override
  Widget get bootstrap => AppWidget();
}
