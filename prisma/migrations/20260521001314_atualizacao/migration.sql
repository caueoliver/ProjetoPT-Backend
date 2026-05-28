-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_avaliacoesLoja" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "lojaId" INTEGER NOT NULL,
    "nota" INTEGER NOT NULL,
    "comentario" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "avaliacoesLoja_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "avaliacoesLoja_lojaId_fkey" FOREIGN KEY ("lojaId") REFERENCES "lojas" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_avaliacoesLoja" ("comentario", "createdAt", "id", "lojaId", "nota", "updatedAt", "usuarioId") SELECT "comentario", "createdAt", "id", "lojaId", "nota", "updatedAt", "usuarioId" FROM "avaliacoesLoja";
DROP TABLE "avaliacoesLoja";
ALTER TABLE "new_avaliacoesLoja" RENAME TO "avaliacoesLoja";
CREATE UNIQUE INDEX "avaliacoesLoja_usuarioId_key" ON "avaliacoesLoja"("usuarioId");
CREATE UNIQUE INDEX "avaliacoesLoja_lojaId_key" ON "avaliacoesLoja"("lojaId");
CREATE TABLE "new_avaliacoesProduto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "productId" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "avaliacoesProduto_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_avaliacoesProduto" ("comment", "createdAt", "id", "productId", "rating", "updatedAt", "usuarioId") SELECT "comment", "createdAt", "id", "productId", "rating", "updatedAt", "usuarioId" FROM "avaliacoesProduto";
DROP TABLE "avaliacoesProduto";
ALTER TABLE "new_avaliacoesProduto" RENAME TO "avaliacoesProduto";
CREATE UNIQUE INDEX "avaliacoesProduto_usuarioId_key" ON "avaliacoesProduto"("usuarioId");
CREATE UNIQUE INDEX "avaliacoesProduto_productId_key" ON "avaliacoesProduto"("productId");
CREATE TABLE "new_comentariosAvaliacoes" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "avaliacoesLojaId" INTEGER NOT NULL,
    "avaliacoesProdutoId" INTEGER NOT NULL,
    "conteudo" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "comentariosAvaliacoes_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "comentariosAvaliacoes_avaliacoesLojaId_fkey" FOREIGN KEY ("avaliacoesLojaId") REFERENCES "avaliacoesLoja" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "comentariosAvaliacoes_avaliacoesProdutoId_fkey" FOREIGN KEY ("avaliacoesProdutoId") REFERENCES "avaliacoesProduto" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_comentariosAvaliacoes" ("avaliacoesLojaId", "avaliacoesProdutoId", "conteudo", "createdAt", "id", "updatedAt", "usuarioId") SELECT "avaliacoesLojaId", "avaliacoesProdutoId", "conteudo", "createdAt", "id", "updatedAt", "usuarioId" FROM "comentariosAvaliacoes";
DROP TABLE "comentariosAvaliacoes";
ALTER TABLE "new_comentariosAvaliacoes" RENAME TO "comentariosAvaliacoes";
CREATE UNIQUE INDEX "comentariosAvaliacoes_usuarioId_key" ON "comentariosAvaliacoes"("usuarioId");
CREATE UNIQUE INDEX "comentariosAvaliacoes_avaliacoesLojaId_key" ON "comentariosAvaliacoes"("avaliacoesLojaId");
CREATE UNIQUE INDEX "comentariosAvaliacoes_avaliacoesProdutoId_key" ON "comentariosAvaliacoes"("avaliacoesProdutoId");
CREATE TABLE "new_imagensProdutos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "produtoId" INTEGER NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "ordem" INTEGER NOT NULL,
    CONSTRAINT "imagensProdutos_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "produtos" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_imagensProdutos" ("id", "imageUrl", "ordem", "produtoId") SELECT "id", "imageUrl", "ordem", "produtoId" FROM "imagensProdutos";
DROP TABLE "imagensProdutos";
ALTER TABLE "new_imagensProdutos" RENAME TO "imagensProdutos";
CREATE UNIQUE INDEX "imagensProdutos_produtoId_key" ON "imagensProdutos"("produtoId");
CREATE TABLE "new_lojas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "usuarioId" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT,
    "logoUrl" TEXT NOT NULL,
    "bannerUrl" TEXT NOT NULL,
    "stickerUrl" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "lojas_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_lojas" ("bannerUrl", "createdAt", "descricao", "id", "logoUrl", "nome", "stickerUrl", "updatedAt", "usuarioId") SELECT "bannerUrl", "createdAt", "descricao", "id", "logoUrl", "nome", "stickerUrl", "updatedAt", "usuarioId" FROM "lojas";
DROP TABLE "lojas";
ALTER TABLE "new_lojas" RENAME TO "lojas";
CREATE UNIQUE INDEX "lojas_usuarioId_key" ON "lojas"("usuarioId");
CREATE TABLE "new_produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "lojaId" INTEGER NOT NULL,
    "categoriaId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "preco" REAL NOT NULL,
    "estoque" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "produtos_lojaId_fkey" FOREIGN KEY ("lojaId") REFERENCES "lojas" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "produtos_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "categorias" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_produtos" ("categoriaId", "createdAt", "description", "estoque", "id", "lojaId", "name", "preco", "updatedAt") SELECT "categoriaId", "createdAt", "description", "estoque", "id", "lojaId", "name", "preco", "updatedAt" FROM "produtos";
DROP TABLE "produtos";
ALTER TABLE "new_produtos" RENAME TO "produtos";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
