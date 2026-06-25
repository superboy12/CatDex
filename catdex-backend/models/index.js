const { sequelize } = require('../config/db');
const User = require('./User');
const Cat = require('./Cat');
const Achievement = require('./Achievement');

const syncDB = async () => {
  try {
    await sequelize.sync({ alter: true });
    console.log('Database Synced Successfully.');
  } catch (error) {
    console.error('Error syncing database:', error);
  }
};

module.exports = {
  sequelize,
  User,
  Cat,
  Achievement,
  syncDB,
};
