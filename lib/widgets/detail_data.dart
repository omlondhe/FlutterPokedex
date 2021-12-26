import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  final int id;
  const DetailData({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: 500,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(51),
          topRight: Radius.circular(51),
        ),
      ),
      child: Column(
        children: const [Text("To be continued....")],
      ),
    );
  }
}
