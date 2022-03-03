import 'package:flutter/material.dart';
import 'package:hello_flutter/models/device.dart';
import 'package:hello_flutter/widgets/device_item.dart';

List<Device> _devices = [
  Device('Light', 'assets/images/livingroom/light.jpg', 'On',
      [255, 233, 231, 247]),
  Device('Coller', 'assets/images/livingroom/Coller.jpg', 'Off',
      [255, 249, 235, 232]),
  Device('Smart TV', 'assets/images/livingroom/smart_tv.jpg', 'Off',
      [255, 230, 246, 240]),
  Device('Fan', 'assets/images/livingroom/fan.png', 'On', [255, 233, 231, 247]),
  Device('Computer', 'assets/images/livingroom/computer.jpg', 'On',
      [255, 249, 235, 232]),
];

class LivingRoom extends StatefulWidget {
  const LivingRoom({Key? key}) : super(key: key);

  @override
  State<LivingRoom> createState() => _LivingRoom();
}

class _LivingRoom extends State<LivingRoom> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            _buildAppbar(context),
            _builDetailLivingRoom(context),
            Padding(
              padding: const EdgeInsets.only(left: 28, top: 40),
              child: Row(
                children: const [
                  Text('Devices',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 32,
                      )),
                ],
              ),
            ),
            _buildListDevice(context)
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 36,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 8, 0, 0),
            child: Text(
              'Living Room',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }

  Widget _builDetailLivingRoom(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 320,
      height: 500,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 245, 249),
                borderRadius: BorderRadius.circular(300),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: 280,
                  height: 280,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 219, 142, 176),
                      Color.fromARGB(255, 222, 171, 239),
                      Color.fromARGB(255, 219, 142, 176),
                      Color.fromARGB(255, 222, 171, 239),
                      Color.fromARGB(255, 255, 243, 216),
                    ], begin: Alignment.bottomRight, end: Alignment.topRight),
                  ),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    backgroundImage:
                        const AssetImage('assets/images/clock.png'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '21',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 52),
                            ),
                            Text(
                              '°C',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30),
                            ),
                          ],
                        ),
                        const Text('Room',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16)),
                        const Text('Temperature',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 240,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30)),
                  child: SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 12,
                      activeTrackColor: Color.fromARGB(255, 226, 246, 245),
                      inactiveTrackColor: Color.fromARGB(255, 244, 248, 251),
                      thumbColor: Colors.black,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      max: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Room Temperature',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: -40,
            left: 116,
            child: Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/fire.png'),
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('26',
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 24)),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Text('%',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
        clipBehavior: Clip.none,
      ),
    );
  }

  Widget _buildListDevice(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _devices.length,
            itemBuilder: (context, index) =>
                ListDevice(devices: _devices[index])),
      ),
    );
  }
}
