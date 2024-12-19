import 'package:auto_aid/pages/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          children: [
            const SizedBox(height: 50),
            // Onboarding Image
            _buildScrollWidget(),
            const SizedBox(height: 40),
            // Indicator Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0),
                const SizedBox(width: 10),
                _buildDot(1),
                const SizedBox(width: 10),
                _buildDot(2),
              ],
            ),
            const SizedBox(height: 50),
            // Get Started Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Navigation()));
                },
                icon: const Icon(Icons.arrow_forward),
                iconAlignment: IconAlignment.end,
                label: const Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Dots
  Widget _buildDot(int index) {
    bool isActive = (index == _currentPage);
    return Container(
      width: 50,
      height: 7,
      decoration: BoxDecoration(
        color: isActive ? Color.fromRGBO(42, 75, 160, 1) : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildScrollWidget() {
    return SizedBox(
      height: 500,
      child: PageView(
        onPageChanged: _onPageChanged,
        children: [
          _buildPageViewWidget(
            'assets/images/welcome.png',
            'Welcome to AutoZaid.',
            'We are happy to have you, together we can make your car experience better',
          ),
          _buildPageViewWidget(
            'assets/images/comfort.png',
            'Comfort & Convenience',
            'Book an appointment, buy spare parts all at your comfort. No need to leave your home',
          ),
          _buildPageViewWidget(
            'assets/images/store.png',
            'Large Stock & Availability',
            'Is it for a car, truck or bike? Anything at all,  We have got you covered.',
          ),
        ],
      ),
    );
  }

  Widget _buildPageViewWidget(String image, String title, String subtitle) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(height: 20),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
