// Shows Table
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('show', {
    show_id: {type: DataTypes.INTEGER, allowNull: false, unique: true, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
    show_order: {type: DataTypes.INTEGER, allowNull: false},
    description: {type: DataTypes.TEXT},
    competitive: {type: DataTypes.BOOLEAN, allowNull: false},
    doubles: {type: DataTypes.BOOLEAN, allowNull: false},
    year: {type: DataTypes.INTEGER, allowNull: false}
  },
  {
    timestamps: false
  })
}