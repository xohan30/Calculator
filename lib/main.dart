import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MyHomePage(title: 'cALCULATOr (aryan)',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output="0";

  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  buttonPressed(String buttonText){
    
    if(buttonText == "CLEAR"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operand="";
    }else if(buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/"){
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    }else if(buttonText == "."){
      if(_output.contains(".")){
        print("Already Contains a Decimal");
      }else{
        _output = _output+buttonText;
      }
    }else if(buttonText =="="){
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "x"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";
    }else{
      _output=_output+buttonText;
    }

    print(_output);

    setState(() {
      
      output = double.parse(_output).toStringAsFixed(2);

    });

  }

  Widget buildButten(String buttonText){
     return new Expanded(
                  child: new MaterialButton(
                  padding: new EdgeInsets.all(24.0),
                  child: new Text(buttonText,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                      
                    ),
                   ),
                  onPressed: () => 
                    buttonPressed(buttonText),
                  color: Colors.red,
                  textColor: Colors.black,
                ),
     );
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(

        child: new Column(children: <Widget>[

          new Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 50.0,
              horizontal: 20.0,
            ),
            child: new Text(output, style: new TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.bold,color: Colors.red,
            ),)
            ),
          new Expanded(
            child: new Divider()
          ),
          new Column(
            children: [
              new  Row(
                children:[
                  buildButten("7"),
                  buildButten("8"),
                  buildButten("9"),
                  buildButten("/"),
                ],
              ),

              new  Row(
                children:[
                  buildButten("4"),
                  buildButten("5"),
                  buildButten("6"),
                  buildButten("x"),
                ],
              ),

              new  Row(
                children:[
                  buildButten("1"),
                  buildButten("2"),
                  buildButten("3"),
                  buildButten("-"),
                ],
              ),

              new  Row(
                children:[
                  buildButten("."),
                  buildButten("0"),
                  buildButten("00"),
                  buildButten("+"),
                ],
              ),

              new  Row(
                children:[
                  buildButten("CLEAR"),
                  buildButten("="),
                  
                ],
              ),
            ],
          ) 


        ])



      )
    );
  }
}
