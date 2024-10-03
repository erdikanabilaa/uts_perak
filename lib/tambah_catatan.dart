import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uts_papb/redux_controller.dart';

class TambahCatatan extends StatefulWidget {
  const TambahCatatan({super.key});

  @override
  _TambahCatatanState createState() => _TambahCatatanState();
}

class _TambahCatatanState extends State<TambahCatatan> {
  String? _selectedCategory;
  List<String> _categories = ['Pemasukkan', 'Pengeluaran'];
  final TextEditingController _jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Catatan Finansial'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Judul Catatan',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(),
                  ),
                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _jumlahController,
                  decoration: InputDecoration(
                    labelText: 'Jumlah Uang',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedCategory != null &&
                        _jumlahController.text.isNotEmpty) {
                      StoreProvider.of<AppState>(context).dispatch(
                        TambahCatatanAction(
                          kategori: _selectedCategory!,
                          jumlah: int.parse(_jumlahController.text),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Simpan Catatan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
