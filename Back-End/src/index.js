require("dotenv").config();
const express = require("express");
const cors = require("cors");
const route = require("./routes/main.js");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
// Routes
route(app);

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server is running at http://localhost:${PORT}`);
});
