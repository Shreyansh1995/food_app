import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/entities/cart_entity.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_bloc.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_event.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_state.dart';

class CartBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
        builder: (context,state){
          if (state is ShowCartState) {
            return _cartWidget(context, state.totalPrice, state.result);
          }
          return _cartWidget(context, 0.0, []);
        },
        listener: (context,state){
          if(state is EmptyCartState){
            Navigator.pop(context);
          }
        });
  }

  Widget _cartWidget(
      BuildContext context, double totalPrice, List<CartEntity> cartItems) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.9, // Make it nearly fullscreen
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
              ),
              const Text(
                'We will deliver in 24 minutes to the address:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('100a Ealing Rd'),
                  TextButton(
                      onPressed: () {}, child: const Text('Change address')),
                ],
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                // To fit the height of items in the bottom sheet
                physics: const NeverScrollableScrollPhysics(),
                // To avoid nested scrolling
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            item.imageUrl!, // Replace with the actual image URL
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name!,
                                  style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          RemoveQuantity(cartItems[index],
                                              item.quantity!));
                                    }, // Handle decrease quantity
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(item.quantity.toString()),
                                  IconButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                          AddQuantityEvent(cartItems[index],
                                              item.quantity!));
                                    }, // Handle increase quantity
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                            '\$${(item.price! * item.quantity!).toStringAsFixed(2)}'),
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Cutlery', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {}, // Handle decrease cutlery
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      const Text('1'),
                      // Cutlery quantity (can be variable if needed)
                      IconButton(
                        onPressed: () {}, // Handle increase cutlery
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery', style: TextStyle(fontSize: 16)),
                  Text('\$0.00'),
                ],
              ),
              const Text(
                'Free delivery from \$30',
                style: TextStyle(color: Colors.grey),
              ),
              const Divider(),
              const Text('Payment method', style: TextStyle(fontSize: 16)),
              const ListTile(
                leading: Icon(Icons.payment), // Example icon for Apple Pay
                title: Text('Apple Pay'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const Divider(),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Fullscreen sheet
                      backgroundColor: Colors.transparent,
                      builder: (context) => CartBottomSheet(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '24 min',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
