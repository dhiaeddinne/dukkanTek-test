import 'package:flutter/material.dart';


class UnknownScreenRoute extends StatefulWidget {
  const UnknownScreenRoute({Key? key}) : super(key: key);

  @override
  _UnknownScreenRouteState createState() => _UnknownScreenRouteState();
}

class _UnknownScreenRouteState extends State<UnknownScreenRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Unknown Route"),
      ),
    );
  }
}
