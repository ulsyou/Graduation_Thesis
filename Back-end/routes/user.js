const express = require("express");
const mongoose = require("mongoose");
const bcrypt = require("bcrypt");
const router = express.Router();
const User = require("../models/user");
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

    return res.status(200).json({
      message: "Login successful",
      role: user.role,
      id: user._id, 
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

router.post("/create/users", checkAdminRole, async (req, res) => {
  try {
    const { email, password, ...userData } = req.body;

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
    const users = await User.find();
    res.status(200).json(users);
  } catch (err) {
    res.status(500).json({ error: "Error retrieving users" });
  }
});

router.get("/users/:id", checkAdminRole, async (req, res) => {
  try {
    const user = await User.findById(req.params.id);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }
    res.status(200).json(user);
  } catch (err) {
    res.status(500).json({ error: "Error retrieving user" });
  }
});

router.patch("/update/users/:id", checkAdminRole, async (req, res) => {
  try {
    const updatedUser = await User.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    if (!updatedUser) {
      return res.status(404).json({ error: "User not found" });
    }
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
