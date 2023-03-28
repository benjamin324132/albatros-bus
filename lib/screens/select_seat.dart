import 'package:albatros_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'booking_list.dart';
import 'checkout_screen.dart';

class SelectSeatScreen extends StatefulWidget {
  const SelectSeatScreen({Key? key}) : super(key: key);

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Color(0xFFF8F8F9),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Icon(Iconsax.arrow_left_2),
                    ),
                    const Text(
                      "Seleccione su asiento",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xFFF8F8F9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: const Icon(Iconsax.arrow_left_2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  decoration: const BoxDecoration(
                      color: Color(0xFFF8F8F9),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SeatBox(
                            text: "1",
                            ocupied: true,
                          ),
                          SeatBox(
                            text: "2",
                            ocupied: true,
                          ),
                          Spacer(),
                          SeatBox(text: "3"),
                          SeatBox(text: "4"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "5"),
                          SeatBox(text: "6"),
                          Spacer(),
                          SeatBox(
                            text: "7",
                            ocupied: true,
                          ),
                          SeatBox(
                            text: "8",
                            ocupied: true,
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "9"),
                          SeatBox(text: "10"),
                          Spacer(),
                          SeatBox(text: "11"),
                          SeatBox(text: "12"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "13"),
                          SeatBox(text: "14"),
                          Spacer(),
                          SeatBox(text: "15"),
                          SeatBox(text: "16"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(
                            text: "17",
                            selected: true,
                          ),
                          SeatBox(text: "18"),
                          Spacer(),
                          SeatBox(text: "19"),
                          SeatBox(
                            text: "20",
                            ocupied: true,
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(
                            text: "21",
                            ocupied: true,
                          ),
                          SeatBox(
                            text: "22",
                            ocupied: true,
                          ),
                          Spacer(),
                          SeatBox(text: "23"),
                          SeatBox(text: "24"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "25"),
                          SeatBox(text: "26"),
                          Spacer(),
                          SeatBox(text: "27"),
                          SeatBox(text: "28"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "29"),
                          SeatBox(text: "30"),
                          Spacer(),
                          SeatBox(text: "31"),
                          SeatBox(text: "32"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "33"),
                          SeatBox(text: "34"),
                          Spacer(),
                          SeatBox(text: "35"),
                          SeatBox(text: "36"),
                        ],
                      ),
                      Row(
                        children: const [
                          SeatBox(text: "37"),
                          SeatBox(text: "38"),
                          Spacer(),
                          SeatBox(
                            text: "39",
                            ocupied: true,
                          ),
                          SeatBox(
                            text: "40",
                            ocupied: true,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Disponible",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 8),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Seleccionado",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 8),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration:  BoxDecoration(
                                color: kPrimaryColor.withOpacity(0.3),
                                borderRadius:
                                   const BorderRadius.all(Radius.circular(8))),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            "Ocupado",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 8),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CheckoutScreen()))
                  },
                  child: const Text("Continuar"),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeatBox extends StatelessWidget {
  const SeatBox(
      {Key? key,
      required this.text,
      this.selected = false,
      this.ocupied = false})
      : super(key: key);
  final String text;
  final bool selected;
  final bool ocupied;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 55,
        height: 55,
        margin: const EdgeInsets.all(defaultPadding / 3),
        decoration: BoxDecoration(
            color:ocupied ? kPrimaryColor.withOpacity(0.3) : selected ? kPrimaryColor : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        )));
  }
}
