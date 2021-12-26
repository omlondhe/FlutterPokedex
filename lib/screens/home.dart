import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/api/pokeapi.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/widgets/pokemon_grid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemon = List.empty();

  @override
  void initState() {
    super.initState();
    getPokemonFromPokeApi();
  }

  void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
          return Pokemon.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 251,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "hero",
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: FlutterLogo(),
                  ),
                ),
              ),
              collapseMode: CollapseMode.parallax,
              stretchModes: const [
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
          ),
          const SliverPadding(padding: EdgeInsets.all(4)),
          PokemonGrid(pokemon: pokemon)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "fab",
        onPressed: () {},
        tooltip: 'Share',
        child: const Icon(
          Icons.share_rounded,
        ),
      ),
    );
  }
}
