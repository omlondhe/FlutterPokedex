import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PokemonCardData extends StatelessWidget {
  final int id;
  final String image;
  final String name;

  const PokemonCardData({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Hero(
              tag: "image-$id",
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: image,
                fadeInCurve: Curves.easeInOut,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        const Divider(),
        Hero(
          tag: "name-$id",
          child: Material(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(21),
              ),
            ),
            child: Center(
              child: Text(
                "${name[0].toUpperCase()}${name.substring(1)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
