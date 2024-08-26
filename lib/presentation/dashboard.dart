import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/bloc/home_product/product_dashboard_bloc.dart';
import 'package:push/utils/text_styles.dart';
import '../bloc/dashboard/category/category_bloc.dart';
import '../bloc/dashboard/chip/chip_bloc.dart';
import '../bloc/dashboard/product/product_bloc.dart';
import '../bloc/dashboard/vagitable/vigitable_bloc.dart';
import '../color_utils.dart';
import '../model/ProductDto.dart';
import 'CartScreen.dart';
class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});
  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int? selectedVegetableId;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   /*   appBar: AppBar(
        title: Text('Product Display'),
        actions: [
          BlocBuilder<ProductDashboardBloc, ProductDashboardState>(
            builder: (context, state) {
              int cartCount = 0;
              if (state is ProductLoaded) {
                cartCount = state.cartCount;
              }
              return Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                    },
                  ),
                  if (cartCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Text(
                          '$cartCount',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),*/
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoriesLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (state is CategoriesLoaded ) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            final isSelected =
                                state.selectedCategory?.id == category.id;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.height * 0.25,

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ), // Adjust the width as needed
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      title: Center(
                                        child: Text(
                                          category.name,
                                          textAlign: TextAlign.center,
                                          style: TextStyles.bodyText1Accent,
                                        ),
                                      ),
                                      trailing: isSelected
                                          ? const Icon(Icons.check, color: Colors.green)
                                          : null,
                                      onTap: () {
                                        context
                                            .read<CategoryBloc>()
                                            .add(SelectCategory(category));
                                      /*  var id=state.selectedCategory?.id;*/
                                        print(category.id);
                                      //  context.read<ProductBloc>().add(LoadProducts(category.id));

                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }
              else if (state is CategoriesError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('No categories found'));
            },
          ),
          // Products List
          /*   Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      print(product);
                      return ListTile(
                        title: Text(product.name,style: TextStyles.heading1Accent,),
                      );
                    },
                  );
                }
                return const Center(child: Text('Select a category to see products'));
              },
            ),
          ),*/
          SizedBox(height: 12,),
          BlocBuilder<VegetableBloc, VegetableState>(
            builder: (context, state) {
              if (state is VegetableLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is VegetableError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              else if (state is VegetableLoaded) {
                final vegetables = state.vegetables;
                return Column(
                  children: [
                    Container(
                      height: 48,
                      padding: EdgeInsets.all(12),
                      decoration: const ShapeDecoration(

                        color:  Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: .12, style: BorderStyle.solid),
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      //MediaQuery.of(context).size.height * .,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        isDense: false,
                        underline: SizedBox(),
                        iconEnabledColor: Colors.white,
                        dropdownColor:Colors.deepPurple,
                        hint: const Text(
                          "Select Vagitable",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: selectedVegetableId,
                        items: vegetables.map<DropdownMenuItem<int>>((Map<String, dynamic> veg) {
                              return DropdownMenuItem<int>(
                                value: veg['id'],
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4.0),
                                  child: Text(
                                    veg['name'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            selectedVegetableId = newvalue;
                            print('Selected Vegetable ID: $selectedVegetableId');
                          });
                        },
                      ),
                    ),

                  ],
                );
              }
              return const Center(child: Text('Select a vegetable'));
            },
          ),
          SizedBox(height: 12,),
          BlocBuilder<ChipBloc, ChipState>(
            builder: (context, state) {
              if (state is ChipLoading) {
                return Center(child: CircularProgressIndicator());
              }
              else if (state is ChipLoaded) {
                // Use defaultSelectedId if needed
                final defaultSelectedId = state.defaultSelectedId;
                print(defaultSelectedId);
                return Wrap(
                  spacing: 8.0,
                  children: state.chips.map((chip) {
                    return ChoiceChip(
                     // backgroundColor: Colors.deepPurple,
                      label: Text(chip.name),
                      selected: chip.isSelected,
                      onSelected: (selected) {
                        BlocProvider.of<ChipBloc>(context)
                            .add(ToggleChipSelection(chip.id));
                      },
                    );
                  }).toList(),
                );
              } else {
                return Center(child: Text('No chips available.'));
              }
            },
          ),
          BlocBuilder<ProductDashboardBloc, ProductDashboardState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // New Arrivals Section
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('New Arrivals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      ProductList(products: state.newArrivals),
                      // Popular Products Section
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Popular Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      ProductList(products: state.popularProducts),
                    ],
                  ),
                );
              } else if (state is ProductError) {
                return Center(child: Text(state.message));
              } else {
                return const Center(child: Text('No products available.'));
              }
            },
          ),
        ],
        ),
      ),
    );
  }
}


class ProductList extends StatelessWidget {
  final List<ProductDto> products;

  ProductList({required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.name, style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${product.price.toString()}', style: TextStyle(fontSize: 14)),
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ProductDashboardBloc>(context).add(AddToCart(product));
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}