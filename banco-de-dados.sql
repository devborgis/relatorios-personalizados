CREATE TABLE TB_USUARIO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	STATUS INTEGER NOT NULL DEFAULT 1,
	NOME VARCHAR(150) NOT NULL,
	LOGIN VARCHAR(60) NOT NULL,
	SENHA VARCHAR(60) NOT NULL
);

CREATE TABLE TB_FORMULARIO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	NOME VARCHAR(250) NOT NULL,
	DESCRICAO VARCHAR(250)
);

CREATE TABLE TB_REL_GRUPO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	DESCRICAO VARCHAR(100)
);

CREATE TABLE TB_REL_SUB_GRUPO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	DESCRICAO VARCHAR(100)
);

CREATE TABLE TB_RELATORIO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	NOME VARCHAR(250) NOT NULL,
	DESCRICAO VARCHAR(250),
	ID_GRUPO INTEGER,
	ID_SUB_GRUPO INTEGER,
	FR3 BLOB,
	FOREIGN KEY(ID_GRUPO) REFERENCES TB_REL_GRUPO(ID),
	FOREIGN KEY(ID_SUB_GRUPO) REFERENCES TB_REL_SUB_GRUPO(ID)
);

CREATE TABLE TB_USU_PERMISSAO (
	ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ID_USU INTEGER NOT NULL,
	ID_FORM INTEGER,
	ID_RELATORIO INTEGER,
	VISUALIZAR INTEGER NOT NULL DEFAULT 0,
	INCLUIR INTEGER NOT NULL DEFAULT 0,
	EXCLUIR INTEGER NOT NULL DEFAULT 0,
	EDITAR INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY(ID_USU) REFERENCES TB_USUARIO(ID),
	FOREIGN KEY(ID_FORM) REFERENCES TB_FORMULARIO(ID),
	FOREIGN KEY(ID_RELATORIO) REFERENCES TB_RELATORIO(ID)
);
