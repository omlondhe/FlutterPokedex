import 'package:flutter/material.dart';

class PokemonCardBackground extends StatelessWidget {
  final int id;
  const PokemonCardBackground({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$id",
      style: TextStyle(
        fontSize: 101,
        fontWeight: FontWeight.bold,
        color: Colors.grey[200],
      ),
    );
  }
}
