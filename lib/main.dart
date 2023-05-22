import 'package:calculator/custom_button.dart';
import 'package:calculator/custom_number_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.black54,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String field1 = "";
  String field2 = "";
  String operator = "";

  void deleteLastInField() => setState(
        () {
          if (field2.isNotEmpty) {
            field2 = field2.substring(0, field2.length - 1);
          }
        },
      );

  void inputField(String value) => setState(() => field2 += value);

  void resetField() => setState(() => field2 = "");

  void resetAllField() => setState(
        () {
          field1 = "";
          field2 = "";
          operator = "";
        },
      );

  void inputOperator(String value) => setState(
        () {
          if (field1 == "" && field2 != "") {
            field1 = field2;
            operator = value;
            field2 = "";
          } else if (field2 != "" && field1 != "") {
            switch (operator) {
              case "+":
                if (field1.contains(".") || field2.contains(".")) {
                  field1 =
                      (double.parse(field1) + double.parse(field2)).toString();
                } else {
                  field1 = (int.parse(field1) + int.parse(field2)).toString();
                }
                if (field1.contains(".0")) {
                  field1 = double.parse(field1).toInt().toString();
                }
                field2 = "";
                break;

              case "-":
                if (field1.contains(".") || field2.contains(".")) {
                  field1 =
                      (double.parse(field1) - double.parse(field2)).toString();
                } else {
                  field1 = (int.parse(field1) - int.parse(field2)).toString();
                }
                if (field1.contains(".0")) {
                  field1 = double.parse(field1).toInt().toString();
                }
                field2 = "";
                break;

              case "X":
                if (field1.contains(".") || field2.contains(".")) {
                  field1 =
                      (double.parse(field1) * double.parse(field2)).toString();
                } else {
                  field1 = (int.parse(field1) * int.parse(field2)).toString();
                }
                if (field1.contains(".0")) {
                  field1 = double.parse(field1).toInt().toString();
                }
                field2 = "";
                break;

              case "/":
                if (field1.contains(".") || field2.contains(".")) {
                  field1 =
                      (double.parse(field1) / double.parse(field2)).toString();
                } else {
                  field1 = (int.parse(field1) / int.parse(field2)).toString();
                }
                if (field1.contains(".0")) {
                  field1 = double.parse(field1).toInt().toString();
                }
                field2 = "";
                break;
            }
            if (value == "=") {
              field2 = field1;
              field1 = "";
              operator = "";
            } else {
              operator = value;
            }
          } else if (field1 != "" && field2 == "") {
            operator = value;
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.black12,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          field1,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          operator,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      field2,
                      style: const TextStyle(fontSize: 50),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  GridView.count(
                    primary: false,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: [
                      CustomOperationButton(
                        title: "C",
                        operation: () => resetAllField(),
                      ),
                      CustomOperationButton(
                        title: "CE",
                        operation: () => resetField(),
                      ),
                      CustomOperationButton(
                        title: "/",
                        operation: () => inputOperator("/"),
                      ),
                      CustomOperationButton(
                        title: "Del",
                        operation: () => deleteLastInField(),
                      ),
                    ],
                  ),
                  GridView.count(
                    primary: false,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: [
                      CustomNumberButton(
                        title: "7",
                        operation: () => inputField("7"),
                      ),
                      CustomNumberButton(
                        title: "8",
                        operation: () => inputField("8"),
                      ),
                      CustomNumberButton(
                        title: "9",
                        operation: () => inputField("9"),
                      ),
                      CustomOperationButton(
                        title: "X",
                        operation: () => inputOperator("X"),
                      ),
                    ],
                  ),
                  GridView.count(
                    primary: false,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: [
                      CustomNumberButton(
                        title: "4",
                        operation: () => inputField("4"),
                      ),
                      CustomNumberButton(
                        title: "5",
                        operation: () => inputField("5"),
                      ),
                      CustomNumberButton(
                        title: "6",
                        operation: () => inputField("6"),
                      ),
                      CustomOperationButton(
                        title: "-",
                        operation: () => inputOperator("-"),
                      ),
                    ],
                  ),
                  GridView.count(
                    primary: false,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: [
                      CustomNumberButton(
                        title: "1",
                        operation: () => inputField("1"),
                      ),
                      CustomNumberButton(
                        title: "2",
                        operation: () => inputField("2"),
                      ),
                      CustomNumberButton(
                        title: "3",
                        operation: () => inputField("3"),
                      ),
                      CustomOperationButton(
                        title: "+",
                        operation: () => inputOperator("+"),
                      ),
                    ],
                  ),
                  GridView.count(
                    primary: false,
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: [
                      CustomNumberButton(
                        title: "00",
                        operation: () => inputField("00"),
                      ),
                      CustomNumberButton(
                        title: "0",
                        operation: () => inputField("0"),
                      ),
                      CustomNumberButton(
                        title: ".",
                        operation: () => inputField("."),
                      ),
                      CustomOperationButton(
                        title: "=",
                        operation: () => inputOperator("="),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
