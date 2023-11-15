const mongoose = require("mongoose");

const diseaseSchema = mongoose.Schema({
  image: {
    type: String,
    required: false,
  },
  diseaseCode: {
    type: String,
    unique: true,
    required: false,
  },
  diseaseName: {
    type: String,
    required: true,
  },
  harm: {
    type: String,
    required: true,
  },
  environment: {
    type: String,
    required: true,
  },
  time: {
    type: String,
    required: true,
  },
  classification: {
    type: String,
    enum: ["Côn trùng", "Dịch bệnh", "Nấm hại", "Sâu bệnh"],
    required: true,
  },
});

diseaseSchema.pre("save", async function (next) {
  if (!this.diseaseCode) {
    const lastDisease = await this.constructor
      .findOne({}, { diseaseCode: 1 }, { sort: { diseaseCode: -1 } })
      .exec();

    let newDiseaseCode = "DT00001";
    if (lastDisease && lastDisease.diseaseCode) {
      const lastCodeNumber = parseInt(
        lastDisease.diseaseCode.substring(2),
        10
      );
      newDiseaseCode = `DT${(lastCodeNumber + 1).toString().padStart(5, "0")}`;
    }

    this.diseaseCode = newDiseaseCode;
  }
  next();
});

module.exports = mongoose.model("Disease", diseaseSchema);
