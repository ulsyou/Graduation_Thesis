const mongoose = require("mongoose");

const activitiesSchema = mongoose.Schema({
  activitiesCode: {
    type: String,
    unique: true
  },
  image: {
    type: String,
    required: false,
  },
  activitiesName: {
    type: String,
    required: true,
  },
});

activitiesSchema.pre("save", async function (next) {
  if (!this.activitiesCode) {
    const lastActivity = await this.constructor.findOne(
      {},
      { activitiesCode: 1 },
      { sort: { activitiesCode: -1 } }
    ).exec();

    let newActivitiesCode = "AC0001";
    if (lastActivity && lastActivity.activitiesCode) {
      const lastCodeNumber = parseInt(
        lastActivity.activitiesCode.substring(2),
        10
      );
      newActivitiesCode = `AC${(lastCodeNumber + 1).toString().padStart(4, "0")}`;
    }

    this.activitiesCode = newActivitiesCode;
  }
  next();
});

module.exports = mongoose.model("Activities", activitiesSchema);