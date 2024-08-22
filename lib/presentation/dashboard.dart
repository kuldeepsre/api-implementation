import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/utils/text_styles.dart';
import '../bloc/dashboard/category/category_bloc.dart';
import '../bloc/dashboard/product/product_bloc.dart';
import '../bloc/dashboard/vagitable/vigitable_bloc.dart';
import '../color_utils.dart';
class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});
  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int? selectedVegetableId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: [
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoriesLoaded) {
              return Container(
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
                      return Container(
                        width: MediaQuery.of(context).size.height * 0.25,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                context.read<ProductBloc>().add(LoadProducts(category.id));

                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (state is CategoriesError) {
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
        Expanded(child: BlocBuilder<VegetableBloc, VegetableState>(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 12),
                    child: Container(
                      height: 48,
                      padding: EdgeInsets.all(12),
                      decoration: ShapeDecoration(
                        color: ColorUtils.boarderBlue,
                        shape: const RoundedRectangleBorder(
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
                        dropdownColor: ColorUtils.boarderBlue,
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
                  ),

                ],
              );
            }
            return const Center(child: Text('Select a vegetable'));
          },
        ))
      ],
      ),
    );
  }
}
