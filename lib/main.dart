import 'package:flutter/material.dart';
import 'package:bloc_yas_practice/bloc/productos_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final productosBloc = new ProductosBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productosBloc.productosContador,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('Productos ${snapshot.data ?? 0}');
            },
          )
        ),
        body: StreamBuilder(
          stream: productosBloc.getProductos,
          builder: ( _ , AsyncSnapshot<List<String>> snapshot) {

            final productos = snapshot.data ?? [];

            return ListView.builder(
                    itemCount: productos.length,
                    itemBuilder: (_, i) {
                      return ListTile(
                        title: Text( productos[i] ),
                      );
                    },
                  );

          },
        )
      ),
    );
  }
}
