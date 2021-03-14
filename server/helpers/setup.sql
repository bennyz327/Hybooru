
CREATE TABLE meta (
  id INTEGER PRIMARY KEY DEFAULT 39,
  hash INTEGER DEFAULT 0
);

INSERT INTO meta DEFAULT VALUES;

CREATE TABLE global (
  id INTEGER PRIMARY KEY DEFAULT 39,
  thumbnail_width INTEGER NOT NULL,
  thumbnail_height INTEGER NOT NULL,
  posts INTEGER NOT NULL,
  tags INTEGER NOT NULL,
  mappings INTEGER NOT NULL,
  needs_tags INTEGER NOT NULL
);

CREATE TABLE posts (
  id INTEGER PRIMARY KEY,
  hash BYTEA NOT NULL UNIQUE,
  size INTEGER,
  width INTEGER,
  height INTEGER,
  duration FLOAT,
  num_frames INTEGER,
  has_audio BOOLEAN,
  rating FLOAT,
  mime INTEGER,
  posted TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE urls (
  id INTEGER,
  postid INTEGER NOT NULL REFERENCES posts(id),
  url TEXT NOT NULL,

  PRIMARY KEY(id, postid)
);

CREATE TABLE tags (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  subtag TEXT NOT NULL,
  used INTEGER NOT NULL
);

CREATE TABLE namespaces (
  id INTEGER PRIMARY KEY,
  name TEXT,
  color TEXT NOT NULL
);

CREATE TABLE mappings (
  postid INTEGER NOT NULL REFERENCES posts(id),
  tagid INTEGER NOT NULL REFERENCES tags(id),

  PRIMARY KEY(postid, tagid)
);
