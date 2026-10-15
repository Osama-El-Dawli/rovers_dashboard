String handleGradeName({required int grade}) {
  switch (grade) {
    case 1:
      return 'الأولى';
    case 2:
      return 'الثانية';
    case 3:
      return 'الثالثة';
    case 4:
      return 'الرابعة';
    default:
      return '';
  }
}
