--Part – A
--1. Retrieve a unique genre of songs.
select distinct genre from songs

--2. Find top 2 albums released before 2010.
select top 2 * from albums where release_year<2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
insert into songs values(1245,'Zaroor',2.55,'Feel Good',1005)
select * from songs

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
update songs
set genre='Happy'
where Song_title='Zaroor'
select * from songs

--5. Delete an Artist ‘Ed Sheeran’
Delete from Artists
where Artist_name='Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
Alter Table Songs
Add  Ratings decimal(3,2)
select* from Songs
--7. Retrieve songs whose title starts with 'S'.
Select * from Songs where Song_title like 's%'

--8. Retrieve all songs whose title contains 'Everybody'.
Select * from Songs where Song_title like '%Everybody%'
--9. Display Artist Name in Uppercase.
Select UPPER(Artist_name) from Artists
--10. Find the Square Root of the Duration of a Song ‘Good Luck’
Select SQRT(Duration) from Songs where Song_title='Good Luck'
--11. Find Current Date.
Select GETDATE()
--12. Find the number of albums for each artist.
Select Artist_id,count(Album_title) from Albums group by Artist_id
--13. Retrieve the Album_id which has more than 5 songs in it.
Select Album_id,count(Song_id) from Songs group by Album_id having count(Song_id)>5
--14. Retrieve all songs from the album 'Album1'. (using Subquery)
Select * from songs where
Album_id=(Select Album_id from Albums where Album_title='Album1')
--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
Select Album_title from Albums where
Artist_id=(Select Artist_id from Artists where Artist_name='Aparshakti Khurana')
--16. Retrieve all the song titles with its album title.
Select s.Song_title,a.Album_title
from Songs as s
Inner join Albums as a
on s.Album_id=a.Album_id
--17. Find all the songs which are released in 2020.
Select s.song_title,a.release_year 
from songs as s
Inner join Albums as a
on s.Album_id=a.Album_id
where a.Release_year=2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
Create view Fav_Songs 
As
Select * from songs where Song_id >=101 and Song_id<=105

Select * from Fav_Songs
--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
Update Fav_Songs
Set Song_title='Jannat' 
where Song_id=101
--20. Find all artists who have released an album in 2020.
Select ar.Artist_name
from Artists as ar
inner join Albums as al
on Ar.Artist_id=al.Artist_id
where al.Release_year=2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
Select s.song_title,s.duration
from Songs as s
inner join Albums as a
on s.Album_id=a.Album_id
inner join Artists as ar
on ar.Artist_id=a.Artist_id
where ar.Artist_name='Shreya Ghoshal'
order by s.Duration

--Part – B
--22. Retrieve all song titles by artists who have more than one album.
Select s.song_title,a.Release_year,ar.Artist_id
from Songs as s
inner join Albums as a
on s.Album_id=a.Album_id
inner join Artists as ar
on ar.Artist_id=a.Artist_id
where ar.Artist_id in(select artist_id from albums group by Artist_id having count(Album_id)>1)

--23. Retrieve all albums along with the total number of songs.
Select a.album_title,count(s.song_title)
from songs as s
inner join albums as a
on a.album_id=s.Album_id
group by Album_title

--24. Retrieve all songs and release year and sort them by release year.
Select s.song_title,a.release_year
from songs as s
inner join albums as a
on a.album_id=s.Album_id
order by a.Release_year

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
select count(song_title),genre
from songs
group by genre
having count(song_title)>2

--26. List all artists who have albums that contain more than 3 songs.Select a.Album_title,ar.Artist_name,COUNT(s.song_title)
from Songs as s
inner join Albums as a
on s.Album_id=a.Album_id
inner join Artists as ar
on ar.Artist_id=a.Artist_id
group by a.Album_title,a.Album_title,ar.Artist_name
having count(s.Song_title)>3

--Part – C
--27. Retrieve albums that have been released in the same year as 'Album4'
Select album_title,release_year
from albums
where Release_year=(select Release_year from albums where album_title='Album4')  and not album_title='Album4'

--28. Find the longest song in each genre
Select genre,max(duration)
from songs
group by genre

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
Select s.song_title,a.album_title
from songs as s
inner join albums as a
on s.Album_id=a.Album_id
where a.Album_title like '%Album%'

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
Select sum(s.duration) as duration_total,ar.Artist_name
from Songs as s
inner join Albums as a
on s.Album_id=a.Album_id
inner join Artists as ar
on ar.Artist_id=a.Artist_id
group by ar.Artist_name
having sum(s.duration)>15