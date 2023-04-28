CREATE TABLE "Item" (
    "id" INTEGER NOT NULL,
    "author" VARCHAR(255) NOT NULL,
    "publish_date" DATE NOT NULL,
    "archived" BOOLEAN NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Author" (
    "id" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL,
    FOREIGN KEY("id") REFERENCES "Item"("author")
);

CREATE TABLE "Game" (
    "id" INTEGER NOT NULL,
    "multiplayer" VARCHAR(255) NOT NULL,
    "last_played_at" DATE NOT NULL,
    FOREIGN KEY("id") REFERENCES "Item"("id")
);