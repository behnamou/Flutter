import 'package:auto_route/auto_route.dart';
import 'package:bou/pages/separator_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HamsterPage extends StatefulWidget {
  const HamsterPage({super.key});

  @override
  _HamsterPageState createState() => _HamsterPageState();
}

class _HamsterPageState extends State<HamsterPage> {
  List<HamsterCard> cards = [
    HamsterCard("CEO", 17, 316, 4001113, "PR&Team"),
    HamsterCard("Marketing", 16, 207, 1662545, "PR&Team"),
  ];

  static String formatNumber(double number) {
    final formatter = NumberFormat('#,##0', 'en_US');
    return formatter.format(number);
  }

  HamsterCard findMostProfitableCard(List<HamsterCard> cards) {
    return cards.reduce((current, next) =>
        current.costToEarningsRatio() < next.costToEarningsRatio()
            ? current
            : next);
  }

  double ratioThreshold = 1;
  final TextEditingController _thresholdController = TextEditingController();

  @override
  void dispose() {
    _thresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final tabsRouter = AutoTabsRouter.of(context);
    final myCard = findMostProfitableCard(cards);
    // پیدا کردن کارت‌های سودده
    List<HamsterCard> profitableCards =
        findProfitableCards(cards, ratioThreshold);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    child: const Text('Cancel')),
                const SizedBox(height: 20),
                TextField(
                  controller: _thresholdController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Ratio Threshold',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) {
                    setState(() {
                      ratioThreshold = double.tryParse(value) ?? 1000;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Profitable Cards:',
                  style: TextStyle(fontFamily: 'sfpro', fontSize: 20),
                ),
                Column(
                  children: profitableCards.map((card) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SeparatorLineWidget(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "$card\nRatio: ${card.costToEarningsRatio()}",
                            style: const TextStyle(
                                fontSize: 16, fontFamily: 'sfpro'),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SeparatorLineWidget(),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffEEF2F3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Best card to buy :",
                        style: TextStyle(
                            color: Color(0xff536471),
                            fontFamily: 'sfpro',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "$myCard\nRatio: ${myCard.costToEarningsRatio()}",
                        style: const TextStyle(
                            color: Color(0xff536471),
                            fontFamily: 'sfpro',
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HamsterCard {
  String name;
  double earningsPerHour;
  double cost;
  double level;
  String category;

  HamsterCard(
      this.name, this.level, this.earningsPerHour, this.cost, this.category);

  double costToEarningsRatio() {
    return cost / earningsPerHour;
  }

  @override
  String toString() {
    return "Name: $name Level: $level \nProfit: ${_HamsterPageState.formatNumber(earningsPerHour)} Cost: ${_HamsterPageState.formatNumber(cost)} \nCategoty: $category";
  }
}

List<HamsterCard> findProfitableCards(
    List<HamsterCard> cards, double ratioThreshold) {
  return cards
      .where((card) => card.costToEarningsRatio() < ratioThreshold)
      .toList();
}
