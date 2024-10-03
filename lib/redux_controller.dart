// State Aplikasi
class AppState {
  final int totalPemasukkan;
  final int totalPengeluaran;
  final List<String> pemasukkanList;
  final List<String> pengeluaranList;

  AppState({
    required this.totalPemasukkan,
    required this.totalPengeluaran,
    required this.pemasukkanList,
    required this.pengeluaranList,
  });

  // State awal
  factory AppState.initial() {
    return AppState(
      totalPemasukkan: 0,
      totalPengeluaran: 0,
      pemasukkanList: [],
      pengeluaranList: [],
    );
  }

  // Method untuk memperbarui state
  AppState copyWith({
    int? totalPemasukkan,
    int? totalPengeluaran,
    List<String>? pemasukkanList,
    List<String>? pengeluaranList,
  }) {
    return AppState(
      totalPemasukkan: totalPemasukkan ?? this.totalPemasukkan,
      totalPengeluaran: totalPengeluaran ?? this.totalPengeluaran,
      pemasukkanList: pemasukkanList ?? this.pemasukkanList,
      pengeluaranList: pengeluaranList ?? this.pengeluaranList,
    );
  }
}

// Actions
class TambahCatatanAction {
  final String kategori;
  final int jumlah;

  TambahCatatanAction({required this.kategori, required this.jumlah});
}

class HapusCatatanAction {
  final String kategori;
  final int jumlah;

  HapusCatatanAction({required this.kategori, required this.jumlah});
}

// Reducer
AppState appReducer(AppState state, dynamic action) {
  if (action is TambahCatatanAction) {
    if (action.kategori == 'Pemasukkan') {
      return state.copyWith(
        totalPemasukkan: state.totalPemasukkan + action.jumlah,
        pemasukkanList: List.from(state.pemasukkanList)..add(action.jumlah.toString()),
      );
    } else if (action.kategori == 'Pengeluaran') {
      return state.copyWith(
        totalPengeluaran: state.totalPengeluaran + action.jumlah,
        pengeluaranList: List.from(state.pengeluaranList)..add(action.jumlah.toString()),
      );
    }
  } else if (action is HapusCatatanAction) {
    if (action.kategori == 'Pemasukkan') {
      return state.copyWith(
        totalPemasukkan: state.totalPemasukkan - action.jumlah,
        pemasukkanList: List.from(state.pemasukkanList)..remove(action.jumlah.toString()),
      );
    } else if (action.kategori == 'Pengeluaran') {
      return state.copyWith(
        totalPengeluaran: state.totalPengeluaran - action.jumlah,
        pengeluaranList: List.from(state.pengeluaranList)..remove(action.jumlah.toString()),
      );
    }
  }

  return state;
}
