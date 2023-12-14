import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

//theme colors
const kPrimaryColor = Color(0xFF151529);
const kSecondaryColor = Color(0xFFEBF1F5);
const kWhiteColor = Colors.white;

//buttonsColors
const kDefaultBtnColor = Color(0xFF151529);
const kSecondBtnColor = Colors.white;
const kDisabledBtnColor = Color(0xFFEBF1F5);

//borderColors
const kDefaultBorderColor = Color(0xFFEBF1F5);
const kChooseBorderColor = Color(0xFF151529);

//iconsColors
const kPrimaryIconColor = Colors.white;
const kSecondaryIconColor = Color(0xFF151529);

// textColors
const kPrimaryTextColor = Color(0xFF151529);
const kSecondaryTextColor = Colors.white;

//Strings
class AppStrings {
  static const String teamTitle = "مين X الصورة";
  static const String actingTitle = "تمثيل اللاعب";
  static const String auctionTitle = "عروستي بالعكس";
  static const String passwordTitle = "كلمة السر";
  static const String stopwatchTitle = "٥ X ١٠";
  static const String whoIamTitle = "أنا مين ؟";
  static const String contactTitle = "ما تخش ترمي السلام يزميلي";
  static const String instructionTitle = "التعليمات";
  static const String guideTitle = "الأدلة";
  static const String letsGoBtn = "يلا بينا";
  static const String nextPlayerBtn = "خش على اللاعب اللي بعده";
  static const String nextGuideBtn = "الدليل اللي بعده";
  static const String showPlayerBtn = "وريني اللاعب ده";
  static const String levelTitle = "مستوى الصعوبة";
  static const String easyLevelBtn = "عالهادي";
  static const String midLevelBtn = "نص نص";
  static const String hardLevelBtn = "تقيل";
  static const String confirmLevelBtn = "ودي يزميلي ";
  static const String nextTeamBtn = "خش على الفريق اللي بعده";
  static const String showPlayersBtn = "وريني اللاعيبة";
  static const String nextQuestionBtn = "خش على السؤال اللي بعده";
  static const String showAnswersBtn = "وريني إجابات";
  static const String answersTitle = "إجابات";
  static const String okBtn = "اشطا يزميلي";
  static const String thePlayerIs = "اللاعب ده هو";
  static const String errorMessage = "اتأكد من النت يزميلي";


  static const String passwordInstruction1 = "مينفعش تقول اسم أي لاعب أو فريق أو جنسية اللاعب";
  static const String passwordInstruction2 = "لازم تقول كلمة واحدة بس في كل مرة وبتتلعب على 8 جولات";
  static const String passwordInstruction3 = "متاح 30 ثانية لكل فريق علشان يقول الكلمة والإجابة";
  static const String passwordInstruction4 = "لو فضلنا متعادلين بنروح لكسر التعادل";

  static const String whoIamInstruction1 = "في 5 أدلة متاحة لكل لاعب وبتتلعب على 3 جولات";
  static const String whoIamInstruction2 = "لو خمنت اسم غلط أفضلية الإجابة بتروح للفريق التاني بعد ما يسمع الدليل اللي بعده";

  static const String actingInstruction1 = "مينفعش تشاور على أي حاجة موجودة في المكان";
  static const String actingInstruction2 = "متاح 45 ثانية لكل فريق علشان يخمن اسم ، والفريق له 3 تخمينات بس";
  static const String actingInstruction3 = "لو الفريق معرفش اللاعب الفريق التاني متاح له يخمن مرة واحدة بس في 10 ثواني";
  static const String actingInstruction4 = "بنلعب على 8 جولات ولو فضلنا متعادلين بنروح لكسر التعادل";

  static const String teamInstruction1 = "بتظهرلك صورة لفريق فبداية ماتش وبتتلعب على 5 جولات";
  static const String teamInstruction2 = "كل لاعب بيخمن لاعب واحد بس من ال11 لاعب في دوره";
  static const String teamInstruction3 = "الفريق اللي بيجاوب إجابات صح اكتر بيفوز بالجولة #بديهيات";
  static const String teamInstruction4 = "لو لاعب جاوب مرتين ورا بعض غلط مبيجاوبش تاني باقي الجولة";

  static const String stopwatchInstruction1 = "اللاعب بيجاوب 5 اجابات صحيحة في 10 ثواني من بعد ما يسمع السؤال";
  static const String stopwatchInstruction2 = "بنلعب على 8 جولات ولو فضلنا متعادلين بنروح لكسر التعادل";

  static const String auctionInstruction1 = "المزاد بيبدأ من كل لاعب على زميله بعدد الأسئلة اللي يقدر يعرف بيها اللاعب , واللي المزاد هيرسى عليه بالرقم الأقل هو اللي هيلعب";
  static const String auctionInstruction2 = "اللي بيسمع السؤال المفروض يجاوب بـ آه أو لأ حتى لو ميعرفش الإجابة";
  static const String auctionInstruction3 = "لو معرفش الإجابة بعد ما يسمع كل الأسئلة , الفريق التاني بيستخدم العدد الباقي من الأسئلة وبعدها يجاوب";
  static const String auctionInstruction4 = "بنلعب على 8 جولات ولو فضلنا متعادلين بنروح لكسر التعادل";

