import 'package:flutter/material.dart';

class PlanSelectionPage extends StatelessWidget {
  const PlanSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Escolha um plano para cuidar da sua imagem: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mais vendido',
                              style: TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Cabelo e Barba',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'R\$ 149,90 / Mês',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Você sempre alinhado.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildFeatureRow(Icons.check, 'Corte Ilimitado'),
                      _buildFeatureRow(Icons.check, 'Barba Ilimitado'),
                      _buildFeatureRow(Icons.close, 'Sobrancelha Ilimitado'),
                      _buildFeatureRow(Icons.check, '10% Desconto em Produtos'),
                      _buildFeatureRow(Icons.check, 'Benefícios em Empresas Parceiras'),
                      _buildFeatureRow(Icons.check, 'App de Agendamento Exclusivo'),
                      _buildFeatureRow(Icons.check, '10% Desconto em Químicas'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(iconData, color: iconData == Icons.check ? Colors.green : Colors.red),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
