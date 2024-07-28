import 'package:flutter/material.dart';


class LoadingBar extends StatelessWidget{
  const LoadingBar({super.key});
  // ignore: non_constant_identifier_names
  Widget Build(BuildContext context)
  {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(" data")],),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}