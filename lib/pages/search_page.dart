import 'package:app_resep_makanan/widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:app_resep_makanan/models/category_model.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<CategoryModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(  
          children: [
            const SizedBox(height: 70.0),
            const Center(
              child: Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16.0,
                  color: Color(0xFF97A2B0),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    'assets/icons/black_search.svg',
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6EBF2),
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6EBF2),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6EBF2),
                    width: 1.5,
                  ),
                ),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Resep Populer',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 10.0,
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
