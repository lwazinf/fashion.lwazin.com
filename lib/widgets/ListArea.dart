import 'dart:ui';

import 'package:arcana_fashion/services/ProviderService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListArea extends StatefulWidget {
  @override
  _ListAreaState createState() => _ListAreaState();
}

class _ListAreaState extends State<ListArea> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            top: 2.0,
            bottom: 8.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                color: Colors.black38,
                height: (settings.listLock) ? 160 : 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Container(
                          color: Colors.black45,
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: GestureDetector(
            onTap: () {
              settings.switchListLock();
            },
            child: Icon(
              (settings.listLock)
                  ? Icons.keyboard_arrow_down_sharp
                  : Icons.keyboard_arrow_up_sharp,
              size: 25,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
