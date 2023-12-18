import 'package:flutter/material.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';

class CardDataGempa extends StatelessWidget {
  const CardDataGempa({
    super.key,
    required this.gempa,
  });

  final GempaEntity gempa;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Card(
        color: const Color.fromARGB(255, 229, 240, 166),
        shadowColor: Colors.red,
        elevation: 4,
        shape: const RoundedRectangleBorder(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wilayah : ${gempa.wilayah}",
              ),
              Text(
                "Magnitude : ${gempa.magnitude}",
              ),
              Text("Kedalaman : ${gempa.kedalaman}"),
              Text(
                "Jam : ${gempa.jam}",
              ),
              Text(
                "Tanggal : ${gempa.tanggal}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
