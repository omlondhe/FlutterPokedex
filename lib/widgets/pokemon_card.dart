import 'package:flutter/material.dart';
import 'package:pokedex/screens/details.dart';
import 'package:pokedex/widgets/pokemon_card_background.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';

class PokemonCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  void navigate(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Details(
          id: id,
          name: name,
          image: image,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation.drive(Tween(begin: 0, end: 1)),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 571),
        reverseTransitionDuration: const Duration(milliseconds: 571),
      ),
    );
  }

  BoxDecoration getContainerDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        enableFeedback: true,
        splashColor: Colors.red[50],
        onTap: () => navigate(context),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: getContainerDecoration(),
          child: Stack(
            children: [
              PokemonCardBackground(id: id),
              PokemonCardData(id: id, name: name, image: image),
            ],
          ),
        ),
      ),
    );
  }
}
