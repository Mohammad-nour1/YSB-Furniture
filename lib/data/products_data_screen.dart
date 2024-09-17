import 'package:ecommerce/models/product.dart';

List<Product> products = [
  Product(
    name: 'Arm Chair',
    description: 'Chair made by wood',
    price: 300,
    imageUrl:
        'https://images.pexels.com/photos/105004/pexels-photo-105004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Arm Chair
    colors: [0xFF6F35A5, 0xFFFFD700, 0xFFFF4500],
    materials: ['Wood', 'Metal'],
    fabrics: ['Leather', 'Cotton'],
    dimensions: {'Height': '24"', 'Width': '20"', 'Depth': '18"'},
    category: 'Chairs',
  ),
  Product(
    name: 'Sofa',
    description: 'Comfortable sofa',
    price: 500,
    imageUrl:
        'https://images.pexels.com/photos/3757055/pexels-photo-3757055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Sofa
    colors: [0xFFB0E57C, 0xFFB3B3B3, 0xFFFFA07A],
    materials: ['Fabric', 'Wood'],
    fabrics: ['Velvet', 'Linen'],
    dimensions: {'Height': '30"', 'Width': '60"', 'Depth': '35"'},
    category: 'Sofas',
  ),
  Product(
    name: 'Dining Table',
    description: 'Modern dining table',
    price: 700,
    imageUrl:
        'https://images.pexels.com/photos/5825538/pexels-photo-5825538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Dining Table
    colors: [0xFFA52A2A, 0xFF00008B, 0xFF2E8B57],
    materials: ['Wood', 'Glass'],
    fabrics: ['None'],
    dimensions: {'Height': '30"', 'Width': '72"', 'Depth': '36"'},
    category: 'Tables',
  ),
  Product(
    name: 'Coffee Table',
    description: 'Elegant coffee table',
    price: 150,
    imageUrl:
        'https://images.pexels.com/photos/280471/pexels-photo-280471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Coffee Table
    colors: [0xFFDAA520, 0xFF696969, 0xFFFF4500],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '18"', 'Width': '48"', 'Depth': '24"'},
    category: 'Tables',
  ),
  Product(
    name: 'Nightstand',
    description: 'Modern nightstand',
    price: 120,
    imageUrl:
        'https://images.pexels.com/photos/2451264/pexels-photo-2451264.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Nightstand
    colors: [0xFF8B4513, 0xFFB22222, 0xFFDAA520],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '24"', 'Width': '18"', 'Depth': '16"'},
    category: 'Tables',
  ),
  Product(
    name: 'Office Chair',
    description: 'Comfortable office chair',
    price: 250,
    imageUrl:
        'https://images.pexels.com/photos/12269764/pexels-photo-12269764.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Office Chair
    colors: [0xFF000000, 0xFF696969, 0xFF8B0000],
    materials: ['Metal', 'Plastic'],
    fabrics: ['Leather'],
    dimensions: {'Height': '45"', 'Width': '26"', 'Depth': '26"'},
    category: 'Chairs',
  ),
  Product(
    name: 'Table Lamp',
    description: 'Stylish table lamp',
    price: 80,
    imageUrl:
        'https://images.pexels.com/photos/7046164/pexels-photo-7046164.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Table Lamp
    colors: [0xFFFFD700, 0xFFDAA520, 0xFF8B4513],
    materials: ['Metal', 'Fabric'],
    fabrics: ['Cotton'],
    dimensions: {'Height': '20"', 'Width': '10"', 'Depth': '10"'},
    category: 'Tables',
  ),
  Product(
    name: 'Dresser',
    description: 'Elegant dresser',
    price: 450,
    imageUrl:
        'https://images.pexels.com/photos/1571471/pexels-photo-1571471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Dresser
    colors: [0xFFDAA520, 0xFF696969, 0xFFFF4500],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '40"', 'Width': '50"', 'Depth': '18"'},
    category: 'Sofas',
  ),
  Product(
    name: 'Recliner',
    description: 'Comfortable recliner',
    price: 400,
    imageUrl:
        'https://images.pexels.com/photos/7195553/pexels-photo-7195553.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Recliner
    colors: [0xFF000000, 0xFF696969, 0xFF8B0000],
    materials: ['Metal', 'Plastic'],
    fabrics: ['Leather'],
    dimensions: {'Height': '40"', 'Width': '30"', 'Depth': '35"'},
    category: 'Chairs',
  ),
  Product(
    name: 'Bar Stool',
    description: 'Stylish bar stool',
    price: 100,
    imageUrl:
        'https://images.pexels.com/photos/7319279/pexels-photo-7319279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Bar Stool
    colors: [0xFFDAA520, 0xFF696969, 0xFFFF4500],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '30"', 'Width': '15"', 'Depth': '15"'},
    category: 'Chairs',
  ),
  Product(
    name: 'Outdoor Chair',
    description: 'Durable outdoor chair',
    price: 200,
    imageUrl:
        'https://images.pexels.com/photos/6370026/pexels-photo-6370026.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Outdoor Chair
    colors: [0xFF8B4513, 0xFF00008B, 0xFFB8860B],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '40"', 'Width': '24"', 'Depth': '24"'},
    category: 'Chairs',
  ),
  Product(
    name: 'Rocking Chair',
    description: 'Comfortable rocking chair',
    price: 220,
    imageUrl:
        'https://images.pexels.com/photos/1148955/pexels-photo-1148955.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Rocking Chair
    colors: [0xFF8B4513, 0xFF00008B, 0xFFB8860B],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '40"', 'Width': '24"', 'Depth': '24"'},
    category: 'Chairs',
  ),
  Product(
    name: 'Vanity',
    description: 'Elegant vanity',
    price: 500,
    imageUrl:
        'https://images.pexels.com/photos/1866149/pexels-photo-1866149.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Vanity
    colors: [0xFF8B4513, 0xFF00008B, 0xFFB8860B],
    materials: ['Wood', 'Metal'],
    fabrics: ['None'],
    dimensions: {'Height': '50"', 'Width': '30"', 'Depth': '20"'},
    category: 'Sofas',
  ),
  Product(
  name: 'Classic Wall Clock',
  description: 'Elegant wall clock with a classic design.',
  price: 120,
  imageUrl: 'https://images.pexels.com/photos/2182727/pexels-photo-2182727.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // استبدل برابط الصورة الفعلي
  colors: [0xFF000000, 0xFFB22222, 0xFFDAA520],
  materials: ['Wood', 'Glass'],
  fabrics: [],
  dimensions: {'Diameter': '15"', 'Thickness': '2"'},
  category: 'Clocks',
),
Product(
  name: 'Modern Desk Clock',
  description: 'Sleek desk clock with a modern touch.',
  price: 95,
  imageUrl: 'https://images.pexels.com/photos/833487/pexels-photo-833487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // استبدل برابط الصورة الفعلي
  colors: [0xFF808080, 0xFF00FFFF, 0xFFDC143C],
  materials: ['Metal', 'Plastic'],
  fabrics: [],
  dimensions: {'Height': '6"', 'Width': '4"', 'Depth': '2"'},
  category: 'Clocks',
),
Product(
  name: 'Vintage Pocket Watch',
  description: 'Antique pocket watch with intricate detailing.',
  price: 250,
  imageUrl: 'https://images.pexels.com/photos/4095545/pexels-photo-4095545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // استبدل برابط الصورة الفعلي
  colors: [0xFFC0C0C0, 0xFF8B4513],
  materials: ['Brass', 'Leather'],
  fabrics: ['Leather'],
  dimensions: {'Diameter': '2"', 'Thickness': '0.5"'},
  category: 'Clocks',
),
Product(
  name: 'Smart Digital Watch',
  description: 'High-tech digital watch with fitness tracking.',
  price: 180,
  imageUrl: 'https://images.pexels.com/photos/1010480/pexels-photo-1010480.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // استبدل برابط الصورة الفعلي
  colors: [0xFF0000FF, 0xFF32CD32, 0xFFFF4500],
  materials: ['Silicone', 'Aluminum'],
  fabrics: [],
  dimensions: {'Height': '1"', 'Width': '2"', 'Depth': '0.5"'},
  category: 'Clocks',
),

];
