default[:praga][:staging][:core_name] = "praga"
default[:praga][:staging][:deltaImportQuery] = ""
default[:praga][:staging][:deltaQuery] = ""
default[:praga][:staging][:url] = "jdbc:mysql://dev.virtualshelf.net/estantevirtual"
default[:praga][:staging][:user] = "ev-search"
default[:praga][:staging][:query] = "select autor, titulo, editora, ano, data_reg, rec_id as id, user_id, preco, descr, tipo, estado from catalogo limit 1000;"
default[:praga][:staging][:password] = "123mudar"
default[:praga][:staging][:drive] = "com.mysql.jdbc.Driver"

default[:praga][:production][:core_name] = "search"
default[:praga][:production][:deltaImportQuery] = ""
default[:praga][:production][:deltaQuery] = ""
default[:praga][:production][:url] = "jdbc:mysql://dev.virtualshelf.net/estantevirtual"
default[:praga][:production][:user] = "ev-search"
default[:praga][:production][:query] = "select autor, titulo, editora, ano, data_reg, rec_id as id, user_id, preco, descr, tipo, estado from catalogo limit 1000;"
default[:praga][:production][:password] = "123mudar"
default[:praga][:production][:drive] = "com.mysql.jdbc.Driver"