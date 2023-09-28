const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  image: {
    type: {
      url: String,
    },
    required: false,
  },
  employeeCode: {
    type: String,
    unique: true,
    required: false,
  },
  fullName: {
    type: String,
    required: true,
  },
  phoneNumber: {
    type: String,
    required: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
    match: /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/,
  },
  password: {
    type: String,
    required: true,
  },
  expertise: {
    type: String,
    required: true,
  },
  role: {
    type: String,
    enum: ["Quản trị viên", "Chuyên gia", "Nhân viên"],
    required: true,
  },
});

userSchema.pre("save", async function (next) {
  if (!this.employeeCode) {
    const lastEmployee = await this.constructor.findOne(
      {},
      { employeeCode: 1 },
      { sort: { employeeCode: -1 } }
    ).exec();

    let newEmployeeCode = "RC0001";
    if (lastEmployee && lastEmployee.employeeCode) {
      const lastCodeNumber = parseInt(
        lastEmployee.employeeCode.substring(2),
        10
      );
      newEmployeeCode = `RC${(lastCodeNumber + 1).toString().padStart(4, "0")}`;
    }

    this.employeeCode = newEmployeeCode;
  }
  next();
});

module.exports = mongoose.model("User", userSchema);
