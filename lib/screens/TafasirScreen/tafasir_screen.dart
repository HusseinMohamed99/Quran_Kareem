import 'package:flutter/material.dart';
import 'package:moshaf_app/image_assets.dart';

class TafasirScreen extends StatelessWidget {
  const TafasirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.imagesBackground,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
