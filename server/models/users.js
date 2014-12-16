// Users Table
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user', {
    user_id: {type: DataTypes.INTEGER, allowNull: false, unique: true, primaryKey: true, autoIncrement: true },
    first_name: {type: DataTypes.STRING, allowNull: false, validate: {is: ["^[a-z]+$",'i']}},
    last_name: {type: DataTypes.STRING, allowNull: false, validate: {is: ["^[a-z]+$",'i']}},
    username: {type: DataTypes.STRING, unique: true, allowNull: false},
    role: {type: DataTypes.STRING, allowNull: false, validate: {isIn: [['judge', 'admin']]}},
    password_digest: {type: DataTypes.STRING, allowNull: false},
    active: {type: DataTypes.BOOLEAN, defaultValue: true}
  },
  {
    timestamps: false
  })
}