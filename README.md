# Slave Voyages PostgreSQL
O objetivo deste projeto é disponibilizar os dados do site Slave Voyages em formato SQL para ser utilizado com banco de dados PostgreSQL.

## Descrição
Utilizamos o arquivo [CSV](https://www.slavevoyages.org/documents/download/tastdb-2010.csv) para popular a base de dados. 
Para compreender os valores de cada coluna é necessário consultar a [descrição do projeto Slave Voyages] (https://www.slavevoyages.org/voyage/about#methodology/introduction/0/pt/) e consultar o arquivo [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf) que contém as especificação e os valores possiveis de cada coluna.

Através do [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf) criamos tabelas para normalizar o banco de dados, utilizando diversas tabelas ligadas por chaves estrangeiras.

O arquivo tables.sql contém as estruturas das tabelas e as iformações do [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf)
O arquivo voyages.sql contém os dados do arquivo [CSV](https://www.slavevoyages.org/documents/download/tastdb-2010.csv).

### Lista de tabelas existentes:

- african_resistance
- broad_regions
- country_ship_registered_national
- imputed_country_ship_registered_natinimp
- imputed_outcome_voyage_fate2
- imputed_outcome_voyage_fate3
- imputed_outcome_voyage_fate4
- particular_outcome_voyage_fate
- places
- rig_vessel_rig
- specific_regions
- ton_in_tonnage_tontype
- voyage_groupings_xmimpflag
- voyages

Para as tabelas que referenciam apenas uma coluna o padrão de nomenclatura é nome_tabela_coluna.
Por exemplo, a tabela imputed_outcome_voyage_fate2 representa a coluna fate2 no [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf).

### Tabelas:

- country_ship_registered_**national**
- imputed_country_ship_registered_**natinimp**
- imputed_outcome_voyage_**fate2**
- imputed_outcome_voyage_**fate3**
- imputed_outcome_voyage_**fate4**
- particular_outcome_voyage_**fate**
- rig_vessel_**rig**
- ton_in_tonnage_**tontype**
- voyage_groupings_**xmimpflag**

Para as tabelas que não seguem esse padrão, significa que seus valores representam mais de uma coluna

### Tabelas: 

- places
- broad_regions
- specific_regions

A tabela voyages contem todas as informações do arquivo CSV original.
As demais tabelas possuem os códigos(IDs) referenciados pela tabela voyages. 
Todos os códigos estão referenciados no arquivo [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf)

## Próximos passos:

- Entender as inconsistências encontradas:
Identificamos alguns códigos no arquivo CSV que não constam no [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf).
Existem 25 incosistencias na tabela places. São identificadas através da coluna label com a string "Unknown"
Existe uma entrada na tabela rig_vessel_rig também idendificada através da coluna label com a string "Unknown"

- Utilizar o arquivo PSPP para contruir o banco de dados.
- Testar os scripts SQL em outros bancos como MySQL.

## Como utilizar?

Disponibilizamos 3 arquivos:

1. Arquivos tables.sql
2. Arquivo voyages.sql
3. Arquivo import_csv_to_postgresql.rb
4. Arquivo de backup(dump)

Os arquivos tables.sql e voyages.sql são scripts SQL.
Podem ser executados diretamente no terminal do PostgreSQL

Exemplo:

`psql -d nome_do_banco -U usuario -f tables.sql`

Primeiro executa o SQL tables.sql, em seguida o arquivo voyages.sql.
Com esses passos as tabelas que referenciam o [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf) serão criadas e populadas com as informações.
A tabela voyages terá apenas sua estrutura criada. 
Para popular a tabela voyages será necessário executar o script ruby import_csv_to_postgresql.rb

```ruby import_csv_to_postgresql.rb```

Dessa forma a tabela voyages será populada com todas as informações do CSV, serão inseridas 34.500 registros.

Outra forma é utilizar apenas o arquivo de dump. Dessa forma os passos anteriores são desnecessários.

```pg_restore nome_do_banco -U postgresql -f dump_slave_voyages```
