import 'package:flutter/material.dart';
//Feito por Endleyson Reis Duarte dos Santos
//exercicio curso de flutter 

void main() { //função principal que chama o app
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}




class _HomeState extends State<Home> {


  TextEditingController pesoControl = TextEditingController();//resposnavel por pegar as informações digitadas 
  TextEditingController alturaControl = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // responsavel pela validação
  String _infoText= "Informe seus dados";
// função que reseta (limpa) os dados na tela
  void _reset() {
    pesoControl.text = "";
    alturaControl.text="";
    setState(() {
      _infoText= "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });

  }
  // função que calcula o IMC
  void _calculate(){
    setState((){
        double peso = double.parse(pesoControl.text);
        double altura = double.parse(alturaControl.text) / 100;
        double imc = peso/(altura*altura);
    if (imc < 18.6) {
      _infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 18.6 && imc<24.9) {
      _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 24.9 && imc<29.9) {
      _infoText = "Sobre Peso (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 29.9 && imc<34.9) {
      _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 34.9 && imc<39.9) {
      _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
    }else if(imc >= 40.0) {
      _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
    }
    });

  }

  //construtor do app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: _reset,
            )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 120.0, color: Colors.green,),
                TextFormField(keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.green)
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                  controller: pesoControl, //controlador do TextEditingController
                  validator: (value){ //função do validaor
                    if(value.isEmpty){
                      return "Insira seu peso!";
                   }
                    return null;},
                ),
                TextFormField(keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                  controller: alturaControl,
                  validator: (value){
                    if(value.isEmpty){
                      return "Insira sua altura!";
                    }
                    return null;},
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 60,
                    child: RaisedButton(
                      onPressed:() {
                        if (_formKey.currentState.validate()) {
                          _calculate();
                        }
                      },
                      child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25),),
                      color: Colors.green,
                    ),
                  ),
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                ),
              ],
            ),)
    )
    );
  }
}



