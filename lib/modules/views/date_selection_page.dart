import 'package:barber_app/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DateTimeSelectionPage extends StatefulWidget {
  final String selectedProfessional;

  const DateTimeSelectionPage({super.key, required this.selectedProfessional});

  @override
  DateTimeSelectionPageState createState() => DateTimeSelectionPageState();
}

class DateTimeSelectionPageState extends State<DateTimeSelectionPage> {
  Map<DateTime, List<String>> availableTimes = {
    _removeTime(DateTime.now()): ["10:00", "11:00", "14:00", "16:00"],
    _removeTime(DateTime.now().add(const Duration(days: 1))): ["10:00", "12:00", "15:00"],
    _removeTime(DateTime.now().add(const Duration(days: 2))): ["11:00", "13:00", "15:00", "17:00"],
    _removeTime(DateTime.now().add(const Duration(days: 3))): ["09:00", "10:00", "14:00"],
    _removeTime(DateTime.now().add(const Duration(days: 4))): ["11:00", "12:00", "15:00"],
    _removeTime(DateTime.now().add(const Duration(days: 5))): ["13:00", "16:00"],
  };

  DateTime selectedDate = _removeTime(DateTime.now());
  String? selectedTime;
  DateTime focusedDate = DateTime.now();
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  static DateTime _removeTime(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth = DateUtils.getDaysInMonth(focusedDate.year, focusedDate.month);
    DateTime firstDayOfMonth = DateTime(focusedDate.year, focusedDate.month, 1);
    int firstWeekday = firstDayOfMonth.weekday;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecionar Data e Hora"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      focusedDate = DateTime(focusedDate.year, focusedDate.month - 1, 1);
                    });
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  DateFormat('MMMM yyyy').format(focusedDate),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      focusedDate = DateTime(focusedDate.year, focusedDate.month + 1, 1);
                    });
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemCount: daysInMonth + firstWeekday,
              itemBuilder: (context, index) {
                if (index < firstWeekday) {
                  return const SizedBox();
                }

                int day = index - firstWeekday + 1;
                DateTime currentDay = DateTime(focusedDate.year, focusedDate.month, day);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDate = _removeTime(currentDay);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedDate == _removeTime(currentDay) ? Colors.green : Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        day.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedDate == _removeTime(currentDay) ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Horários disponíveis para ${formatter.format(selectedDate)}:",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: availableTimes[selectedDate] != null
                ? ListView.builder(
                    itemCount: availableTimes[selectedDate]!.length,
                    itemBuilder: (context, index) {
                      String time = availableTimes[selectedDate]![index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            time,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: selectedTime == time ? const Icon(Icons.check, color: Colors.green) : null,
                          onTap: () {
                            setState(() {
                              selectedTime = time;
                            });
                          },
                        ),
                      );
                    },
                  )
                : const Center(child: Text("Nenhum horário disponível")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: selectedTime != null
                  ? () {
                      GoRouter.of(context).push(AppRoutes.summary);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Confirmar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
