import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_app/screens/home_screen.dart';
import 'package:learning_app/screens/main_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learning_app/screens/sub_sreens/home_page.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
      // routes: {
      //   'home_screen': (context) => HomeScreen(),
      //   'dashboard': (context) => HomeScreen(),
      // },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;
  bool _show = false;

  @override
  void initState() {
    usernameController.text = 'root';
  }

  bool isShowPassword = true;
  void showHidePassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;
    final homeScreen = HomeScreen();
    // Navigator.pushNamed(context, 'home_screen');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => homeScreen));
    // if (username.isEmpty) {
    //   setState(() {
    //     _validate = true;
    //   });
    // }
    print('usenrame :$username');
    print('password :$password');
  }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              children: [
                /// logo and name
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 60,
                    ),
                    const Text(
                      'SALE TOP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                /// welcome text

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        'Welcome Back',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                ),

                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      errorText: _validate ? 'Username can\'t be Empty' : null,
                      prefix: Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: const Icon(
                          Icons.person,
                          size: 18,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 8)),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                      suffix: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          showHidePassword();
                        },
                      ),
                      hintText: 'Password',
                      prefix: const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.lock,
                          size: 18,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(
                        top: 8,
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: TextButton(
                            onPressed: () {
                              login();
                            },
                            child: Text(
                              'Login Now',
                              style: TextStyle(color: Colors.white),
                            )),
                      )),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {
                    print('navigate to new screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Forgot Password ?'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                /// 3 icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.facebook,
                          color: Colors.blue,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.linkedinIn,
                          color: Colors.blue,
                          size: 40,
                        ))
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't have an account?"),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              elevation: 5,
                              context: context,
                              builder: (ctx) => Padding(
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        left: 15,
                                        right: 15,
                                        bottom: MediaQuery.of(ctx)
                                                .viewInsets
                                                .bottom +
                                            15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 4,
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ],
                                        ),
                                        const TextField(
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              labelText: 'Username'),
                                        ),
                                        const TextField(
                                          keyboardType: TextInputType.name,
                                          decoration: InputDecoration(
                                              labelText: 'Username'),
                                        ),
                                        const TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              labelText: 'Password'),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('Submit'))
                                      ],
                                    ),
                                  ));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? _showBottomSheet() {
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: ElevatedButton(
              child: Text("Close Bottom Sheet"),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  _show = false;
                });
              },
            ),
          );
        },
      );
    } else {
      return null;
    }
  }
}
