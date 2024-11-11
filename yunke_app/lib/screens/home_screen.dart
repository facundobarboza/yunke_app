import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:yunke_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:yunke_app/services/services.dart';
import 'package:yunke_app/widgets/match_slider.dart';
import 'package:yunke_app/widgets/widgets.dart';

import '../widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final authService = Provider.of<AuthService>(context, listen: false);
    final sponsorsService = Provider.of<SponsorsService>(context);
    final matchsService = Provider.of<MatchsService>(context);

    if (sponsorsService.isLoading || matchsService.isLoading) {
      return LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yunke Futbol Club',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: const [
          /*  IconButton(
            icon: const Icon(Icons.login_outlined),
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ), */
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Slideshow(sponsors: sponsorsService.sponsors),
            MatchSlider(matchs: matchsService.matchs),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Equipos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Row(
              children: [
                Container(
                  width: size.width * 0.449,
                  height: 190,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details',
                            arguments: 'movie-instance'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: const FadeInImage(
                              placeholder: AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(
                                  'https://media.admagazine.com/photos/637d11a6e63c8afac40e7a01/master/pass/1442809583'),
                              width: double.infinity,
                              height: 140,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('Masculino',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.449,
                  height: 190,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'details',
                            arguments: 'movie-instance'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: const FadeInImage(
                              placeholder: AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(
                                  'https://images.pagina12.com.ar/styles/width960/public/2024-03/823451-pagina-2012-20-281-29.jpg?itok=g3El-2fZ'),
                              width: double.infinity,
                              height: 140,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('Femenino',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: size.width * 0.99,
              height: 190,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'details',
                        arguments: 'movie-instance'),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: const FadeInImage(
                          placeholder: AssetImage('assets/no-image.jpg'),
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/yunke-app.appspot.com/o/hacete-socio-taman%CC%83o.png?alt=media&token=4d7bbba9-bd0c-4a11-bbb6-092610af578b'),
                          width: double.infinity,
                          height: 140,
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  /* const Text('Beneficios',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold)
                          ) */
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String toUpperCase() {
    return this[0].toUpperCase();
  }
}
