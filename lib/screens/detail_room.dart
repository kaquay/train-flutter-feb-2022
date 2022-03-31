import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/models/device.dart';
import 'package:hello_flutter/models/room.dart';
import 'package:hello_flutter/widgets/device_item.dart';

class DetailRoom extends StatefulWidget {
  final Room room;

  // QuerySnapshot detail =
  const DetailRoom({Key? key, required this.room}) : super(key: key);

  @override
  State<DetailRoom> createState() => _DetailRoom();
}

class _DetailRoom extends State<DetailRoom> {
  double _currentSliderValue = 20;
  CollectionReference detail =
      FirebaseFirestore.instance.collection('device_item');
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
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
            child: Text(
              widget.room.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }

  Widget _builDetailLivingRoom(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
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
                          children: [
                            Text(
                              '${widget.room.temperature}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 52),
                            ),
                            const Text(
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
                      color: const Color.fromARGB(255, 255, 255, 255),
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
                      max: 40,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                          print(_currentSliderValue);
                          widget.room.humidity = _currentSliderValue.ceil();
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
                      children: [
                        Text('${widget.room.humidity}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 24)),
                        const Padding(
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
      child: FutureBuilder<QuerySnapshot>(
        future: detail.where('idRoom', isEqualTo: widget.room.idRoom).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Đang tải danh sách thiết bị'));
          }
          final List<DocumentSnapshot> document = snapshot.data!.docs;

          return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: document.length,
              itemBuilder: (context, index) {
                Device nd = Device(
                    document[index].id,
                    document[index]['name'],
                    document[index]['img'],
                    document[index]['status'],
                    document[index]['color']);

                return DeviceItem(devices: nd);
              }
              // ListDevice(devices: _devices[index])
              );
        },
      ),
    ));
  }
}
