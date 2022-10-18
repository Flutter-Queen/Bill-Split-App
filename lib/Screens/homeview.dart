import 'package:bill_split_app/Screens/resultview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/friendheading.dart';
import '../Widgets/splitbutton.dart';
import '../Constant/constants.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({Key? key}) : super(key: key);

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  double friendvalue = 0.0;
  double tipValue = 0.0;
  String taxvalue = '0';
  String bill = '';
  TextEditingController taxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          title: Text(
            '✨Split your bill in seconds!',
            style: GoogleFonts.dancingScript(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 25),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.mainColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Total',
                          style: GoogleFonts.dancingScript(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        bill,
                        style: GoogleFonts.dancingScript(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Friends:',
                            style: GoogleFonts.dancingScript(
                                color: Colors.lightBlue[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            'Tax:',
                            style: GoogleFonts.dancingScript(
                                color: Colors.purple[100],
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          Text(
                            'Tip:',
                            style: GoogleFonts.dancingScript(
                                color: Colors.lightGreen[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            friendvalue.round().toString(),
                            style: GoogleFonts.dancingScript(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            '$taxvalue %',
                            style: GoogleFonts.dancingScript(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          Text(
                            '\$ ${tipValue.round().toString()}',
                            style: GoogleFonts.dancingScript(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          )
                        ],
                      )
                    ],
                  )
                ]),
          ),
          const FriendsHeading(),
          Slider(
              divisions: 15,
              activeColor: AppColors.mainColor,
              inactiveColor: Colors.grey,
              min: 0,
              max: 15,
              value: friendvalue,
              onChanged: (value) {
                setState(() {
                  friendvalue = value;
                });
              }),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width / 2,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tip',
                        style: GoogleFonts.dancingScript(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 25),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  tipValue--;
                                });
                              },
                              backgroundColor: Colors.grey[100],
                              child: const Icon(
                                Icons.remove,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ),
                          Text(
                            '\$ ${tipValue.round().toString()}',
                            style: GoogleFonts.dancingScript(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 25),
                          ),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  tipValue++;
                                });
                              },
                              backgroundColor: Colors.grey[100],
                              child: const Icon(
                                Icons.add,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width / 3,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.mainColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  controller: taxController,
                  onChanged: (value1) {
                    setState(() {
                      taxvalue = value1;
                    });
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Tax %',
                    labelStyle: GoogleFonts.dancingScript(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 25),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('.'),
              buildButton('0'),
              buildButton('-'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                if (taxController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Please Enter your amount',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultView(
                              bill: bill,
                              friends: friendvalue,
                              tax: taxvalue,
                              tip: tipValue)));
                }
              },
              child: const SplitButton(
                title: 'Split Bill',
              )),
          const SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }

  buildButton(String text) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(50, 50), shape: const CircleBorder()),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style: GoogleFonts.dancingScript(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 25),
        ));
  }
}
