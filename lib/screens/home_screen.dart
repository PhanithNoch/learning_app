import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// profile and cover
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.height * 0.5
                        : MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    /// background image
                    Container(
                      height: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.3,
                      child: Image.network(
                        'https://images.pexels.com/photos/675920/pexels-photo-675920.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),

                    /// profile
                    Positioned(
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              radius: 85,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 80,
                                foregroundImage: NetworkImage(
                                    'https://i.pinimg.com/236x/39/4e/b6/394eb68e3bcf46cd24b049278ca31ad6.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(Icons.camera_alt),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// end section profile and cover

              /// profile name and nickname
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Anne Feliccita',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "I'm a fullstack developer",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ],
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.add),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Add Story'),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.remove_red_eye),
                        SizedBox(
                          height: 5,
                        ),
                        Text('View As'),
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.person),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Edit Profile'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: const [
                          Icon(Icons.more_horiz),
                          SizedBox(
                            height: 5,
                          ),
                          Text('More'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
