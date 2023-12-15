//image  selection by user container

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale_backend/presentation/product_update-delete/bloc/multicontentupdate_bloc.dart';

class UpdateImageContainer extends StatelessWidget {
  const UpdateImageContainer({
    super.key,
    required this.screenwidth,
    required this.screenheight,
  });

  final double screenwidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MulticontentupdateBloc, MulticontentupdateState>(
      builder: (context, state) {
        if(state is Addimageloadingstate){
          return const Center(child: CircularProgressIndicator(),);
        }
        if (state is  ImagefethsuccessState) {
          final List images = state.imagelist;
            if(images.isEmpty) {
            return const Center(
              child: Text('please select an image'),
            );
          }
          else {
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
                                    image: NetworkImage(images[index]))),
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
                                 context.read<MulticontentupdateBloc>().add(DeleteimageEvent(index: index));
                              },
                            ),
                          )
                        ]);
                      })),
            ]);
          } 
        
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
