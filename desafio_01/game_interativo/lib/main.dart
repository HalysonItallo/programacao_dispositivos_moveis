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
                      child: const Text("Próxima pergunta"),
                    ),
                  ],
                )
              : const Text("Seu resultado final está acima")
        ],
      ),
    );
  }
}

List<dynamic> data = [
  <String, dynamic>{
    "ask":
        "Normalmente, quantos litros de sangue uma pessoa tem? Em média, quantos são retirados numa doação de sangue?",
    "A": "Tem entre 2 a 4 litros. São retirados 450 mililitros",
    "B": "Tem entre 4 a 6 litros. São retirados 450 mililitros",
    "C": "Tem 10 litros. São retirados 2 litros",
    "D": "Tem 7 litros. São retirados 1,5 litros",
    "E": "Tem 0,5 litros. São retirados 0,5 litros",
    "result": "B",
  },
  <String, dynamic>{
    "ask": "De quem é a famosa frase “Penso, logo existo”?",
    "A": "Platão",
    "B": "Galileu Galilei",
    "C": "Descartes",
    "D": "Sócrates",
    "E": "Francis Bacon",
    "result": "E",
  },
  <String, dynamic>{
    "ask": "De onde é a invenção do chuveiro elétrico?",
    "A": "França",
    "B": "Inglaterra",
    "C": "Brasil",
    "D": "Austrália",
    "E": "Itália",
    "result": "C",
  },
  <String, dynamic>{
    "ask": "Quais o menor e o maior país do mundo?",
    "A": "Vaticano e Rússia",
    "B": "Nauru e China",
    "C": "Mônaco e Canadá",
    "D": "Malta e Estados Unidos",
    "E": "São Marino e Índia",
    "result": "A",
  },
  <String, dynamic>{
    "ask":
        "Qual o nome do presidente do Brasil que ficou conhecido como Jango?",
    "A": "Jânio Quadros",
    "B": "Jacinto Anjos",
    "C": "Getúlio Vargas",
    "D": "João Figueiredo",
    "E": "João Goulart",
    "result": "E",
  },
  <String, dynamic>{}
];
