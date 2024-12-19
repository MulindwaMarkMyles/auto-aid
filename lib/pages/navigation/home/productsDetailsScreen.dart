import 'package:auto_aid/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ProductsDetailsScreen extends StatefulWidget {
  final String title;
  final String rating;
  final String price;
  final String category;
  final List<String> imageUrls;
  final String description = "";

  ProductsDetailsScreen({
    required this.title,
    required this.rating,
    required this.price,
    required this.category,
    required this.imageUrls,
  });

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  int _currentImageIndex = 0;
  int _selectedQuantity = 1;
  String? _selectedBrand;
  String? _selectedModel;

  final List<int> _quantities = List<int>.generate(10, (i) => i + 1);
  final List<String> _brands = ['Toyota', 'Honda', 'Ford', 'BMW', 'Mercedes'];
  final Map<String, List<String>> _models = {
    'Toyota': ['Corolla', 'Camry', 'RAV4'],
    'Honda': ['Civic', 'Accord', 'CR-V'],
    'Ford': ['Focus', 'Fusion', 'Explorer'],
    'BMW': ['3 Series', '5 Series', 'X5'],
    'Mercedes': ['C-Class', 'E-Class', 'GLA'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Carousel
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    itemCount: widget.imageUrls.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
                // Indicator Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.imageUrls.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      width: _currentImageIndex == index ? 10 : 8,
                      height: _currentImageIndex == index ? 10 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImageIndex == index
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                // Product Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Rating and Category
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Row(
                    children: [
                      Icon(
                        IconlyBold.star,
                        color: Colors.amber,
                        size: 24,
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.rating,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.category,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                // Price
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "UGX ${widget.price}",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Quantity Dropdown
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: _selectedQuantity,
                    items: _quantities.map((quantity) {
                      return DropdownMenuItem<int>(
                        value: quantity,
                        child: Text(quantity.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedQuantity = value!;
                      });
                    },
                  ),
                ),
                // Car Brand Dropdown
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Car Brand',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: _selectedBrand,
                    items: _brands.map((brand) {
                      return DropdownMenuItem<String>(
                        value: brand,
                        child: Text(brand),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedBrand = value;
                        _selectedModel = null; // Reset model when brand changes
                      });
                    },
                  ),
                ),
                // Car Model Dropdown
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Car Model',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: _selectedModel,
                    items: _selectedBrand != null
                        ? _models[_selectedBrand!]!.map((model) {
                            return DropdownMenuItem<String>(
                              value: model,
                              child: Text(model),
                            );
                          }).toList()
                        : [],
                    onChanged: (value) {
                      setState(() {
                        _selectedModel = value;
                      });
                    },
                  ),
                ),
                // Description
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Product Description",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Text(
                    "Here is a detailed description of the product. It provides all the relevant information that the user might need before making a purchase.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Add to Cart Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          // Back Button
          Positioned(
            top: 45,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  IconlyLight.arrow_left,
                  color: Colors.black,
                  size: 24,
                ),
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints(
                  minHeight: 40,
                  minWidth: 40,
                ),
              ),
            ),
          ),
          // Cart Button
          Positioned(
            top: 45,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                icon: Icon(
                  IconlyLight.bag_2,
                  color: Colors.black,
                  size: 24,
                ),
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints(
                  minHeight: 40,
                  minWidth: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
