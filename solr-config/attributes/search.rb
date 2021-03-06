default[:search][:staging][:path] = "/opt/solr-5.2.1/server/solr"
default[:search][:staging][:core_name] = "search"
default[:search][:staging][:url] = "jdbc:mysql://dev2.virtualshelf.net:3306/estantevirtual"
default[:search][:staging][:user] = "solr"
default[:search][:staging][:password] = "RCifH0slt7"
default[:search][:staging][:drive] = "com.mysql.jdbc.Driver"

default[:search][:staging][:query] = "SELECT u.cidade, c.rec_id as rec_id, c.user_id as user_id, c.autor, c.titulo, c.idioma, c.editora, c.descr, c.capa, c.tipo, c.estado estado_livro, c.capa, c.peso, c.peso_est, c.preco, DATEDIFF(NOW(), c.data_reg) reg_dias_atras, c.data_reg, u.estado uf, LTRIM_JUNK(lower(u.cidade), 1, 1, 1) cidade, c.estante, c.ano, u.nomeabrev vendedor, u.username, u.ativo usuario_ativo, c.ativo catalogo_ativo, bc.idioma titulo_idioma, cdna.preco_externo preco_externo, cdna.capa_dna capa_dna, br.dna_crc, br.dna_nvends_ativos, cdna.dna_crc FROM catalogo c INNER JOIN usuarios u ON (u.user_id = c.user_id) LEFT JOIN catalogo_dna_nova2 cdna ON ( c.rec_id = cdna.rec_id ) LEFT JOIN booktree_20150525.booktree_radicais br on (cdna.dna_crc = br.radical_crc ) LEFT JOIN booktree_20150525.booktree_crawl bc on (br.radical_id = bc.radical_id ) WHERE c.ativo = 1 AND u.ativo IN (1,11)"
default[:search][:staging][:deltaImportQuery] = "SELECT  u.cidade, c.rec_id, c.user_id, c.autor, c.titulo, c.idioma, c.editora, c.descr, c.capa, c.tipo, c.estado estado_livro, c.capa, c.peso, c.peso_est, c.preco, DATEDIFF(NOW(), c.data_reg) reg_dias_atras, c.data_reg, u.estado uf, LTRIM_JUNK(lower(u.cidade), 1, 1, 1) cidade, c.estante, c.ano, u.nomeabrev, u.username, u.ativo usuario_ativo, c.ativo catalogo_ativo, bc.idioma titulo_idioma, cdna.preco_externo preco_externo, cdna.capa_dna capa_dna,br.dna_crc, br.dna_nvends_ativos FROM catalogo c INNER JOIN usuarios u ON (u.user_id = c.user_id) LEFT JOIN catalogo_dna_nova2 cdna ON ( c.rec_id = cdna.rec_id ) LEFT JOIN booktree_20150525.booktree_radicais br on (cdna.dna_crc = br.radical_crc ) LEFT JOIN booktree_20150525.booktree_crawl bc on (br.radical_id = bc.radical_id ) WHERE c.ativo = 1 AND u.ativo IN (1,11) AND ( c.data_reg &gt; '${dih.last_index_time}' or c.data_alt &gt; '${dih.last_index_time}' )"
default[:search][:staging][:deltaQuery] = "select c.rec_id FROM catalogo c INNER JOIN usuarios u ON (u.user_id = c.user_id) LEFT JOIN catalogo_dna_nova2 cdna ON ( c.rec_id = cdna.rec_id ) LEFT JOIN booktree_20150525.booktree_radicais br on (cdna.dna_crc = br.radical_crc ) LEFT JOIN booktree_20150525.booktree_crawl bc on (br.radical_id = bc.radical_id ) WHERE c.ativo = 1 AND u.ativo IN (1,11) AND c.data_alt > sysdate() - interval 20 MINUTE"


default[:search][:production][:path] = "/opt/solr-5.2.1/server/solr"
default[:search][:production][:core_name] = "search"
default[:search][:production][:url] = "jdbc:mysql://174.143.111.169/estantevirtual"
default[:search][:production][:user] = "solr"
default[:search][:production][:password] = "RCifH0slt7"
default[:search][:production][:drive] = "com.mysql.jdbc.Driver"

default[:search][:production][:query] = "SELECT u.cidade, c.rec_id as rec_id, c.user_id as user_id, c.autor, c.titulo, c.idioma, c.editora, c.descr, c.capa, c.tipo, c.estado estado_livro, c.capa, c.peso, c.peso_est, c.preco, DATEDIFF(NOW(), c.data_reg) reg_dias_atras, c.data_reg, u.estado uf, LTRIM_JUNK(lower(u.cidade), 1, 1, 1) cidade, c.estante, c.ano, u.nomeabrev vendedor, u.username, u.ativo usuario_ativo, c.ativo catalogo_ativo, bc.idioma titulo_idioma, cdna.preco_externo preco_externo, cdna.capa_dna capa_dna, br.dna_crc, br.dna_nvends_ativos, cdna.dna_crc FROM catalogo c INNER JOIN usuarios u ON (u.user_id = c.user_id) LEFT JOIN catalogo_dna_nova2 cdna ON ( c.rec_id = cdna.rec_id ) LEFT JOIN booktree_20150525.booktree_radicais br on (cdna.dna_crc = br.radical_crc ) LEFT JOIN booktree_20150525.booktree_crawl bc on (br.radical_id = bc.radical_id ) WHERE c.ativo = 1 AND u.ativo IN (1,11)"
default[:search][:production][:deltaImportQuery] = "SELECT  u.cidade, c.rec_id, c.user_id, c.autor, c.titulo, c.idioma, c.editora, c.descr, c.capa, c.tipo, c.estado estado_livro, c.capa, c.peso, c.peso_est, c.preco, DATEDIFF(NOW(), c.data_reg) reg_dias_atras, c.data_reg, u.estado uf, LTRIM_JUNK(lower(u.cidade), 1, 1, 1) cidade, c.estante, c.ano, u.nomeabrev, u.username, u.ativo usuario_ativo, c.ativo catalogo_ativo, bc.idioma titulo_idioma, cdna.preco_externo preco_externo, cdna.capa_dna capa_dna,br.dna_crc, br.dna_nvends_ativos FROM catalogo c INNER JOIN usuarios u ON (u.user_id = c.user_id) LEFT JOIN catalogo_dna_nova2 cdna ON ( c.rec_id = cdna.rec_id ) LEFT JOIN booktree_20150525.booktree_radicais br on (cdna.dna_crc = br.radical_crc ) LEFT JOIN booktree_20150525.booktree_crawl bc on (br.radical_id = bc.radical_id ) WHERE c.ativo = 1 AND u.ativo IN (1,11) AND ( c.data_reg &gt; '${dih.last_index_time}' or c.data_alt &gt; '${dih.last_index_time}' )"
default[:search][:production][:deltaQuery] = "select c.rec_id FROM catalogo c INNER JOIN usuarios u ON (u.user_id = c.user_id) LEFT JOIN catalogo_dna_nova2 cdna ON ( c.rec_id = cdna.rec_id ) LEFT JOIN booktree_20150525.booktree_radicais br on (cdna.dna_crc = br.radical_crc ) LEFT JOIN booktree_20150525.booktree_crawl bc on (br.radical_id = bc.radical_id ) WHERE c.ativo = 1 AND u.ativo IN (1,11) AND c.data_alt > sysdate() - interval 20 MINUTE"


default[:logrotate][:rotate] = 2
default[:logrotate][:dateformat] = false # set to '-%Y%m%d' to have date formatted logs
  

