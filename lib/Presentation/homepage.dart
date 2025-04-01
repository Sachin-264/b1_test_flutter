import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:b1_test_flutter/Utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDelivered = false;
  bool showCompletionButton = false;

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  void _markAsDelivered() {
    setState(() {
      isDelivered = true;
      showCompletionButton = true;
    });

    _showDeliveryConfirmation();
  }

  void _showDeliveryConfirmation() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: screenWidth * 0.15,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Confirmation icon
            Container(
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              decoration: BoxDecoration(
                color: AppColors.importantText.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                size: screenWidth * 0.15,
                color: AppColors.importantText,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Title
            Text(
              'Order Delivered!',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),

            // Subtitle
            Text(
              'Your order has been successfully delivered',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.035,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Surprise bag info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                'Your bag was a surprise!\n'
                    'We hope you enjoy the selection of items chosen for you.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),

            // Action button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.importantText,
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Got It',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.close,
                  color: AppColors.importantText,
                  size: screenWidth * 0.06,
                ),
                SizedBox(width: screenWidth * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order',
                      style: GoogleFonts.poppins(
                        color: AppColors.importantText,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '#5678956 | 8:32 A.M',
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'Help',
              style: GoogleFonts.poppins(
                color: AppColors.importantText,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: 1.0,
              child: Column(
                children: [
                  Text(
                    'Delivered by',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    '10-11 PM',
                    style: GoogleFonts.poppins(
                      color: AppColors.importantText,
                      fontSize: screenWidth * 0.065,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Order Overview Card
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.translationValues(0, 0, 0),
              child: Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Overview',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Divider(color: Colors.black54, thickness: 0.5),
                    // Product
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: screenWidth * 0.2,
                            height: screenWidth * 0.2,
                            color: Colors.grey[200],
                            child: Icon(Icons.fastfood, size: screenWidth * 0.1, color: Colors.grey),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Barbeque Nation, HSR',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '₹585',
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                            Text(
                              '1 X Surprise Bag',
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.black54, thickness: 0.5),
                    // Delivery Address
                    Text(
                      'Delivery Address',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Apartment 4B, Sunshine Residency\n'
                          '123 MG Road, Bangalore\n'
                          'Karnataka - 560001',
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    Divider(color: Colors.black54, thickness: 0.5),
                    // Delivery Time
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.importantText,
                          size: screenWidth * 0.05,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery Time',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Estimated: 45-50 minutes',
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Order Status Timeline
            Column(
              children: [
                _buildStatusItem('Order Confirmed', true),
                _buildStatusItem('Out for Delivery', !isDelivered),
                _buildStatusItem('Delivered', isDelivered),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),

            if (showCompletionButton)
              SizedBox(
                width: screenWidth * 0.9,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: 1.0,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isDelivered = false;
                        showCompletionButton = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Mark as Complete',
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            else if (!isDelivered)
              SizedBox(
                width: screenWidth * 0.9,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: 1.0,
                  child: ElevatedButton(
                    onPressed: _markAsDelivered,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.importantText,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Mark as Delivered',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String title, bool isCompleted) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.05,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              // Dot indicator
              Container(
                width: screenWidth * 0.03,
                height: screenWidth * 0.03,
                decoration: BoxDecoration(
                  color: isCompleted ? AppColors.importantText : Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
              // Vertical line
              Container(
                width: 2,
                height: screenHeight * 0.06,
                color: isCompleted ? AppColors.importantText : Colors.grey[300],
              ),
            ],
          ),
          SizedBox(width: screenWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: isCompleted ? Colors.black : Colors.grey,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  _getStatusSubtitle(title, isCompleted),
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusSubtitle(String title, bool isCompleted) {
    if (!isCompleted) return 'Pending';
    switch (title) {
      case 'Order Confirmed':
        return '8:32 AM';
      case 'Out for Delivery':
        return '9:15 AM';
      case 'Delivered':
        return '10:05 AM';
      default:
        return '';
    }
  }
}