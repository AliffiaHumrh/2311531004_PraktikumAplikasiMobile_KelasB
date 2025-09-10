import 'dart:io';
import 'package:halo/oop.dart';

void main() {
  PaketLaundry cuciSetrika = PaketLaundry("Cuci & Setrika", 6000);
  PaketLaundry cuci = PaketLaundry("Cuci", 4000);
  PaketLaundry setrika = PaketLaundry("Setrika", 3000);

  TransaksiLaundry transaksi = TransaksiLaundry();

  bool lanjut = true;
  print("=== Aplikasi Mini Laundry (OOP dengan Menu) ===");

  while (lanjut) {
    print("\nPilih Paket:");
    print("1. Cuci & Setrika (Rp6000/kg)");
    print("2. Cuci (Rp4000/kg)");
    print("3. Setrika (Rp3000/kg)");
    print("4. Selesai dan hitung total");

    stdout.write("Masukkan pilihan Anda (1-4): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 4) {
      lanjut = false;
      break;
    }

    stdout.write("Masukkan jumlah kg: ");
    int kg = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
        transaksi.tambahPesanan(cuciSetrika, kg);
        print(
          "Ditambahkan: $kg kg ${cuciSetrika.nama} = Rp${cuciSetrika.hitungHarga(kg)}",
        );
        break;
      case 2:
        transaksi.tambahPesanan(cuci, kg);
        print("Ditambahkan: $kg kg ${cuci.nama} = Rp${cuci.hitungHarga(kg)}");
        break;
      case 3:
        transaksi.tambahPesanan(setrika, kg);
        print(
          "Ditambahkan: $kg kg ${setrika.nama} = Rp${setrika.hitungHarga(kg)}",
        );
        break;
      default:
        print("Pilihan tidak valid!");
    }
  }

  transaksi.cetakNota();
}
