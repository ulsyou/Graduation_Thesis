const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const connectDB = require("./config/db");

const app = express();
const userRoute = require("./routes/user");
const riceStrainRoute = require("./routes/rice");
const fertilizerRoute = require("./routes/fertilizer");
const diseaseRoute = require("./routes/disease");
const fieldRoute = require("./routes/field-sample");
const pesticideRoute = require("./routes/pesticides");
const cropSeason = require("./routes/crop-season");

// Connect Database
connectDB();

app.use(express.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

// Cấu hình tùy chọn cors
const corsOptions = {
  origin: "http://10.0.2.2:5000", 
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
  credentials: true,
};

app.use(cors(corsOptions));

// Route API
app.use("/user", userRoute);
app.use("/rice-strain", riceStrainRoute);
app.use("/fertilizer", fertilizerRoute);
app.use("/disease", diseaseRoute);
app.use("/field", fieldRoute);
app.use("/pesticide", pesticideRoute);
app.use("/crops-season", cropSeason);

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server running on port ${port}`));
