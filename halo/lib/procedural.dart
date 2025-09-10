class PaketLaundry {
  String nama;
  int hargaPerKg;

  PaketLaundry(this.nama, this.hargaPerKg);

  int hitungHarga(int kg) {
    return hargaPerKg * kg;
  }
}

class TransaksiLaundry {
  List<Map<String, dynamic>> pesanan = [];

  void tambahPesanan(PaketLaundry paket, int kg) {
    int subtotal = paket.hitungHarga(kg);
    pesanan.add({
      'paket': paket.nama,
      'kg': kg,
      'subtotal': subtotal,
    });
  }

  int hitungTotal() {
    int total = 0;
    for (var item in pesanan) {
      total += item['subtotal'] as int;
    }
    return total;
  }

  double hitungDiskon(int total) {
    if (total >= 100000) {
      return 0.10;
    } else if (total >= 50000) {
      return 0.05;
    }
    return 0.0;
  }

  void cetakNota() {
    print("\n=== Nota Laundry (OOP) ===");
    for (var item in pesanan) {
      print("${item['paket']} (${item['kg']} kg) = Rp${item['subtotal']}");
    }

    int total = hitungTotal();
    double diskon = hitungDiskon(total);
    double totalBayar = total - (total * diskon);

    print("Total sebelum diskon: Rp$total");
    print("Diskon: ${diskon * 100}%");
    print("Total yang harus dibayar: Rp$totalBayar");
  }
}
