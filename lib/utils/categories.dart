import 'package:quran_app/pages/99_names.dart';
import 'package:quran_app/pages/quran_page.dart';
import 'package:quran_app/pages/tasbih_page.dart';

const route_categories = [
  {
    "id": 1,
    "name": "Qur'an",
    "picture": "assets/icons/quran.png",
    "route": QuranPage()
  },
  {
    "id": 2,
    "name": "Namoz\nvaqtlari",
    "picture": "assets/icons/namoz.png",
    "route": QuranPage()

  },
  {
    "id": 3,
    "name": "Tasbeh",
    "picture": "assets/icons/tasbih.png",
    "route": TasbihPage()

  },
  {
    "id": 4,
    "name": "Qibla",
    "picture": "assets/icons/kaaba.png",
    "route": QuranPage()

  },
  {
    "id": 5,
    "name": "Allohning\n99\nismlari",
    "picture": "assets/icons/99.png",
    "route": NamesOfAllah()

  },
  {
    "id": 6,
    "name": "Namoz\no'qishni\no'rganamiz",
    "picture": "assets/icons/praying.png",
    "route": QuranPage()

  },
  ////
  {
    "id": 7,
    "name": "Zikr\nva\nduolar",
    "picture": "assets/icons/zikr.png",
    "route": QuranPage()

  },
  {
    "id": 8,
    "name": "Savol\nva\njavob",
    "picture": "assets/icons/brain.png",
    "route": QuranPage()

  },
  {
    "id": 9,
    "name": "Kitoblar",
    "picture": "assets/icons/books.png",
    "route": QuranPage()

  },
];
