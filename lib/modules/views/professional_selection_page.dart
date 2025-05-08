import 'package:barber_app/shared/components/professional_card.dart';
import 'package:barber_app/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfessionalSelectionPage extends StatefulWidget {
  const ProfessionalSelectionPage({super.key});

  @override
  ProfessionalSelectionPageState createState() => ProfessionalSelectionPageState();
}

class ProfessionalSelectionPageState extends State<ProfessionalSelectionPage> {
  final List<Map<String, dynamic>> barbers = [
    {
      'isAnyProfessional': false,
      'name': 'Fred',
      'availability': 'Disponível hoje',
      'imageUrl': '',
    },
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Escolha seu barbeiro",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: barbers.length,
            itemBuilder: (context, index) {
              final professional = barbers[index];
              return ProfessionalCard(
                isAnyProfessional: professional['isAnyProfessional'],
                onTap: () {
                  setState(() {
                    if (selectedIndex == index) {
                      selectedIndex = null;
                    } else {
                      selectedIndex = index;
                    }
                  });
                },
                professionalImage: Icon(
                  Icons.person,
                  size: 48,
                ),
                professionalName: professional['name'],
                availability: professional['availability'],
                isSelected: selectedIndex == index,
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: selectedIndex != null
              ? () {
                  GoRouter.of(context).push(AppRoutes.dateSelection);
                }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Confirmar Profissional",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
