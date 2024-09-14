import 'package:flutter/material.dart';
import 'package:kasani_fish/Controller/dropdown_controller.dart';
import 'package:provider/provider.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../Controller/calendar_controller.dart';
import '../../Controller/quantity_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_icon_row.dart';
import 'carrito_screen.dart';
import 'home_screen.dart';

class Datos extends StatefulWidget {
  const Datos({super.key, required this.title});

  final String title;

  @override
  _DatosState createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
      );
    }
  }

  Widget _buildStepIcon(int step) {
    bool isCompleted = _currentStep > step;
    bool isActive = _currentStep == step;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isCompleted || (isActive && _currentStep == 2) ? AppColors.blueLagoon : Colors.white,
        border: Border.all(color: AppColors.blueLagoon),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: isCompleted || (isActive && _currentStep == 2)
            ? const Icon(Icons.check, color: Colors.white, size: 18)
            : isActive
            ? const Icon(Icons.circle, color: AppColors.blueLagoon, size: 18)
            : const Icon(Icons.circle_outlined, color: AppColors.blueLagoon, size: 18),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return _buildStep1();
      case 1:
        return _buildStep2();
      case 2:
        return _buildStep3();
      default:
        return Container();
    }
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Container(
            height: 85,
            width: 322,
            color: AppColors.white,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Seleccionar lugar de entrega', style: TextStyle(fontSize: 12, color: AppColors.black)),
                const SizedBox(height: 8),
                Consumer<DropdownController>(
                  builder: (context, locationController, child) {
                    return Container(
                      height: 32,
                      width: 287,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: locationController.selectedLocation,
                          onChanged: (newValue) {
                            locationController.setSelectedLocation(newValue!);
                          },
                          items: locationController.locations
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(value, style: const TextStyle(fontSize: 12)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text('Seleccionar lugar de entrega', style: TextStyle(fontSize: 12, color: AppColors.black)),
          const SizedBox(height: 8),
          Container(
            height: 350,
            width: 319,
            color: AppColors.white,
            child: Consumer<CalendarController>(
              builder: (context, calendarController, child) {
                return TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 1, 1),
                  focusedDay: calendarController.focusedDay,
                  calendarFormat: calendarController.calendarFormat,
                  selectedDayPredicate: (day) {
                    return isSameDay(calendarController.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    calendarController.onDaySelected(selectedDay, focusedDay);
                  },
                  onFormatChanged: (format) {
                    if (calendarController.calendarFormat != format) {
                      calendarController.onFormatChanged(format);
                    }
                  },
                  onPageChanged: (focusedDay) {
                    calendarController.onPageChanged(focusedDay);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Text('Arco horario de entrega', style: TextStyle(fontSize: 12, color: AppColors.black)),
          const SizedBox(height: 10),
          const Text('Info recibida del ERP', style: TextStyle(fontSize: 12, color: AppColors.black)),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return Consumer<QuantityController>(
      builder: (context, quantityController, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text('Mi pedido', style: TextStyle(fontSize: 12, color: AppColors.black)),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRow(
                    description: 'In et eros lectus lobortis viverra',
                    quantity: quantityController.quantity1,
                    unit: 'Kg',
                    showRemoveButton: true,
                    onDecrement: quantityController.decQuantity1,
                    onIncrement: quantityController.incQuantity1,
                  ),
                  Divider(color: AppColors.light),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemRow(
                    description: 'In et eros lectus lobortis viverra',
                    quantity: quantityController.quantity2,
                    unit: 'Doc',
                    onDecrement: quantityController.decQuantity2,
                    onIncrement: quantityController.incQuantity2,
                  ),
                  Divider(color: AppColors.light),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text("Commentarios finales", style: TextStyle(fontSize: 12, color: AppColors.black)),
            const SizedBox(height: 10),
            Container(
              height: 78,
              width: 333,
              color: AppColors.white,
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(
                  Icons.local_shipping,
                  size: 24,
                  color: AppColors.purple,
                ),
                const SizedBox(width: 8),
                const Text('Datos de entrega', style: TextStyle(fontSize: 12, color: AppColors.black)),
              ],
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                text: 'Fecha de entrega:   ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: '30/05',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                text: 'Hora de entrega:     ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: 'De 11: 00 am a 1: 00 pm',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              text: const TextSpan(
                text: 'Lugar de entrega:   ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: 'Local Socabaya',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStep3() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 180),
        child: SizedBox(
          height: 135,
          width: 328,
          child: Image.asset(Appimages.register),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return _currentStep < 2 ? CustomButton(text: 'Continuar', onPressed: _nextStep) : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        title: const Text('Datos de Entrega', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: AppColors.deeppurple)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.deeppurple),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarritoScreen(title: '')),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStepIcon(0),
                const Expanded(
                  child: Divider(color: AppColors.blueLagoon, thickness: 2),
                ),
                _buildStepIcon(1),
                const Expanded(
                  child: Divider(color: AppColors.blueLagoon, thickness: 2),
                ),
                _buildStepIcon(2),
              ],
            ),
            Expanded(child: _buildStepContent(_currentStep)),
            _buildControls(),
          ],
        ),
      ),
    );
  }
}
