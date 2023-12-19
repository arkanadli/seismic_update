import 'package:flutter/material.dart';
import 'package:seismic_update/core/services/injection_container.dart';
import 'package:seismic_update/features/kontak/domain/usecases/get_all_kontak.dart';

class KontakScreen extends StatefulWidget {
  const KontakScreen({super.key});

  @override
  State<KontakScreen> createState() => _KontakScreenState();
}

class _KontakScreenState extends State<KontakScreen> {
  final GetAllKontak getAllKontak = sl<GetAllKontak>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('s'));
  }
}
