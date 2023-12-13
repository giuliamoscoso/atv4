import 'dart:math';

import 'package:flutter/material.dart';

class Aleatorio extends StatefulWidget {
  @override
  State<Aleatorio> createState() => _AleatorioState();
}

class _AleatorioState extends State<Aleatorio> {
  String infoTexto = "Informe seu palpite (de 0 a 10)";

  TextEditingController randomController = TextEditingController();

  Widget buildTextField(String label, TextEditingController c) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.purple, fontSize: 20.0),
          border: const OutlineInputBorder()),
      style: const TextStyle(color: Colors.purple, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }

  void _randomNumber() {
    int number = int.parse(randomController.text);
    int randomNumber = Random().nextInt(11);

    setState(() {
      if (number > 10 || number < 1) {
        infoTexto = "Informe seu palpite (de 0 a 10)";
        return;
      } else if (number == randomNumber) {
        infoTexto = "Você acertou! Parabéns!";
      } else {
        infoTexto = "Você errou, o número era $randomNumber. Tente novamente!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Adivinhe o Número',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                randomController.text = "";
                setState(() {
                  infoTexto = "Informe seu palpite (de 0 a 10)";
                });
              },
              icon: const Icon(Icons.refresh, color: Colors.white))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.casino_rounded,
                size: 170.0,
                color: Color.fromARGB(255, 150, 113, 102),
              ),
              buildTextField("Número", randomController),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {
                        _randomNumber();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text(
                        "Descobrir",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  infoTexto,
                  style: const TextStyle(color: Colors.purple, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              )
            ]),
      ),
    );
  }
}
