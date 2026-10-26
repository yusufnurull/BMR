// Jenis kelamin menentukan konstanta pada rumus Mifflin-St Jeor.
enum Gender { male, female }

// Menyimpan data pengguna dan menghitung estimasi kebutuhan kalori saat istirahat.
class BmrCalculator {
  BmrCalculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  final int height;
  final int weight;
  final int age;
  final Gender gender;

  // Rumus Mifflin-St Jeor memakai berat (kg), tinggi (cm), dan umur (tahun).
  double calculateBMR() {
    final genderConstant = gender == Gender.male ? 5 : -161;
    return (10 * weight) + (6.25 * height) - (5 * age) + genderConstant;
  }
}
