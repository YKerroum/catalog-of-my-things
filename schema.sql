create table if not exists label (
    id int not null generated always as identity,
    title varchar(255) not null,
    color varchar(255) not null,
    primary key (id)
);

create table if not exists items (
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
