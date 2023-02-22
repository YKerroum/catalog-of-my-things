
create table if not exists items (
    id int not null generated always as identity,
    publish_date date not null,
    archived boolean not null default false,
    id_genre int,
    id_author int,
    id_label int,

    );
)
