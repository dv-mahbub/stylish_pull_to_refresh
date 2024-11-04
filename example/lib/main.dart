import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_pull_to_refresh/stylish_pull_to_refresh.dart';

Color lightBlack = Colors.black54;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: GoogleFonts.bitter(
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_card,
              color: lightBlack,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      backgroundColor: const Color.fromARGB(234, 255, 255, 255),
      body: SafeArea(
        child: StylishPullToRefresh(
          style: Style.audioWave,
          size: 50,
          onRefresh: () async {
            await Future.delayed(
              const Duration(seconds: 4),
            );
          },
          child: bodyContent(size),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.amber[800],
          onTap: (int value) {}),
    );
  }

  SingleChildScrollView bodyContent(Size size) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 17, right: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              balanceContainer(size),
              instructionPart(),
              resultContainer(
                  size: size,
                  iconBackground: Colors.green.shade900,
                  iconData: Icons.currency_bitcoin,
                  title: '4.576905 BTC',
                  total: 21.675,
                  subTotal: 5.749,
                  increament: 3.457),
              resultContainer(
                  size: size,
                  iconBackground: Colors.purple.shade800,
                  iconData: Icons.keyboard_double_arrow_up_outlined,
                  title: '12.9843704 ETH',
                  total: 17.876,
                  subTotal: 6.083,
                  increament: 2.972),
              resultContainer(
                  size: size,
                  iconBackground: const Color.fromARGB(255, 241, 40, 4),
                  iconData: Icons.money,
                  title: '3.972302 TK',
                  total: 18.437,
                  subTotal: 6.936,
                  increament: 1.549),
              resultContainer(
                  size: size,
                  iconBackground: const Color.fromARGB(255, 2, 107, 84),
                  iconData: Icons.currency_exchange,
                  title: '10.493792 CRN',
                  total: 9.203,
                  subTotal: 4.384,
                  increament: -2.058),
              resultContainer(
                  size: size,
                  iconBackground: Colors.blue,
                  iconData: Icons.share,
                  title: '8.398421 XRP',
                  total: 22.387,
                  subTotal: 6.238,
                  increament: -2.239),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding instructionPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sorted by higher %',
            style: GoogleFonts.bitter(textStyle: const TextStyle(fontSize: 15)),
          ),
          DropdownButton<String>(
            hint: Text(
              '24h',
              style: GoogleFonts.bitter(
                textStyle: const TextStyle(fontSize: 15),
              ),
            ),
            items: <String>['24h'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          )
        ],
      ),
    );
  }

  Widget resultContainer(
      {required Size size,
      required Color iconBackground,
      required IconData iconData,
      required String title,
      required double total,
      required double subTotal,
      required double increament}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: size.width - 40,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .05,
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.05,
              blurRadius: 10,
              offset: const Offset(-2, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconBackground,
              radius: 25,
              child: Icon(
                iconData,
                size: 37,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.bitter(
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87.withOpacity(.6)),
                        ),
                      ),
                      Text(
                        '\$$total',
                        style: GoogleFonts.bitter(
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87.withOpacity(.6)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$$subTotal',
                        style: GoogleFonts.bitter(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87.withOpacity(.4)),
                        ),
                      ),
                      Text(
                        '${increament >= 0 ? '+' : ''}$increament%',
                        style: GoogleFonts.bitter(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: increament > 0
                                  ? Colors.green.withOpacity(.9)
                                  : Colors.red.withOpacity(.9)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container balanceContainer(Size size) {
    return Container(
      width: size.width - 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .05,
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.05,
            blurRadius: 10,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 20,
                child: Icon(
                  Icons.wallet,
                  size: 27,
                  color: Colors.white,
                ),
              ),
              Text(
                'Total Wallet Balance',
                style: GoogleFonts.bitter(
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              DropdownButton<String>(
                hint: Text(
                  'USD',
                  style: GoogleFonts.bitter(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                ),
                items: <String>['USD'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '\$59.537',
                style: GoogleFonts.bitter(
                  textStyle: TextStyle(
                      fontSize: 30,
                      color: lightBlack,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '+3.55%',
                  style: GoogleFonts.bitter(
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              Text(
                '7.251332 BTC',
                style: GoogleFonts.bitter(
                  textStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(
                flex: 5,
              )
            ],
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: lightBlack,
            size: 30,
          )
        ],
      ),
    );
  }
}
