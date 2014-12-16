// ShowListings Table
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('showlisting', {
    show_id: {type: DataTypes.INTEGER, allowNull: false, primaryKey: true, references: 'shows', referencesKey: "show_id"},
    organization_id: {type: DataTypes.INTEGER, allowNull: false, primaryKey: true, references: 'organizations', referencesKey: "organization_id"}
  },
  {
    timestamps: false
  })
}