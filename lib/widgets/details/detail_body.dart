import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/details/color_dot.dart';
import 'package:store_app/widgets/details/product_image.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({super.key, required this.product});

  final Product product;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  bool black = true;
  bool blue = false;
  bool red = false;

  void onChange(Color color) {
    if (color == Colors.blue) {
      setState(() {
        black = false;
        blue = true;
        red = false;
      });
    } else if (color == Colors.red) {
      setState(() {
        black = false;
        blue = false;
        red = true;
      });
    } else if (color == kTextColor) {
      setState(() {
        black = true;
        blue = false;
        red = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
          ),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ProductImage(
                  size: size,
                  image: widget.product.image, // widget besause statefull
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorDot(
                      filColor: kTextColor,
                      isSelected: black,
                      onChangeCircle: (color) {
                        onChange(color);
                      },
                    ),
                    ColorDot(
                      filColor: Colors.blue,
                      isSelected: blue,
                      onChangeCircle: (color) {
                        onChange(color);
                      },
                    ),
                    ColorDot(
                      filColor: Colors.red,
                      isSelected: red,
                      onChangeCircle: (color) {
                        onChange(color);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  widget.product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                ' السعر : \$${widget.product.price}',
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
            vertical: kDefaultPadding / 2,
          ),
          child: Text(
            widget.product.description,
            style: const TextStyle(fontSize: 19.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
