CREATE TABLE "Item" (
    "id" INTEGER NOT NULL,
    "author" VARCHAR(255) NOT NULL,
    "label" VARCHAR(255) NOT NULL,
    "genre" VARCHAR(255) NOT NULL,
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

CREATE TABLE "Label" (
    "id" INTEGER NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "color" VARCHAR(255) NOT NULL,
    FOREIGN KEY("id") REFERENCES "Item"("label")
);

CREATE TABLE "Genre" (
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Game" (
    "id" INTEGER NOT NULL,
    "multiplayer" VARCHAR(255) NOT NULL,
    "last_played_at" DATE NOT NULL,
    FOREIGN KEY("id") REFERENCES "Item"("id")
);

CREATE TABLE "Book" (
    "id" INTEGER NOT NULL,
    "publisher" VARCHAR(255) NOT NULL,
    "cover_state" VARCHAR(255) NOT NULL,
    FOREIGN KEY("id") REFERENCES "Item"("id")
);

CREATE TABLE "MusicAlbum" (
    "id" INTEGER NOT NULL,
    "on_spotify" BOOLEAN NOT NULL,
    FOREIGN KEY("id") REFERENCES "Item"("id")
);