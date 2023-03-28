import 'package:albatros_app/constants.dart';
import 'package:albatros_app/screens/booking_list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _title = TextEditingController();
  String? originSelected;
  String? destinySelected;

  String departureDate = "";
  String returnDate = "";

  int qty = 1;
  int _currentPage = 0;
  List<String> demoBigImages = [
    "https://images.pexels.com/photos/4825701/pexels-photo-4825701.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/2079228/pexels-photo-2079228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://media.istockphoto.com/id/495638220/photo/sahuaros.jpg?b=1&s=612x612&w=0&k=20&c=I_zs_RwtH0kivYn7_DH3GbSAiVdBqnw_g5jr5tT3y3k=",
    "https://media.istockphoto.com/id/1471057920/photo/view-of-hermosillo-city-from-the-top-of-cerro-de-la-campana-at-sunset.jpg?b=1&s=612x612&w=0&k=20&c=QAH0JV1OMtRo-Kjkan1MBrCOn0TsLXTxMq9WEBKCnnw=",
  ];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("Hermosillo"), value: "Hermosillo"),
      DropdownMenuItem(child: Text("Nogales"), value: "Nogales"),
      DropdownMenuItem(child: Text("Caborca"), value: "Caborca"),
      DropdownMenuItem(child: Text("Cd. Obregon"), value: "Cd. Obregon"),
      DropdownMenuItem(child: Text("Navojoa"), value: "Navojoa"),
      DropdownMenuItem(child: Text("Magdalena"), value: "Magdalena"),
      DropdownMenuItem(child: Text("Cananea"), value: "Cananea"),
      DropdownMenuItem(child: Text("Santa Ana"), value: "Santa Ana"),
    ];
    return menuItems;
  }

  String simplyFormat({required DateTime time}) {
    String year = time.year.toString();
    String month = time.month.toString().padLeft(2, '0');
    String day = time.day.toString().padLeft(2, '0');

    // return the "yyyy-MM-dd HH:mm:ss" format
    return "$day/$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                "Buenos dias",
                style: TextStyle(color: Color(0xFFB8B5C3), fontSize: 16),
              ),
              const Text(
                "¿A donde te Diriges?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              AspectRatio(
                aspectRatio: 1.5,
                child: Stack(
                  children: [
                    PageView.builder(
                        itemCount: demoBigImages.length,
                        onPageChanged: (value) {
                          setState(() {
                            _currentPage = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Image.network(demoBigImages[index]),
                          );
                        }),
                    Positioned(
                        bottom: defaultPadding,
                        right: defaultPadding,
                        child: Row(
                          children: List.generate(
                            demoBigImages.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(
                                  left: defaultPadding / 2),
                              child:
                                  IndicatorDot(isActive: index == _currentPage),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Selecciona tu origen y destino",
                style: TextStyle(color: Color(0xFFB8B5C3), fontSize: 16),
              ),
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: defaultOutlineInputBorder,
                    enabledBorder: defaultOutlineInputBorder,
                    focusedBorder: defaultOutlineInputBorder,
                    hintText: "Seleccione el Origen",
                    filled: true,
                    fillColor: Color(0xFFF8F8F9),
                    hintStyle: TextStyle(
                      color: Color(0xFFB8B5C3),
                    ),
                  ),
                  validator: (value) =>
                      value == null ? "Seleccione el Origen" : null,
                  dropdownColor: Color(0xFFF8F8F9),
                  value: originSelected,
                  onChanged: (String? newValue) {
                    setState(() {
                      originSelected = newValue!;
                    });
                  },
                  items: dropdownItems),
              const SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: defaultOutlineInputBorder,
                    enabledBorder: defaultOutlineInputBorder,
                    focusedBorder: defaultOutlineInputBorder,
                    hintText: "Seleccione el Destino",
                    filled: true,
                    fillColor: Color(0xFFF8F8F9),
                    hintStyle: TextStyle(
                      color: Color(0xFFB8B5C3),
                    ),
                  ),
                  validator: (value) =>
                      value == null ? "Seleccione el Destino" : null,
                  dropdownColor: Color(0xFFF8F8F9),
                  value: destinySelected,
                  onChanged: (String? newValue) {
                    setState(() {
                      destinySelected = newValue!;
                    });
                  },
                  items: dropdownItems),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Selecciona la fecha",
                style: TextStyle(color: Color(0xFFB8B5C3), fontSize: 16),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? startPickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2024),
                             builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: kPrimaryColor,
          ),
        ),
        child: child!,
      )}
                            );
                        if (startPickedDate != null) {
                          //String formattedDate = DateFormat('dd-MM-yyyy').format(startPickedDate);
                          setState(() {
                            departureDate = simplyFormat(time: startPickedDate);
                          });
                        }
                      },
                      child: Container(
                        //width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F8F9),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                            child: Text(
                          departureDate.isEmpty
                              ? "Fecha de Salida"
                              : departureDate,
                          style: const TextStyle(color: Color(0xFFB8B5C3)),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? startPickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2024),
                            builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                          primary: kPrimaryColor,
                                     ),
                                     ),
                               child: child!,
                          )});
                        if (startPickedDate != null) {
                          //String formattedDate = DateFormat('dd-MM-yyyy').format(startPickedDate);
                          setState(() {
                            returnDate = simplyFormat(time: startPickedDate);
                          });
                        }
                      },
                      child: Container(
                        //width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F8F9),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Center(
                            child: Text(
                          returnDate.isEmpty ? "Fecha de Regreso" : returnDate,
                          style: const TextStyle(color: Color(0xFFB8B5C3)),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
             const SizedBox(
                height: 25,
              ),
              const Text(
                "Selecciona los pasajeros",
                style: TextStyle(color: Color(0xFFB8B5C3), fontSize: 16),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (qty >= 2) qty -= 1;
                        });
                      },
                      icon: const Icon(Iconsax.minus)),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  Text(
                    "$qty",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          qty += 1;
                        });
                      },
                      icon: const Icon(Iconsax.add)),
                ],
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
                          builder: (context) => const BookingList()))
                },
                child: const Text("Buscar"),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kPrimaryColor.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
