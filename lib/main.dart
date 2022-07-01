import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:profile_ui/widgets/profile_list_item.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppBarButton(
                        icon: Icons.arrow_back,
                      ),
                      SvgPicture.asset("assets/icons/menu.svg"),
                    ],
                  ),
                ),
                AvatarImage(),
                const SizedBox(
                  height: 30,
                ),
                SocialIcons(),
                const SizedBox(height: 30),
                const Text(
                  'chromicle',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins"),
                ),
                const Text(
                  '@amFOSS',
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Mobile App Developer and Open source enthusiastic',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontFamily: "Poppins"),
                ),
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final IconData icon;

  const AppBarButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kAppPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kLightBlack,
              offset: const Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: kWhite,
              offset: const Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: Icon(
        icon,
        color: fCL,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(8),
      decoration: avatarDecoration,
      child: Container(
        decoration: avatarDecoration,
        padding: const EdgeInsets.all(3),
        child: const CircleAvatar(
            backgroundImage: NetworkImage('https://www.whatsappimages.in/wp-content/uploads/2021/12/girl-New-Superb-Whatsapp-Dp-Profile-Images-photo.jpg'),
              ),
            ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          color: const Color(0xFF102397),
          iconData: facebook,
          onPressed: () {},
        ),
        SocialIcon(
          color: const Color(0xFFff4f38),
          iconData: googlePlus,
          onPressed: () {},
        ),
        SocialIcon(
          color: const Color(0xFF38A1F3),
          iconData: twitter,
          onPressed: () {},
        ),
        SocialIcon(
          color: const Color(0xFF2867B2),
          iconData: linkedin,
          onPressed: () {},
        )
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function onPressed;

  SocialIcon({required this.color, required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          onPressed: (){},
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const <Widget>[
          ProfileListItem(
            icon: LineAwesomeIcons.user_shield,
            text: 'Privacy',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.history,
            text: 'Purchase History',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.question_circle,
            text: 'Help & Support',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.cog,
            text: 'Settings',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.user_plus,
            text: 'Invite a Friend',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.alternate_sign_out,
            text: 'Logout',
            hasNavigation: false,
          ),
        ],
      ),
    );
  }
}
