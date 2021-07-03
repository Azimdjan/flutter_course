import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_service_app/models/location.dart';
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
  late GoogleMapController googleMapController;
  PageController controller = PageController(initialPage: 0);
  var _isCompleted = false;
  var _isWriting = false;
  var _isSecond = false;

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  void isCompleted() {
    if (_firstController.text.isNotEmpty && _secondController.text.isNotEmpty)
      _isCompleted = true;
    else
      _isCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWithAppBar(
      downContainer: buildDownContainer(context),
      actionButton: buildActionButton(context),
      child: buildScreen(context),
      googleMap: buildGoogleMap(context),
      title: 'Alaska',
      isWriting: _isWriting,
      isCompleted: _isCompleted,
      margin: true,
    );
  }

  Widget buildScreen(BuildContext context) {
    var focusNode = FocusScope.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        !_isSecond
            ? TextField(
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
                    isCompleted();
                    focusNode.nextFocus();
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.white,
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
              )
            : Container(),
        const SizedBox(
          height: 25,
        ),
        !_isSecond
            ? TextField(
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
                    isCompleted();
                    focusNode.unfocus();
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.white,
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
              )
            : Container(),
      ],
    );
  }

  Widget buildDownContainer(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      height: mediaQuery.height * 0.65,
      width: mediaQuery.width,
      color: Colors.transparent,
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          RequestContainer(controller: controller),
          SeatContainer(controller: controller),
          PaymentContainer(controller: controller),
        ],
        onPageChanged: (index) {
          if (index != 0) {
            setState(() {
              _isSecond = true;
            });
          } else {
            setState(() {
              _isSecond = false;
            });
          }
        },
      ),
    );
  }

  Widget buildActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () async {
        final location = await CurrentLocation.getLoc();
        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: location,
              bearing: 192.8334901395799,
              tilt: 59.440717697143555,
              zoom: 19.151926040649414),
        ));
      },
      child: const Icon(Icons.my_location),
    );
  }

  Widget buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.87,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
      ),
    );
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<void> gotoLake() async {
    print('hello');
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
