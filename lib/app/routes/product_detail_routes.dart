import 'package:get/route_manager.dart';
import 'package:introducao_flutter/app/modules/home/home_binding.dart';
import 'package:introducao_flutter/app/modules/home/home_page.dart';
import 'package:introducao_flutter/app/modules/product_detail/product_detail_binding.dart';
import 'package:introducao_flutter/app/modules/product_detail/product_detail_page.dart';

class ProductDetailRouters {
  ProductDetailRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailBinding(),
      page: () => const ProductDetailPage(),
    )
  ];
}
