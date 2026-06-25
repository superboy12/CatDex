const express = require('express');
const router = express.Router();
const { upload, scanCat, getCatDex } = require('../controllers/catController');
const { protect } = require('../middlewares/authMiddleware');

router.post('/scan', protect, upload.single('image'), scanCat);
router.get('/', protect, getCatDex);

module.exports = router;
