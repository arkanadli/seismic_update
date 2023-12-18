import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:seismic_update/features/kontak/data/model/kontak_model.dart';
import 'package:seismic_update/features/kontak/domain/entities/kontak_entity.dart';
import 'package:seismic_update/features/kontak/domain/repositories/kontak_repository.dart';

class KontakRepositoryImpl extends KontakRepository {
  final FirebaseFirestore _firestore;

  KontakRepositoryImpl(this._firestore);

  @override
  Stream<List<KontakEntity>> getAllKontak() {
    return _firestore.collection('kontaks').snapshots().map((querySnapshot) {
      return querySnapshot.docs
          .map(
            (doc) => KontakModel.fromJson(
              doc.data(),
            ),
          )
          .toList();
    });
  }

  @override
  Future<KontakEntity> getByIdKontak(String id) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await _firestore.collection('kontaks').doc(id).get();
    return KontakModel.fromJson(doc.data()!);
  }

  @override
  Future<void> create(KontakEntity kontakEntity) async {
    DocumentReference<Map<String, dynamic>> docRef =
        _firestore.collection('kontaks').doc();

    final id = docRef.id;

    KontakModel kontak = KontakModel.fromEntity(kontakEntity);

    kontak = kontak.copyWith(id: id);

    await docRef.set(kontak.toJson());
  }

  @override
  Future<void> update(KontakEntity kontakEntity) async {
    KontakModel kontakModel = KontakModel.fromEntity(kontakEntity);
    await _firestore
        .collection('kontaks')
        .doc(kontakModel.id)
        .update(kontakModel.toJson());
  }

  @override
  Future<void> delete(String id) async {
    await _firestore.collection('kontaks').doc(id).delete();
  }
}
