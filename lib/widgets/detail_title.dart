import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final int id;
  final String name;
  const DetailTitle({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(11, 4, 11, 4),
      margin: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(51),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: "$id",
            child: Material(
              color: Colors.red[100],
              type: MaterialType.transparency,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(21),
                ),
              ),
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(51),
                  color: Colors.red[100],
                ),
                child: Center(
                  child: Text(
                    id.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Hero(
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
                labelPadding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                backgroundColor: Colors.white,
                label: Text(
                  "${name[0].toUpperCase()}${name.substring(1)}",
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
