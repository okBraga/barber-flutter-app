import 'package:barber_app/core/components/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:barber_app/features/appointment/presentation/widgets/date_chip.dart';
import 'package:barber_app/features/appointment/presentation/widgets/time_chip.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const List<String> months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  String? selectedTime;

  final List<DateTime> availableDates = List.generate(7, (index) => DateTime.now().add(Duration(days: index)));

  final List<String> availableTimes = ['11:30', '11:45', '12:00', '12:15', '14:00', '14:30', '15:00', '15:30', '16:00'];

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'SEG';
      case 2:
        return 'TER';
      case 3:
        return 'QUA';
      case 4:
        return 'QUI';
      case 5:
        return 'SEX';
      case 6:
        return 'SÁB';
      case 7:
        return 'DOM';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Data e horário',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${months[DateTime.now().month - 1]} ${DateTime.now().year}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: availableDates.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final date = availableDates[index];
                        final isSelected = selectedDate?.day == date.day;
                        final dayName = _getDayName(date.weekday);
                        return DateChip(
                          dayNumber: date.day.toString(),
                          dayName: dayName,
                          isSelected: isSelected,
                          onTap: () => setState(() => selectedDate = date),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 24, bottom: 16),
                      child: Text(
                        'Horários disponíveis',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 2.5,
                            children: availableTimes.map((time) {
                              final isSelected = selectedTime == time;
                              return TimeChip(
                                time: time,
                                isSelected: isSelected,
                                onTap: () => setState(() => selectedTime = time),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomButtonBar(
          buttonText: 'Continuar',
          onPressed: () => GoRouter.of(context).push(AppRoutes.summary),
        ),
      ),
    );
  }
}