  static const String imageFBTitle = 'image';
  static const String nameFBTitle = 'name';
  static const String keyFBTitle = 'key';
  static const String firstClueFBTitle = 'firstClue';
  static const String secondClueFBTitle = 'secondClue';
  static const String thirdClueFBTitle = 'thirdClue';
  static const String fourthClueFBTitle = 'fourthClue';
  static const String fifthClueFBTitle = 'fifthClue';
  static const String player1FBTitle = 'player1';
  static const String player2FBTitle = 'player2';
  static const String player3FBTitle = 'player3';
  static const String player4FBTitle = 'player4';
  static const String player5FBTitle = 'player5';
  static const String player6FBTitle = 'player6';
  static const String player7FBTitle = 'player7';
  static const String player8FBTitle = 'player8';
  static const String player9FBTitle = 'player9';
  static const String player10FBTitle = 'player10';
  static const String player11FBTitle = 'player11';
  static const String questionFBTitle = 'question';
  static const String answer1FBTitle = 'answer1';
  static const String answer2FBTitle = 'answer2';
  static const String answer3FBTitle = 'answer3';
  static const String answer4FBTitle = 'answer4';
  static const String answer5FBTitle = 'answer5';
  static const String answer6FBTitle = 'answer6';
  static const String answer7FBTitle = 'answer7';
  static const String answer8FBTitle = 'answer8';
  static const String answer9FBTitle = 'answer9';
  static const String answer10FBTitle = 'answer10';

  static const String easyId = 'easy';
  static const String midId = 'mid';
  static const String hardId = 'hard';

  static const String actingCollection = 'acting';
  static const String actingDoc = '1LlkXAR1LM9uEJjTzmZ9';
  static const String easyActingCollection = 'EasyActing';
  static const String midActingCollection = 'MidActing';
  static const String hardActingCollection = 'HardActing';


  static const String auctionCollection = 'auction';
  static const String auctionDoc = 'OY6bG6fXXvMrwOkRxX8Q';
  static const String easyAuctionCollection = 'easyAuction';
  static const String midAuctionCollection = 'midAuction';
  static const String hardAuctionCollection = 'hardAuction';

  static const String whoIamCollection = 'whoIam';
  static const String whoIamDoc = '5dEbW1U929wM9GXX9ICG';
  static const String easyWhoIamCollection = 'easyWhoIam';
  static const String midWhoIamCollection = 'midWhoIam';
  static const String hardWhoIamCollection = 'hardWhoIam';

  static const String teamCollection = 'team';
  static const String teamDoc = '8Btb3BghIZ2wDiQADBqj';
  static const String easyTeamCollection = 'easyTeam';
  static const String midTeamCollection = 'midTeam';
  static const String hardTeamCollection = 'hardTeam';

  static const String passwordCollection = 'password';
  static const String passwordDoc = '9gg6AB5gIfepzUkSLBs0';
  static const String easyPasswordCollection = 'easyPassword';
  static const String midPasswordCollection = 'midPassword';
  static const String hardPasswordCollection = 'hardPassword';

  static const String stopWatchCollection = 'stopWatch';
  static const String stopWatchDoc = 't43WU8CefscojTtSo6Fp';
  static const String easyStopWatchCollection = 'easyStopWatch';
  static const String midStopWatchCollection = 'midStopWatch';
  static const String hardStopWatchCollection = 'hardStopWatch';

}

//Images
const kActingImage = 'assets/images/acting.png';
const kAuctionImage = 'assets/images/bid.png';
const kPasswordImage = 'assets/images/password.png';
const kStopwatchImage = 'assets/images/timer.png';
const kTeamImage = 'assets/images/nameTheTeam.png';
const kWhoIamImage = 'assets/images/guessThePlayer.png';

const kHomeBGImage = 'assets/backgrounds/homeBG.png';
const kRedPlayerBG = 'assets/backgrounds/Red-PlayerBG.png';
const kBluePlayerBG = 'assets/backgrounds/Blue-PlayerBG.png';
const kYellowPlayerBG = 'assets/backgrounds/Yellow-PlayerBG.png';
const kBabyBluePlayerBG = 'assets/backgrounds/BabyBlue-PlayerBG.png';
const kWhitePlayerBG = 'assets/backgrounds/White-PlayerBG.png';
const kDarkRedPlayerBG = 'assets/backgrounds/DarkRed-PlayerBG.png';

//icons
const kFacebookIcon = 'assets/icons/facebook.svg';
const kInstagramIcon = 'assets/icons/instagram.svg';
const kTelegramIcon = 'assets/icons/telegram.svg';
const kWhatsappIcon = 'assets/icons/whatsapp.svg';
const kXIcon = 'assets/icons/x.svg';
const kResetIcon = 'assets/icons/reset.svg';
const kShowPlayerIcon = 'assets/icons/showPlayer.svg';
const pauseIcon = Iconsax.pause5;

