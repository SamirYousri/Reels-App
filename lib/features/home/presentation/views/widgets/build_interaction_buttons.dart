import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildInteractionButtons() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 100),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.solidHeart,
                  color: Colors.white, size: 30),
              onPressed: () {},
            ),
            const Text('Like', style: TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.comment,
                  color: Colors.white, size: 30),
              onPressed: () {},
            ),
            const Text('Comment',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.share,
                  color: Colors.white, size: 30),
              onPressed: () {},
            ),
            const Text('Share', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    ),
  );
}
