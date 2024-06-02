enum UserRole { citizen, driver, admin }

// Function to convert string to enum
UserRole getUserRoleFromString(String role) {
  switch (role) {
    case "citizen":
      return UserRole.citizen;
    case 'driver':
      return UserRole.driver;
    default:
      return UserRole.admin;
  }
}

// Function to convert enum to string
String getUserRoleToString(UserRole role) {
  switch (role) {
    case UserRole.citizen:
      return "citizen";
    case UserRole.driver:
      return 'driver';
    default:
      return 'admin';
  }
}
