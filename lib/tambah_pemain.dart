import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_pertama/home_screen.dart';
import 'package:project_pertama/main.dart';

class TambahPemain extends StatefulWidget {
  const TambahPemain({super.key});

  @override
  State<TambahPemain> createState() => _TambahPemain();
}

class _TambahPemain extends State<TambahPemain> {
  final _formKey = GlobalKey<FormState>();
  final _playerNameController = TextEditingController();
  final _playerPosController = TextEditingController();
  final _playerNumController = TextEditingController();
  final _playerCountryController = TextEditingController();
  final _playerAgeController = TextEditingController();
  final _playerHeightController = TextEditingController();
  String? _playerGenderController;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text("Tambah Pemain Baru", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Form untuk menambahkan pemain baru akan ditempatkan di sini.", style: TextStyle(fontSize: screenWidth/30), textAlign: TextAlign.left),
                SizedBox(height: 10),
                TextFormField(
                  controller: _playerNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tidak boleh kosong.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Nama", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan nama anda.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _playerPosController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Tidak boleh kosong.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Posisi Pemain", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan posisi pemain.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _playerNumController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong.";
                    } else if (int.tryParse(value) == null) {
                      return "Masukan hanya angka.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Nomor Punggung", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan nomor punggung pemain.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _playerCountryController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Kewarganegaraan", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan negara asal pemain.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _playerAgeController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong.";
                    } else if (int.tryParse(value) == null) {
                      return "Masukan hanya angka.";
                    } else if (int.parse(value) < 10 || int.parse(value) > 50) {
                      return "Usia hanya boleh di antara 10 - 50 tahun.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Usia Pemain", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan usia pemain.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                TextFormField(
                  controller: _playerHeightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong.";
                    } else if (int.tryParse(value) == null) {
                      return "Masukan hanya angka.";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Tinggi Pemain (cm)", style: TextStyle(fontSize: screenWidth/30),),
                    hintText: "Masukan tinggi badan pemain.",
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jenis Kelamin",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: screenWidth/30, color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RadioMenuButton<String>(
                          value: "Laki-laki",
                          groupValue: _playerGenderController,
                          onChanged: (value) => setState(() => _playerGenderController = value),
                          child: const Text("Laki-laki"),
                        ),
                        SizedBox(width: screenWidth/6),
                        RadioMenuButton<String>(
                          value: "Perempuan",
                          groupValue: _playerGenderController,
                          onChanged: (value) => setState(() => _playerGenderController = value),
                          child: const Text("Perempuan"),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log("message");
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the background color to blue
                  foregroundColor: Colors.white, // Set the text/icon color to white for contrast
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Optional: Add padding
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  minimumSize: const Size.fromHeight(50),
                ),
                  child: Text("Submit", style: TextStyle(fontSize: screenWidth/30),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
