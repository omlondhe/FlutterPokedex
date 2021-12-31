import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/pokemon_grid_items.dart';

class PokemonGrid extends StatefulWidget {
  final List<Pokemon> pokemon;
  const PokemonGrid({Key? key, required this.pokemon}) : super(key: key);

  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
            ? 4
            : (width > 450)
                ? 3
                : 2;

    return LiveSliverGrid(
      itemCount: 250,
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.pokemon.isEmpty ? 1 : crossAxisCount,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 200 / 244,
      ),
      showItemInterval: const Duration(milliseconds: 150),
      showItemDuration: const Duration(milliseconds: 750),
      visibleFraction: 0.001,
      itemBuilder: (context, index, animation) {
        return pokemonGridItem(context, index, animation, widget.pokemon);
      },
    );
  }
}
