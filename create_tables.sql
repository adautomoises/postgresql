CREATE TABLE IF NOT EXISTS mesas (
	id int not null primary key,
	mesa_codigo varchar(20),
	mesa_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);

CREATE TABLE IF NOT EXISTS funcionarios (
	id int not null primary key,
	funcionario_codigo varchar(20),
	funcionario_nome varchar(100),
	funcionario_situacao varchar(1) default 'A',
	funcionario_comissao real,
	funcionario_cargo varchar(30),
	data_criacao timestamp,
	data_atualizacao timestamp
);

CREATE TABLE IF NOT EXISTS vendas (
	id int not null primary key,
	funcionario_id int references funcionarios (id),
	mesa_id int references mesas (id),
	venda_codigo varchar(20),
	venda_valor real,
	venda_total real,
	venda_desconto real,
	venda_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);

CREATE TABLE IF NOT EXISTS produtos (
	id int not null primary key,
	produto_codigo varchar(20),
	produto_nome varchar(60),
	produto_valor real,
	produto_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);

CREATE TABLE IF NOT EXISTS itens_vendas (
	id int not null primary key,
	produto_id int not null references produtos(id),
	vendas_id int not null references vendas(id),
	item_valor real,
	item_quantidade int,
	item_total real,
	data_criacao timestamp,
	data_atualizacao timestamp
);

CREATE TABLE IF NOT EXISTS comissoes (
	id int not null primary key,
	funcionario_id int references funcionarios(id),
	comissao_valor real,
	comissao_situacao varchar(1) default 'A',
	data_criacao timestamp,
	data_atualizacao timestamp
);