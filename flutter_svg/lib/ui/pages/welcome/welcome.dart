import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/bear.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
      semanticsLabel: 'Bear happy',
      height: 350,
      alignment: Alignment.bottomCenter,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 128),
            child: const Text(
              "Olá, bem vindo a pet&cia",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(249, 231, 231, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 64),
                      child: const Text(
                        "Acesse sua conta",
                        style: TextStyle(
                          fontSize: 32,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Email"),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            label: Text("Password"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              svg,
            ],
          ),
        ],
      ),
    );
  }
}
