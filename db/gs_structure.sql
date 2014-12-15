-- 
-- TABLE STRUCTURE FOR GS_SCORING SYSTEM
--

CREATE TABLE users (
user_id SERIAL PRIMARY KEY NOT NULL,
username CHARACTER VARYING(255) UNIQUE NOT NULL,
first_name CHARACTER VARYING(255) NOT NULL,
last_name CHARACTER VARYING(255) NOT NULL,
role CHARACTER VARYING(255) NOT NULL DEFAULT 'judge'::CHARACTER VARYING(255),
password CHARACTER VARYING(255) NOT NULL,
active BOOLEAN NOT NULL DEFAULT true,
CONSTRAINT check_first_name CHECK (first_name ~* '^[a-z]+$'),
CONSTRAINT check_last_name CHECK (last_name ~* '^([a-z]|\s)+$'),
CONSTRAINT check_role CHECK (role ~* '^(judge|admin)$'));

CREATE TABLE shows (
show_id SERIAL PRIMARY KEY NOT NULL,
name CHARACTER VARYING(255) NOT NULL,
show_order INTEGER NOT NULL,
description TEXT,
competitive BOOLEAN NOT NULL,
doubles BOOLEAN NOT NULL,
year INTEGER);

CREATE TABLE organizations (
organization_id SERIAL PRIMARY KEY NOT NULL,
name CHARACTER VARYING(255) NOT NULL,
franternity BOOLEAN NOT NULL);

CREATE TABLE scorecards (
scorecard_id SERIAL PRIMARY KEY NOT NULL,
show_id INTEGER NOT NULL,
user_id INTEGER NOT NULL,
set_aesthetics INTEGER DEFAULT 0,
set_interaction INTEGER DEFAULT 0,
costumes INTEGER DEFAULT 0,
vocals INTEGER DEFAULT 0,
band INTEGER DEFAULT 0,
featured INTEGER DEFAULT 0,
energy INTEGER DEFAULT 0,
entertainment_value INTEGER DEFAULT 0,
philanthropy_points INTEGER DEFAULT 0,
followable INTEGER DEFAULT 0,
script_quality INTEGER DEFAULT 0,
acting INTEGER DEFAULT 0,
variety INTEGER DEFAULT 0,
execution INTEGER DEFAULT 0,
opening BOOLEAN DEFAULT false,
scene_transitions BOOLEAN DEFAULT false,
plot BOOLEAN DEFAULT false,
song_dialogue_flow BOOLEAN DEFAULT false,
pacing BOOLEAN DEFAULT false,
band_singer_syncronization BOOLEAN DEFAULT false,
characters_established BOOLEAN DEFAULT false,
enunciation BOOLEAN DEFAULT false,
set_move_at_end BOOLEAN DEFAULT false,
CONSTRAINT user_scorecard_fkey FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT show_scorecard_fkey FOREIGN KEY (show_id) REFERENCES shows (show_id) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE show_listings (
show_id INTEGER NOT NULL,
organization_id INTEGER NOT NULL,
PRIMARY KEY (show_id, organization_id),
CONSTRAINT show_listing_fk FOREIGN KEY (show_id) REFERENCES shows (show_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT organization_listing_fk FOREIGN KEY (organization_id) REFERENCES organizations (organization_id) ON DELETE RESTRICT ON UPDATE CASCADE);

