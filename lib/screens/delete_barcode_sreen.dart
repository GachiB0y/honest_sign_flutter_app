import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  final Map<String, dynamic> pallets;
  final TextEditingController _textOldBarcode = TextEditingController();
  final TextEditingController _textNewBarcode = TextEditingController();

  DeleteScreen({super.key, required this.pallets});

  Future<void> _showDeleteDialog(
      BuildContext context, final Map<String, dynamic> pallets) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Вы точно хотите удалить этот штрихкод?'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: true,
                  controller: _textNewBarcode,
                  decoration: const InputDecoration(
                      hintText: 'Отсканируйте  новый штрихкод'),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // закрыть Алерт диалог
                Navigator.pop(context,
                    'Результат с нового экрана'); // отправить новые данные на предыдущий экран
              },
              child: const Text('Да'),
            ),
            ElevatedButton(
              onPressed: () {
                // Обработка нажатия кнопки "Отмена"
                Navigator.pop(context);
              },
              child: const Text('Отмена'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Штрихкод для удаления:',
              style: TextStyle(fontSize: 24),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  autofocus: true,
                  controller: _textOldBarcode,
                  decoration:
                      const InputDecoration(hintText: 'Отсканируйте штрихкод'),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(26.0))),
                onPressed: () {
                  if (!_textOldBarcode.text.isEmpty)
                    _showDeleteDialog(context, pallets);
                },
                child: const Text('Удалть штрихкод'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
