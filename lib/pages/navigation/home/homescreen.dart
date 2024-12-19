import 'package:auto_aid/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:auto_aid/pages/navigation/home/productsDetailsScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hey, Bukama",
                      style: GoogleFonts.quicksand(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage()));
                      },
                      icon: Icon(
                        IconlyLight.bag_2,
                        size: 27,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'Search Products here...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ), // Style hint text
                    border: OutlineInputBorder(
                      // Adds a border around the TextFormField
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(14, 43, 114, 1), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Border when focused
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(14, 43, 114, 1), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      // Border when enabled
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(14, 43, 114, 1), width: 1.0),
                    ),
                    prefixIcon: Icon(IconlyLight.search,
                        color: Colors.white), // Icon on the left
                    filled: true,
                    fillColor: Color.fromRGBO(
                        14, 43, 114, 1), // Light background color
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  ),
                  style: TextStyle(
                      fontSize: 18, color: Colors.white), // Text input style
                  textInputAction:
                      TextInputAction.done, // Action button on keyboard
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Delivering to: ",
                        style: GoogleFonts.poppins(
                          color: Color.fromRGBO(178, 187, 206, 1),
                          fontSize: 18,
                        )),
                    Text("Kyanja, Kisaasi",
                        style: GoogleFonts.montserrat(
                            fontSize: 18, color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        tooltip: "Edit location",
                        iconSize: 18,
                        icon: Icon(IconlyLight.edit,
                            color: Colors.white, size: 18))
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF2563EB), // Royal Blue
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Become a",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              )),
                          Text("Member",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.2,
                              )),
                          SizedBox(height: 8),
                          Text("Claim benefits and get coupons.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              ))
                        ],
                      ))),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF059669), // Emerald Green
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Make an",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              )),
                          Text("Appointment",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.2,
                              )),
                          SizedBox(height: 8),
                          Text("So many mechanics available.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              ))
                        ],
                      ))),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFF7C3AED), // Indigo
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create an",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              )),
                          Text("Account",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.2,
                              )),
                          SizedBox(height: 8),
                          Text("Get 20% off your first three orders.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              ))
                        ],
                      ))),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFDC2626), // Engine Red
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Repair",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              )),
                          Text("& Service",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.2,
                              )),
                          SizedBox(height: 8),
                          Text(
                              "Just a tap away to get your car back to optimal shape.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.9),
                              ))
                        ],
                      ))),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "Popular Parts",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 0.75,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Shock Absorbers",
                    "4.8",
                    "Light Vehicle",
                    "120000",
                    "https://t3.ftcdn.net/jpg/03/23/40/48/240_F_323404833_azSdxooset54WUYx8Rs3S0LanIOVUvsu.jpg"),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Brake Pads",
                    "4.0",
                    "Light Vehicle",
                    "200000",
                    "https://t3.ftcdn.net/jpg/01/63/30/06/240_F_163300641_2blPhlRhHugWEPgDumhjKBI9DjWjCHw5.jpg"),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Tires",
                    "3.5",
                    "Light Vehicle",
                    "1000000",
                    "https://t3.ftcdn.net/jpg/04/25/56/22/240_F_425562222_CKl6qC91SdKA7RAEnqRWA5QLpxB9hgDj.jpg"),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Windshield Wipers",
                    "4.5",
                    "Light Vehicle",
                    "70000",
                    "https://t3.ftcdn.net/jpg/04/47/92/04/240_F_447920409_nU7QAFqy41jFq7XlB8R9tw0KYHW3zfqK.jpg"),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Gearbox",
                    "4.5",
                    "Heavy Vehicle",
                    "5000000",
                    "https://t3.ftcdn.net/jpg/04/59/19/90/240_F_459199042_8SRpQjSsz5RGyutk0ZM0nscM0lKYPkr5.jpg"),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Engine",
                    "4.5",
                    "Heavy Vehicle",
                    "15000000",
                    "https://t4.ftcdn.net/jpg/00/07/27/29/240_F_7272939_M10MvNHyk0dlwx217zLRUJEYRyWEdIEq.jpg"),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: buildProductWidget(
                    "Car Headlamps",
                    "4.5",
                    "Light Vehicle",
                    "150000",
                    "https://t4.ftcdn.net/jpg/04/04/21/45/240_F_404214589_OEBxnBfEHBHv93c0uFM5xMmSfuRTxUqC.jpg"),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverToBoxAdapter(
            child: Text(
              "All Spare Parts",
              style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 0.75,
            children: getAllProducts()
                .map((product) => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: buildProductWidget(
                        product['title']!,
                        product['rating']!,
                        product['category']!,
                        product['price']!,
                        product['image']!,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  List<Map<String, String>> getAllProducts() {
    return [
      {
        'title': 'Oil Filter',
        'rating': '4.7',
        'category': 'Light Vehicle',
        'price': '25000',
        'image':
            'https://t3.ftcdn.net/jpg/00/68/70/82/240_F_68708268_C3B9vxeUXNc7v8jJXRHolRo97E1Pyar0.jpg'
      },
      {
        'title': 'Air Filter',
        'rating': '4.5',
        'category': 'Heavy & Light Vehicle',
        'price': '35000',
        'image':
            'https://t4.ftcdn.net/jpg/04/57/53/55/240_F_457535501_iDcHTFjDyAWFREVo3AxPZoAxLtU21sUY.jpg'
      },
      {
        'title': 'Spark Plugs Set',
        'rating': '4.8',
        'category': 'Light Vehicle',
        'price': '45000',
        'image':
            'https://t3.ftcdn.net/jpg/01/52/14/64/240_F_152146422_12KIcfF25AmHt1842mDzI9WyRgBaG318.jpg'
      },
      {
        'title': 'Battery',
        'rating': '4.9',
        'category': 'Light Vehicle',
        'price': '350000',
        'image':
            'https://t3.ftcdn.net/jpg/00/34/00/28/240_F_34002822_8eIRqlraCavV6QUWAx5eKeak70tRLzoK.jpg'
      },
      {
        'title': 'Alternator',
        'rating': '4.6',
        'category': 'Light Vehicle',
        'price': '450000',
        'image':
            'https://t4.ftcdn.net/jpg/02/09/78/75/240_F_209787502_jZLJzoQc0SmKMWurljmIZiYLHV3hWdP6.jpg'
      },
      {
        'title': 'Timing Belt',
        'rating': '4.7',
        'category': 'Light Vehicle',
        'price': '85000',
        'image':
            'https://t3.ftcdn.net/jpg/03/37/27/36/240_F_337273675_cnbyLFDDn7NkPAWNgDNzelU54nK5HO0k.jpg'
      },
      {
        'title': 'Water Pump',
        'rating': '4.5',
        'category': 'Light Vehicle',
        'price': '120000',
        'image':
            'https://t3.ftcdn.net/jpg/04/44/55/20/240_F_444552051_aUa35IotBn8HRJdg4rcvlP9NFQVayss6.jpg'
      },
      {
        'title': 'Radiator',
        'rating': '4.8',
        'category': 'Heavy Vehicle',
        'price': '380000',
        'image':
            'https://t3.ftcdn.net/jpg/08/96/47/14/240_F_896471470_fS9WZQP3bI64YsjYPkNBfoSEhgjMrFPZ.jpg'
      },
      {
        'title': 'Fuel Pump',
        'rating': '4.6',
        'category': 'Light Vehicle',
        'price': '250000',
        'image':
            'https://t3.ftcdn.net/jpg/02/54/17/40/240_F_254174039_yCEtAiYTNlKwzn2R28JopBQlHnAShYZW.jpg'
      },
      {
        'title': 'Fuel Filter',
        'rating': '4.4',
        'category': 'Light Vehicle',
        'price': '45000',
        'image':
            'https://t4.ftcdn.net/jpg/00/45/55/11/240_F_45551122_R19MCB0hieUiJFF6VWeapToJIHC6pgS6.jpg'
      },
      {
        'title': 'Brake Discs',
        'rating': '4.8',
        'category': 'Light Vehicle',
        'price': '180000',
        'image':
            'https://t3.ftcdn.net/jpg/04/88/77/34/240_F_488773475_oKhGo5tbt1TehsBsiqfFHxlIAWdB7pJJ.jpg'
      },
      {
        'title': 'Brake Fluid',
        'rating': '4.3',
        'category': 'Heavy & Light Vehicle',
        'price': '25000',
        'image':
            'https://t4.ftcdn.net/jpg/01/11/71/05/240_F_111710506_cO8o1tVckZOd8WbK4vH3uaFhgvCRBF1d.jpg'
      },
      {
        'title': 'Clutch Kit',
        'rating': '4.7',
        'category': 'Heavy & Light Vehicle',
        'price': '450000',
        'image':
            'https://t3.ftcdn.net/jpg/01/37/73/04/240_F_137730485_Q5iaiOKnfqaHT5JCtxTONHTcbXkMyo9E.jpg'
      },
      {
        'title': 'CV Joint',
        'rating': '4.5',
        'category': 'Light Vehicle',
        'price': '180000',
        'image':
            'https://t3.ftcdn.net/jpg/00/73/19/72/240_F_73197247_K0IMHcwXljKIxFFuUoCKK5k4FE3B8LsJ.jpg'
      },
    ];
  }

  Widget buildProductWidget(String title, String rating, String category,
      String price, String imageUrl) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductsDetailsScreen(
                  title: title,
                  rating: rating,
                  category: category,
                  price: price,
                  imageUrls: [imageUrl, imageUrl, imageUrl],
                )));
      },
      borderRadius: BorderRadius.circular(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Rating Badge
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(IconlyBold.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(rating,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Content Padding
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  category,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "UGX $price",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.secondary,
                        padding: EdgeInsets.zero,
                        shape: CircleBorder(),
                        child: Icon(
                          IconlyLight.buy,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
