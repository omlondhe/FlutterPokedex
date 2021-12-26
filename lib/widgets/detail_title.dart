import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final int id;
  final String name;
  const DetailTitle({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "name-$id",
      child: Material(
        color: Colors.white,
        type: MaterialType.transparency,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(21),
          ),
        ),
        child: Chip(
          backgroundColor: Colors.white,
          label: Text(
            "${name[0].toUpperCase()}${name.substring(1)}",
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          avatar: CircleAvatar(
            child: Text(
              id.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
