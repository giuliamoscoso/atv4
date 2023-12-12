import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  String infoTexto = "Informe seus dados!";

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

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

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.6) {
        infoTexto = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        infoTexto = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        infoTexto = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        infoTexto = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        infoTexto = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        infoTexto = "Obesidade grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Calculadora de IMC',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                weightController.text = "";
                heightController.text = "";
                setState(() {
                  infoTexto = "Informe seus dados!";
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
                Icons.fitness_center_rounded,
                size: 170.0,
                color: Colors.black,
              ),
              buildTextField("Peso", weightController),
              const Divider(),
              buildTextField("Altura", heightController),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () {
                        _calculate();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text(
                        "Verificar",
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
