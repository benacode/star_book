import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/widgets/doughnut_chart.dart';

class WeeklyAnalyticsTab extends StatelessWidget {
  const WeeklyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final doughnutColor = Theme.of(context).extension<DoughnutChartStyle>()!;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: Column(
        children: [
          MoodDoughnutChart(
            moodDataMap: [
              ChartData(
                  x: 'Productive', y: 3.5, color: doughnutColor.primaryColor),
              ChartData(x: 'Sad', y: 1.5, color: doughnutColor.secondaryColor),
              ChartData(x: 'Angry', y: 1.5, color: doughnutColor.tertiaryColor),
              ChartData(x: 'Happy', y: 1.5, color: doughnutColor.quinaryColor),
              ChartData(
                  x: 'Sick', y: 2.0, color: doughnutColor.quaternaryColor),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          const SelectableTab(),
          SizedBox(height: screenHeight * 0.03),
          Container(
            height: screenHeight * 0.15,
            decoration: BoxDecoration(
              color:
                  Theme.of(context).extension<ThemeColorStyle>()!.quinaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomPadding.smallPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: doughnutColor.primaryColor,
                        radius: 7,
                      ),
                      const Text('Productive'),
                      SizedBox(width: screenWidth * 0.03),
                      CircleAvatar(
                        backgroundColor: doughnutColor.secondaryColor,
                        radius: 7,
                      ),
                      const Text('Angry'),
                      SizedBox(width: screenWidth * 0.03),
                      CircleAvatar(
                        backgroundColor: doughnutColor.tertiaryColor,
                        radius: 7,
                      ),
                      const Text('Sick'),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: screenWidth * 0.035),
                      CircleAvatar(
                        backgroundColor: doughnutColor.quinaryColor,
                        radius: 7,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      const Text('Sad'),
                      SizedBox(width: screenWidth * 0.2),
                      CircleAvatar(
                        backgroundColor: doughnutColor.quaternaryColor,
                        radius: 7,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      const Text('Happy'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectableTab extends StatefulWidget {
  const SelectableTab({super.key});

  @override
  State<SelectableTab> createState() => _SelectableTabState();
}

class _SelectableTabState extends State<SelectableTab> {
  String _selectedTab = 'Mon';

  final List<String> _daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _daysOfWeek.map((day) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTab = day;
            });
          },
          child: Container(
            width: screenWidth * 0.105,
            height: screenHeight * 0.03,
            decoration: BoxDecoration(
              color: (day == _selectedTab)
                  ? Theme.of(context)
                      .extension<ThemeColorStyle>()!
                      .secondaryColor
                  : Theme.of(context)
                      .extension<ThemeColorStyle>()!
                      .secondaryColor
                      .withOpacity(0.03),
              borderRadius: BorderRadius.circular(100),
            ),
            alignment: Alignment.center,
            child: Text(
              day,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: (day == _selectedTab)
                        ? Theme.of(context)
                            .extension<ThemeColorStyle>()!
                            .quinaryColor
                        : Theme.of(context)
                            .extension<ThemeColorStyle>()!
                            .secondaryColor,
                  ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
