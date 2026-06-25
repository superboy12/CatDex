require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { connectDB } = require('./config/db');
const { syncDB } = require('./models');

// Routes
const authRoutes = require('./routes/authRoutes');

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Connect and Sync DB
connectDB().then(() => {
  syncDB();
});

// Use Routes
app.use('/api/auth', authRoutes);
app.use('/api/cats', require('./routes/catRoutes'));

// Basic route
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to CatDex API' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
