import 'package:flutter/material.dart';

class DetailData extends StatefulWidget {
  final int id;
  const DetailData({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailData> createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData>
    with SingleTickerProviderStateMixin {
  late final AnimationController _slideAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation<Offset> _slideAnimation =
      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(_slideAnimationController);

  @override
  void initState() {
    super.initState();
    _slideAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _slideAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _slideAnimationController.reverse();
        return Future.delayed(const Duration(milliseconds: 100))
            .then((value) => true);
      },
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
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
        ),
      ),
    );
  }
}
