import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:seismic_update/core/services/injection_container.dart';
import 'package:seismic_update/features/kontak/data/model/kontak_model.dart';
import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/usecases/create_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/delete_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/get_all_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/get_by_id_kontak.dart';
import 'package:seismic_update/features/kontak/domain/usecases/update_kontak.dart';

class KontakScreen extends StatefulWidget {
  const KontakScreen({super.key});

  @override
  State<KontakScreen> createState() => _KontakScreenState();
}

class _KontakScreenState extends State<KontakScreen> {
  final GetAllKontak getAllKontak = sl<GetAllKontak>();
  final GetByIdKontak getByIdKontak = sl<GetByIdKontak>();
  final CreateKontak createKontak = sl<CreateKontak>();
  final UpdateKontak updateKontak = sl<UpdateKontak>();
  final DeleteKontak deleteKontak = sl<DeleteKontak>();
  final TextEditingController namaTeksController = TextEditingController();
  final TextEditingController nomorTeksController = TextEditingController();
  final TextEditingController keteranganTeksController =
      TextEditingController();

  void openEditBox(KontakEntity kontak) {
    showDialog(
      context: context,
      builder: (context) {
        namaTeksController.text = kontak.nama;
        nomorTeksController.text = kontak.nomorHp;
        keteranganTeksController.text = kontak.keterangan;
        final id = kontak.id;
        return AlertDialog(
          content: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: 500,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 20,
                      controller: namaTeksController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      maxLength: 12,
                      controller: nomorTeksController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'No HP',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      maxLength: 10,
                      controller: keteranganTeksController,
                      decoration: const InputDecoration(
                        labelText: 'Keterangan',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              )),
          actions: [
            ElevatedButton(
                onPressed: () {
                  //add new note to firestore

                  Navigator.of(context).pop();
                },
                child: const Text('Close')),
            ElevatedButton(
                onPressed: () {
                  //add new note to firestore

                  updateKontak.call(KontakModel(
                      id: id,
                      nama: namaTeksController.text,
                      nomorHp: nomorTeksController.text,
                      keterangan: keteranganTeksController.text));

                  Navigator.of(context).pop();
                },
                child: const Text('Save Edit'))
          ],
        );
      },
    );
  }

  void openDeleteConfirm(String id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Delete'),
          content: const Text('Apakah kamu yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                deleteKontak
                    .call(id); // Panggil fungsi delete jika dikonfirmasi
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // open dialog box
  void openCreateBox() {
    namaTeksController.text = '';
    nomorTeksController.text = '';
    keteranganTeksController.text = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: 500,
                child: Column(
                  children: [
                    TextFormField(
                      maxLength: 20,
                      controller: namaTeksController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      maxLength: 12,
                      controller: nomorTeksController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'No HP',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                    TextFormField(
                      maxLength: 10,
                      controller: keteranganTeksController,
                      decoration: const InputDecoration(
                        labelText: 'Keterangan',
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ],
                ),
              )),
          actions: [
            ElevatedButton(
                onPressed: () {
                  //add new note to firestore

                  createKontak.call(
                    KontakModel(
                      id: '1',
                      nama: namaTeksController.text,
                      nomorHp: nomorTeksController.text,
                      keterangan: keteranganTeksController.text,
                    ),
                  );
                  namaTeksController.text = '';
                  nomorTeksController.text = '';
                  keteranganTeksController.text = '';
                  Navigator.of(context).pop();
                },
                child: const Text('Add Notes'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: StreamBuilder(
            stream: getAllKontak.call(),
            builder: (context, snapshot) {
              // for implementation: display ui based on state of the stream
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              }
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Click the + icon to add a new contact",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }
              final listData = snapshot.data!;
              return cardListKontak(context, listData);
            },
          ),
        ),
      ),
    );
  }

  SizedBox cardListKontak(BuildContext context, List<KontakEntity> listData) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          final dataKontak = listData[index];
          return Card(
            child: GestureDetector(
              onTap: () => openEditBox(dataKontak),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://i.ibb.co/PGv8ZzG/me.jpg",
                  ),
                ),
                title: Text('${dataKontak.nama} (${dataKontak.keterangan})'),
                subtitle: Text(dataKontak.nomorHp),
                trailing: IconButton(
                  onPressed: () {
                    openDeleteConfirm(dataKontak.id);
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container floatingButton() {
    return Container(
      transform: Matrix4.translationValues(-15, -15, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.green[400]),
      child: IconButton(
        color: Colors.black,
        onPressed: () {
          openCreateBox();
        },
        icon: const Icon(
          Iconsax.add,
          size: 40,
        ),
      ),
    );
  }
}
