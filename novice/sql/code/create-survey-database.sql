-- This is an example database, these commands will clean up any experimental work
-- Caution this will delete any data that already exists
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Site;
DROP TABLE IF EXISTS Visited;
DROP TABLE IF EXISTS Survey;


--Create the tables

-- The `Person` table is used to explain the most basic queries.
-- Note that `danforth` has no measurements.
create table Person(
	ident    text,
	personal text,
	family	 text
);

-- The `Site` table is equally simple.  Use it to explain the
-- difference between databases and spreadsheets: in a spreadsheet,
-- the lat/long of measurements would probably be duplicated.
create table Site(
	name text,
	lat  real,
	long real
);

-- `Visited` is an enhanced `join` table: it connects to the lat/long
-- of specific measurements, and also provides their dates.
-- Note that #752 is missing a date; we use this to talk about NULL.
create table Visited(
	ident integer,
	site  text,
	dated text
);

-- The `Survey` table is the actual readings.  Join it with `Site` to
-- get lat/long, and with `Visited` to get dates (except for #752).
-- Note that Roerich's salinity measurements are an order of magnitude
-- too large (use this to talk about data cleanup).  Note also that
-- there are two cases where we don't know who took the measurement,
-- and that in most cases we don't have an entry (null or not) for the
-- temperature.
create table Survey(
	taken   integer,
	person  text,
	quant   text,
	reading real
);

-- Load the data
-- The Person table is populated using INSERT statements
insert into Person values('dyer',     'William',   'Dyer');
insert into Person values('pb',       'Frank',     'Pabodie');
insert into Person values('lake',     'Anderson',  'Lake');
insert into Person values('roe',      'Valentina', 'Roerich');
insert into Person values('danforth', 'Frank',     'Danforth');


-- The other tables are populated by importing the data from .csv files.
.separator ","
.import data/Site.csv Site
.import data/Visited.csv Visited
.import data/Survey.csv Survey
