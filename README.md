# spotify_sql_project



# 🎵 Spotify SQL Analytics Project

This project performs data analysis on a fictional Spotify dataset using **PostgreSQL**. It answers **18 real-world analytical questions** related to tracks, artists, albums, and streaming statistics.

---

## 📂 Project Structure

- `spotify.sql` – Contains the table schema and data creation
- `spotify_queries.sql` – Contains all 18 solved SQL queries
- `README.md` – Project overview and explanations

---

## 🗃️ Table Schema

The project uses a single table called `spotify` with the following columns:

| Column              | Type        | Description                        |
|---------------------|-------------|------------------------------------|
| artist              | VARCHAR     | Name of the artist                 |
| track               | VARCHAR     | Name of the track                  |
| album               | VARCHAR     | Album the track belongs to         |
| album_type          | VARCHAR     | Type of album (e.g., album, single)|
| danceability        | FLOAT       | Danceability score                 |
| energy              | FLOAT       | Energy score                       |
| loudness            | FLOAT       | Loudness score                     |
| speechiness         | FLOAT       | Speechiness score                  |
| acousticness        | FLOAT       | Acousticness score                 |
| instrumentalness    | FLOAT       | Instrumentalness score             |
| liveness            | FLOAT       | Liveness score                     |
| valence             | FLOAT       | Valence score                      |
| tempo               | FLOAT       | Tempo (BPM)                        |
| duration_min        | FLOAT       | Duration of track (in minutes)     |
| title               | VARCHAR     | YouTube video title                |
| channel             | VARCHAR     | YouTube channel name               |
| views               | FLOAT       | YouTube views                      |
| likes               | BIGINT      | YouTube likes                      |
| comments            | BIGINT      | YouTube comments                   |
| licensed            | BOOLEAN     | Whether track is licensed          |
| official_video      | BOOLEAN     | Whether it's the official video    |
| stream              | BIGINT      | Spotify stream count               |
| energy_liveness     | FLOAT       | Custom score (energy × liveness)   |
| most_played_on      | VARCHAR     | Platform with most plays (Spotify/YouTube) |

---

## 📌 SQL Questions Solved

### 🔹 Easy Level
1. Retrieve all tracks with more than **1 billion streams**
2. List all **albums and artists**
3. Total number of **comments** where `licensed = TRUE`
4. Find all tracks from **album type = 'single'**
5. Count total number of **tracks per artist**

### 🔸 Medium Level
6. **Average danceability** for each album
7. Top **5 tracks** with highest energy
8. Tracks where `official_video = TRUE` with **views and likes**
9. Total **views per album**
10. Tracks where **Spotify streams > YouTube views**

### 🔺 Advanced Level
11. Top **3 most-viewed tracks per artist** (using window function)
12. Tracks where **liveness > average liveness**
13. `WITH` clause: **energy range** per album (max - min)
14. **Average tempo** per `album_type`
15. Most **liked track per album** (window function)
16. Tracks with **high energy** and **low acousticness**
17. Count of tracks where `licensed = TRUE` AND `official_video = TRUE`
18. Artists with **more than 3 tracks** over **100 million streams**

---

## 📊 Sample Results (Summary)

- ✅ 12 tracks have over **1B streams**
- 🎧 The album *Future Nostalgia* has the highest **average danceability**
- 💥 Track *Blinding Lights* ranks #1 in **energy**
- 🧠 *Adele* has **4 tracks** over 100M+ Spotify streams
- 🔁 Most artists have at least 1 track where **Spotify outperformed YouTube**
- 🪩 *Singles* generally have higher average **tempo** than albums

---

## 🛠️ Tools Used

- 🐘 **PostgreSQL** (SQL queries and database logic)
- 📝 **VS Code / PgAdmin** (Query Execution)
- 📈 *(Optional)* Power BI or Tableau (for data visualization)

---

## 📌 How to Use

1. Clone this repo
2. Run `spotify.sql` to create the table and insert sample data
3. Open `spotify_queries.sql` and run each query step-by-step
4. Observe outputs and analyze trends

---

## 📢 Author

**Aditya Sharma**  
Undergrad | Data Analytics & Web Dev Enthusiast  
📧 Reach out via LinkedIn or GitHub for collaboration!

---

## ⭐️ Like This Project?


