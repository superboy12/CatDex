const { DataTypes } = require('sequelize');
const { sequelize } = require('../config/db');
const User = require('./User');

const Achievement = sequelize.define('Achievement', {
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
  achievement_name: {
    type: DataTypes.STRING,
    allowNull: false,
  }
}, {
  timestamps: true,
  createdAt: 'unlocked_at',
  updatedAt: false,
});

Achievement.belongsTo(User, { foreignKey: 'user_id' });
User.hasMany(Achievement, { foreignKey: 'user_id' });

module.exports = Achievement;
