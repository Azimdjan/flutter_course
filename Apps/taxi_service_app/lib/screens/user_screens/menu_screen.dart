import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_service_app/screens/user_screens/add_new_card_screen.dart';
import 'package:taxi_service_app/screens/user_screens/settings_screen.dart';
import '../../layouts/with_out_appbar.dart';
import '../../widgets/avatar.dart';
import '../../theme.dart';
import '../auth_screens/signin_screen.dart';
import 'history_screen.dart';
import 'search_screen.dart';
import '../../widgets/menu_items.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWithOutAppBar(
      child: buildScreen(context),
    );
  }

  Widget buildScreen(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(bottom: 54, top: 20, right: 20, left: 20),
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
              child: SvgPicture.asset(TaxiServiceAppTheme.vector),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Avatar(),
          const SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MenuItems(
                fileName: TaxiServiceAppTheme.homeIcon,
                title: 'Home',
                direction: SearchScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.paymentIcon,
                title: 'Payment Method',
                direction: AddNewCardScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.historyIcon,
                title: 'History',
                direction: HistoryScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.promoIcon,
                title: 'Apply Promo Code',
                direction: SearchScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.invitationIcon,
                title: 'Invite Friends',
                direction: SearchScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.settingsIcon,
                title: 'Setting',
                direction: SettingsScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.onlineIcon,
                title: 'Online Support',
                direction: SearchScreen.routeName,
              ),
              const MenuItems(
                fileName: TaxiServiceAppTheme.logoutIcon,
                title: 'Log Out',
                direction: SignInScreen.routeName,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
