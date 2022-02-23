import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Room {
  String name;
  // ignore_for_file: prefer_typing_uninitialized_variables
  var color;
  String avt;
  String device;
  var textColor;
  Room(this.name, this.color, this.avt, this.device, this.textColor);
}

// var arr = [255, 0, 0, 0];

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}

List<Room> _rooms = <Room>[
  Room('Livingroom', [255, 0, 0, 0], 'assets/images/livingroom.webp',
      '5 devices', [255, 255, 255, 255]),
  Room('Kitchen', [255, 254, 246, 229], 'assets/images/kitchen.jpg',
      '4 devices', [255, 0, 0, 0]),
  Room('Office ', [255, 233, 231, 247], 'assets/images/iconoffice.png',
      '10 devices', [255, 0, 0, 0]),
  Room('Bedroom ', [255, 207, 235, 244], 'assets/images/bedroom.png',
      '6 devices', [255, 0, 0, 0]),
  Room('Bathroom ', [255, 250, 235, 232], 'assets/images/bathroom.png',
      '7 devices', [255, 0, 0, 0]),
  Room('Dinning ', [255, 239, 247, 229], 'assets/images/dinning.webp',
      '4 devices', [255, 0, 0, 0]),
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(_rooms[5].color[3]);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(children: [
            _buildAppbar(context),
            _buildWelcomePlace(context),
            _buildAddroom(context),
            _buildGridviewRooms(context),
          ]),
        ),
      ),
    );
  }

  Widget _buildAddroom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 0.0),
      child: Row(
        children: [
          const Text(
            'Your ',
            style: TextStyle(fontSize: 30),
          ),
          const Text(
            'Rooms',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                primary: const Color.fromARGB(255, 226, 246, 245),
                elevation: 0.0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )),
            child: Row(
              children: const [
                Text(
                  'Add  ',
                  style: TextStyle(color: Color.fromARGB(255, 77, 192, 192)),
                ),
                Icon(
                  Icons.add_circle,
                  color: Color.fromARGB(255, 77, 192, 192),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridviewRooms(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),
      shrinkWrap: true,
      itemCount: _rooms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemBuilder: (context, int index) {
        return SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    _rooms[index].color[0],
                    _rooms[index].color[1],
                    _rooms[index].color[2],
                    _rooms[index].color[3]),
                elevation: 0.0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                  backgroundImage: AssetImage(_rooms[index].avt),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(_rooms[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(
                              _rooms[index].textColor[0],
                              _rooms[index].textColor[1],
                              _rooms[index].textColor[2],
                              _rooms[index].textColor[3]))),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(_rooms[index].device,
                      style: TextStyle(
                          color: Color.fromARGB(
                              _rooms[index].textColor[0],
                              _rooms[index].textColor[1],
                              _rooms[index].textColor[2],
                              _rooms[index].textColor[3]))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.grid_view_rounded,
                size: 40,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const CircleAvatar(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                backgroundImage: AssetImage('assets/images/icon.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomePlace(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(32.0, 16.0, 0.0, 4.0),
            child: Text(
              'Hi Sajon',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w600),
            ),
          ),
          Image(image: AssetImage('assets/images/hello.png'))
        ],
      ),
      Container(
          padding: const EdgeInsets.only(left: 32.0),
          child: const Text('Wellcome to Orix Home.',
              style: TextStyle(
                fontSize: 20.0,
              )))
    ]);
  }
}
