// Scorecards Table
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('scorecard', {
    scorecard_id: {type: DataTypes.INTEGER, allowNull: false, unique: true, primaryKey: true, autoIncrement: true },
    set_aesthetics: {type: DataTypes.INTEGER, defaultValue: 0},
    set_interaction: {type: DataTypes.INTEGER, defaultValue: 0},
    costumes: {type: DataTypes.INTEGER, defaultValue: 0},
    vocals: {type: DataTypes.INTEGER, defaultValue: 0},
    band: {type: DataTypes.INTEGER, defaultValue: 0},
    featured: {type: DataTypes.INTEGER, defaultValue: 0},
    energy: {type: DataTypes.INTEGER, defaultValue: 0},
    entertainment_value: {type: DataTypes.INTEGER, defaultValue: 0},
    philanthropy_points: {type: DataTypes.INTEGER, defaultValue: 0},
    followable: {type: DataTypes.INTEGER, defaultValue: 0},
    script_quality: {type: DataTypes.INTEGER, defaultValue: 0},
    acting: {type: DataTypes.INTEGER, defaultValue: 0},
    variety: {type: DataTypes.INTEGER, defaultValue: 0},
    execution: {type: DataTypes.INTEGER, defaultValue: 0},
    opening: {type: DataTypes.BOOLEAN, defaultValue: false},
    scene_transitions: {type: DataTypes.BOOLEAN, defaultValue: false},
    plot: {type: DataTypes.BOOLEAN, defaultValue: false},
    song_dialogue_flow: {type: DataTypes.BOOLEAN, defaultValue: false},
    pacing: {type: DataTypes.BOOLEAN, defaultValue: false},
    band_singer_syncronization: {type: DataTypes.BOOLEAN, defaultValue: false},
    characters_established: {type: DataTypes.BOOLEAN, defaultValue: false},
    enunciation: {type: DataTypes.BOOLEAN, defaultValue: false},
    set_move_at_end: {type: DataTypes.BOOLEAN, defaultValue: false},
    show_id: {type: DataTypes.INTEGER, allowNull: false, references: 'shows', referencesKey: "show_id"},
    user_id: {type: DataTypes.INTEGER, allowNull: false, references: 'users', referencesKey: "user_id"}
  })
}