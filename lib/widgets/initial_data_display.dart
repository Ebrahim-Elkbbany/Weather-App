import 'package:flutter/material.dart';

class InitialDataDisplay extends StatelessWidget {
  const InitialDataDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Text(
            'there is no weather 😔 start',
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Text(
            'searching now 🔍',
            style: TextStyle(
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }
}