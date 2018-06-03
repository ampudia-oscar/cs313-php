DROP TABLE topic CASCADE;
DROP TABLE topic_scripture;
DROP TABLE Scriptures;

CREATE TABLE Scriptures (
	id SERIAL,
	book VARCHAR(45),
	chapter INT,
	verse INT,
	content VARCHAR(255),
        PRIMARY KEY (id)
);

-- INSERT INTO Scriptures (book,chapter,verse,content)
-- VALUES
-- ('John','1','5','And the light shineth in darkness; and the darkness comprehended it not.'),
-- ('Doctrine and Covenants','88','49','The light shineth in darkness, and the darkness comprehendeth it not; nevertheless, the day shall come when you shall comprehend even God, being quickened in him and by him.'),
-- ('Doctrine and Covenants','93','28','He that keepeth his commandments receiveth truth and light, until he is glorified in truth and knoweth all things.'),
-- ('Mosiah','16','9','He is the light and the life of the world; yea, a light that is endless, that can never be darkened; yea, and also a life which is endless, that there can be no more death.');

CREATE TABLE topic (
    id SERIAL,
    name VARCHAR(45),
    PRIMARY KEY (id)
);

INSERT INTO topic (name)
VALUES ('Faith'),('Sacrifice'),('Charity');

CREATE TABLE topic_scripture (
  topic_id INT NOT NULL,
  scripture_id INT NOT NULL,
  PRIMARY KEY (topic_id, scripture_id),
  CONSTRAINT fk_topic_scripture_topic FOREIGN KEY (topic_id) REFERENCES topic (id),
  CONSTRAINT fk_topic_scripture_scripture FOREIGN KEY (scripture_id) REFERENCES scriptures (id)
);

CREATE INDEX fk_topic_scripture_scripture_idx ON topic_scripture (scripture_id ASC);

CREATE INDEX fk_topic_scripture_topic_idx ON topic_scripture (topic_id ASC);
