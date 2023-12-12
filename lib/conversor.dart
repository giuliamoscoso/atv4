import 'package:flutter/material.dart';

class Conversor extends StatefulWidget {
  @override
  State<Conversor> createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  String infoTexto = "Informe o valor a ser convertido!";
  String selectedCurrency = 'USD - Dólar Americano';

  TextEditingController valueController = TextEditingController();

  Widget buildTextField(String label, TextEditingController c) {
    return TextField(
      decoration: InputDecoration(
          prefix: const Text('R\$ '),
          prefixStyle: const TextStyle(color: Colors.purple, fontSize: 25.0),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.purple, fontSize: 20.0),
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2.0))),
      style: const TextStyle(color: Colors.purple, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }

  void _calculate() {
    double value = double.parse(valueController.text);

    setState(() {
      if (selectedCurrency == 'USD - Dólar Americano') {
        infoTexto = "${(value / 4.94).toStringAsFixed(2)} USD";
      } else if (selectedCurrency == 'EUR - Euro') {
        infoTexto = "${(value / 5.33).toStringAsFixed(2)} EUR";
      } else if (selectedCurrency == 'GBP - Libra Esterlina') {
        infoTexto = "${(value / 6.20).toStringAsFixed(2)} GBP";
      } else if (selectedCurrency == 'JPY - Iene Japonês') {
        infoTexto = "${(value * 29.41).toStringAsFixed(2)} JPY";
      } else if (selectedCurrency == 'CNY - Yuan Chinês') {
        infoTexto = "${(value * 1.44).toStringAsFixed(2)} CNY";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Conversor de Moedas',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                valueController.text = "";
                setState(() {
                  infoTexto = "Informe o valor a ser convertido!";
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
                Icons.attach_money_rounded,
                size: 170.0,
                color: Colors.green,
              ),
              buildTextField("Valor em Reais", valueController),
              DropdownButton<String>(
                value: selectedCurrency,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCurrency = newValue!;
                  });
                },
                style: const TextStyle(color: Colors.purple, fontSize: 25.0),
                iconSize: 40.0,
                items: <String>[
                  'USD - Dólar Americano',
                  'EUR - Euro',
                  'GBP - Libra Esterlina',
                  'JPY - Iene Japonês',
                  'CNY - Yuan Chinês'
                ] // Add the list of currency names
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
