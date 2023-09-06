import 'package:flutter/material.dart';

class UserViewShimmer extends StatelessWidget {
  const UserViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10,
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.08,
              width: size.width * 0.2,
              child: const Holder(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: SizedBox(
                      width: size.width * 0.2,
                      height: size.height * 0.02,
                      child: const Holder(),
                    ),
                  ),
                  growable: false,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Holder extends StatelessWidget {
  const Holder({super.key});

  @override
  Widget build(BuildContext context) => const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0x1F000000),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      );
}
