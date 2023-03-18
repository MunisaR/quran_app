import 'package:quran_app/pages/99_names.dart';
import 'package:quran_app/pages/quran_page.dart';
import 'package:quran_app/pages/rayingMainPage.dart';
import 'package:quran_app/pages/tasbih_page.dart';
import 'package:quran_app/widgets/quiz_card.dart';
import "../pages/quizz/qur'an/quran_quizz_page.dart";
import 'package:quran_app/pages/zikrs.dart';

const routeCategories = [
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
    "route": TasbihPage()

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
    "route": PrayingMainPage()

  },
  ////
  {
    "id": 7,
    "name": "Zikr\nva\nduolar",
    "picture": "assets/icons/zikr.png",
    "route": Zikrs()

  },
  {
    "id": 8,
    "name": "Savol\nva\njavob",
    "picture": "assets/icons/brain.png",
    "route": QuizCard( )

  },
  {
    "id": 9,
    "name": "Kitoblar",
    "picture": "assets/icons/books.png",
    "route": QuranPage()

  },
];

const quizzCategories = [
  {
    "id": 1,
    "name": "Prophets",
    "picture": "assets/icons/quizz_prophets.png",
    "route": ProphetsQuizPage()
  },
  {
    "id": 2,
    "name": "Qur'an",
    "picture": "assets/icons/quiz_quran.jpg",
    "route": QuranQuizPage()
  },
  {
    "id": 3,
    "name": "Ramadan",
    "picture": "assets/icons/ramadan.jpg",
    "route": RamadanQuizPage()
  },
  {
    "id": 4,
    "name": "Praying",
    "picture": "assets/icons/quiz_mosque.jpg",
    "route": PrayingQuizPage()
  },
  {
    "id": 5,
    "name": "Hajj",
    "picture": "assets/icons/hajj.jpg",
    "route": HajjQuizPage()
  },
];
