import 'package:flutter/material.dart';
import 'package:hello_flutter/models/device.dart';

List<Device> _devices = [
  Device('Light', 'assets/images/livingroom/light.jpg', 'On', []),
  Device('Coller', 'assets/images/livingroom/Coller.jpg', 'Off', []),
  Device('Smart TV', 'assets/images/livingroom/smart_tv.jpg', 'Off', []),
  Device('Fan', 'assets/images/livingroom/fan.png', 'On', []),
  Device('Computer', 'assets/images/livingroom/computer.jpg', 'On', []),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 36,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(12, 8, 0, 0),
                    child: Text(
                      'Living Room',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              width: 320,
              height: 500,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255)),
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
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 219, 142, 176),
                                  Color.fromARGB(255, 222, 171, 239),
                                  Color.fromARGB(255, 219, 142, 176),
                                  Color.fromARGB(255, 222, 171, 239),
                                  Color.fromARGB(255, 255, 243, 216),
                                ],
                                begin: Alignment.bottomRight,
                                end: Alignment.topRight),
                          ),
                          child: CircleAvatar(
                            radius: 80,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
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
                              thumbColor: Colors.amber,
                              thumbShape: RoundSliderThumbShape(),
                            ),
                            child: Slider(
                              value: _currentSliderValue,
                              max: 100,
                              divisions: 5,
                              label: _currentSliderValue.round().toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentSliderValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const Text(
                          'Room Temperature',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16),
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
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: const [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/fire.png'),
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                          Text('26 %')
                        ],
                      ),
                    ),
                  ),
                ],
                clipBehavior: Clip.none,
              ),
            ),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _devices.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                          child: SizedBox(
                            width: 108,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 163, 105, 105),
                                  elevation: 0.0,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    backgroundImage:
                                        AssetImage(_devices[index].img),
                                  ),
                                  Text(
                                    _devices[index].Name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                  Text(_devices[index].status,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
