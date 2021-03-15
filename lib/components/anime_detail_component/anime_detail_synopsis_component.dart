import 'package:flutter/material.dart';

import 'package:AniFlix/constants.dart';

class SynopsisComponent extends StatelessWidget {
  final String synopsis;

  SynopsisComponent({this.synopsis});

  final BorderRadius synopsisRadius = BorderRadius.circular(16);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: synopsisRadius,
        color: Colors.blue[900].withOpacity(0.8),
      ),
      child: ClipRRect(
        borderRadius: synopsisRadius,
        child: ExpansionTile(
          title: Text(
            'Synopsis',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[800].withOpacity(0.8),
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: synopsisRadius,
                color: kMyBlueColor.withOpacity(0.8),
              ),
              child: Text(
                synopsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
