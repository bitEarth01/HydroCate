// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoGraphGrid extends StatefulWidget {
  String name;
  String unit;
  String value;
  InfoGraphGrid(
      {super.key, required this.name, required this.unit, required this.value});

  @override
  State<InfoGraphGrid> createState() => _InfoGraphGridState();
}

class _InfoGraphGridState extends State<InfoGraphGrid> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      // height: height * 0.15,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      // padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(widget.name,
                  style: GoogleFonts.inter(
                      fontSize: 29, fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(widget.value,
                      style: GoogleFonts.inter(
                          fontSize: 24, fontWeight: FontWeight.normal)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(widget.unit,
                        style: GoogleFonts.inter(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                  ),
                ),
              ],
            )
            // SvgPicture.asset(
            //   height: height * 0.08,
            //   fit: BoxFit.fitWidth,
            //   'assets/homepage/co2.svg',
            // ),
            // Text(
            //   'CO2',
            //   style: GoogleFonts.inter(
            //     fontSize: 12,
            //   ),
            // ),
            // Text(
            //   'ppm',
            //   style: GoogleFonts.inter(
            //     fontSize: 12,
            //   ),
            // ),
            // Text('420',
            //     style:
            //         GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class InfoDoubleGrid extends StatefulWidget {
  String name;
  String unit;
  String value;
  String name1;
  String unit1;
  String value1;
  InfoDoubleGrid(
      {super.key,
      required this.name,
      required this.unit,
      required this.value,
      required this.name1,
      required this.unit1,
      required this.value1});

  @override
  State<InfoDoubleGrid> createState() => _InfoDoubleGridState();
}

class _InfoDoubleGridState extends State<InfoDoubleGrid> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      // padding: EdgeInsets.only(left: 16),
      child: Row(children: [
        Container(
          height: height * 0.18,
          width: width * 0.4,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(widget.value,
                    style: GoogleFonts.inter(
                        fontSize: 49, fontWeight: FontWeight.bold)),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Text(widget.name,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.normal)),
              Text(
                widget.unit,
                style: GoogleFonts.inter(
                    fontSize: 8, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: height * 0.18,
          width: width * 0.4,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(widget.value1,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                        fontSize: 49, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.name1,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.normal)),
              Text(
                widget.unit1,
                style: GoogleFonts.inter(
                    fontSize: 8, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ]),
      // child: Column(
      //   children: [
      //     Align(
      //       alignment: Alignment.topLeft,
      //       child: Text(widget.name,
      //           style: GoogleFonts.inter(
      //               fontSize: 24, fontWeight: FontWeight.bold)),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(widget.value,
      //               style: GoogleFonts.inter(
      //                   fontSize: 24, fontWeight: FontWeight.normal)),
      //         ),
      //         const SizedBox(
      //           width: 5,
      //         ),
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(widget.unit,
      //               style: GoogleFonts.inter(
      //                   fontSize: 12, fontWeight: FontWeight.normal)),
      //         ),
      //       ],
      //     )
      //     // SvgPicture.asset(
      //     //   height: height * 0.08,
      //     //   fit: BoxFit.fitWidth,
      //     //   'assets/homepage/co2.svg',
      //     // ),
      //     // Text(
      //     //   'CO2',
      //     //   style: GoogleFonts.inter(
      //     //     fontSize: 12,
      //     //   ),
      //     // ),
      //     // Text(
      //     //   'ppm',
      //     //   style: GoogleFonts.inter(
      //     //     fontSize: 12,
      //     //   ),
      //     // ),
      //     // Text('420',
      //     //     style:
      //     //         GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
      //   ],
      // ),
    );
  }
}
