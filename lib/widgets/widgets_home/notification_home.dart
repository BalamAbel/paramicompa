import 'package:flutter/material.dart';
import 'package:proyecto_currys/pages/home/paginas_principales/notification.dart';

class notification_home extends StatelessWidget {
  const notification_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        (Icons.notifications),
      ),
      onPressed: () {
         Navigator.of(context).push((MaterialPageRoute(
            builder: (context) => const notifications())));
      },
    );
  }
}
