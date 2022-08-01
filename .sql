CREATE TABLE "public.Usuário" (
	"Id" serial NOT NULL UNIQUE,
	"nome" varchar(50) NOT NULL,
	"email" varchar(50) NOT NULL UNIQUE,
	"senha" uuid NOT NULL,
	CONSTRAINT "Usuário_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Produto" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	"preço" DECIMAL NOT NULL,
	""fotoFrente"" varchar(100) NOT NULL,
	""fotoFundo"" varchar(100) NOT NULL,
	""fotoPrincipal"" varchar(100) NOT NULL,
	""categoriaId"" int NOT NULL,
	""tamanhoId"" int NOT NULL,
	CONSTRAINT "Produto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Categorias" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	"padrão" BOOLEAN NOT NULL,
	CONSTRAINT "Categorias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Tamanhos" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	"padrão" BOOLEAN NOT NULL,
	CONSTRAINT "Tamanhos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Compra_Produto" (
	"id" serial NOT NULL,
	"quantidade" bigint NOT NULL,
	""produtoId"" int NOT NULL,
	CONSTRAINT "Compra_Produto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Item" (
	"id" serial NOT NULL,
	"quantidade" int NOT NULL,
	""produtoId"" int NOT NULL,
	CONSTRAINT "Item_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Estados" (
	"id" serial NOT NULL,
	"nome" varchar(50) NOT NULL,
	CONSTRAINT "Estados_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Compra" (
	"id" serial NOT NULL,
	""userId"" int NOT NULL,
	""estadoId"" int NOT NULL,
	""compraId"" int NOT NULL,
	""dataCompra"" DATE NOT NULL,
	"endereço" TEXT NOT NULL,
	CONSTRAINT "Compra_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Produto" ADD CONSTRAINT "Produto_fk0" FOREIGN KEY (""categoriaId"") REFERENCES "Categorias"("id");
ALTER TABLE "Produto" ADD CONSTRAINT "Produto_fk1" FOREIGN KEY (""tamanhoId"") REFERENCES "Tamanhos"("nome");



ALTER TABLE "Compra_Produto" ADD CONSTRAINT "Compra_Produto_fk0" FOREIGN KEY (""produtoId"") REFERENCES "Produto"("id");

ALTER TABLE "Item" ADD CONSTRAINT "Item_fk0" FOREIGN KEY (""produtoId"") REFERENCES "Produto"("id");


ALTER TABLE "Compra" ADD CONSTRAINT "Compra_fk0" FOREIGN KEY (""userId"") REFERENCES "Usuário"("Id");
ALTER TABLE "Compra" ADD CONSTRAINT "Compra_fk1" FOREIGN KEY (""estadoId"") REFERENCES "Estados"("id");
ALTER TABLE "Compra" ADD CONSTRAINT "Compra_fk2" FOREIGN KEY (""compraId"") REFERENCES "Compra_Produto"("id");








