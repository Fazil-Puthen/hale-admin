//image  selection by user container
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/constants/constants.dart';
import 'package:hale_backend/presentation/add_product%20screen/bloc/addproduct_bloc.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.screenwidth,
    required this.screenheight,
  });

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddproductBloc, AddproductState>(
      // buildWhen:(previous, current) => current is Gallerypicked,
      builder: (context, state) {
        if (state is Gallerypicked) {
          final images = state.pickedimages;
            if(images==null||images.isEmpty) {
            return const Center(
              child: Text('please select an image'),
            );
          }
          else {
             print('this is images length: ${images.length.toString()}');
            return Stack(children: [
              SizedBox(
                  width: screenwidth * 0.5,
                  height: screenheight * 0.4,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 0.2,
                              mainAxisSpacing: 5),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Stack(children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(fit: BoxFit.contain,
                                    image: MemoryImage(Uint8List.fromList(
                                        images[index].bytes,)))),
                          ),
                          Positioned(left: screenwidth<750?1:25,
                          top: screenwidth<750?-10:1,
                            child: IconButton(
                              splashColor: Colors.red,
                              hoverColor: Colors.red,
                              splashRadius: 20,
                              icon: Icon(
                                Icons.delete,
                                semanticLabel: 'Delete',
                                size:screenwidth<750?10:20,
                                color: Colors.red.withOpacity(0.5),
                              ),
                              onPressed: () {
                                 context.read<AddproductBloc>().add(ImageDeleteEvent(index: index));
                              },
                            ),
                          )
                        ]);
                      })),
            ]);
          } 
        
        } else {
          return SizedBox();
        }
      },
    );
  }
}
