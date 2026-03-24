import 'package:flutter/material.dart';

void main() => runApp(const FloreriaAjoloteApp());

class FloreriaAjoloteApp extends StatelessWidget {
  const FloreriaAjoloteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.pink),
      home: const CatalogoFloreria(),
    );
  }
}

class CatalogoFloreria extends StatelessWidget {
  const CatalogoFloreria({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> productos = [
      {"t": "Ramo de rosas", "s": "Amor", "e": 5, "i": "ramo_rosas.jpg"},
      {"t": "Logo Ajolote", "s": "Oficial", "e": 4, "i": "ajolotelogo.png"},
      {"t": "Arreglo Chio", "s": "Especial", "e": 5, "i": "c0557-chio.lealc-2.jpg"},
      {"t": "Ajolote Flor", "s": "Firma", "e": 5, "i": "ajoloteflor.PNG"},
      {"t": "Acapulco", "s": "Tropical", "e": 4, "i": "flores-acapulco.jpg"},
      {"t": "Flores Bonitas", "s": "Detalle", "e": 5, "i": "flores-bonitas.jpg"},
      {"t": "Macetas", "s": "Hogar", "e": 3, "i": "macetas.png"},
      {"t": "Omaiga", "s": "Sorpresa", "e": 5, "i": "omaiga.PNG"},
      {"t": "Arreglo 728", "s": "Premium", "e": 4, "i": "728-2-Arreglo-728-800x800-800x800-740x740.jpg"},
      {"t": "Captura", "s": "Diseño", "e": 4, "i": "Captura.PNG"},
      {"t": "Idilio", "s": "Romance", "e": 5, "i": "FY0155-Idilio_1.png"},
      {"t": "Cuidado", "s": "Guía", "e": 3, "i": "cuidado.png"},
      {"t": "Nubecita", "s": "Suave", "e": 5, "i": "flor-de-nubecita.png"},
      {"t": "Uy!", "s": "Novedad", "e": 4, "i": "uy.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FLORERIA AJOLOTE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.pink[400],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.65,
        ),
        itemCount: productos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/' + productos[index]['i'], // Cargando desde assets
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error_outline, color: Colors.red)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(productos[index]['t'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(productos[index]['s'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (star) => Icon(
                          star < productos[index]['e'] ? Icons.star : Icons.star_border,
                          size: 16, color: Colors.amber,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
