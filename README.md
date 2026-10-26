# bmi

# BMR (Basal Metabolic Rate) Calculator

Aplikasi BMR Calculator adalah aplikasi berbasis Flutter yang dikembangkan untuk menghitung estimasi jumlah kalori basal harian yang dibutuhkan oleh tubuh manusia ketika dalam keadaan istirahat total. Aplikasi ini menggunakan rumus **Mifflin-St Jeor** yang memperhitungkan faktor jenis kelamin, tinggi badan, berat badan, dan umur.

## 👥 Anggota Kelompok

1. MUHAMMAD RAFLI RAFSANJANI - K3524030
2. YUSUF NURUL HUDA - K3524038
3. MUHAMMAD RAMDHANI - K3524080

## 📱 Deskripsi Aplikasi

- **Platform**: Android / iOS (Flutter)
- **Fitur Utama**:
  - Pemilihan gender (Male/Female)
  - Slider interaktif untuk memilih tinggi badan (Height)
  - Tombol inkremen/dekremen untuk berat badan (Weight) dan umur (Age)
  - Perhitungan estimasi kalori harian saat istirahat (BMR)

Rumus Mifflin-St Jeor yang digunakan:

- Laki-laki: `BMR = 10 × berat(kg) + 6.25 × tinggi(cm) − 5 × umur + 5`
- Perempuan: `BMR = 10 × berat(kg) + 6.25 × tinggi(cm) − 5 × umur − 161`

Hasil merupakan estimasi dan dapat berbeda dari kebutuhan aktual setiap orang.

## 📸 Screenshot Aplikasi

Simpan screenshot aplikasi pada folder `screenshots/` dengan nama berikut:

![Screenshot Input Page](screenshots/bmr-input.png)
![Screenshot Result Page](screenshots/bmr-result.png)

## 🚀 Cara Menjalankan Project

1. Clone repository ini.
2. Buka folder project, lalu jalankan `flutter pub get`.
3. Hubungkan emulator atau perangkat fisik Anda.
4. Jalankan perintah `flutter run`.
