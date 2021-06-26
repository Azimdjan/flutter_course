import 'package:flutter/material.dart';
import '../../layouts/with_appbar.dart';
import '../../widgets/search_down_con.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();

  var _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      downContainer: const DownContainer(),
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
              )),
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
