INSERT INTO Users VALUES (0, "root", 0);
INSERT INTO Users VALUES (1, "admin", 0);
INSERT INTO Users VALUES (2, "user", 0);
INSERT INTO Users VALUES (3, "content_manager", 1);

INSERT INTO Users VALUES (4, "Alexpert", 4);
INSERT INTO Users VALUES (5, "Some_important_guy", 5);
INSERT INTO Users VALUES (6, "Robert", 6);
INSERT INTO Users VALUES (7, "Random", 7);

INSERT INTO Loggables VALUES (4, "Alexpert");
INSERT INTO Loggables VALUES (5, "Some_important_guy");
INSERT INTO Loggables VALUES (6, "Robert");
INSERT INTO Loggables VALUES (7, "Random");

-- INSERT INTO INodes VALUES(0, "/", 0, 0);
-- INSERT INTO INodes VALUES(1, "home", 0, 0);
-- INSERT INTO INodes VALUES(2, "Alexpert", 4, 1);
-- INSERT INTO INodes VALUES(3, "Some_important_guy", 5, 1);
-- INSERT INTO INodes VALUES(4, "Robert", 6, 1);
-- INSERT INTO INodes VALUES(5, "Random", 7, 1);
-- INSERT INTO INodes VALUES(6, "config", 0, 0);

-- INSERT INTO INodes VALUES(7, "Alex_picture", 4, 2);
-- INSERT INTO INodes VALUES(8, "config", 1, 6);

-- INSERT INTO Files VALUES(7, "Alex_picture.jpg");
-- INSERT INTO Files VALUES(8, "config.json");

INSERT INTO Members VALUES(2, 4);
INSERT INTO Members VALUES(2, 5);
INSERT INTO Members VALUES(2, 6);
INSERT INTO Members VALUES(2, 7);