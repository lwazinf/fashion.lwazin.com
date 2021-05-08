import 'dart:ui';

import 'package:arcana_fashion/services/ProviderService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 2.0,
        top: 4.0,
      ),
      child: GestureDetector(
        onDoubleTap: () {
          settings.switchDisplayLock();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: AnimatedContainer(
              color: Colors.black38,
              height: (settings.displayLock) ? 450 : 220,
              width: MediaQuery.of(context).size.width,
              duration: Duration(
                milliseconds: 200,
              ),
              child: AnimatedOpacity(
                duration: Duration(
                  milliseconds: 200,
                ),
                opacity: (settings.displayLock) ? 1.0 : 0.8,
                child: Image.network(
                  settings.displayImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
