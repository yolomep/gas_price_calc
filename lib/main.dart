import 'package:flutter/material.dart';
void main() {
  runApp(GasPriceCalc());
}
class GasPriceCalc extends StatefulWidget {
  const GasPriceCalc({Key? key}) : super(key: key);

  @override
  State<GasPriceCalc> createState() => _GasPriceCalcState();
}

class _GasPriceCalcState extends State<GasPriceCalc> {
  double pricePerGallon = 4.67;
  double gallonsPumped = 0.0;
  double priceToPay = 0.0;

  final prices = ["87 \$4.67", "E85 \$3.99", "93 \$4.75", "95 \$4.29", "97 \$5.03"];
  String dropdownvalue = "87 \$4.67";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gas Price Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gas Price Calculator"),
          backgroundColor: Color(0xFFD6F21D),
          foregroundColor: Colors.black, //
        ),
        body: Column(
          children: [
            DisplayText("Amount you owe at the pump"),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Text(
                  '\$ ${(gallonsPumped*pricePerGallon).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)
              ),
            ),
            DisplayText("Input the gallons to fill"),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: IconButton(onPressed: () {
                      print('Minus Button Pressed');
                      setState(() {
                        gallonsPumped = gallonsPumped - 0.1;
                        if (gallonsPumped < 0) gallonsPumped = 0;
                      });
                    },
                        icon: Icon(Icons.horizontal_rule_sharp)),
                  ),
                  Text(
                      '${gallonsPumped.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: IconButton(onPressed: () {
                      print('Plus Button Pressed');

                      setState(() {
                        gallonsPumped = gallonsPumped + 0.1;
                      });
                    }, icon: Icon(Icons.add)),
                  ),
                ],
              ),
            ),
            DisplayText("Todays price of gasoline is "),
            DisplayText(
                "\$ ${pricePerGallon}"
            ),
            Container(
              child: DropdownButton(
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: prices.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    pricePerGallon = double.parse(newValue.substring(newValue.length - 4));
                  });
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
class DisplayText extends StatelessWidget {
  String _textToDisplay;

  double fontSize = 20.0;
  DisplayText(this._textToDisplay, {this.fontSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        _textToDisplay,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}