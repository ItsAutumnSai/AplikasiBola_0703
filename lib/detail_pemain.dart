import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_pertama/home_screen.dart';
import 'package:project_pertama/main.dart';

class DetailPemain extends StatefulWidget {
  final String nama;
  final String penyerang;
  final int nomor;
  final String negara;
  final int usia;
  final double tinggi;
  final String gender;
  const DetailPemain({super.key, this.nama = "", this.penyerang = "", this.nomor = 0, this.negara = "", this.usia = 0, this.tinggi = 0.0, this.gender = ""});


  @override
  State<DetailPemain> createState() => _DetailPemain();
}

class _DetailPemain extends State<DetailPemain> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text("Detail Pemain", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Pemain: ${widget.nama}", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    Text("Posisi Pemain: ${widget.penyerang}", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    Text("Nomor Punggung: ${widget.nomor}", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    Text("Kewarganegaraan: ${widget.negara}", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    Text("Usia Pemain: ${widget.usia} tahun", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    Text("Tinggi Pemain: ${widget.tinggi/100} m", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    Text("Jenis Kelamin: ${widget.gender}", style: TextStyle(fontSize: screenWidth/25),),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38, // Set the background color to blue
                      foregroundColor: Colors.white, // Set the text/icon color to white for contrast
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Optional: Add padding
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                      minimumSize: const Size.fromHeight(50),
                    ),
                      child: Text("Cancel", style: TextStyle(fontSize: screenWidth/30, color: Colors.black45),),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false,);
                      },
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38, // Set the background color to blue
                      foregroundColor: Colors.white, // Set the text/icon color to white for contrast
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Optional: Add padding
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                      minimumSize: const Size.fromHeight(50),
                    ),
                      child: Text("Save", style: TextStyle(fontSize: screenWidth/30, color: Colors.black45),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
