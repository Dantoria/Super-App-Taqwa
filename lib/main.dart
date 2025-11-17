void main() async {
  /// 🔹 Pastikan Flutter sudah siap sebelum menjalankan async
  WidgetsFlutterBinding.ensureInitialized();
 
  /// 🔹 Inisialisasi format tanggal bahasa Indonesia
  /// Contoh hasil: “Senin, 6 November 2025”
  await initializeDateFormatting('id_ID', null);
 
  /// 🔹 Override SSL supaya koneksi HTTP/HTTPS yang self-signed tetap bisa jalan
  HttpOverrides.global = MyHttpOverrides();
 
  /// 🔹 Jalankan aplikasi utama
  runApp(const MyApp());
}
 
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
A