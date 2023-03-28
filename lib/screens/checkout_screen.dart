import 'package:albatros_app/screens/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../constants.dart';
import 'booking_list.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
                      "Información de pagos",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Opacity(
                      opacity: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            color: Color(0xFFF8F8F9),
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: const Icon(Iconsax.arrow_left_2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Nombre",
                    filled: true,
                    fillColor: Color(0xFFF8F8F9),
                    hintStyle: TextStyle(
                      color: Color(0xFFB8B5C3),
                    ),
                    border: defaultOutlineInputBorder,
                    enabledBorder: defaultOutlineInputBorder,
                    focusedBorder: defaultOutlineInputBorder,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Iconsax.user),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                    filled: true,
                    fillColor: Color(0xFFF8F8F9),
                    hintStyle: TextStyle(
                      color: Color(0xFFB8B5C3),
                    ),
                    border: defaultOutlineInputBorder,
                    enabledBorder: defaultOutlineInputBorder,
                    focusedBorder: defaultOutlineInputBorder,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Iconsax.card),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
               const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Número de tarjeta",
                    filled: true,
                    fillColor: Color(0xFFF8F8F9),
                    hintStyle: TextStyle(
                      color: Color(0xFFB8B5C3),
                    ),
                    border: defaultOutlineInputBorder,
                    enabledBorder: defaultOutlineInputBorder,
                    focusedBorder: defaultOutlineInputBorder,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(Iconsax.card),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "MM/YY",
                          filled: true,
                          fillColor: Color(0xFFF8F8F9),
                          hintStyle: TextStyle(
                            color: Color(0xFFB8B5C3),
                          ),
                          border: defaultOutlineInputBorder,
                          enabledBorder: defaultOutlineInputBorder,
                          focusedBorder: defaultOutlineInputBorder,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Iconsax.calendar),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "CVV",
                          filled: true,
                          fillColor: Color(0xFFF8F8F9),
                          hintStyle: TextStyle(
                            color: Color(0xFFB8B5C3),
                          ),
                          border: defaultOutlineInputBorder,
                          enabledBorder: defaultOutlineInputBorder,
                          focusedBorder: defaultOutlineInputBorder,
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Iconsax.card_add),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
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
                            builder: (context) => const TicketScreen()))
                  },
                  child: const Text("Pagar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder defaultOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide.none,
  borderRadius: BorderRadius.all(Radius.circular(12)),
);
