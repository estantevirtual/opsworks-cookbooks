default[:search][:staging][:core_name] = "search"
default[:search][:staging][:deltaImportQuery] = ""
default[:search][:staging][:deltaQuery] = ""
default[:search][:staging][:url] = "jdbc:mysql://dev.virtualshelf.net/estantevirtual"
default[:search][:staging][:user] = "ev-search"
default[:search][:staging][:query] = "select autor, titulo, editora, ano, data_reg, rec_id as id, user_id, preco, descr, tipo, estado from catalogo limit 1000;"
default[:search][:staging][:password] = "123mudar"
default[:search][:staging][:drive] = "com.mysql.jdbc.Driver"

default[:search][:production][:core_name] = "search"
default[:search][:production][:deltaImportQuery] = ""
default[:search][:production][:deltaQuery] = ""
default[:search][:production][:url] = "jdbc:mysql://dev.virtualshelf.net/estantevirtual"
default[:search][:production][:user] = "ev-search"
default[:search][:production][:query] = "select autor, titulo, editora, ano, data_reg, rec_id as id, user_id, preco, descr, tipo, estado from catalogo limit 1000;"
default[:search][:production][:password] = "123mudar"
default[:search][:production][:drive] = "com.mysql.jdbc.Driver"
