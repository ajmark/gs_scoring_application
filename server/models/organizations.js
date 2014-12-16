// Organizations Table
module.exports = function(sequelize, DataTypes) {
  return sequelize.define("Organization", {
    organization_id: {type: DataTypes.INTEGER, allowNull: false, unique: true, primaryKey: true, autoIncrement: true },
    fraternity: {type: DataTypes.BOOLEAN, allowNull: false},
    name: {type:DataTypes.STRING, allowNull: false}
  })
}