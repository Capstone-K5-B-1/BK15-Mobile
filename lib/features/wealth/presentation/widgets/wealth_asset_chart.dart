import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Represents a single segment in our doughnut chart.
class ChartData {
  final String category;
  final double value;
  final Color color;
  final IconData icon;

  ChartData(this.category, this.value, this.color, this.icon);
}

class WealthAssetChart extends StatefulWidget {
  const WealthAssetChart({super.key});

  @override
  State<WealthAssetChart> createState() => _WealthAssetChartState();
}

class _WealthAssetChartState extends State<WealthAssetChart> {
  // Sample data simulating fintech assets:
  // We use one dominant segment (Credit Card) taking up the majority of the chart.
  final List<ChartData> chartData = [
    ChartData('Credit Card', 80, const Color(0xFF8A1816), Icons.credit_card), // Dominant segment (Maroon)
    ChartData('Cash',20, const Color(0xFFD9A05B), Icons.money),        // Secondary segment (Gold/Sand)
    // ChartData('E-Wallet', 0, const Color(0xFFE5E5E5), Icons.account_balance_wallet),    // Tertiary segment (Grey)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // Responsive height, typical for a dashboard chart card
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SfCircularChart(
        // Margin adjusted to allow labels with connectors to render without clipping
        margin: EdgeInsets.zero,
        // Center content annotation (Icon + text)
        
        // Doughnut Series Setup
        series: <CircularSeries>[
          DoughnutSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            pointColorMapper: (ChartData data, _) => data.color,
            
            // Inner radius controls the thickness of the doughnut. 
            // 70% leaves plenty of room for our center annotation.
            innerRadius: '60%',
            
            // Add spacing between segments for a modern look
            explodeAll: true,
            explodeOffset: '2%',
            
            // Enable and style the data labels
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              // Format label to show percentage cleanly
              labelIntersectAction: LabelIntersectAction.shift,
              // Setup clean connector lines
              connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.line, // Curve gives a more organic, elegant feel
                length: '15%',
                width: 1.5,
                color: Colors.grey,
              ),
             textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            dataLabelMapper: (ChartData data, _) => '${data.value.toInt()}%',
            animationDuration: 1500,
            // Animation for smooth entry
          ),
          DoughnutSeries<ChartData, String>(
            // radius: '80%',       // WAJIB sama persis dengan Series 1
            innerRadius: '60%',  // WAJIB sama persis dengan Series 1
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            
            // KUNCI: Transparan agar warna Series 1 tidak tertutup
            pointColorMapper: (ChartData data, _) => Colors.transparent, 
            
            explode: true,
            explodeAll: true,
            explodeOffset: '2%', // WAJIB sama persis dengan Series 1
            
            // Pengaturan Ikon (DI DALAM)
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
              builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
                final ChartData currentData = data;
                
                // Jika ingin membuat icon seperti badge (kotak putih/bulat), Anda 
                // bisa membungkus Icon ini dengan Container + BoxDecoration.
                // Disini saya buat sederhana hanya Icon warna putih.
                return Icon(
                  currentData.icon,
                  color: Colors.white, // Kontras dengan warna chart
                  size: 25,
                );
              },
            ),
            animationDuration: 1500,
          ),
        ],
      ),
    );
  }
}
