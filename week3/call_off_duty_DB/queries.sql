INSERT INTO
    Players (
        player_name,
        email,
        RegistrationDate,
        TotalPlayTime,
        OverallKDRatio
    )
VALUES
    (
        'Sniper42',
        'sniper42@email.com',
        '2023-01-15',
        5000,
        1.75
    ),
    (
        'RushQueen',
        'rushqueen@email.com',
        '2023-02-20',
        4500,
        1.50
    ),
    (
        'TacticalMaster',
        'tacticalmaster@email.com',
        '2023-03-10',
        6000,
        2.00
    ),
    (
        'StealthNinja',
        'stealthninja@email.com',
        '2023-04-05',
        5500,
        1.80
    ),
    (
        'ExplosiveExpert',
        'explosiveexpert@email.com',
        '2023-05-01',
        4800,
        1.60
    );

INSERT INTO
    Weapons (
        weapon_name,
        weapon_type,
        damage,
        fire_rate,
        accuracy,
        weapon_range
    )
VALUES
    ('M4A1', 'Assault Rifle', 30, 800.00, 75.50, 500),
    ('AWP', 'Sniper Rifle', 115, 41.00, 95.00, 1000),
    ('MP5', 'Submachine Gun', 26, 800.00, 70.00, 200),
    ('Desert Eagle', 'Pistol', 53, 267.00, 65.00, 150),
    ('SPAS-12', 'Shotgun', 80, 85.00, 60.00, 50);

INSERT INTO
    Maps (map_name, game_mode, map_size)
VALUES
    ('Dust2', 'Team Deathmatch, Domination', 'Medium'),
    ('Nuketown', 'Free-for-All, Hardpoint', 'Small'),
    ('Verdansk', 'Battle Royale', 'Large'),
    (
        'Shipment',
        'Team Deathmatch, Kill Confirmed',
        'Small'
    ),
    (
        'Terminal',
        'Search and Destroy, Domination',
        'Medium'
    );

INSERT INTO
    matchs (map_id, date_time, game_mode, duration)
VALUES
    (1, '2023-06-01 14:30:00', 'Team Deathmatch', 600),
    (2, '2023-06-01 15:45:00', 'Free-for-All', 480),
    (3, '2023-06-02 10:00:00', 'Battle Royale', 1800),
    (4, '2023-06-02 12:30:00', 'Kill Confirmed', 540),
    (
        5,
        '2023-06-03 20:00:00',
        'Search and Destroy',
        720
    );

INSERT INTO
    player_matches (
        player_id,
        match_id,
        kills,
        deaths,
        assists,
        score
    )
VALUES
    (1, 1, 20, 10, 5, 2500),
    (2, 1, 15, 12, 8, 2100),
    (3, 2, 25, 8, 3, 3000),
    (4, 3, 10, 5, 2, 1500),
    (5, 4, 18, 15, 7, 2300);

INSERT INTO
    Loadouts (
        player_id,
        loadout_name,
        primary_weapon,
        perk,
        Equipment
    )
VALUES
    (
        1,
        'Sniper Setup',
        2,
        'Ghost, Cold-Blooded, Dead Silence',
        'Claymore, Smoke Grenade'
    ),
    (
        2,
        'Rush Setup',
        3,
        'Lightweight, Marathon, Ninja',
        'Frag Grenade, Flashbang'
    ),
    (
        3,
        'Tactical Setup',
        4,
        'Scavenger, Hardline, Tactical Mask',
        'C4, EMP Grenade'
    ),
    (
        4,
        'Stealth Setup',
        4,
        'Ghost, Cold-Blooded, Ninja',
        'Throwing Knife, Smoke Grenade'
    ),
    (
        5,
        'Explosive Setup',
        5,
        'Flak Jacket, Danger Close, Tactical Mask',
        'Semtex, Concussion Grenade'
    );

INSERT INTO
    Leaderboards (player_id, category, ranks, score)
VALUES
    (1, 'Total Kills', 1, 5000.00),
    (2, 'Win Ratio', 2, 0.75),
    (3, 'Score Per Minute', 1, 450.50),
    (4, 'Longest Killstreak', 3, 20.00),
    (5, 'Headshot Percentage', 4, 35.50);