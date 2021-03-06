import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Dice"),
          backgroundColor: Colors.red,
        ),
        body: const Game(),
      ),
    ),
  );
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String dropdownValue = 'A';

  int currentAsk = 0;
  int countErrors = 0;
  int countHits = 0;

  void nextAsk() {
    setState(() {
      if (maxValueAsk()) {
        currentAsk++;
      }
    });
  }

  void addCountErros() {
    setState(() {
      if (maxValueAsk()) {
        countErrors++;
      }
    });
  }

  void addCountHits() {
    setState(() {
      if (maxValueAsk()) {
        countHits++;
      }
    });
  }

  bool maxValueAsk() {
    return (currentAsk < (data.length - 1));
  }

  @override
  Widget build(BuildContext context) {
    var ask = data[currentAsk];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    Text("Quantidade de acertos: $countHits")
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    Text("Quantidade de erros: $countErrors")
                  ],
                ),
              ],
            ),
          ),
          maxValueAsk()
              ? Column(
                  children: [
                    Container(
                      width: 600,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${ask["ask"]}",
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: Text(
                        "A) ${ask["A"]}",
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: Text(
                        "B) ${ask["B"]}",
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: Text(
                        "C) ${ask["C"]}",
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: Text(
                        "D) ${ask["D"]}",
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: Text(
                        "E) ${ask["E"]}",
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.redAccent),
                        underline: Container(
                          height: 2,
                          color: Colors.red,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['A', 'B', 'C', 'D', 'E']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (dropdownValue == ask["result"]) {
                          addCountHits();
                        } else {
                          addCountErros();
                        }
                        nextAsk();
                      },
                      child: const Text("Pr??xima pergunta"),
                    ),
                  ],
                )
              : const Text("Seu resultado final est?? acima")
        ],
      ),
    );
  }
}

List<dynamic> data = [
  <String, dynamic>{
    "ask":
        "Normalmente, quantos litros de sangue uma pessoa tem? Em m??dia, quantos s??o retirados numa doa????o de sangue?",
    "A": "Tem entre 2 a 4 litros. S??o retirados 450 mililitros",
    "B": "Tem entre 4 a 6 litros. S??o retirados 450 mililitros",
    "C": "Tem 10 litros. S??o retirados 2 litros",
    "D": "Tem 7 litros. S??o retirados 1,5 litros",
    "E": "Tem 0,5 litros. S??o retirados 0,5 litros",
    "result": "B",
  },
  <String, dynamic>{
    "ask": "De quem ?? a famosa frase ???Penso, logo existo????",
    "A": "Plat??o",
    "B": "Galileu Galilei",
    "C": "Descartes",
    "D": "S??crates",
    "E": "Francis Bacon",
    "result": "E",
  },
  <String, dynamic>{
    "ask": "De onde ?? a inven????o do chuveiro el??trico?",
    "A": "Fran??a",
    "B": "Inglaterra",
    "C": "Brasil",
    "D": "Austr??lia",
    "E": "It??lia",
    "result": "C",
  },
  <String, dynamic>{
    "ask": "Quais o menor e o maior pa??s do mundo?",
    "A": "Vaticano e R??ssia",
    "B": "Nauru e China",
    "C": "M??naco e Canad??",
    "D": "Malta e Estados Unidos",
    "E": "S??o Marino e ??ndia",
    "result": "A",
  },
  <String, dynamic>{
    "ask":
        "Qual o nome do presidente do Brasil que ficou conhecido como Jango?",
    "A": "J??nio Quadros",
    "B": "Jacinto Anjos",
    "C": "Get??lio Vargas",
    "D": "Jo??o Figueiredo",
    "E": "Jo??o Goulart",
    "result": "E",
  },
  <String, dynamic>{}
];
