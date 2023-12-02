const mongoose = require("mongoose");

const fertilizerSchema = mongoose.Schema({
    image: {
        type: String,
        required: false,
    },
    fertilizerCode: {
        type: String,
        unique: true,
        required: false,
    },
    fertilizerName: {
        type: String,
        required: true,
    },
    supplier: {
        type: String,
        required: true,
    },
    instructions: {
        type: String,
        required: true,
    },
    usage: {
        type: String,
        required: true,
    },
    nutrients: {
        kali: { type: Number, required: true },
        nitro: { type: Number, required: true },
        phosphate: { type: Number, required: true },
        others: { type: Number, required: true },
    },
});

fertilizerSchema.pre("save", async function (next) {
    if (!this.fertilizerCode) {
        const lastFertilizer = await this.constructor.findOne(
            {},
            { fertilizerCode: 1 },
            { sort: { fertilizerCode: -1 } }
        ).exec();

        let newFertilizerCode = "FS00001";
        if (lastFertilizer && lastFertilizer.fertilizerCode) {
            const lastCodeNumber = parseInt(
                lastFertilizer.fertilizerCode.substring(2),
                10
            );
            newFertilizerCode = `FS${(lastCodeNumber + 1).toString().padStart(5, "0")}`;
        }

        this.fertilizerCode = newFertilizerCode;
    }
    next();
});

module.exports = mongoose.model("Fertilizer", fertilizerSchema);
