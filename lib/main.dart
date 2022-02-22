import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(children: [
            _buildAppbar(context),
            _buildWelcomePlace(context),
            Padding(
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
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
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
                          style: TextStyle(
                              color: Color.fromARGB(255, 77, 192, 192)),
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
            ),
            GridView.count(
              padding: const EdgeInsets.fromLTRB(36.0, 24.0, 36.0, 24.0),
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: [
                SizedBox(
                  width: 100,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 0, 0, 0),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          backgroundImage:
                              AssetImage('assets/images/livingroom.webp'),
                        ),
                        Text('Living Room',
                            style: TextStyle(fontWeight: FontWeight.w900)),
                        Text('5 devices'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 254, 246, 229),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          backgroundImage:
                              AssetImage('assets/images/kitchen.jpg'),
                        ),
                        Text('Kitchen',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                        Text('4 devices',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 233, 231, 247),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          backgroundImage:
                              AssetImage('assets/images/iconoffice.png'),
                        ),
                        Text('Office',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                        Text('10 devices',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 207, 235, 244),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          backgroundImage:
                              AssetImage('assets/images/bedroom.png'),
                        ),
                        Text('Bedroom',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                        Text('6 devices',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 250, 235, 232),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          backgroundImage:
                              AssetImage('assets/images/bathroom.png'),
                        ),
                        Text(
                          'Bathroom',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          '7 devices',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 239, 247, 228),
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/dinning.webp'),
                        ),
                        Text(
                          'Dinning Room',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          '4 devices',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
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
