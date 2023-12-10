const mongoose = require("mongoose");

const pesticideSchema = mongoose.Schema({
    pesticideCode: {
        type: String,
        unique: true,
        required: false,
    },
    pesticideName: {
        type: String,
        required: true
    },
    supplier: {
        type: String,
        required: true
    },
    ingredients: {
        type: String,
        required: true
    },
    function: {
        type: String,
        required: true
    },
    usageInstructions: {
        type: String,
        required: true
    },
    image: {
        type: String,
        required: false
    },
    treatingDiseases: {
    type: [String],
    enum: [
        "Bệnh khô vằn",
        "Rầy nâu",
        "Sâu đục thân",
        "Sâu cuốn lá",
        "Lùn xoắn là",
        "Bệnh đạo ôn",
        "Bệnh đốm nâu",
    ],
    required: true,
    }
});

pesticideSchema.pre("save", async function (next) {
    if (!this.pesticideCode) {
        const lastPesticide = await this.constructor.findOne(
            {},
            { pesticideCode: 1 },
            { sort: { pesticideCode: -1 } }
        ).exec();

        let newPesticideCode = "PE00001";
        if (lastPesticide && lastPesticide.pesticideCode) {
            const lastCodeNumber = parseInt(
                lastPesticide.pesticideCode.substring(2),
                10
            );
            newPesticideCode = `PE${(lastCodeNumber + 1).toString().padStart(5, "0")}`;
        }

        this.pesticideCode = newPesticideCode;
    }
    next();
});

module.exports = mongoose.model("Pesticide", pesticideSchema);
