const { ObjectId } = require("mongodb");
const mongoose = require("mongoose");

const cropSeasonSchema = mongoose.Schema({
    cropSeasonCode: {
        type: String,
        unique: true,
        required: false
    },
    cropSeasonName: {
        type: String,
        required: true
    },
    riceVariety: {
        type: String,
        ref: "strainName",
        required: true
      },
      fieldSample: {
        type: String, 
        ref: "fieldCode",
        required: true
      },
    seasonType: {
        type: String,
        enum: ["Đông xuân", "Hè thu", "Vụ mùa"],
        required: true
    },
    yield: {
        type: String
    },
    plantingDate: {
        type: Date
    },
    harvestDate: {
        type: Date
    }
});

cropSeasonSchema.pre("save", async function (next) {
    if (!this.cropSeasonCode) {
        const lastSeason = await this.constructor.findOne(
            {},
            { cropSeasonCode: 1 },
            { sort: { cropSeasonCode: -1 } }
        ).exec();

        let newSeasonCode = "RC00001";
        if (lastSeason && lastSeason.cropSeasonCode) {
            const lastCodeNumber = parseInt(
                lastSeason.cropSeasonCode.substring(2),
                10
            );
            newSeasonCode = `RC${(lastCodeNumber + 1).toString().padStart(5, "0")}`;
        }

        this.cropSeasonCode = newSeasonCode;
    }
    next();
});

module.exports = mongoose.model("CropSeason", cropSeasonSchema);
