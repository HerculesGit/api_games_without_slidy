import 'package:api_games/app/modules/home/models/game_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/*
O Repository Pattern permite que possamos encapsular a lógica de acesso a dados,
 através da injeção de dependência, os dados poderiam estar em uma API, 
 em um banco de dados ou até em um arquivo.
*/
class GameRepository {
  final Dio dio;
  GameRepository({@required this.dio});

  Future<List<GameModel>> getAllGames() async {
    // nao precisa mos usar assim:
    //   dio.get("$BASE_URL/pokemon");
    // por que usamos a baseUrl do Dio na injecao de dependencia
    // dentro do arquivo AppModule
    final response = await dio.get("/pokemon");
    final List<GameModel> games = [];
    for (var item in (response.data['results'] as List)) {
      GameModel model = GameModel(name: item['name']);
      games.add(model);
    }
    return games;
  }
}
