# Slave Voyages PostgreSQL
O objetivo deste projeto é disponibilizar os dados do site Slave Voyages em formato SQL para ser utilizado com banco de dados PostgreSQL.

## Descrição
Utilizamos o arquivo [CSV](https://www.slavevoyages.org/documents/download/tastdb-2010.csv) para inserir os registros na base de dados. 
Para compreender os valores de cada coluna é necessário consultar a [descrição do projeto Slave Voyages](https://www.slavevoyages.org/voyage/about#methodology/introduction/0/pt/) e  o arquivo [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf) que contém as especificações e os valores possíveis de cada coluna.

Através do [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf) criamos tabelas para normalizar o banco de dados, utilizando diversas tabelas ligadas por chaves estrangeiras. 

O arquivo tables.sql contém as estruturas das tabelas e as informações do [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf).<br /> 
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

Para as tabelas que referenciam apenas uma coluna no [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf), o padrão de nomenclatura é nome_tabela_coluna. <br />
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

Para as tabelas que não seguem esse padrão, significa que seus valores representam mais de uma coluna no [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf).

### Tabelas: 

- places
- broad_regions
- specific_regions

A tabela voyages contém todas as informações do arquivo CSV original. <br />
As demais tabelas possuem os códigos(IDs) referenciados pela tabela voyages. <br /> 
Todos os códigos estão referenciados no arquivo [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf)

## Como utilizar?

### 1 - Através do arquivo de DUMP
Utilizando o arquivo de **dump_slave_voyages**, basta executar o comando pg_restore em um banco PostgreSQL.<br />
Este dump é completo, possui todas as informações presentes nos arquivos SQL do projeto.
Exemplo:

`pg_restore -U nome_do_usuario -d nome_do_banco dump_slave_voyages`

### 2 - Através dos scripts SQL
Disponibilizamos 3 arquivos:

1. Arquivos tables.sql
2. Arquivo voyages.sql
3. Arquivo import_csv_to_postgresql.rb

Os arquivos tables.sql e voyages.sql são scripts SQL. <br />
Podem ser executados diretamente no terminal do PostgreSQL

Exemplo:

`psql -d nome_do_banco -U usuario -f tables.sql`

Primeiro execute o SQL tables.sql, em seguida o arquivo voyages.sql.<br />
Com esses passos as tabelas que referenciam o [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf) serão criadas e as informações inseridas. <br />
Para a tabela voyages será criada apenas sua estrutura. <br /> 
Para inserir os regitros na tabela voyages, execute o script ruby import_csv_to_postgresql.rb

`ruby import_csv_to_postgresql.rb`

Dessa forma a tabela voyages deve ter todas as informações do CSV, serão inseridos 34.941 registros.

## Próximos passos:

- Entender as inconsistências encontradas:
Identificamos alguns códigos no arquivo CSV que não constam no [Codebook](https://www.slavevoyages.org/documents/download/Codebook2013_5-3_final.pdf).
Existem 25 inconsistências na tabela places. São identificadas através da coluna label com a string "Unknown"
Existe uma entrada na tabela rig_vessel_rig também idendificada através da coluna label com a string "Unknown"

- Utilizar o arquivo PSPP para construir o banco de dados.
- Testar os scripts SQL em outros bancos como MySQL.
