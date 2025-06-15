-- IPL 2025 Database Schema (MySQL Version)

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS ipl_2025;
USE ipl_2025;

-- Teams Table
CREATE TABLE IF NOT EXISTS teams (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL,
    home_venue VARCHAR(100),
    captain VARCHAR(100),
    coach VARCHAR(100),
    founded_year INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Players Table
CREATE TABLE IF NOT EXISTS players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    team_id INT,
    player_name VARCHAR(100) NOT NULL,
    age INT,
    nationality VARCHAR(50),
    role VARCHAR(50),
    batting_style VARCHAR(50),
    bowling_style VARCHAR(50),
    base_price DECIMAL(10,2),
    current_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team_id) REFERENCES teams(team_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Matches Table
CREATE TABLE IF NOT EXISTS matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    team1_id INT,
    team2_id INT,
    venue VARCHAR(100),
    match_date DATE,
    match_time TIME,
    toss_winner_id INT,
    toss_decision VARCHAR(20),
    match_winner_id INT,
    margin_runs INT,
    margin_wickets INT,
    player_of_match_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (team1_id) REFERENCES teams(team_id) ON DELETE SET NULL,
    FOREIGN KEY (team2_id) REFERENCES teams(team_id) ON DELETE SET NULL,
    FOREIGN KEY (toss_winner_id) REFERENCES teams(team_id) ON DELETE SET NULL,
    FOREIGN KEY (match_winner_id) REFERENCES teams(team_id) ON DELETE SET NULL,
    FOREIGN KEY (player_of_match_id) REFERENCES players(player_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Match_Details Table
CREATE TABLE IF NOT EXISTS match_details (
    match_id INT,
    team_id INT,
    total_runs INT,
    wickets INT,
    extras INT,
    overs DECIMAL(4,1),
    run_rate DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (match_id, team_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES teams(team_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Player_Stats Table
CREATE TABLE IF NOT EXISTS player_stats (
    player_id INT,
    match_id INT,
    runs_scored INT,
    balls_faced INT,
    fours INT,
    sixes INT,
    wickets INT,
    overs_bowled DECIMAL(4,1),
    runs_conceded INT,
    maidens INT,
    catches INT,
    stumpings INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (player_id, match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (match_id) REFERENCES matches(match_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Venues Table
CREATE TABLE IF NOT EXISTS venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    capacity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Create indexes for better query performance
CREATE INDEX idx_players_team ON players(team_id);
CREATE INDEX idx_matches_teams ON matches(team1_id, team2_id);
CREATE INDEX idx_match_details_match ON match_details(match_id);
CREATE INDEX idx_player_stats_player ON player_stats(player_id);
CREATE INDEX idx_player_stats_match ON player_stats(match_id);

-- Create a view for team performance
CREATE OR REPLACE VIEW team_performance AS
SELECT 
    t.team_id,
    t.team_name,
    COUNT(m.match_id) as total_matches,
    SUM(CASE WHEN m.match_winner_id = t.team_id THEN 1 ELSE 0 END) as wins,
    SUM(CASE WHEN m.match_winner_id != t.team_id THEN 1 ELSE 0 END) as losses
FROM teams t
LEFT JOIN matches m ON t.team_id IN (m.team1_id, m.team2_id)
GROUP BY t.team_id, t.team_name; 