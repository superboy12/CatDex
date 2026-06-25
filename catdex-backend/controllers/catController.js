const { Cat, User } = require('../models');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const axios = require('axios'); // We need axios to call python AI service

// Multer setup for local storage temporarily
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const dir = './uploads/';
    if (!fs.existsSync(dir)) fs.mkdirSync(dir);
    cb(null, dir);
  },
  filename: (req, file, cb) => {
    cb(null, `cat_${Date.now()}${path.extname(file.originalname)}`);
  }
});
const upload = multer({ storage });

const scanCat = async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ message: 'No image uploaded' });
    }

    const imagePath = req.file.path;
    
    // Simulate calling the Python AI Service for Detection & Gen AI
    // In real app: send image to http://localhost:8000/api/detect
    
    // Dummy response for now
    const dummyCat = {
      name: 'Lord Meowington',
      description: 'Menguasai parkiran minimarket sejak 2024.',
      rarity: 'Epic',
      image_url: `http://localhost:5000/${imagePath}`.replace(/\\/g, '/')
    };

    // Save to DB
    const newCat = await Cat.create({
      user_id: req.user.id,
      name: dummyCat.name,
      description: dummyCat.description,
      rarity: dummyCat.rarity,
      image_url: dummyCat.image_url,
      location: req.body.location ? JSON.parse(req.body.location) : null
    });

    res.json({
      message: 'Cat scanned successfully',
      data: newCat
    });

  } catch (error) {
    console.error('Scan Error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

const getCatDex = async (req, res) => {
  try {
    const cats = await Cat.findAll({ where: { user_id: req.user.id } });
    res.json({ cats });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

module.exports = {
  upload,
  scanCat,
  getCatDex
};
