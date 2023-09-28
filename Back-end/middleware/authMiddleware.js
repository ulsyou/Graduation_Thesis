function checkAdminRole(req, res, next) {
    const authenticatedUserRole = "Quản trị viên"; 
  
    if (authenticatedUserRole !== "Quản trị viên") {
      return res.status(403).json({ error: "Permission denied. Only administrators are allowed." });
    }
    next();
  }
  
  module.exports = { checkAdminRole };
  