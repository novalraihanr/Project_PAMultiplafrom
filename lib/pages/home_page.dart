import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:app_resep_makanan/models/category_model.dart';
import 'package:app_resep_makanan/widgets/recipe_card.dart';
import 'package:app_resep_makanan/pages/search_page.dart';
import 'package:app_resep_makanan/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    HomeContent(),
    ProfilePage(),
    SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavBarItem('assets/icons/home.svg', 0),
            SizedBox(),
            buildNavBarItem('assets/icons/profile.svg', 1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF042628),
        onPressed: () => _onItemTapped(2),
        child: SvgPicture.asset(
          'assets/icons/search.svg',
          color: Colors.white,
          height: 30.0,
        ),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildNavBarItem(String svgPath, int index) {
    return IconButton(
      onPressed: () => _onItemTapped(index),
      icon: SvgPicture.asset(
        svgPath,
        color: _selectedIndex == index
            ? const Color(0xFF70B9BE)
            : Color(0xFF97A2B0),
        height: 35.0,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryModel>(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color(0xFFE7E9EB),
          ],
          stops: [0.98, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30.0),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/sun.svg',
                  height: 30.0,
                  width: 30.0,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Hello!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const Text(
              'Nama User',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                height: 1.5,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Disarankan',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: SvgPicture.asset(
                'assets/images/card-sample.svg',
                width: 400.0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Kategori',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton(context, 0, 'Breakfast'),
                _buildCategoryButton(context, 1, 'Lunch'),
                _buildCategoryButton(context, 2, 'Dinner'),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Resep Populer',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 0.8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return RecipeCard(
                  imageUrl:
                      'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/233/2024/04/28/Rendang-206972355.jpg',
                  title: 'Resep ${index + 1}',
                  calories: '${100 + index * 50}',
                  time: '${10 + index * 5} min',
                );
              },
            ),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, int index, String label) {
    final categoryModel = Provider.of<CategoryModel>(context);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: categoryModel.selectedCategory == index
                ? const Color(0xFF70B9BE)
                : const Color(0xFFF1F5F5),
            foregroundColor: categoryModel.selectedCategory == index
                ? Colors.white
                : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () => categoryModel.setSelectedCategory(index),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
