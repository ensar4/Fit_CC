class RoleUtil {
  static var data;

  RoleUtil(readData) {
    data = readData;
  }

  static dynamic getData() {
    return data;
  }

  static void deleteDataFromBox() {
    data = null;
  }

}
