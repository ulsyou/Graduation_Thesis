const mongoose = require("mongoose");

const fieldSampleSchema = mongoose.Schema({
    fieldCode: {
        type: String,
        unique: true,
        required: false,
    },
    image: {
        type: String,
        required: false,
      },
    area: {
        type: String,
        required: true,
    },
    latitude: {
        type: String,
        required: true,
    },
    longitude: {
        type: String,
        required: true,
    },
    province: {
        type: String,
        required: true,
    },
    owner: {
        type: String,
        required: true,
    },
    classification: {
        type: String,
        enum: [
            "Đất phù sa ven sông",
            "Đất phù sa xa sông",
            "Đất nhiễm mặn",
            "Đất nhiễm phèn",
            "Đất nhiễm mặn + phèn",
        ],
        required: true,
    },
});

fieldSampleSchema.pre("save", async function (next) {
    if (!this.fieldCode) {
        const lastFieldSample = await this.constructor.findOne(
            {},
            { fieldCode: 1 },
            { sort: { fieldCode: -1 } }
        ).exec();

        let newFieldCode = "RF00001";
        if (lastFieldSample && lastFieldSample.fieldCode) {
            const lastCodeNumber = parseInt(
                lastFieldSample.fieldCode.substring(2),
                10
            );
            newFieldCode = `RF${(lastCodeNumber + 1).toString().padStart(5, "0")}`;
        }

        this.fieldCode = newFieldCode;
    }
    next();
});

module.exports = mongoose.model("FieldSample", fieldSampleSchema);
