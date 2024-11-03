import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 193, 14, 1),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BlueBox(),
          _LoginIcon(),
          child
        ],
      ),
    );
  }
}

class _LoginIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            child:
                const Icon(Icons.person_pin, color: Colors.white, size: 100)));
  }
}

class _BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _headerBackgound(),
    );
  }

  BoxDecoration _headerBackgound() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(38, 52, 119, 1),
        Color.fromRGBO(55, 77, 173, 1)
      ]));
}
