// lib/features/home/presentation/widgets/club_image_mapper.dart
String getClubImagePath(int clubId) {
  switch (clubId) {
    case 1:
      return 'assets/images/club1.png';
    case 2:
      return 'assets/images/chess_club.png';
    case 3:
      return 'assets/images/club3.png';
    // Añade más casos según tu lista...
    default:
      return 'assets/images/club_default.png';
  }
}
