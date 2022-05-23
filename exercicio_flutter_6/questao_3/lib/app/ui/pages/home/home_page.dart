import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valuecheckBox1 = false;
  bool valuecheckBox2 = false;
  bool valuecheckBox3 = false;
  bool valuecheckBox4 = false;

  @override
  Widget build(BuildContext context) {
    bool verifyTristateLogic = (valuecheckBox1 == true &&
        valuecheckBox2 == true &&
        valuecheckBox3 == true &&
        valuecheckBox4 != true);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: valuecheckBox1,
                    onChanged: (value) {
                      setState(() {
                        valuecheckBox1 = value!;
                      });
                    },
                  ),
                  const Text(
                    "Aceito compartilhar dados para melhoria do aplicativo.",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: valuecheckBox2,
                    onChanged: (value) {
                      setState(() {
                        valuecheckBox2 = value!;
                      });
                    },
                  ),
                  const Text(
                    "Aceito compartilhar dados para melhoria do aplicativo.",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: valuecheckBox3,
                    onChanged: (value) {
                      setState(() {
                        valuecheckBox3 = value!;
                      });
                    },
                  ),
                  const Text(
                    "Aceito compartilhar dados para melhoria do aplicativo.",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    tristate: verifyTristateLogic ? true : false,
                    value: verifyTristateLogic ? null : valuecheckBox4,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        valuecheckBox1 = value!;
                        valuecheckBox2 = value;
                        valuecheckBox3 = value;
                        valuecheckBox4 = value;
                      });
                    },
                  ),
                  Text(
                    "Aceitar todos os itens acima",
                    style: TextStyle(
                      color:
                          verifyTristateLogic ? Colors.black38 : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
