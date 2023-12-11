const express = require("express");
const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const router = express.Router();
const User = require("../models/user");
const upload = require('../config/upload');
const { checkAdminRole } = require("../middleware/authMiddleware");

router.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });

    if (!user) {
      return res.status(401).json({ message: "Email or password incorrect" });
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: "Email or password incorrect" });
    }

    const userObject = user.toObject();
    delete userObject.password;

    return res.status(200).json({
      message: "Login successful",
      role: user.role,
      user: userObject,
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.post("/create/users", checkAdminRole, upload.single('image'), async (req, res) => {
  try {
    const { email, password, ...userData } = req.body;

    if (req.file) {
      userData.image = req.file.filename;
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = new User({
      _id: new mongoose.Types.ObjectId(),
      email,
      password: hashedPassword,
      ...userData,
    });

    const savedUser = await newUser.save();
    res.status(201).json(savedUser);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.get("/users", checkAdminRole, async (req, res) => {
  try {
    let Users = await User.find();
    Users = Users.map(User => {
        User = User.toObject();
        if (User.image) {
            User.image = `${req.protocol}://${req.get('host')}/uploads/${User.image}`;
        }
        return User;
    });
    res.json(Users);
} catch (err) {
    handleErrors(res, err);
}
});

router.get("/users/:id", checkAdminRole, async (req, res) => {
  if (res.User.image) {
    res.User.image = `${req.protocol}://${req.get('host')}/uploads/${res.User.image}`;
}
res.json(res.User);
});

router.patch("/update/users/:id", checkAdminRole, upload.single('image'), async (req, res) => {
  try {
    let userData = await User.findById(req.params.id);
    if (!userData) {
      return res.status(404).json({ error: "User not found" });
    }

    if (req.file) {
      userData.image = req.file.filename;
    }

    for (let prop in req.body) userData[prop] = req.body[prop];

    const updatedUser = await userData.save();
    res.status(200).json(updatedUser);
  } catch (err) {
    res.status(500).json({ error: "Error updating user" });
  }
});

router.delete("/delete/users/:id", checkAdminRole, async (req, res) => {
  try {
    const deletedUser = await User.findByIdAndRemove(req.params.id);
    if (!deletedUser) {
      return res.status(404).json({ error: "User not found" });
    }
    return res.status(200).json({ message: "User deleted successfully" });
  } catch (err) {
    res.status(500).json({ error: "Error deleting user" });
  }
});

module.exports = router;
