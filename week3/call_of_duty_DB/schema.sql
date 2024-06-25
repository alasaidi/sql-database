CREATE TABLE
    Players (
        player_id INT PRIMARY KEY AUTO_INCREMENT,
        player_name VARCHAR(50) not null unique,
        email VARCHAR(50) not null unique,
        registration_date DATE not null,
        total_play_time INT not null,
        overallKD_ratio INT not null
    );

create table
    Weapons (
        Weapon_id int primary key auto_increment,
        weapon_name varchar(50) not null unique,
        weapon_type varchar(50) not null,
        damage int not null,
        fire_rate int not null,
        accuracy int not null,
        weapon_range int not null
    );

create table
    maps (
        map_id int primary key not null AUTO_INCREMENT,
        map_name varchar(50) not null unique,
        game_mode varchar(50) not null,
        map_size varchar(50) not null
    );

create table
    matchs (
        match_id int primary key AUTO_INCREMENT,
        map_id int not null,
        date_time datetime,
        game_mode varchar(50) not null,
        duration int not null,
        foreign key (map_id) references maps (map_id)
    );

CREATE TABLE
    player_matches (
        playermatch_id INT PRIMARY KEY AUTO_INCREMENT,
        match_id INT NOT NULL,
        player_id INT NOT NULL,
        kills INT NOT NULL,
        deaths INT NOT NULL,
        assists INT NOT NULL,
        score INT NOT NULL,
        FOREIGN KEY (match_id) REFERENCES matchs (match_id),
        FOREIGN KEY (player_id) REFERENCES players (player_id),
        UNIQUE (player_id, match_id)
    )
CREATE TABLE
    loadouts (
        loadout_id INT PRIMARY KEY AUTO_INCREMENT,
        player_id INT NOT NULL UNIQUE,
        loadout_name VARCHAR(50) NOT NULL UNIQUE,
        primary_weapon INT NOT NULL,
        perk VARCHAR(50) NOT NULL,
        equipment VARCHAR(50) NOT NULL,
        FOREIGN KEY (player_id) REFERENCES players (player_id),
        FOREIGN KEY (primary_weapon) REFERENCES weapons (weapon_id)
    );

create table
    leaderboards (
        leaderboard_id int primary key AUTO_INCREMENT,
        player_id int not null unique,
        category varchar(50) not null,
        ranks int not null,
        score int not null,
        foreign key (player_id) references players (player_id)
    );

-- Create indexes to speed common searches
CREATE INDEX player_search ON players (player_name, email);

CREATE INDEX weapon_search ON weapons (weapon_name);

CREATE INDEX leaderboard ON leaderboards (leaderboard_id);