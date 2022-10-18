import 'package:bill_split_app/Screens/homeview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/constants.dart';
import '../Widgets/splitbutton.dart';

class ResultView extends StatefulWidget {
  const ResultView(
      {Key? key,
      required this.bill,
      required this.friends,
      required this.tax,
      required this.tip})
      : super(key: key);
  final double friends;
  final String bill;
  final String tax;
  final double tip;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  String calAmount = '';
  calculatedAmount() {
    double taxAmount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);

    double totalBill =
        (double.parse(widget.bill) + taxAmount + widget.tip) / widget.friends;
    setState(() {
      calAmount = totalBill.toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();
    calculatedAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            '✨ Result ✨',
            style: GoogleFonts.dancingScript(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 25),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 8),
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
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Equally Divided Amount',
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
                    '\$$calAmount',
                    style: GoogleFonts.dancingScript(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                ),
                child: Row(
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.friends.round().toString(),
                          style: GoogleFonts.dancingScript(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          '${widget.tax}%',
                          style: GoogleFonts.dancingScript(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        Text(
                          '\$${widget.tip.round().toString()}',
                          style: GoogleFonts.dancingScript(
                              color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          const Spacer(),
          Text(
            'Everyone should pay \$$calAmount',
            style: GoogleFonts.dancingScript(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BillSplit()));
              },
              child: const SplitButton(
                title: 'Split Again',
              )),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
