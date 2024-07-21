import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CourseCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final double review;
  final double fees;

  const CourseCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.review,
    required this.fees,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                width: 100,
                height: 100,
                child: Image(
                  image: AssetImage(imageUrl),
                  width: 100,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(title),
              Text(subtitle),
              Text('$review'),
              Text('$fees'),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Color.fromRGBO(129, 50, 153, 1)),
                    ),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text('Buy Now  ',style: TextStyle(color:Color.fromRGBO(251, 246, 253, 1) ),),
                        Icon(IconsaxPlusLinear.shop,color: Color.fromRGBO(251, 246, 253, 1) ,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8),
                    child: IconButton(
                      color: Color.fromRGBO(236, 215, 247, 1),
                      onPressed: () {
                        
                      },
                      icon: Icon(IconsaxPlusLinear.call_calling,color: Color.fromRGBO(129, 50, 153, 1),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
