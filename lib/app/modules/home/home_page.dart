import 'package:api_games/app/modules/home/models/game_model.dart';
import 'package:api_games/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Observer(
        builder: (context) {
          if (_homeController.games.error != null) {
            return Center(
              child: FlatButton(
                onPressed: () {
                  _homeController.fetchGames();
                },
                child: Text("Press Again"),
              ),
            );
          } else if (_homeController.games.value == null) {
            return Center(child: CircularProgressIndicator());
          }

          List<GameModel> games = _homeController.games.value;
          return ListView.builder(
            itemCount: games.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(games[index].name),
              );
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.arrow_forward),
      //     onPressed: () {
      //       Modular.to.pushNamed("/other/${_homeController.text}");
      //     }),
    );
  }
}
