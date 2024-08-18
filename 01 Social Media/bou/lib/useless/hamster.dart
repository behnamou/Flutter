import 'package:auto_route/auto_route.dart';
import 'package:bou/common/separator_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HamsterPage extends StatefulWidget {
  @override
  _HamsterPageState createState() => _HamsterPageState();
}

class _HamsterPageState extends State<HamsterPage> {
  List<HamsterCard> cards = [
    // PR&Team
    HamsterCard("CEO", 17, 316, 4001113, "PR&Team"),
    HamsterCard("Marketing", 16, 207, 1662545, "PR&Team"),
    HamsterCard("IT Team", 16, 709, 3325090, "PR&Team"),
    HamsterCard("Support team", 16, 207, 1246909, "PR&Team"),
    HamsterCard("HamsterBook", 17, 221, 2000557, "PR&Team"),
    HamsterCard("HamsterTube", 17, 284, 2400668, "PR&Team"),
    HamsterCard("X", 17, 253, 2200612, "PR&Team"),
    HamsterCard("Cointelegraph", 18, 135, 3538715, "PR&Team"),
    HamsterCard("HamsterGram", 16, 148, 831273, "PR&Team"),
    HamsterCard("TikTok", 16, 295, 1246909, "PR&Team"),
    HamsterCard("Coindesk", 16, 236, 1662545, "PR&Team"),
    HamsterCard("Influencers", 17, 853, 10002783, "PR&Team"),
    HamsterCard("Partnership program", 17, 221, 2000557, "PR&Team"),
    HamsterCard("Product team", 16, 295, 1662545, "PR&Team"),
    HamsterCard("BisDev team", 16, 148, 831273, "PR&Team"),
    HamsterCard("Two factor authentication", 17, 395, 4001113, "PR&Team"),
    HamsterCard("UX and UI team", 17, 553, 3040846, "PR&Team"),
    HamsterCard("Security team", 17, 632, 4001113, "PR&Team"),
    HamsterCard("QA team", 17, 600, 5101419, "PR&Team"),
    HamsterCard("Antihacking shield", 16, 325, 3325090, "PR&Team"),
    HamsterCard("Risk management team", 16, 782, 3325090, "PR&Team"),
    HamsterCard("Security Audition", 16, 295, 4987636, "PR&Team"),
    HamsterCard("Anonymous transactions ban", 18, 1010, 4987636, "PR&Team"),
    HamsterCard("Blocking suspicious accounts", 16, 472, 2078181, "PR&Team"),
    HamsterCard("Tokenomics expert", 17, 1580, 20005566, "PR&Team"),
    HamsterCard("Consensus Explorer pass", 16, 4430, 41563630, "PR&Team"),
    HamsterCard("VC labs", 15, 1380, 11243126, "PR&Team"),
    HamsterCard("Compliance officer", 17, 379, 14003896, "PR&Team"),
    HamsterCard("Welcome to Amsterdam", 16, 959, 4987636, "PR&Team"),
    HamsterCard("Developement Hub Mumbai", 15, 11040, 65282666, "PR&Team"),
    HamsterCard("Data Center Tokyo", 15, 17930, 145072592, "PR&Team"),
    HamsterCard("Leaderboards", 15, 2070, 14507259, "PR&Team"),
    HamsterCard("Minigame", 14, 2580, 13291885, "PR&Team"),
    // Markets
    HamsterCard("Fantokens", 16, 2810, 16625452, "Markets"),
    HamsterCard("Staking", 17, 1900, 14003896, "Markets"),
    HamsterCard("BTC pairs", 17, 126, 1000278, "Markets"),
    HamsterCard("ETH pairs", 16, 118, 498764, "Markets"),
    HamsterCard("Top 10 cmc pairs", 16, 236, 1662545, "Markets"),
    HamsterCard("GameFi tokens", 17, 221, 2000557, "Markets"),
    HamsterCard("Defi2.0 tokens", 16, 118, 831273, "Markets"),
    HamsterCard("SocialFi Tokens", 16, 148, 831273, "Markets"),
    HamsterCard("Meme Coins", 15, 303, 1450726, "Markets"),
    HamsterCard("Shit coins", 17, 1860, 20005566, "Markets"),
    HamsterCard("Margin trading x10", 17, 869, 10002783, "Markets"),
    HamsterCard("Margin trading x20", 17, 1110, 10002783, "Markets"),
    HamsterCard("Margin trading x30", 17, 1580, 14003896, "Markets"),
    HamsterCard("Margin trading x50", 16, 3250, 16625452, "Markets"),
    HamsterCard("Margin trading x75", 17, 3480, 30008349, "Markets"),
    HamsterCard("Margin trading x100", 17, 3080, 20005566, "Markets"),
    HamsterCard("Derivatives", 17, 1560, 10002783, "Markets"),
    HamsterCard("Prediction markets", 18, 1170, 17693574, "Markets"),
    HamsterCard("Web3 integration", 17, 2500, 26007236, "Markets"),
    HamsterCard("DAO", 17, 727, 4001113, "Markets"),
    HamsterCard("P2P trading", 17, 1230, 16804676, "Markets"),
    HamsterCard("Trading bots", 16, 576, 3491345, "Markets"),
    HamsterCard("LayerZero Listing", 16, 2660, 16625452, "Markets"),
    // Legal
    HamsterCard("KYC", 17, 32, 400111, "Legal"),
    HamsterCard("KYB", 16, 177, 831273, "Legal"),
    HamsterCard("Legal opinion", 15, 166, 725363, "Legal"),
    HamsterCard("SEC reansparancy", 16, 177, 1995054, "Legal"),
    HamsterCard("Anti money loundering", 16, 827, 4987636, "Legal"),
    HamsterCard("Licence UAE", 17, 1770, 20005566, "Legal"),
    HamsterCard("Licence Asia", 16, 1090, 8312726, "Legal"),
    HamsterCard("Licence South America", 16, 1150, 8312726, "Legal"),
    HamsterCard("Licence Australia", 17, 2150, 20005566, "Legal"),
    HamsterCard("Licence North America", 16, 2830, 16625452, "Legal"),
    HamsterCard("Licence Nigeria", 17, 537, 6001670, "Legal"),
    HamsterCard("Licence Japan", 15, 7170, 36268148, "Legal"),
    HamsterCard("Licence Ethiopia", 15, 4970, 25387704, "Legal"),
    HamsterCard("Licence India", 15, 6900, 32641333, "Legal"),
    HamsterCard("Licence Bangladesh", 15, 9660, 50775407, "Legal"),
    HamsterCard("Licence Indonesia", 15, 13800, 72536296, "Legal"),
    HamsterCard("Licence Vietnam", 15, 11040, 61655852, "Legal"),
    HamsterCard("Licence Turkey", 15, 8280, 54402222, "Legal"),
    HamsterCard("Licence Philippines", 15, 17930, 108804444, "Legal"),
    // Web3
    HamsterCard("DEX", 15, 8280, 54402222, "Web3"),
    HamsterCard("Oracle", 15, 2210, 12693852, "Web3"),
    HamsterCard("Vesting Smartcontracts", 14, 3090, 13624182, "Web3"),
    HamsterCard("Launchpad", 14, 7740, 31568227, "Web3"),
    HamsterCard("NFT Marketplace", 14, 5160, 25919176, "Web3"),
    HamsterCard("Grant for Developers", 15, 11040, 72536296, "Web3"),
    HamsterCard("NFT Metaverse", 11, 4210, 21406518, "Web3"),
    HamsterCard("Crypto Farming", 14, 7740, 49844569, "Web3"),
    HamsterCard("Sport Collectibles Marketplace", 15, 1930, 10880444, "Web3"),
    HamsterCard("Market Making", 15, 1660, 12331170, "Web3"),
    HamsterCard("Web3 Advertising Platform", 15, 1100, 9429718, "Web3"),
    // Specials
    HamsterCard("Hmaster with friends", 16, 886, 8312726, "Specials"),
    HamsterCard("Vipassana hamster", 16, 1770, 14962907, "Specials"),
    HamsterCard("University hamster", 15, 3040, 16683348, "Specials"),
    HamsterCard("Gym hamster", 15, 1380, 8704356, "Specials"),
    HamsterCard("Healthy nurition hamster", 15, 2210, 12331170, "Specials"),
    HamsterCard("Sleeping hamster", 15, 1660, 10880444, "Specials"),
    HamsterCard("HamsterGPT", 15, 4970, 39894963, "Specials"),
    HamsterCard("HamsterBank", 16, 56090, 498763557, "Specials"),
    HamsterCard("Telegram Stars integration", 16, 2360, 28263268, "Specials"),
    HamsterCard("Telegram Miniapp Launch", 15, 2760, 18134074, "Specials"),
    HamsterCard("Hamster Analytics", 14, 5160, 24922285, "Specials"),
    HamsterCard("50M Telegram Channel", 14, 2580, 16614856, "Specials"),
    HamsterCard("HamsterStore launch", 15, 13800, 68909481, "Specials"),
    HamsterCard("HamsterWatch for soulmate", 8, 1720, 8557150, "Specials"),
    HamsterCard("Call for BTC to rise", 8, 8590, 42785751, "Specials"),
    HamsterCard("Business jet", 1, 3210, 13230000, "Specials"),
    HamsterCard("CX Hub Istanbul", 15, 8280, 39894963, "Specials"),
    HamsterCard("Hamster break records", 12, 6190, 40365183, "Specials"),
    HamsterCard("X Network 10 Million", 16, 1180, 11637816, "Specials"),
    HamsterCard("Hamster Green energy", 16, 5900, 28263268, "Specials"),
    HamsterCard("YouTube 25 Million", 16, 6200, 29925813, "Specials"),
    HamsterCard("TG Leaders", 17, 7270, 88024491, "Specials"),
    HamsterCard("Premarket Launch", 12, 16890, 80730365, "Specials"),
    HamsterCard("Hamster Kombat merch", 15, 276, 2176089, "Specials"),
    HamsterCard(
        "TON + Hamster Kombat = Success", 12, 11260, 80730365, "Specials"),
    HamsterCard("Consensus Piranha Pass", 15, 5240, 36268148, "Specials"),
    HamsterCard("Web3 academy launch", 16, 4430, 18287997, "Specials"),
    HamsterCard("YouTube Gold Button", 17, 869, 10002783, "Specials"),
    HamsterCard("Hamster YouTube Channel", 18, 845, 15165921, "Specials"),
    HamsterCard("Bitcoin Pizza day", 17, 316, 4001113, "Specials"),
    HamsterCard("Top 10 Global Ranking", 17, 3790, 40011132, "Specials"),
    HamsterCard("NFT Collection Launch", 16, 3540, 28263268, "Specials"),
    HamsterCard("Special Hamster Conference", 17, 2840, 20005566, "Specials"),
    HamsterCard("Short squeeze", 15, 2760, 25387704, "Specials"),
    HamsterCard("There are two chairs", 15, 5520, 36268148, "Specials"),
    HamsterCard("Long squeeze", 16, 5900, 49876356, "Specials"),
    HamsterCard("Villa for DEV team", 17, 1420, 8002226, "Specials"),
    HamsterCard("Apps Center Listing", 16, 2950, 24938178, "Specials"),
    HamsterCard("Bogdanoff is calling", 16, 1400, 8312726, "Specials"),
    HamsterCard("USDT on TON", 17, 4260, 40011132, "Specials"),
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

  double ratioThreshold = 1000;
  final TextEditingController _thresholdController = TextEditingController();

  @override
  void dispose() {
    _thresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _myCard = findMostProfitableCard(cards);
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
                      children: [
                        const SeparatorLineWidget(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            '${card.name}: Level \n${card.level} Earnings per Hour: ${formatNumber(card.earningsPerHour)} Cost: ${formatNumber(card.cost)} \nGroup: ${card.category}',
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
                Text("${_myCard}\nRatio: ${_myCard.costToEarningsRatio()}"),
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
