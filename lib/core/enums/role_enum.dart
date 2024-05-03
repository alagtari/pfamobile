enum UserRole { citizen, driver, admin }

// Function to convert string to enum
UserRole getUserRoleFromString(String role) {
  switch (role) {
    case "citizen":
      return UserRole.citizen;
    case "driver":
      return UserRole.driver;
    default:
      return UserRole.admin;
  }
}
