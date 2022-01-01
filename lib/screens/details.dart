import 'package:flutter/material.dart';
import 'package:pokedex/widgets/detail_back_button.dart';
import 'package:pokedex/widgets/detail_data.dart';
import 'package:pokedex/widgets/detail_image.dart';
import 'package:pokedex/widgets/detail_title.dart';

class Details extends StatefulWidget {
  final int? id;
  final String? name;
  final String? image;
  const Details({Key? key, this.id, this.name, this.image}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _controller = ScrollController();

  ScrollPhysics _physics = const BouncingScrollPhysics();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels <= 56) {
        setState(() => _physics = const BouncingScrollPhysics());
      } else {
        setState(() => _physics = const ClampingScrollPhysics());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: _controller,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        physics: _physics,
        child: Column(
          children: [
            DetailImage(id: widget.id!, image: widget.image!),
            DetailTitle(id: widget.id!, name: widget.name!),
            DetailData(id: widget.id!),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const DetailBackButton(),
    );
  }
}
