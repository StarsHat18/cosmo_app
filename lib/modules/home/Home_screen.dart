// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cosmo_app/detailScreen.dart';
import 'package:cosmo_app/modules/home/home_controller.dart';
import 'package:cosmo_app/modules/login/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cosmo_app/model/planets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final LoginController loginController = Get.put(LoginController());
  final user = FirebaseAuth.instance.currentUser!;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              color: Colors.grey.shade600,
                              style: BorderStyle.solid),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsellleadsucceed.files.wordpress.com%2F2013%2F03%2Fbigstock-young-businessman-scratching-h-26164514.jpg&f=1&nofb=1&ipt=c69a66f78fe911bb226f850be78657b25c3a28f7eea9ca81d1d70ef5909be7e8&ipo=images'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Hey ',
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                          children: [
                            TextSpan(
                                text: getFirstNameFromDisplayName(
                                    user.displayName.toString()),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              color: Colors.grey.shade600,
                              style: BorderStyle.solid),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await loginController.signOut();
                            Get.offAllNamed('/login');
                          },
                          icon: Icon(
                            Icons.logout,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                              color: Colors.grey.shade600,
                              style: BorderStyle.solid),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: RichText(
                    text: TextSpan(
                      text: 'Your personal\nguide',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      children: const [
                        TextSpan(
                          text: ' to the universe',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.grey,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Start Explore   ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                        children: const [
                          WidgetSpan(
                              child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white70,
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container(
                      // color: Colors.amber,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        'Perfect tool for discovering the wonders of the universe!',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text('Planets',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: listPlaanets(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class listPlaanets extends StatelessWidget {
  final homeController = Get.find<HomeController>();
  listPlaanets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      try {
        if (homeController.planet.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              Planets planet = homeController.planet[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(planet: planet);
                  }));
                },
                child: cardplanets(
                  name: planet.name,
                  imgsurl: planet.imgs,
                  type: planet.type,
                ),
              );
            },
            itemCount: homeController.planet.length,
            scrollDirection: Axis.horizontal,
          );
        }
      } catch (e) {
        return Center(child: Text("Error: $e"));
      }
    });
  }
}

class cardplanets extends StatelessWidget {
  String name;
  String imgsurl;
  String type;
  cardplanets({
    Key? key,
    required this.name,
    required this.imgsurl,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network(
              imgsurl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text(type,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

String getFirstNameFromDisplayName(String displayName) {
  // Pisahkan nama lengkap menjadi kata-kata terpisah
  List<String> nameParts = displayName.split(' ');

  // Ambil kata pertama sebagai first name
  if (nameParts.isNotEmpty) {
    String firstName = nameParts.first;
    return firstName;
  } else {
    // Jika tidak ada kata yang terpisah, gunakan nama lengkap sebagai first name
    return displayName;
  }
}
