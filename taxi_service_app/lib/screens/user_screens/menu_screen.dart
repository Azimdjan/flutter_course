import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../auth_screens/signin_screen.dart';
import 'search_screen.dart';
import '../../widgets/menu_items.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(61, 41, 115, 1.0),
        padding:
            const EdgeInsets.only(bottom: 58, top: 20, right: 20, left: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.topRight,
              // ignore: avoid_unnecessary_containers
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/images/Vector.svg',
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Marius Ciocirlan',
                  style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'SF-Pro-Display',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Marius974@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SF-Pro-Display',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(113, 119, 171, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MenuItems(
                  fileName: 'home.svg',
                  title: 'Home',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'payment.svg',
                  title: 'Payment Method',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'history.svg',
                  title: 'History',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'promo.svg',
                  title: 'Apply Promo Code',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'invitation.svg',
                  title: 'Invite Friends',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'settings.svg',
                  title: 'Setting',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'online.svg',
                  title: 'Online Support',
                  direction: SearchScreen.routeName,
                ),
                const MenuItems(
                  fileName: 'logout.svg',
                  title: 'Log Out',
                  direction: SignInScreen.routeName,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
