import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_pertama/login_screen.dart';
import 'package:project_pertama/main.dart';
import 'package:project_pertama/register_screen.dart';
import 'package:project_pertama/tambah_pemain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final List<String> daftarNomorTelp = [];
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text("Persib App", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        backgroundColor: Colors.blue[500],
        leading: Padding(padding: const EdgeInsets.only(left:8), child: Image.asset('assets/images/Logo_Persib_Bandung.png')),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white,),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jadwal Pertandingan Persib Bandung",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.blue[50],
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: const [
                    Text(
                      "Persib Bandung VS Arema FC",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("Tanggal: 25 Desember 2024"),
                    Text("Waktu: 19:00 WIB"),
                    Text("Lokasi: Stadion Gelora Bandung Lautan Api"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Menu",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MenuItem(icon: Icons.person, label: "Player", onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TambahPemain()));
                },),
                _MenuItem(icon: Icons.calendar_today, label: "Jadwal"),
                _MenuItem(icon: Icons.bar_chart, label: "Klasemen"),
                _MenuItem(icon: Icons.shopping_bag, label: "Merchandise"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Berita Terbaru Persib Bandung",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Container(
                    width: 220,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 99, 255, 217),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Persib Bandung Resmi Rekrut Pemain Baru",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Persib Bandung telah resmi merekrut pemain baru untuk memperkuat skuad mereka di musim depan. Pemain tersebut diharapkan dapat memberikan kontribusi besar bagi tim.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _MenuItem({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
        Icon(icon, size: 30, color: Colors.blue),
        const SizedBox(height: 4),
        Text(label),
      ],
      )
    );
  }
}