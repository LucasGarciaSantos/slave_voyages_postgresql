require 'pg'
require 'csv'

def parse(line)
  line_values = []
  
  @sql_parsed_lines = []

  line.keys.each do |column|
    column = line[column.to_sym]
    if column == ' '
      line_values << "NULL"
    elsif column.instance_of?(String) && column.include?("'")
      line_values << "'#{column.gsub("'","''")}'"
    else
      line_values << "'#{column}'"
    end
  end
  @sql_parsed_lines << "(#{line_values.join(",")})"
end

conn = PG.connect(dbname: 'slave_voyages', user: 'postgres')

file = CSV.table('/tmp/tastdb-2010.csv', encoding: 'ISO-8859-1')
file.each do |line|
  parse(line.to_hash)

  sql_string = "INSERT INTO voyages(
  voyageid,
  evgreen,
  shipname,
  national,
  natinimp,
  placcons,
  yrcons,
  placreg,
  yrreg,
  rig,
  tonnage,
  tonmod,
  guns,
  ownera,
  ownerb,
  ownerc,
  ownerd,
  ownere,
  ownerf,
  ownerg,
  ownerh,
  owneri,
  ownerj,
  ownerk,
  ownerl,
  ownerm,
  ownern,
  ownero,
  ownerp,
  fate,
  fate2,
  fate3,
  fate4,
  resistance,
  ptdepimp,
  plac1tra,
  plac2tra,
  plac3tra,
  mjbyptimp,
  npafttra,
  sla1port,
  adpsale1,
  adpsale2,
  mjslptimp,
  portret,
  yearam,
  Date_dep,
  Date_buy,
  Date_leftAfr,
  Date_land1,
  Date_depam,
  Date_end,
  voy1imp,
  voy2imp,
  captaina,
  captainb,
  captainc,
  crew1,
  crew3,
  crewdied,
  slintend,
  ncar13,
  ncar15,
  ncar17,
  tslavesd,
  slaximp,
  slaarriv,
  slas32,
  slas36,
  slas39,
  slamimp,
  menrat7,
  womrat7,
  boyrat7,
  girlrat7,
  malrat7,
  chilrat7,
  jamcaspr,
  vymrtimp,
  vymrtrat,
  sourcea,
  sourceb,
  sourcec,
  sourced,
  sourcee,
  sourcef,
  sourceg,
  sourceh,
  sourcei,
  sourcej,
  sourcek,
  sourcel,
  sourcem,
  sourcen,
  sourceo,
  sourcep,
  sourceq,
  sourcer
  )
  VALUES #{@sql_parsed_lines.join(",")}"

  conn.exec(sql_string)
end