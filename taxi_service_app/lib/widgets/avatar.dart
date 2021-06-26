import 'package:flutter/material.dart';

import '../theme.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(TaxiServiceAppTheme.avatar),
        ),
        const SizedBox(height: 20),
        Text(
          'Marius Ciocirlan',
          style: Theme.of(context).textTheme.headline3
        ),
        const SizedBox(height: 10),
        Text(
          'Marius974@gmail.com',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
