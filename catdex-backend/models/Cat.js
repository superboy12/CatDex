const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const User = require('./User');

const Cat = sequelize.define('Cat', {
  id: {
    type: DataTypes.UUID,
    defaultValue: DataTypes.UUIDV4,
    primaryKey: true,
  },
  user_id: {
    type: DataTypes.UUID,
    allowNull: false,
    references: {
      model: User,
      key: 'id'
    }
  },
  name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  description: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  rarity: {
    type: DataTypes.ENUM('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary'),
    defaultValue: 'Common',
  },
  image_url: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  location: {
    type: DataTypes.JSON, 
    allowNull: true,
  }
}, {
  timestamps: true,
  createdAt: 'created_at',
  updatedAt: false,
});

Cat.belongsTo(User, { foreignKey: 'user_id' });
User.hasMany(Cat, { foreignKey: 'user_id' });

module.exports = Cat;
