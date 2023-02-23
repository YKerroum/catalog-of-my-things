create table if not exists label (
    id int not null generated always as identity,
    title varchar(255) not null,
    color varchar(255) not null,
    primary key (id)
);

CREATE TABLE genres(
  id INT, 
  name VARCHAR(255), 
  PRIMARY KEY(id)
);

CREATE TABLE authors(
  id INT, 
  first_name VARCHAR(255), 
  last_name VARCHAR(255), 
  PRIMARY KEY(id)
);

create table if not exists item (
    id int not null generated always as identity,
    publish_date date not null,
    archived boolean default false,
    id_genre int,
    id_author int,
    id_label int,

    primary key (id),
    foreign key (id_genre) references genre(id),
    foreign key (id_author) references author(id),
    foreign key (id_label) references label(id)
);

create table if not exists book (
    id int not null generated always as identity,
    publisher varchar(255) not null,
    cover_state varchar(255) not null,
    publish_date date not null,
    archived boolean default false,
    id_genre int,
    id_author int,
    id_label int,

    primary key (id),
    foreign key (id_genre) references genre(id),
    foreign key (id_author) references author(id),
    foreign key (id_label) references label(id)
);

CREATE TABLE musicalbums(
  id INT, 
  name VARCHAR(255), 
  published_date DATE, 
  on_spotify BOOLEAN, 
  archived BOOLEAN, 
  author_id INT REFERENCES authors(id), 
  label_id INT REFERENCES labels(id), 
  genre_id INT REFERENCES genres(id), 
  PRIMARY KEY(id)
);

CREATE TABLE games(
  id INT, 
  name VARCHAR(255), 
  published_date DATE, 
  last_played_date DATE, 
  multiplayer BOOLEAN, 
  archived BOOLEAN, 
  author_id INT REFERENCES authors(id), 
  label_id INT REFERENCES labels(id), 
  genre_id INT REFERENCES genres(id), 
  PRIMARY KEY(id)
);
