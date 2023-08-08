import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  final Map<String, dynamic> pallets;
  final TextEditingController _textOldBarcode = TextEditingController();
  final TextEditingController _textNewBarcode = TextEditingController();

  DeleteScreen({super.key, required this.pallets});

  Future<void> _showDeleteDialog(
      BuildContext context, final Map<String, dynamic> pallets,
      {required bool isBox}) async {
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
                if (!_textNewBarcode.text.isEmpty) {
                  isBox
                      ? deleteBarcodeBox(
                          _textOldBarcode.text, _textNewBarcode.text)
                      : deleteBarcodeForUnit(
                          _textOldBarcode.text, _textNewBarcode.text);
                  Navigator.pop(context); // закрыть Алерт диалог
                  Navigator.pop(context,
                      'Результат с нового экрана'); // отправить новые данные на предыдущий экран
                }
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

  void deleteBarcodeForUnit(String barcodeForDelete, String newBarcode) {
    for (final pallet in pallets.entries) {
      if (pallet.value is Map<String, List<String>>) {
        pallet.value.forEach((key, box) {
          if (box is List<String>) {
            if (box.contains(barcodeForDelete)) {
              final int index = box.indexOf(barcodeForDelete);
              box.remove(barcodeForDelete);
              box.insert(index, newBarcode);
            }
          }
        });
      }
    }
  }

  void deleteBarcodeBox(String barcodeForDelete, String newBarcode) {
    bool shouldBreak = false;
    for (final pallet in pallets.entries) {
      if (shouldBreak) {
        return; // пропуск оставшихся итераций
      }
      if (pallet.value is Map<String, List<String>>) {
        Map<String, List<String>> copyBoxes = Map.from(pallet.value);
        copyBoxes.forEach((key, box) {
          if (key == barcodeForDelete) {
            pallet.value[newBarcode] =
                List<String>.from(pallet.value[barcodeForDelete]);
            pallet.value.remove(barcodeForDelete);
            shouldBreak = true;
            return;
          }
          if (shouldBreak) {
            return; // пропуск оставшихся итераций
          }
        });
      }
    }
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
                  if (!_textOldBarcode.text.isEmpty) {
                    _showDeleteDialog(context, pallets, isBox: false);
                  }
                },
                child: const Text(
                  'Удалть штрихкод бутылки',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(26.0))),
                onPressed: () {
                  if (!_textOldBarcode.text.isEmpty) {
                    _showDeleteDialog(context, pallets, isBox: true);
                  }
                },
                child: const Text(
                  'Удалть штрихкод коробки',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
