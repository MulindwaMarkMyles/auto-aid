import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample cart data (you can replace this with your actual cart data)
  List<Map<String, dynamic>> cartItems = [
    {
      'title': 'Oil Filter',
      'price': 1200000,
      'quantity': 2,
      'image':
          'https://t3.ftcdn.net/jpg/00/68/70/82/240_F_68708268_C3B9vxeUXNc7v8jJXRHolRo97E1Pyar0.jpg'
    },
    {
      'title': 'Air Filter',
      'quantity': 4,
      'price': 35000,
      'image':
          'https://t4.ftcdn.net/jpg/04/57/53/55/240_F_457535501_iDcHTFjDyAWFREVo3AxPZoAxLtU21sUY.jpg'
    },
    {
      'title': 'Spark Plugs Set',
      'quantity': 3,
      'price': 45000,
      'image':
          'https://t3.ftcdn.net/jpg/01/52/14/64/240_F_152146422_12KIcfF25AmHt1842mDzI9WyRgBaG318.jpg'
    },
    {
      'title': 'Battery',
      'quantity': 1,
      'price': 350000,
      'image':
          'https://t3.ftcdn.net/jpg/00/34/00/28/240_F_34002822_8eIRqlraCavV6QUWAx5eKeak70tRLzoK.jpg'
    },
    {
      'title': 'Alternator',
      'quantity': 2,
      'price': 450000,
      'image':
          'https://t4.ftcdn.net/jpg/02/09/78/75/240_F_209787502_jZLJzoQc0SmKMWurljmIZiYLHV3hWdP6.jpg'
    },
    {
      'title': 'Timing Belt',
      'quantity': 10,
      'price': 85000,
      'image':
          'https://t3.ftcdn.net/jpg/03/37/27/36/240_F_337273675_cnbyLFDDn7NkPAWNgDNzelU54nK5HO0k.jpg'
    }
  ];

  // Add scroll controller for better memory management
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Safe method to calculate total with null checking
  double getTotalCost() {
    try {
      return cartItems.fold(0, (sum, item) {
        final price = item['price'] as num? ?? 0;
        final quantity = item['quantity'] as int? ?? 0;
        return sum + (price * quantity);
      });
    } catch (e) {
      debugPrint('Error calculating total: $e');
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Title
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                      20, 150, 20, 30),
                  child: Text(
                    "Shopping Cart",
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // Cart Items List
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= cartItems.length) return null;
                    return CartItemTile(
                      item: cartItems[index],
                      onQuantityChanged: (newQuantity) {
                        setState(() {
                          cartItems[index]['quantity'] = newQuantity;
                        });
                      },
                    );
                  },
                  childCount: cartItems.length,
                ),
              ),
              // Bottom Section (Total + Checkout)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TotalCostSection(total: getTotalCost()),
                    CheckoutButton(onPressed: () => handleCheckout(context)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),

          // Back button at the top-left
          Positioned(
            top: 45, // Adjust as needed
            left: 20, // Adjust as needed
            child: const SizedBox(
              width: 50,
              height: 50,
              child: BackBtn(),
            ),
          ),
        ],
      ),
    );
  }

  void handleCheckout(BuildContext context) {
    // Add proper error handling for checkout
    try {
      if (cartItems.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cart is empty')),
        );
        return;
      }
      // Implement checkout logic
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Checkout failed: ${e.toString()}')),
      );
    }
  }
}

// Separate widget for cart items
class CartItemTile extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(int) onQuantityChanged;

  const CartItemTile({
    required this.item,
    required this.onQuantityChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['image'] as String? ?? '',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 60,
                      width: 60,
                      color: Colors.grey[300],
                      child: Icon(Icons.error),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'] as String? ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "UGX ${(item['price'] as num? ?? 0).toStringAsFixed(0)}",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ]),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.remove_outline)),
              Text(
                item['quantity'].toString(),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Ionicons.add_outline)),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

// Separate widget for total cost section
class TotalCostSection extends StatelessWidget {
  final double total;

  const TotalCostSection({required this.total, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total:",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "UGX ${total.toStringAsFixed(0)}",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for checkout button
class CheckoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CheckoutButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        child: Container(
          width: double.infinity,
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
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              "Checkout",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 50,
        maxHeight: 50,
      ),
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
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Icon(
                IconlyLight.arrow_left,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
