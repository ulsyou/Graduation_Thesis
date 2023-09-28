const mongoose = require("mongoose");

const riceStrainSchema = mongoose.Schema({
  image: {
    type: String,
    required: false,
  },
  strainCode: {
    type: String,
    unique: true,
    required: false,
  },
  strainName: {
    type: String,
    required: true,
  },
  supplier: {
    type: String,
    required: true,
  },
  characteristics: {
    type: String,
    required: true,
  },
});

riceStrainSchema.pre("save", async function (next) {
  if (!this.strainCode) {
    const lastStrain = await this.constructor.findOne(
      {},
      { strainCode: 1 },
      { sort: { strainCode: -1 } }
    ).exec();

    let newStrainCode = "RS00001";
    if (lastStrain && lastStrain.strainCode) {
      const lastCodeNumber = parseInt(
        lastStrain.strainCode.substring(2),
        10
      );
      newStrainCode = `RS${(lastCodeNumber + 1).toString().padStart(5, "0")}`;
    }

    this.strainCode = newStrainCode;
  }
  next();
});

module.exports = mongoose.model("RiceStrain", riceStrainSchema);
