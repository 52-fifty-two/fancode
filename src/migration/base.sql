-- create tables
create table if not exists mydb.sports
(
    id int auto_increment not null primary key,
    name varchar(50) not null,
    status boolean not null default true,
    recUpdatedAt timestamp not null default current_timestamp on update current_timestamp,
    createdAt timestamp not null default current_timestamp
);

create table if not exists mydb.tours
(
    id int auto_increment not null primary key,
    name varchar(50) not null,
    sportId int not null,
    status boolean not null default true,
    startTime timestamp not null,
    endTime timestamp not null,
    recUpdatedAt timestamp not null default current_timestamp on update current_timestamp,
    createdAt timestamp not null default current_timestamp,
    foreign key (sportId) references sports(id)
);

create table if not exists mydb.matches
(
    id int auto_increment not null primary key,
    name varchar(50) not null,
    tourId int not null,
    status boolean not null default true,
    format varchar(50) not null,
    startTime timestamp not null,
    endTime timestamp not null,
    recUpdatedAt timestamp not null default current_timestamp on update current_timestamp,
    createdAt timestamp not null default current_timestamp,
    foreign key (tourId) references tours(id)
);

create table if not exists mydb.news
(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    matchId INT,
    tourId INT,
    sportId INT NOT NULL,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (matchId) REFERENCES matches(id),
    FOREIGN KEY (tourId) REFERENCES tours(id),
    FOREIGN KEY (sportId) REFERENCES sports(id)
);


-- seed data
insert ignore into mydb.sports (id, name) values (1, 'Cricket');
insert ignore into mydb.sports (id, name) values (2, 'Football');

insert ignore into mydb.tours (id, name, sportId, startTime, endTime) values (1, 'Indian Premier League, 2023', 1, '2023-04-09 00:00:00', '2023-05-30 00:00:00');
insert ignore into mydb.tours (id, name, sportId, startTime, endTime) values (2, 'India Super League, 2023', 2, '2023-04-21 00:00:00', '2023-06-20 00:00:00');
insert ignore into mydb.tours (id, name, sportId, startTime, endTime) values (3, 'India Tour of West Indies, 2023', 1, '2023-06-10 00:00:00', '2023-06-29 00:00:00');
insert ignore into mydb.tours (id, name, sportId, startTime, endTime) values (4, 'English Premier League, 2022', 2, '2022-04-09 00:00:00', '2022-05-30 00:00:00');

insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('GT vs RCB', 1, 'T20', '2023-04-09 18:00:00', '2023-04-09 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('CSK vs MI', 1, 'T20', '2023-04-10 18:00:00', '2021-04-10 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('LSG vs KXIP', 1, 'T20', '2023-04-11 18:00:00', '2023-04-11 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('RR vs SRH', 1, 'T20', '2023-04-12 18:00:00', '2023-04-12 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('BLR vs BEN', 2, 'soccer', '2023-04-29 18:00:00', '2023-04-29 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('ATK vs MCFC', 2, 'soccer', '2023-04-21 18:00:00', '2023-04-21 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('KER vs JFC', 2, 'soccer', '2023-04-22 18:00:00', '2023-04-22 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('IND vs WI', 3, 'ODI', '2023-06-10 10:00:00', '2023-06-10 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('IND vs WI', 3, 'ODI', '2023-06-12 10:00:00', '2023-06-12 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('IND vs WI', 3, 'ODI', '2023-06-14 10:00:00', '2023-06-14 23:00:00');
insert ignore into mydb.matches (name, tourId, format, startTime, endTime) values ('KER vs JFC', 4, 'soccer', '2022-04-09 18:00:00', '2022-04-09 23:00:00');

insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('Exciting Match Ahead', 'Get ready for an exciting match between GT and RCB!', 1, 1, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('CSK vs MI Preview', 'Here''s what to expect from the upcoming CSK vs MI match.', 2, 1, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('LSG vs KXIP Highlights', 'Catch the highlights of the thrilling LSG vs KXIP match.', 3, 1, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('RR vs SRH Recap', 'Read about the key moments from the RR vs SRH match.', 4, 1, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('Exciting Soccer Match', 'Don''t miss the exciting soccer match between BLR and BEN.', NULL, 2, 2, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('ATK vs MCFC Preview', 'Get ready for an intense clash between ATK and MCFC in the ISL.', NULL, 2, 2, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('KER vs JFC Highlights', 'Relive the highlights of the thrilling KER vs JFC match.', NULL, 2, 2, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('IND vs WI ODI Series', 'Follow the latest updates from the IND vs WI ODI series.', NULL, 3, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('IND vs WI ODI Series Update', 'Stay tuned for the latest updates from the ongoing IND vs WI ODI series.', NULL, 3, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('IND vs WI ODI Series Final Match', 'Get ready for the final match of the IND vs WI ODI series.', NULL, 3, 1, NOW());
insert ignore into mydb.news (title, description, matchId, tourId, sportId, createdAt) VALUES ('KER vs JFC Highlights (EPL)', 'Relive the highlights of the exciting KER vs JFC match in the EPL.', NULL, 4, 2, NOW());
