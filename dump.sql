-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: jsmalls128.mysql.pythonanywhere-services.com    Database: jsmalls128$web
-- ------------------------------------------------------
-- Server version	5.6.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acct_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sub` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('Jamal B',NULL,'1998-01-28','jsmalls128','Jamal123','owner',2,0),('James Cameron','yaBoi@gmail.com','1997-05-14','theguy','password','admin',3,0),('MATT','group2emails6050@gmail.com','1995-02-02','MATTTTTTTT','00000000','admin',4,1),('Chase Meusel','cam92233@uga.edu','1998-01-12','cam92233','pugco6-zaxmag-xyvxoD','customer',5,0),('asdflj','lksdjf@uga.edu','1998-05-05','sl;kdf','lksjfdal','vendor',6,0),('Rando','rando@uga.edu','1997-03-24','yourusser','Passs','customer',7,0),('dlskjfal;kdsjf','asldkfjal;dkfj','1998-04-14','asld;kfja;sldkfj','lksadfjal;dkfj','cutomer',8,0),('FirstName','jmballard3@gmail.com','1997-05-04','user','password','customer',10,0),('test1','jsmalls128@live.com','1997-05-04','test1','password','vendor',12,0),('This Name','yomma@uga.edu','1997-08-08','used','password','vendor',13,0),('Person','email@email.com','1997-01-01','hell','password','cust',14,0),('Person','email@email.com','1997-01-01','hell','password','cust',15,0),('Newadmin','admin@email.com','1995-04-14','admin','password','admin',16,0),('matt','group2emails6050@gmail.com','1995-02-02','MATTTTTTTT','00000000','admin',17,1),('Matt','group2emails6050@gmail.com','1995-02-02','matt','0','customer',18,1),('Myname','myemail@uga.edu','1998-05-05','name','password1','customer',19,0),('Chase Meusel','cam92233@uga.edu','1998-01-12','cam92233','helloWorld12','customer',20,0),('Autumn','aeb19951@uga.edu','1996-11-07','autumn','1234','customer',21,0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `add_line_1` text COLLATE utf8mb4_unicode_ci,
  `add_line_2` text COLLATE utf8mb4_unicode_ci,
  `state` text COLLATE utf8mb4_unicode_ci,
  `zip` tinyint(4) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `city` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('line1','','ga',127,0,'city'),('addressline1','','ga',127,0,'adminCity'),('My House','','GA',127,0,'Athens'),('address Line 1','','ga',127,0,'MyCity'),('175 Lumpkin','','GA',127,0,'Athens'),('359 Heritage Rd.','','Georgia',127,0,'Hartwell');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `subject` tinytext COLLATE utf8mb4_unicode_ci,
  `title` tinytext COLLATE utf8mb4_unicode_ci,
  `isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `price` float DEFAULT NULL,
  `pic_url` text COLLATE utf8mb4_unicode_ci,
  `promo` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('Sci-Fi','Ready Player One','9780307887443','Ernest Cline','In the year 2045, reality is an ugly place. The only time teenage Wade Watts really feels alive is when he\'s jacked into the virtual utopia known as the OASIS. Wade\'s devoted his life to studying the puzzles hidden within this world\'s digital confines—puzzles that are based on their creator\'s obsession with the pop culture of decades past and that promise massive power and fortune to whoever can unlock them. )\nBut when Wade stumbles upon the first clue, he finds himself beset by players willing to kill to take this ultimate prize. The race is on, and if Wade\'s going to survive, he\'ll have to win—and confront the real world he\'s always been so desperate to escape.',8.79,'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Ready_Player_One_cover.jpg/220px-Ready_Player_One_cover.jpg',10,12,NULL),('Fiction','The Outsiders','9781101642610','S.E. Hinton','No one ever said life was easy. But Ponyboy is pretty sure that he\'s got things figured out. He knows that he can count on his brothers, Darry and Sodapop. And he knows that he can count on his friends-true friends who would do anything for him, like Johnny and Two-Bit. But not on much else besides trouble with the Socs, a vicious gang of rich kids whose idea of a good time is beating up on “greasers” like Ponyboy. At least he knows what to expect-until the night someone takes things too far. The Outsiders is a dramatic and enduring work of fiction that laid the groundwork for the YA genre. S. E. Hinton\'s classic story of a boy who finds himself on the outskirts of regular society remains as powerful today as it was the day it was first published.',8.99,'https://books.google.com/books/content/images/frontcover/ha6GIYze5lEC?fife=w400-h600',0,15,NULL),('Horror','It','9781501141232','Stephen King','Welcome to Derry, Maine. It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real.They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But the promise they made twenty-eight years ago calls them reunite in the same place where, as teenagers, they battled an evil creature that preyed on the city’s children. Now, children are being murdered again and their repressed memories of that terrifying summer return as they prepare to once again battle the monster lurking in Derry’s sewers.',9.99,'https://books.google.com/books/content/images/frontcover/-rUACwAAQBAJ?fife=w400-h600',0,13,NULL),('Romance','Fifty Shades of Grey','9781612130293','E. L. James','When literature student Anastasia Steele goes to interview young entrepreneur Christian Grey, she encounters a man who is beautiful, brilliant, and intimidating. The unworldly, innocent Ana is startled to realize she wants this man and, despite his enigmatic reserve, finds she is desperate to get close to him. Unable to resist Ana’s quiet beauty, wit, and independent spirit, Grey admits he wants her, too—but on his own terms.Shocked yet thrilled by Grey’s singular erotic tastes, Ana hesitates. For all the trappings of success—his multinational businesses, his vast wealth, his loving family—Grey is a man tormented by demons and consumed by the need to control. When the couple embarks on a daring, passionately physical affair, Ana discovers Christian Grey’s secrets and explores her own dark desires.',5.99,'https://books.google.com/books/content/images/frontcover/qDP6NmRAPzsC?fife=w400-h600',10,11,NULL),('Help','The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life','9780062457738','Mark Manson','Manson advises us to get to know our limitations and accept them. Once we embrace our fears, faults, and uncertainties, once we stop running and avoiding and start confronting painful truths, we can begin to find the courage, perseverance, honesty, responsibility, curiosity, and forgiveness we seek.There are only so many things we can give a f**k about so we need to figure out which ones really matter, Manson makes clear. While money is nice, caring about what you do with your life is better, because true wealth is about experience. A much-needed grab-you-by-the-shoulders-and-look-you-in-the-eye moment of real-talk, filled with entertaining stories and profane, ruthless humor, The Subtle Art of Not Giving a F**k is a refreshing slap for a generation to help them lead contented, grounded lives.',7.99,'https://books.google.com/books/content/images/frontcover/yng_CwAAQBAJ?fife=w200-h300',0,11,NULL),('Help','The Art of War','9789380914893','Sun Tzu','The Art of War is a translation of Sun Tzu’s originally written book on battle strategies by author James Clavell. Sun Tzu believed war to be an essential wrongdoing that must be got rid of whenever it can be. The war should be fought fleetingly to reduce economic decline. Sun Tzu harped on the significance of placement in military tactics. The planning to position an army must be dependent on the stipulations in the physical surroundings and the subjective thoughts of various militants in those conditions. He believed that strategy cannot be considered as planning with respect to glancing through a previously decided list. It is better represented by the fact that it needs speedy and suitable reactions to altering situations. Planning gives results in restrained surroundings. But in case of an altering environment, similar plans come in each other’s ways and give rise to undesired outcomes. The book has been a profound factor in the workings of Eastern and Western military strategies, business planning, legal thought processes, and more.',8.99,'https://books.google.com/books/content/images/frontcover/yec-DAAAQBAJ?fife=w400-h600',0,11,NULL),('Fiction','Moby Dick','9781504041195','Herman Melville','Despite strange warnings, Ishmael, a young schoolteacher from Manhattan, signs up for a voyage aboard the Pequod, a whaling ship departing from New Bedford, Massachusetts. While on shore, he strikes up a friendship with Queequeg, a tattooed South Seas cannibal. The unlikely friends are hired for the journey—only to discover their commander will be Captain Ahab, a brooding, one-legged, tyrannical old man fixated on avenging Moby Dick, the great white whale who crippled him.',8.99,'https://books.google.com/books/content/images/frontcover/lv0lDQAAQBAJ?fife=w400-h600',0,15,NULL),('Fiction','Treasure Island','9781773130439','Robert Louis Stevenson','Treasure Island is an adventure novel by Scottish author Robert Louis Stevenson, narrating a tale of \"buccaneers and buried gold\". It was originally serialized in the childrens magazine Young Folks between 1881 through 1882 under the title Treasure Island, or the mutiny of the Hispaniola, credited to the pseudonym \"Captain George North\". It was first published as a book on 14 November 1883 by Cassell & Co. Treasure Island is traditionally considered a coming-of-age story, and is noted for its atmosphere, characters, and action. It is also noted as a wry commentary on the ambiguity of morality—as seen in Long John Silver—unusual for childrens literature. It is one of the most frequently dramatized of all novels. Its influence is enormous on popular perceptions of pirates, including such elements as treasure maps marked with an \"X\", schooners, the Black Spot, tropical islands, and one-legged seamen bearing parrots on their shoulders.',8.99,'https://books.google.com/books/content/images/frontcover/KMkDDQAAQBAJ?fife=w400-h600',0,12,NULL),('Jesus','The Holy Bible: King James Version','9783736801493','King James Version','The Holy Bible. As interpreted in the King James Version.',8.99,'https://books.google.com/books/content/images/frontcover/WFxoAwAAQBAJ?fife=w400-h600',0,12,NULL),('History','The Communist Manifesto','9780857190079','Karl Marx','This book is essential for anyone seeking to understand the history of the 19th and 20th centuries. Comprehending the motives and actions of many of its leading figures is impossible unless one has read this key text. \'The Communist Manifesto\' left its mark upon the souls of leaders and rebels alike and shaped the deeds of whole nations for the greater part of 100 years. It could also be said to have led indirectly to the violent death of hundreds of millions of people.',7.99,'https://books.google.com/books/content/images/frontcover/0D3y6YG0z6sC?fife=w400-h600',10,11,NULL),('Fiction','The Three Musketeers','9781504033800','Alexandre Dumas','D’Artagnan journeys to Paris armed with nothing but his sword, his courage, and a burning desire to prove his mettle as a member of King Louis XIII’s elite guardsmen. A swashbuckling corps of gentlemen rogues, the Musketeers live to antagonize Cardinal Richelieu and sweep every woman in France off her feet. Before d’Artagnan can join their ranks, however, he must distinguish himself on the field of battle.',8.99,'https://books.google.com/books/content/images/frontcover/4VpsCwAAQBAJ?fife=w400-h600',0,11,NULL),('Science','The Theory of Relativity: And Other Essays','9781453204696','Albert Einstein','In this collection of his seven most important essays on physics, Einstein guides his reader step-by-step through the many layers of scientific theory that formed a starting point for his discoveries. By both supporting and refuting the theories and scientific efforts of his predecessors, Einstein reveals in a clear voice the origins and meaning of such significant topics as physics and reality, the fundamentals of theoretical physics, the common language of science, the laws of science and of ethics, and an elementary derivation of the equivalence of mass and energy.',8.99,'https://books.google.com/books/content/images/frontcover/Smz0WDomeqAC?fife=w400-h600',0,13,NULL),('Fiction','Alice\'s Adventures in Wonderland','9780007382484','Lewis Carroll','‘Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, “and what is the use of a book,” thought Alice, “without pictures or conversations?”’ So begins the tale of Alice, who follows a curious White Rabbit down a hole and falls into Wonderland, a fantastical place where nothing is quite as it seems: animals talk, nonsensical characters confuse, Mad Hatters throw tea parties and the Queen plays croquet. Alice’s attempts to find her way home become increasingly bizarre, infuriating and amazing in turn.',7.99,'https://books.google.com/books/content/images/frontcover/sK4x05-Mk8wC?fife=w400-h600',0,15,NULL),('Love','Twilight','9780316007443','Stephenie Meyer','Isabella Swan\'s move to Forks, a small, perpetually rainy town in Washington, could have been the most boring move she ever made. But once she meets the mysterious and alluring Edward Cullen, Isabella\'s life takes a thrilling and terrifying turn. Up until now, Edward has managed to keep his vampire identity a secret in the small community he lives in, but now nobody is safe, especially Isabella, the person Edward holds most dear. The lovers find themselves balanced precariously on the point of a knife-between desire and danger.Deeply romantic and extraordinarily suspenseful, Twilight captures the struggle between defying our instincts and satisfying our desires. This is a love story with bite.',8.99,'https://books.google.com/books/content/images/frontcover/ZfjzX7M8zt0C?fife=w200-h300',0,14,NULL),('Mystery','The Da Vinci Code','9786022911845','Dan Brown','While in Paris, Harvard symbologist Robert Langdon is awakened by a phone call in the dead of the night. The elderly curator of the Louvre has been murdered inside the museum, his body covered in baffling symbols. As Langdon and gifted French cryptologist Sophie Neveu sort through the bizarre riddles, they are stunned to discover a trail of clues hidden in the works of Leonardo da Vinci—clues visible for all to see and yet ingeniously disguised by the painter.',8.99,'https://books.google.com/books/content/images/frontcover/6-pmDwAAQBAJ?fife=w400-h600',0,11,NULL),('Math','Testbook','9780999443385','MathAuthor','This is a mathbook',2.99,'https://images-na.ssl-images-amazon.com/images/I/51swYFwZs0L._SX384_BO1,204,203,200_.jpg',0,20,8);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cust_id` varchar(50) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('autumn','9780307887443',2),('cam92233','9781501141232',3),('cam92233','9780062457738',5),('autumn','9789380914893',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `customer_id` int(11) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `ship_add` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `items` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-27 23:56:05
