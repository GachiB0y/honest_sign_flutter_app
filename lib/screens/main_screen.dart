import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honest_sign_flutter_app/constants.dart';
import 'package:honest_sign_flutter_app/domain/api_client/api_client_barcode.dart';
import 'package:honest_sign_flutter_app/domain/entity/enity.dart';

import 'package:intl/intl.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late TextEditingController _textEditingController;

  final ScrollController _scrollController = ScrollController();
  final List<Item> allBarcodeHistory = [];
  final BarcodeService barcodeService = const BarcodeService();

  final List<Item> unit = [];
  int countBarcodes = 0;
  bool isNewRelease = true;

  final List<Box> boxes = [];

  final ModelsPallet pallets = ModelsPallet(
      barcode: 'Будущая палета',
      date: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
      boxes: []);

  late InputWithKeyboardControlFocusNode myFocusNode;
  late InputWithKeyboardControlFocusNode myFocusNodeCheckBarcode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();

    myFocusNode = InputWithKeyboardControlFocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  Future<void> _showDeleteDialog(
    BuildContext context,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Вы точно хотите удалить все текущие штрихкоды?',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                deleteCurrentUnit(deleteAll: true);
                Navigator.pop(context); // закрыть Алерт диалог
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

  Future<void> _showSendPalletDialog(
    BuildContext context,
    String? message,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message == null
                    ? 'Палета отправлена успешно!'
                    : '$message Повторите попытку.',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogChekBarcode(
    BuildContext context,
    bool isBox,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isBox ? 'Отсканируйте коробку!' : 'Отсканируйте палету!',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  void createBox(String item) {
    setState(() {
      DateTime now = DateTime.now();
      String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
      final List<Item> copyUnits = unit.sublist(0, unit.length - 1);
      boxes.add(Box(barcode: item, date: formattedDateTime, items: copyUnits));

      pallets.boxes = [...boxes];

      unit.clear();
      _scrollController.jumpTo(_scrollController.position
          .maxScrollExtent); //  авто скролл  на последний элемент при добавлении его в список
    });
  }

  void createPallet(String text) {
    setState(() {
      DateTime now = DateTime.now();
      String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
      unit.clear();
      pallets.barcode = text;
      pallets.date = formattedDateTime;
    });
  }

  void _sendText(String text) {
    setState(() {
      DateTime now = DateTime.now();
      String formattedDateTime = DateFormat('dd.MM.yyyy HH:mm').format(now);
      unit.add(Item(barcode: text, date: formattedDateTime));
      allBarcodeHistory.add(Item(barcode: text, date: formattedDateTime));
      countBarcodes += 1;
      //проверка на палету
      if (countBarcodes % (countBoxesPerPallet + 1) == 0) {
        createPallet(text);
      } else if (countBarcodes % (countBoxesPerPallet) == 0) {
        _showDialogChekBarcode(context, false);
      }
      // проверка на коробку
      if (unit.length == countUnitsPerBox) {
        _showDialogChekBarcode(context, true);
      } else if (unit.length == (countUnitsPerBox + 1)) {
        createBox(text);
      }
    });

    // myFocusNode.requestFocus(); //расскоментировать для обычного TExtFormField
    _textEditingController.clear();
  }

  void deleteCurrentUnit({required bool deleteAll}) {
    setState(() {
      if (deleteAll) {
        if (unit.isNotEmpty) {
          countBarcodes -= unit.length;
          unit.clear();
        }
      } else {
        countBarcodes -= 1;
        unit.removeLast();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isNewRelease
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // focusNode: myFocusNode,
                  autofocus: true,
                  controller: _textEditingController,
                  onFieldSubmitted: (value) async {
                    try {
                      await barcodeService.getInfoForBarcodeRealise(
                          numberCard: _textEditingController.text);
                      setState(() {
                        _textEditingController.clear();
                        isNewRelease = false;
                      });
                    } catch (e) {
                      final String message =
                          e.toString().replaceAll('Exception: ', '');
                      _showSendPalletDialog(context, message);
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Введите номер карты, для получения данных!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                      //  TextFormField(
                      //   focusNode: myFocusNode,
                      //   autofocus: true,
                      //   controller: _textEditingController,
                      //   onFieldSubmitted: (value) {
                      //     _sendText(value);
                      //   },
                      // )
                      InputWithKeyboardControl(
                    focusNode: myFocusNode,
                    onSubmitted: (value) {
                      _sendText(value);
                    },
                    autofocus: true,
                    controller: _textEditingController,
                    width: 300,
                    startShowKeyboard: false,
                    buttonColorEnabled: Colors.blue,
                    buttonColorDisabled: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () async {
                        myFocusNode.nextFocus();
                        _showDeleteDialog(context);
                        // /// ВЫЗОВ НОВГО СКРИНА НА УДАЛЕНИЕ
                        // final result = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DeleteScreen(
                        //       pallets: pallets,
                        //     ),
                        //   ),
                        // );
                        // // Обработка результата с нового экрана
                        // if (result != null) {}

                        myFocusNode.requestFocus();
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                      label: const Text('Удалить')),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton.icon(
                      onPressed: () async {
                        myFocusNode.nextFocus();

                        try {
                          if (pallets.barcode != 'Будущая палета') {
                            await barcodeService.postBarcodes(pallets: pallets);
                            _showSendPalletDialog(context, null);
                          } else {
                            _showSendPalletDialog(
                                context, 'Нет штрихкода для палета!');
                          }
                        } catch (e) {
                          final String message =
                              e.toString().replaceAll('Exception: ', '');
                          _showSendPalletDialog(context, message);
                        }

                        myFocusNode.requestFocus();
                      },
                      icon: const Icon(Icons.call_made, color: Colors.green),
                      label: const Text('Отправить палету')),
                ],
              ),
              TwoTabWidget(
                pallets: pallets,
                deleteCurrentUnit: deleteCurrentUnit,
                scrollController: _scrollController,
                unit: unit,
              ),
            ],
          );
  }
}

class InputWithKeyboardControl extends EditableText {
  /// startShowKeyboard is initial value to show or not the keyboard when the widget is created, default value is false
  final bool startShowKeyboard;

  /// focusNode is responsible for controlling the focus of the field, this parameter is required
  final InputWithKeyboardControlFocusNode focusNode;

  /// width is responsible for set the widget size, This parameter is required
  final double width;

  /// buttonColorEnabled is responsible for set color in button when is enabled, default value is Colors.blue
  final Color buttonColorEnabled;

  /// buttonColorDisabled is responsible for set color in button when is disabled, default value is Colors.black
  final Color buttonColorDisabled;

  InputWithKeyboardControl({
    super.key,
    required TextEditingController controller,
    TextStyle style = const TextStyle(color: Colors.black, fontSize: 18),
    Color cursorColor = Colors.black,
    bool autofocus = false,
    Color? selectionColor,
    this.startShowKeyboard = false,
    void Function(String)? onSubmitted,
    required this.focusNode,
    required this.width,
    this.buttonColorEnabled = Colors.blue,
    this.buttonColorDisabled = Colors.black,
  }) : super(
          controller: controller,
          focusNode: focusNode,
          style: style,
          cursorColor: cursorColor,
          autofocus: autofocus,
          selectionColor: selectionColor,
          backgroundCursorColor: Colors.black,
          onSubmitted: onSubmitted,
        );

  @override
  EditableTextState createState() {
    return InputWithKeyboardControlState(
      startShowKeyboard,
      focusNode,
      width,
      buttonColorEnabled,
      buttonColorDisabled,
    );
  }
}

class InputWithKeyboardControlState extends EditableTextState {
  /// showKeyboard is initial value to show or not the keyboard when the widget is created, default value is false
  bool showKeyboard;

  /// focusNode is responsible for controlling the focus of the field, this parameter is required
  final InputWithKeyboardControlFocusNode focusNode;

  /// width is responsible for set the widget size, This parameter is required
  final double width;

  /// buttonColorEnabled is responsible for set color in button when is enabled, default value is Colors.blue
  final Color buttonColorEnabled;

  /// buttonColorDisabled is responsible for set color in button when is disabled, default value is Colors.black
  final Color buttonColorDisabled;

  // funcionListener is responsible for controller focusNode listener
  late Function funcionListener;

  @override
  void initState() {
    funcionListener = () {
      requestKeyboard();
    };

    focusNode.addListener(funcionListener as void Function());
    super.initState();
  }

  @override
  void dispose() {
    focusNode.removeListener(funcionListener as void Function());
    super.dispose();
  }

  InputWithKeyboardControlState(
    this.showKeyboard,
    this.focusNode,
    this.width,
    this.buttonColorEnabled,
    this.buttonColorDisabled,
  );

  @override
  Widget build(BuildContext context) {
    Widget widget = super.build(context);
    return SizedBox(
      width: width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(child: widget),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void requestKeyboard() {
    super.requestKeyboard();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

class InputWithKeyboardControlFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}

class MapListWidget extends StatelessWidget {
  final Map<String, List<String>> data;

  const MapListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.keys.length,
      itemBuilder: (context, index) {
        String key = data.keys.elementAt(index);
        List<String> values = data[key]!;

        return ExpansionTile(
          title: Text(key),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: values.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(values[index]),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.barcode),
    );
  }
}

class BoxWidget extends StatelessWidget {
  final Box box;

  const BoxWidget({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(box.barcode),
      children: <Widget>[
        ListTile(
          title: const Text('Бутылки:'),
          subtitle: Column(
            children: box.items
                .map((item) => ItemWidget(
                      item: item,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ModelsPalletWidget extends StatelessWidget {
  final ModelsPallet pallet;

  const ModelsPalletWidget({super.key, required this.pallet});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(pallet.barcode),
      children: <Widget>[
        ListTile(
          title: const Text('Коробки:'),
          subtitle: Column(
            children: pallet.boxes
                .map((box) => BoxWidget(
                      box: box,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class TwoTabWidget extends StatelessWidget {
  final ModelsPallet pallets;
  final ScrollController scrollController;
  final List<Item> unit;
  final Function({required bool deleteAll}) deleteCurrentUnit;

  const TwoTabWidget(
      {super.key,
      required this.pallets,
      required this.scrollController,
      required this.unit,
      required this.deleteCurrentUnit});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Текущие бутылки'),
                Tab(text: 'История'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Виджеты для первой вкладки
                  CrrentHistoryWidget(
                    deleteCurrentUnit: deleteCurrentUnit,
                    scrollController: scrollController,
                    unit: unit,
                  ),
                  // Виджеты для второй вкладки
                  SingleChildScrollView(
                    child: ModelsPalletWidget(
                      pallet: pallets,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CrrentHistoryWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<Item> unit;
  final Function({required bool deleteAll}) deleteCurrentUnit;
  const CrrentHistoryWidget(
      {super.key,
      required this.scrollController,
      required this.unit,
      required this.deleteCurrentUnit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      child: ListView.builder(
        controller: scrollController,
        itemCount: unit.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(
                '${index + 1}. Бутылка ${index + 1}.',
                style: const TextStyle(fontSize: 18),
              ),
              trailing: index + 1 == unit.length
                  ? IconButton(
                      onPressed: () {
                        deleteCurrentUnit(deleteAll: false);
                      },
                      icon: const Icon(Icons.close),
                      color: Colors.red,
                    )
                  : null);
        },
      ),
    );
  }
}
