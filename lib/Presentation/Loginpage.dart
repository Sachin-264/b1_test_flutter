import 'package:b1_test_flutter/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int currentIndex = 0;
  final TextEditingController _phoneController = TextEditingController();

  final List<Map<String, dynamic>> content = [
    {
      'title': 'Discover Restaurants',
      'description':
      'Find Surprise Bags from your favorite restaurants at up to 50% OFF near you.',
      'image': 'assets/photo1.png',
    },
    {
      'title': 'Enjoy Delicious Meals',
      'description':
      'Get tasty meals at amazing prices and enjoy new culinary experiences.',
      'image': 'assets/photo2.png',
    },
    {
      'title': 'Explore New Cuisines',
      'description':
      'Discover a variety of cuisines and expand your food horizons.',
      'image': 'assets/photo3.png',
    },
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    // Add your phone number validation logic here if needed
    if (_phoneController.text.isNotEmpty) {
      // Replace 'HomePage' with your actual target page
      Navigator.pushReplacementNamed(context, '/home');
      // Or use this if you want to push a new page:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents resizing when keyboard appears
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight, // Ensure the content takes full height
          child: Column(
            children: [
              // Top Section with Border Radius
              Container(
                height: screenHeight * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.backgroundTop,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          AppColors.backgroundTop.withOpacity(0.8),
                          elevation: 1,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        itemCount: content.length,
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(content[index]['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                content[index]['title']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.07,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.05),
                                child: Text(
                                  content[index]['description']!,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontSize: screenWidth * 0.035,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(content.length,
                                        (indicatorIndex) {
                                      return AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        width: indicatorIndex == currentIndex
                                            ? 16
                                            : 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: indicatorIndex == currentIndex
                                              ? AppColors.importantText
                                              : Colors.grey,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Bottom Section
              Container(
                height: screenHeight * 0.5,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Enter your phone number',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '+91',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            height: screenHeight * 0.03,
                            width: 1,
                            color: Colors.grey[300],
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Expanded(
                            child: TextField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                hintText: '00000-00000',
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey[400],
                                  fontSize: screenWidth * 0.04,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _handleContinue,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBackground,
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.02,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey[300])),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03),
                          child: Text(
                            'or login with',
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey[300])),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.g_mobiledata,
                              size: screenWidth * 0.08),
                        ),
                        SizedBox(width: screenWidth * 0.05),
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.apple, size: screenWidth * 0.08),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Column(
                      children: [
                        Text(
                          'By continuing you agree to our',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Terms & Conditions',
                              style: GoogleFonts.poppins(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.0,
                                color: Colors.black,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' and ',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                            Text(
                              'Privacy Policy',
                              style: GoogleFonts.poppins(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.0,
                                color: Colors.black,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}