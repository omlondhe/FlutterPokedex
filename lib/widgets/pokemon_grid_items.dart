import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

Widget pokemonGridItem(
  BuildContext context,
  int index,
  Animation<double> animation,
  List<Pokemon> pokemon,
) =>
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: pokemon.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : PokemonCard(
                id: pokemon.elementAt(index).id,
                name: pokemon.elementAt(index).name,
                image: pokemon.elementAt(index).img,
              ),
      ),
    );
