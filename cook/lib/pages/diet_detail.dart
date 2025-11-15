import 'package:cook/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DietDetailPage extends StatelessWidget {
  const DietDetailPage({super.key});

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Nieprawidłowy adres URL')));
      return;
    }
    try {
      if (!await launchUrl(uri)) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Nie można otworzyć linku')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Błąd podczas otwierania linku')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    final DietModel? diet = args is DietModel ? args : null;

    if (diet == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Szczegóły diety')),
        body: Center(child: Text('Brak danych diety')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(diet.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: diet.boxColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child: SvgPicture.asset(diet.iconPath, height: 90)),
            ),
            SizedBox(height: 20),
            Text(
              diet.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '${diet.level} • ${diet.duration} • ${diet.calorie}',
              style: TextStyle(color: Colors.blueGrey),
            ),
            SizedBox(height: 20),
            Text(
              'Opis',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              'To przykładowy opis przepisu. Tutaj możesz dodać więcej informacji o diecie, składnikach i krokach przygotowania.',
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>
                        _openUrl(context, 'https://www.example.com'),
                    child: Text('Otwórz w przeglądarce'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(12),
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
