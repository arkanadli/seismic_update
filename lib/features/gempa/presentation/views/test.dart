class Klasemen {
  // atributes kelas
  final List<String> clubs;
  late Map<String, int> skorClubs;

  // kontruktor dan inisialisasi skorClubs yakni 0 untuk tiap club
  Klasemen(this.clubs) {
    skorClubs = {};
    for (String club in clubs) {
      skorClubs[club] = 0;
    }
  }

  // fungsi untuk mengambil peringkat dengan parameter nomorPeringkat
  String ambilPeringkat(int nomorPeringkat) {
    // Memanggil fungsi sortKlasemen untuk mensorting Klasemen
    List<MapEntry<String, int>> sortedKlasemen = sortKlasemen();
    // kondisi jika parameter tidak valid
    if (nomorPeringkat > sortedKlasemen.length) {
      return 'Peringkat $nomorPeringkat tidak didalam list peringkat, peringkat hanya sampai ${sortedKlasemen.length}';
    }
    // return output club yang memiliki klasemen dengan urutan sesuai paramater fungsi
    return "'${sortedKlasemen[nomorPeringkat - 1].key}'"; // di kurangi satu agar sesuai dengan dimensi indeks list yang dari 0
  }

  // fungsi untuk cetak klasemen
  List<String> cetakKlasemen() {
    // Memanggil fungsi sortKlasemen untuk mensorting Klasemen
    List<MapEntry<String, int>> sortedKlasemen = sortKlasemen();
    List<String> result = [];
    for (var entry in sortedKlasemen) {
      // menambahkan tiap entry ke dalam 1 indeks list<String>
      result.add("'${entry.key}'=>${entry.value}");
    }
    // return result berbentuk List<String>
    return result;
  }

  // Fungsi Sorting Klasemen
  List<MapEntry<String, int>> sortKlasemen() {
    List<MapEntry<String, int>> sortedKlasemen = skorClubs.entries.toList();
    sortedKlasemen.sort((a, b) => b.value.compareTo(a.value));
    return sortedKlasemen;
  }

  // Fungsi untuk menyimpan skor permainan dari pertandingan
  // memiliki 3 parameter yakni klubKandang, klubTandang, dan skor berformat 'x:y'
  void catatPermainan(String klubKandang, String klubTandang, String skor) {
    // mengubah skor dengan format 'x:y' menjadi [Int x, Int y]
    final List<int> skorSplit =
        skor.split(':').map((e) => int.parse(e)).toList();
    int golKandang = skorSplit[0];
    int golTandang = skorSplit[1];

    // Penentuan skor yang menang dan kalah
    if (golKandang > golTandang) { 
      // club kandang mendapatkan poin kemenangan
      skorClubs[klubKandang] = (skorClubs[klubKandang] ?? 0) + 3; // menerapkan null safety
    } else if (golKandang < golTandang) { 
      // club tandang mendapatkan poin kemenangan
      skorClubs[klubTandang] = (skorClubs[klubTandang] ?? 0) + 3;
    } else { // draw
      skorClubs[klubKandang] = (skorClubs[klubKandang] ?? 0) + 1;
      skorClubs[klubTandang] = (skorClubs[klubTandang] ?? 0) + 1;
    }
  }
}
