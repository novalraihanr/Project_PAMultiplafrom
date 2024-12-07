import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'popup_recipe.dart';

class RecipeCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String calories;
  final String time;

  const RecipeCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.calories,
    required this.time,
  }) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isIconPressed = false;

  void _showPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopupRecipe(
          imageUrl: widget.imageUrl,
          title: widget.title,
          time: widget.time,
          description:
              "Hidangan khas Minang dengan daging sapi yang dimasak lama dengan santan dan bumbu rempah.",
          ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
          instructions: [
            "Step 1: Do this",
            "Step 2: Do that",
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      color: const Color(0xFFFFFFFF),
      child: GestureDetector(
        onTap: () {
          _showPopup();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.imageUrl,
                      height: 100.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isIconPressed = !isIconPressed;
                        });
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4.0,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            isIconPressed
                                ? 'assets/icons/blue_heart.svg'
                                : 'assets/icons/heart.svg',
                            width: 20.0,
                            height: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/fire.svg',
                        width: 16.0,
                        height: 16.0,
                        color: const Color(0xFF97A2B0),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '${widget.calories} Kcal',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF97A2B0),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        width: 16.0,
                        height: 16.0,
                        color: const Color(0xFF97A2B0),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        widget.time,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF97A2B0),
                          fontFamily: 'Poppins',
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
    );
  }
}
