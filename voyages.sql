BEGIN;
CREATE TABLE voyages(
  id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  voyageid INTEGER,
  evgreen INTEGER,
  shipname VARCHAR,
  national INTEGER REFERENCES country_ship_registered_national(national),
  natinimp INTEGER REFERENCES imputed_country_ship_registered_natinimp(natinimp),
  placcons INTEGER REFERENCES places(id),
  yrcons INTEGER,
  placreg INTEGER REFERENCES places(id),
  yrreg INTEGER,
  rig INTEGER REFERENCES rig_vessel_rig(rig),
  tonnage DECIMAL,
  tonmod DECIMAL,
  guns INTEGER,
  ownera VARCHAR,
  ownerb VARCHAR,
  ownerc VARCHAR,
  ownerd VARCHAR,
  ownere VARCHAR,
  ownerf VARCHAR,
  ownerg VARCHAR,
  ownerh VARCHAR,
  owneri VARCHAR,
  ownerj VARCHAR,
  ownerk VARCHAR,
  ownerl VARCHAR,
  ownerm VARCHAR,
  ownern VARCHAR,
  ownero VARCHAR,
  ownerp VARCHAR,
  fate INTEGER REFERENCES particular_outcome_voyage_fate(fate),
  fate2 INTEGER REFERENCES imputed_outcome_voyage_fate2(fate2),
  fate3 INTEGER REFERENCES imputed_outcome_voyage_fate3(fate3),
  fate4 INTEGER REFERENCES imputed_outcome_voyage_fate4(fate4),
  resistance INTEGER REFERENCES african_resistance(resistance),
  ptdepimp INTEGER REFERENCES places(id),
  plac1tra INTEGER REFERENCES places(id),
  plac2tra INTEGER REFERENCES places(id),
  plac3tra INTEGER REFERENCES places(id),
  mjbyptimp INTEGER REFERENCES places(id),
  npafttra  INTEGER REFERENCES places(id),
  sla1port INTEGER REFERENCES places(id),
  adpsale1 INTEGER REFERENCES places(id),
  adpsale2 INTEGER REFERENCES places(id),
  mjslptimp INTEGER REFERENCES places(id),
  portret INTEGER REFERENCES places(id),
  yearam INTEGER,
  Date_dep DATE,
  Date_buy DATE,
  Date_leftAfr DATE,
  Date_land1 DATE,
  Date_depam DATE,
  Date_end DATE,
  voy1imp DECIMAL,
  voy2imp DECIMAL,
  captaina VARCHAR,
  captainb VARCHAR,
  captainc VARCHAR,
  crew1 DECIMAL,
  crew3 DECIMAL,
  crewdied DECIMAL,
  slintend DECIMAL,
  ncar13 DECIMAL,
  ncar15 DECIMAL,
  ncar17 DECIMAL,
  tslavesd DECIMAL,
  slaximp DECIMAL,
  slaarriv DECIMAL,
  slas32 DECIMAL,
  slas36 DECIMAL,
  slas39 DECIMAL,
  slamimp DECIMAL,
  menrat7 DECIMAL, 
  womrat7 DECIMAL,
  boyrat7 DECIMAL,
  girlrat7 DECIMAL,
  malrat7 DECIMAL,
  chilrat7 DECIMAL,
  jamcaspr DECIMAL,
  vymrtimp DECIMAL,
  vymrtrat DECIMAL,
  sourcea VARCHAR,
  sourceb VARCHAR,
  sourcec VARCHAR,
  sourced VARCHAR,
  sourcee VARCHAR,
  sourcef VARCHAR,
  sourceg VARCHAR,
  sourceh VARCHAR,
  sourcei VARCHAR,
  sourcej VARCHAR,
  sourcek VARCHAR,
  sourcel VARCHAR,
  sourcem VARCHAR,
  sourcen VARCHAR,
  sourceo VARCHAR,
  sourcep VARCHAR,
  sourceq VARCHAR,
  sourcer VARCHAR
);
COMMIT;