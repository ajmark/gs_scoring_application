var Sequelize = require('sequelize');
var pg = require('pg').native;
var db_config = require('../../db/db_config.js');

// the application is executed on the local machine ... use postgres
var sequelize = new Sequelize(db_config.database, db_config.username, db_config.password, {
  host: db_config.host,
  port: db_config.port,
  dialect: db_config.dialect,
  native: db_config.native //Heroku Postgress again
});
 
global.db = {
  Sequelize:    Sequelize,
  sequelize:    sequelize,
  User:         sequelize.import(__dirname + '/users'),
  Show:         sequelize.import(__dirname + '/shows'),
  Organization: sequelize.import(__dirname + '/organizations'),
  ShowListing:  sequelize.import(__dirname + '/show_listings'),
  Scorecard:    sequelize.import(__dirname + '/scorecards')
}

global.db.User.hasMany(global.db.Scorecard)
global.db.Show.hasMany(global.db.Scorecard)
global.db.Show.hasMany(global.db.ShowListing)
global.db.Scorecard.belongsTo(global.db.User)
global.db.Scorecard.belongsTo(global.db.Show)
global.db.Organization.hasMany(global.db.ShowListing)
global.db.ShowListing.belongsTo(global.db.Show)
global.db.ShowListing.belongsTo(global.db.Organization)

console.log(global.db);

module.exports = global.db