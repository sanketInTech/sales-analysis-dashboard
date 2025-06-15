-- Insert sample teams
INSERT INTO teams (team_name, home_venue, captain, coach, founded_year) VALUES
('Mumbai Indians', 'Wankhede Stadium', 'Hardik Pandya', 'Mark Boucher', 2008),
('Chennai Super Kings', 'M. A. Chidambaram Stadium', 'Ruturaj Gaikwad', 'Stephen Fleming', 2008),
('Royal Challengers Bangalore', 'M. Chinnaswamy Stadium', 'Faf du Plessis', 'Andy Flower', 2008),
('Kolkata Knight Riders', 'Eden Gardens', 'Shreyas Iyer', 'Gautam Gambhir', 2008),
('Delhi Capitals', 'Arun Jaitley Stadium', 'Rishabh Pant', 'Ricky Ponting', 2008);

-- Insert sample players
INSERT INTO players (team_id, player_name, age, nationality, role, batting_style, bowling_style, base_price, current_price) VALUES
(1, 'Jasprit Bumrah', 30, 'Indian', 'Bowler', 'Right-handed', 'Right-arm fast', 7.00, 12.00),
(1, 'Suryakumar Yadav', 33, 'Indian', 'Batsman', 'Right-handed', 'Right-arm offbreak', 8.00, 8.00),
(2, 'Ravindra Jadeja', 35, 'Indian', 'All-rounder', 'Left-handed', 'Left-arm orthodox', 7.00, 16.00),
(2, 'Deepak Chahar', 31, 'Indian', 'Bowler', 'Right-handed', 'Right-arm medium', 6.00, 14.00),
(3, 'Virat Kohli', 35, 'Indian', 'Batsman', 'Right-handed', 'Right-arm medium', 15.00, 15.00),
(3, 'Glenn Maxwell', 35, 'Australian', 'All-rounder', 'Right-handed', 'Right-arm offbreak', 11.00, 11.00),
(4, 'Andre Russell', 35, 'West Indian', 'All-rounder', 'Right-handed', 'Right-arm fast', 12.00, 12.00),
(4, 'Sunil Narine', 35, 'West Indian', 'All-rounder', 'Left-handed', 'Right-arm offbreak', 6.00, 6.00),
(5, 'Kuldeep Yadav', 29, 'Indian', 'Bowler', 'Left-handed', 'Left-arm chinaman', 5.00, 5.00),
(5, 'Axar Patel', 30, 'Indian', 'All-rounder', 'Left-handed', 'Left-arm orthodox', 9.00, 9.00);

-- Insert sample matches
INSERT INTO matches (team1_id, team2_id, venue, match_date, match_time, toss_winner_id, toss_decision, match_winner_id, margin_runs, margin_wickets, player_of_match_id) VALUES
(1, 2, 'Wankhede Stadium', '2025-03-22', '19:30:00', 1, 'bat', 1, 25, 0, 1),
(3, 4, 'M. Chinnaswamy Stadium', '2025-03-23', '19:30:00', 3, 'bat', 4, 0, 5, 7),
(2, 5, 'M. A. Chidambaram Stadium', '2025-03-24', '19:30:00', 2, 'field', 2, 0, 3, 3),
(1, 3, 'Wankhede Stadium', '2025-03-25', '19:30:00', 3, 'bat', 1, 0, 4, 2),
(4, 5, 'Eden Gardens', '2025-03-26', '19:30:00', 4, 'field', 4, 15, 0, 8);

-- Insert match details
INSERT INTO match_details (match_id, team_id, total_runs, wickets, extras, overs, run_rate) VALUES
(1, 1, 185, 6, 8, 20.0, 9.25),
(1, 2, 160, 8, 5, 20.0, 8.00),
(2, 3, 165, 10, 7, 19.2, 8.55),
(2, 4, 166, 5, 4, 18.3, 9.03),
(3, 2, 182, 4, 6, 20.0, 9.10),
(3, 5, 175, 7, 5, 20.0, 8.75),
(4, 1, 192, 5, 9, 20.0, 9.60),
(4, 3, 188, 9, 7, 20.0, 9.40),
(5, 4, 195, 6, 8, 20.0, 9.75),
(5, 5, 180, 8, 6, 20.0, 9.00);

-- Insert player stats
INSERT INTO player_stats (player_id, match_id, runs_scored, balls_faced, fours, sixes, wickets, overs_bowled, runs_conceded, maidens, catches, stumpings) VALUES
(1, 1, 0, 0, 0, 0, 3, 4.0, 25, 0, 1, 0),
(2, 1, 65, 35, 6, 4, 0, 0, 0, 0, 0, 0),
(3, 3, 45, 30, 4, 2, 2, 4.0, 28, 0, 2, 0),
(4, 3, 0, 0, 0, 0, 2, 4.0, 32, 0, 0, 0),
(5, 2, 72, 45, 8, 3, 0, 0, 0, 0, 1, 0),
(6, 2, 35, 20, 3, 2, 1, 3.0, 24, 0, 0, 0),
(7, 2, 55, 30, 5, 4, 3, 4.0, 35, 0, 1, 0),
(8, 5, 0, 0, 0, 0, 4, 4.0, 22, 1, 0, 0),
(9, 3, 0, 0, 0, 0, 2, 4.0, 30, 0, 0, 0),
(10, 3, 30, 20, 2, 2, 1, 3.0, 25, 0, 1, 0); 