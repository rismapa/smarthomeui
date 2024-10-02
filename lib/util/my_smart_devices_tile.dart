// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySmartDevicesTile extends StatelessWidget {
  final String iconPath;
  final String deviceName;
  final bool powerOn;
  void Function(bool)? onChanged;

  MySmartDevicesTile({
    Key? key,
    required this.iconPath,
    required this.deviceName,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: powerOn ? Colors.grey[900] : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            iconPath,
            height: 60,
            color: powerOn ? Colors.white : null,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  deviceName,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: powerOn ? Colors.white : null,
                      height: 1.5),
                ),
              ),
              Transform.rotate(
                angle: pi / 2,
                child: CupertinoSwitch(
                  value: powerOn,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
