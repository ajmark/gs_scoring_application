// ShowListings Table
module.exports = function(sequelize, DataTypes) {
  return sequelize.define("ShowListing", {
    show_id: {type: DataTypes.INTEGER, allowNull: false, primaryKey: true, references: "Shows", referencesKey: "show_id"},
    organization_id: {type: DataTypes.INTEGER, allowNull: false, primaryKey: true, references: "Organizations", referencesKey: "organization_id"}
  })
}