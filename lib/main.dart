import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      errorColor: Colors.red, // Define a cor do texto de erro para vermelho
    ),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe seus dados!";

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text.replaceAll(",", "."));
      double height = double.parse(
              heightController.text.replaceAll(",", "").replaceAll(",", ".")) /
          100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de imc"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(00.0, 0.0, 00.0, 0.0),
          child: Form(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imagens/fundo imc.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //const Icon(Icons.person_outlined,
                  // size: 300.0, color: Colors.cyanAccent),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle:
                          TextStyle(color: Colors.cyanAccent, fontSize: 35.0),
                      hintText: "use vírgula, ex: 70,500",
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.cyanAccent, fontSize: 35.0),
                    controller: weightController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira seu Peso (ex: 75,5)";
                      }
                      if (value.contains('.')) {
                        return "Use vírgula  ex: 75,500";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.cyanAccent),
                      hintText: "use vírgula, ex: 1,75",
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 40.0,
                    ),
                    controller: heightController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira sua Altura (ex: 1,78)";
                      }
                      if (value.contains('.')) {
                        return "Use vírgula não ponto ex: 1,78";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 255.0, bottom: 255.0),
                    child: Container(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _calculate();
                            }
                          },
                          child: Text(
                            "Calcular",
                            style:
                                TextStyle(color: Colors.white, fontSize: 28.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                          ),
                        )),
                  ),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 28.0),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
