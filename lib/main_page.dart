import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:uts_papb/redux_controller.dart';
import 'package:uts_papb/tambah_catatan.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Keuangan'),
      ),
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
          converter: (Store<AppState> store) => store.state,
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('Total Pemasukkan : Rp${state.totalPemasukkan}'),
                  SizedBox(height: 20),
                  Text('Total Pengeluaran : Rp${state.totalPengeluaran}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TambahCatatan();
                      }));
                    },
                    child: Text('Tambah Catatan Finansial'),
                  ),
                  

                  // Daftar pemasukan
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.pemasukkanList.length,
                      itemBuilder: (context, index) {
                        final pemasukkan = state.pemasukkanList[index];
                        return ListTile(
                          leading: Text('💰'),
                          title: Text('Pemasukkan'),
                          subtitle: Text('Rp$pemasukkan'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              StoreProvider.of<AppState>(context).dispatch(
                                HapusCatatanAction(
                                  kategori: 'Pemasukkan',
                                  jumlah: int.parse(pemasukkan),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // Daftar pengeluaran
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.pengeluaranList.length,
                      itemBuilder: (context, index) {
                        final pengeluaran = state.pengeluaranList[index];
                        return ListTile(
                          leading: Text('💸'),
                          title: Text('Pengeluaran'),
                          subtitle: Text('Rp$pengeluaran'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              StoreProvider.of<AppState>(context).dispatch(
                                HapusCatatanAction(
                                  kategori: 'Pengeluaran',
                                  jumlah: int.parse(pengeluaran),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}