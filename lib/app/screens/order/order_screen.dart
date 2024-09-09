import 'package:flutter/material.dart';
import 'package:mycart/app/theme/theme.dart';
import 'package:mycart/app/widgets/custom_appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          /// Categories app bar
          const CustomAppBar(
            needBackButton: true,
            needBorderRadius: false,
            bottomPadding: 20,
            title: 'Orders',
          ),

          Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.redColor),
                      ),
                      child: Row(
                        children: [
                          /// Item Image
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Delivery date
                              Text(
                                'Delivered on Aug 23',
                                style: AppTextStyles.dark_14_500,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),

                              /// Item name
                              Text(
                                'Seasonal carry bag',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.dark_14_400,
                              ),

                              /// Rate now
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
