import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../widgets/search_payment_con.dart';
import '../../widgets/search_seat_con.dart';
import '../../layouts/with_appbar.dart';
import '../../widgets/search_request_con.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  PageController controller =
      PageController( initialPage: 0);

  var _isWriting = false;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      downContainer: buildDownContainer(context),
      actionButton: buildActionButton(context),
      child: buildScreen(context),
      title: 'Alaska',
      isWriting: _isWriting,
      margin: true,
    );
  }

  Widget buildScreen(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        TextField(
          textInputAction: TextInputAction.next,
          controller: _firstController,
          onTap: () {
            setState(() {
              _isWriting = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              _isWriting = false;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: const Color.fromRGBO(45, 45, 45, 0.1),
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintText: "Kichik halqa yo'li ko'chasi",
            hintStyle: Theme.of(context).textTheme.bodyText2,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_location_sharp,
                color: Colors.red,
              ),
              color: Colors.amber,
            ),
            suffixIcon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        TextField(
          textInputAction: TextInputAction.done,
          controller: _secondController,
          onTap: () {
            setState(() {
              _isWriting = true;
            });
          },
          onEditingComplete: () {
            setState(() {
              _isWriting = false;
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: const Color.fromRGBO(45, 45, 45, 0.1),
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: 'Qayerga boramiz?',
            hintStyle: Theme.of(context).textTheme.bodyText2,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.location_on),
              color: Colors.amber,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _secondController.clear();
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDownContainer(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      height: mediaQuery.height * 0.65,
      width: mediaQuery.width,
      color: Colors.white,
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          RequestContainer(controller: controller),
          SeatContainer(controller: controller),
          PaymentContainer(controller: controller),
        ],

      ),
    );
  }

  Widget buildActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        print(_isWriting);
      },
      child: const Icon(Icons.my_location),
    );
  }
}
