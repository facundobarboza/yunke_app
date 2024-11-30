import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yunke_app/screens/screens.dart';
import 'package:yunke_app/services/services.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playersService = Provider.of<PlayersService>(context);

    if (playersService.isLoading) {
      return LoadingScreen();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Jugadores',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              mainAxisExtent: 200),
          itemCount: playersService.players.length,
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 1))
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: playersService.players[index].image == null
                          ? const Image(
                              image: AssetImage('assets/no-image.jpg'),
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover)
                          : FadeInImage(
                              placeholder:
                                  const AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(
                                  playersService.players[index].image!),
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          playersService.players[index].name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          playersService.players[index].lastName,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
