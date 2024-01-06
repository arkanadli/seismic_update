import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:seismic_update/features/gempa/domain/entities/gempa_entity.dart';
import 'package:seismic_update/features/gempa/presentation/cubit/gempa_cubit.dart';
import 'package:seismic_update/features/gempa/presentation/cubit/gempa_state.dart';

import '../widgets/card_data_gempa.dart';

class GempaScreen extends StatefulWidget {
  const GempaScreen({super.key});

  @override
  State<GempaScreen> createState() => _GempaScreenState();
}

class _GempaScreenState extends State<GempaScreen> {
  bool startAnimation = false;

  Future<void> getGempaData() async {
    context.read<GempaCubit>().getDataGempa();
  }

  @override
  void initState() {
    super.initState();
    getGempaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              BlocConsumer<GempaCubit, GempaState>(listener: (context, state) {
                if (state is GempaError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                    ),
                  );
                }
              }, builder: (context, state) {
                return state is GettingDataGempa
                    ? screenDataLoading()
                    : state is DataGempaLoaded
                        ? screenDataLoaded(context, state)
                        : screenFetchError(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox screenFetchError(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            getGempaData();
          },
          child: const Icon(Iconsax.refresh),
        ),
      ),
    );
  }

  Center screenDataLoading() {
    return const Center(
      child: Column(
        children: [CircularProgressIndicator()],
      ),
    );
  }

  SizedBox screenDataLoaded(BuildContext context, DataGempaLoaded state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 140,
      child: LiquidPullToRefresh(
        backgroundColor: Colors.white,
        color: Colors.green,
        onRefresh: () => getGempaData(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: state.dataGempa.length,
            itemBuilder: (context, index) {
              final gempa = state.dataGempa[index];
              return CardDataGempa(gempa: gempa);
            },
          ),
        ),
      ),
    );
  }
}
