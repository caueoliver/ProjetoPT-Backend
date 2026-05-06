-- CreateTable
CREATE TABLE "usuarios" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profile_picture_url" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "lojas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "logoUrl" TEXT NOT NULL,
    "bannerUrl" TEXT NOT NULL,
    "stickerUrl" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "lojas_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "avaliacoesLoja" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "lojaId" INTEGER NOT NULL,
    "nota" INTEGER NOT NULL,
    "comentario" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "avaliacoesLoja_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "avaliacoesLoja_lojaId_fkey" FOREIGN KEY ("lojaId") REFERENCES "lojas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "avaliacoesProduto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "avaliacoesProduto_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "comentariosAvaliacoes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "avaliacoesLojaId" INTEGER NOT NULL,
    "avaliacoesProdutoId" INTEGER NOT NULL,
    "conteudo" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "comentariosAvaliacoes_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "comentariosAvaliacoes_avaliacoesLojaId_fkey" FOREIGN KEY ("avaliacoesLojaId") REFERENCES "avaliacoesLoja" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "comentariosAvaliacoes_avaliacoesProdutoId_fkey" FOREIGN KEY ("avaliacoesProdutoId") REFERENCES "avaliacoesProduto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "categorias" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "parentCategoryId" INTEGER,
    CONSTRAINT "categorias_parentCategoryId_fkey" FOREIGN KEY ("parentCategoryId") REFERENCES "categorias" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "lojaId" INTEGER NOT NULL,
    "categoriaId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "preco" REAL NOT NULL,
    "estoque" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "produtos_lojaId_fkey" FOREIGN KEY ("lojaId") REFERENCES "lojas" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "produtos_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "categorias" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "imagensProdutos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produtoId" INTEGER NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "ordem" INTEGER NOT NULL,
    CONSTRAINT "imagensProdutos_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "produtos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_avaliacoesProdutoToprodutos" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_avaliacoesProdutoToprodutos_A_fkey" FOREIGN KEY ("A") REFERENCES "avaliacoesProduto" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_avaliacoesProdutoToprodutos_B_fkey" FOREIGN KEY ("B") REFERENCES "produtos" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_nome_key" ON "usuarios"("nome");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "lojas_usuarioId_key" ON "lojas"("usuarioId");

-- CreateIndex
CREATE UNIQUE INDEX "avaliacoesLoja_usuarioId_key" ON "avaliacoesLoja"("usuarioId");

-- CreateIndex
CREATE UNIQUE INDEX "avaliacoesLoja_lojaId_key" ON "avaliacoesLoja"("lojaId");

-- CreateIndex
CREATE UNIQUE INDEX "avaliacoesProduto_usuarioId_key" ON "avaliacoesProduto"("usuarioId");

-- CreateIndex
CREATE UNIQUE INDEX "avaliacoesProduto_productId_key" ON "avaliacoesProduto"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "comentariosAvaliacoes_usuarioId_key" ON "comentariosAvaliacoes"("usuarioId");

-- CreateIndex
CREATE UNIQUE INDEX "comentariosAvaliacoes_avaliacoesLojaId_key" ON "comentariosAvaliacoes"("avaliacoesLojaId");

-- CreateIndex
CREATE UNIQUE INDEX "comentariosAvaliacoes_avaliacoesProdutoId_key" ON "comentariosAvaliacoes"("avaliacoesProdutoId");

-- CreateIndex
CREATE UNIQUE INDEX "produtos_lojaId_key" ON "produtos"("lojaId");

-- CreateIndex
CREATE UNIQUE INDEX "produtos_categoriaId_key" ON "produtos"("categoriaId");

-- CreateIndex
CREATE UNIQUE INDEX "imagensProdutos_produtoId_key" ON "imagensProdutos"("produtoId");

-- CreateIndex
CREATE UNIQUE INDEX "_avaliacoesProdutoToprodutos_AB_unique" ON "_avaliacoesProdutoToprodutos"("A", "B");

-- CreateIndex
CREATE INDEX "_avaliacoesProdutoToprodutos_B_index" ON "_avaliacoesProdutoToprodutos"("B");
