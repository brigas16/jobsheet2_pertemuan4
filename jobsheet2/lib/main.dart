import 'package:flutter/material.dart';
import 'package:jobsheet2/widgets/KonversiSuhu.dart';
import 'package:jobsheet2/widgets/PerhitunganTerakhir.dart';
import 'package:jobsheet2/widgets/RiwayatPerhitungan.dart';
import 'package:jobsheet2/widgets/TargetPerhitungan.dart';
import 'package:jobsheet2/widgets/inputSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.
  final etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Fahrenheit", "Reamur"];
  String selectedDrowpdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDrowpdown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDrowpdown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;

            break;
          case "Reamur":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;

            break;
          case "Fahrenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) + 32;

            break;
        }

        listHasil.add("Konversi dari" +
            etInput.text +
            "Celcius ke" +
            selectedDrowpdown +
            "Dengan Hasil : " +
            hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basic Widget',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('widget.title'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              inputSuhu(etInput: etInput),
              SizedBox(
                height: 8,
              ),
              TargetPerhitungan(
                selectedDrowpdown: selectedDrowpdown,
                listSatuanSuhu: listSatuanSuhu,
                onDropdownChanged: onDropdownChanged,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              PerhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
              SizedBox(
                height: 10,
              ),
              KonversiSuhu(
                onPressed: konversiSuhu,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
              RiwayatPerhitungan(listHasil: listHasil)
            ],
          ),
        ),
      ),
    );
  }
}
