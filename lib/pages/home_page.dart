import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthome_ui/util/my_smart_devices_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // size of padding
  final double hPadding = 40.0;
  final double vPadding = 25.0;

  // list of smart devices
  List mySmartDevices = [
    ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false],
  ];

  // void power switch
  void PowerSwitchHasChange(value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: hPadding, vertical: vPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icons/menu.png",
                    height: 45,
                  ),
                  const Icon(
                    Icons.person,
                    size: 45,
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // welcome home ima
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: GoogleFonts.montserrat(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Lee Jeno",
                    style: GoogleFonts.montserrat(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // smart devices + grid screen
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Text(
                "Smart Devices",
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: hPadding),
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return MySmartDevicesTile(
                    iconPath: mySmartDevices[index][1],
                    deviceName: mySmartDevices[index][0],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => PowerSwitchHasChange(value, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