class CustomIcons {
  CustomIcons();

  static const _kFontFam = 'CustomIcons';
  static const String? _kFontPkg = null;

  static const IconData playIcon = IconData(59392, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

List<int> randomNumbers = [];

int generateRandomNumber(int max) {
  if (randomNumbers.isEmpty) {
    randomNumbers = List<int>.generate(max, (index) => index);
  }
  final random = Random();
  final index = random.nextInt(randomNumbers.length);
  final randomNumber = randomNumbers[index];
  randomNumbers.removeAt(index);
  return randomNumber;
}
class FireBaseReferences{

  static CollectionReference kEasyActingRef = FirebaseFirestore.instance
      .collection(AppStrings.actingCollection)
      .doc(AppStrings.actingDoc)
      .collection(AppStrings.easyActingCollection);

  static CollectionReference kMidActingRef = FirebaseFirestore.instance
      .collection(AppStrings.actingCollection)
      .doc(AppStrings.actingDoc)
      .collection(AppStrings.midActingCollection);

  static CollectionReference kHardActingRef = FirebaseFirestore.instance
      .collection(AppStrings.actingCollection)
      .doc(AppStrings.actingDoc)
      .collection(AppStrings.hardActingCollection);


  static CollectionReference kEasyAuctionRef = FirebaseFirestore.instance
      .collection(AppStrings.auctionCollection)
      .doc(AppStrings.auctionDoc)
      .collection(AppStrings.easyAuctionCollection);

  static CollectionReference kMidAuctionRef = FirebaseFirestore.instance
      .collection(AppStrings.auctionCollection)
      .doc(AppStrings.auctionDoc)
      .collection(AppStrings.midAuctionCollection);

  static CollectionReference kHardAuctionRef = FirebaseFirestore.instance
      .collection(AppStrings.auctionCollection)
      .doc(AppStrings.auctionDoc)
      .collection(AppStrings.hardAuctionCollection);


  static CollectionReference kEasyPasswordRef = FirebaseFirestore.instance
      .collection(AppStrings.passwordCollection)
      .doc(AppStrings.passwordDoc)
      .collection(AppStrings.easyPasswordCollection);

  static CollectionReference kMidPasswordRef = FirebaseFirestore.instance
      .collection(AppStrings.passwordCollection)
      .doc(AppStrings.passwordDoc)
      .collection(AppStrings.midPasswordCollection);

  static CollectionReference kHardPasswordRef = FirebaseFirestore.instance
      .collection(AppStrings.passwordCollection)
      .doc(AppStrings.passwordDoc)
      .collection(AppStrings.hardPasswordCollection);


  static CollectionReference kEasyStopwatchRef = FirebaseFirestore.instance
      .collection(AppStrings.stopWatchCollection)
      .doc(AppStrings.stopWatchDoc)
      .collection(AppStrings.easyStopWatchCollection);

  static CollectionReference kMidStopwatchRef = FirebaseFirestore.instance
      .collection(AppStrings.stopWatchCollection)
      .doc(AppStrings.stopWatchDoc)
      .collection(AppStrings.midStopWatchCollection);

  static CollectionReference kHardStopwatchRef = FirebaseFirestore.instance
      .collection(AppStrings.stopWatchCollection)
      .doc(AppStrings.stopWatchDoc)
      .collection(AppStrings.hardStopWatchCollection);

  static CollectionReference kEasyTeamRef = FirebaseFirestore.instance
      .collection(AppStrings.teamCollection)
      .doc(AppStrings.teamDoc)
      .collection(AppStrings.easyTeamCollection);

  static CollectionReference kMidTeamRef = FirebaseFirestore.instance
      .collection(AppStrings.teamCollection)
      .doc(AppStrings.teamDoc)
      .collection(AppStrings.midTeamCollection);

  static CollectionReference kHardTeamRef = FirebaseFirestore.instance
      .collection(AppStrings.teamCollection)
      .doc(AppStrings.teamDoc)
      .collection(AppStrings.hardTeamCollection);


  static CollectionReference kEasyWhoIamRef = FirebaseFirestore.instance
      .collection(AppStrings.whoIamCollection)
      .doc(AppStrings.whoIamDoc)
      .collection(AppStrings.easyWhoIamCollection);

  static CollectionReference kMidWhoIamRef = FirebaseFirestore.instance
      .collection(AppStrings.whoIamCollection)
      .doc(AppStrings.whoIamDoc)
      .collection(AppStrings.midWhoIamCollection);

  static CollectionReference kHardWhoIamRef = FirebaseFirestore.instance
      .collection(AppStrings.whoIamCollection)
      .doc(AppStrings.whoIamDoc)
      .collection(AppStrings.hardWhoIamCollection);


}
