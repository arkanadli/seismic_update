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
        bottom: 16.0,
      ),
      child: Card(
        color: const Color.fromARGB(255, 229, 240, 166),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wilayah: ${gempa.wilayah}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.monitor_heart_outlined, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    "Magnitude: ${gempa.magnitude}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.landscape_sharp, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(
                    "Kedalaman: ${gempa.kedalaman}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    "Jam: ${gempa.jam}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.date_range, color: Colors.purple),
                  const SizedBox(width: 8),
                  Text(
                    "Tanggal: ${gempa.tanggal}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
