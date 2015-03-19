CREATE DATABASE  IF NOT EXISTS `BookStore` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `BookStore`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: BookStore
-- ------------------------------------------------------
-- Server version	5.6.19-enterprise-commercial-advanced

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `Book ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `BookCoverPath` varchar(80) DEFAULT NULL,
  `BookDescription` text,
  `Edition` varchar(10) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `Publisher` varchar(50) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `ISBN_10` varchar(20) DEFAULT NULL,
  `ISBN_13` varchar(20) DEFAULT NULL,
  `Price` decimal(4,2) DEFAULT NULL,
  `InvQty` int(11) DEFAULT NULL,
  `bookRating` decimal(4,2) NOT NULL DEFAULT '5.00',
  PRIMARY KEY (`Book ID`),
  UNIQUE KEY `ISBN-10_UNIQUE` (`ISBN_10`),
  UNIQUE KEY `ISBN-13_UNIQUE` (`ISBN_13`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Cracking the Coding Interview: 150 Programming Questions and Solutions','Gayle Laakmann McDowell','41wgksZup2L.jpg','Now in the 5th edition, Cracking the Coding Interview gives you the interview preparation you need to get the top software developer jobs. This is a deeply technical book and focuses on the software engineering skills to ace your interview. The book is over 500 pages and includes 150 programming interview questions and answers, as well as other advice. \n\nThe full list of topics are as follows:\n\n\n\nThe Interview Process\nThis section offers an overview on questions are selected and how you will be evaluated. What happens when you get a question wrong? When should you start preparing, and how? What language should you use? All these questions and more are answered.\n\n\n\nBehind the Scenes\nLearn what happens behind the scenes during your interview, how decisions really get made, who you interview with, and what they ask you. Companies covered include Google, Amazon, Yahoo, Microsoft, Apple and Facebook.\n\n\nSpecial Situations\nThis section explains the process for experience candidates, Program Managers, Dev Managers, Testers / SDETs, and more. Learn what your interviewers are looking for and how much code you need to know.\n\nBefore the Interview\nIn order to ace the interview, you first need to get an interview. This section describes what a software engineer\'s resume should look like and what you should be doing well before your interview.\n\n\nBehavioral Preparation\nAlthough most of a software engineering interview will be technical, behavioral questions matter too. This section covers how to prepare for behavioral questions and how to give strong, structured responses.\n\nTechnical Questions (+ 5 Algorithm Approaches)\nThis section covers how to prepare for technical questions (without wasting your time) and teaches actionable ways to solve the trickiest algorithm problems. It also teaches you what exactly \"good coding\" is when it comes to an interview.\n\n\n150 Programming Questions and Answers\nThis section forms the bulk of the book. Each section opens with a discussion of the core knowledge and strategies to tackle this type of question, diving into exactly how you break down and solve it. Topics covered include \n	•	Arrays and Strings\n	•	Linked Lists\n	•	Stacks and Queues\n	•	Trees and Graphs\n	•	Bit Manipulation\n	•	Brain Teasers\n	•	Mathematics and Probability\n	•	Object-Oriented Design\n	•	Recursion and Dynamic Programming\n	•	Sorting and Searching\n	•	Scalability and Memory Limits\n	•	Testing\n	•	C and C++\n	•	Java\n	•	Databases\n	•	Threads and Locks\nFor the widest degree of readability, the solutions are almost entirely written with Java (with the exception of C / C++ questions). A link is provided with the book so that you can download, compile, and play with the solutions yourself.\n\n	•	\n\nChanges from the Fourth Edition: The fifth edition includes over 200 pages of new content, bringing the book from 300 pages to over 500 pages. Major revisions were done to almost every solution, including a number of alternate solutions added. The introductory chapters were massively expanded, as were the opening of each of the chapters under Technical Questions. In addition, 24 new questions were added.\n\n\nCracking the Coding Interview, Fifth Edition is the most expansive, detailed guide on how to ace your software development / programming interviews.','5th',2011,'CareerCup','Computers & Technology','098478280X','978-0984782802',30.05,20,3.50),(2,'The Hobbit','J.R.R. Tolkien','41aQPTCmeVL.jpg','In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.\nWritten for J.R.R. TolkienÃƒÂ¢Ã¢Â‚Â¬Ã¢Â„Â¢s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001). Unforgettable!','1st',2012,'HMH Books for Young Readers','Science Fiction & Fantasy','054792822X','978-0547928227',11.32,15,5.00),(4,'The Hunger Games (Book 1)','Suzanne Collins','41bOj-am1RL.jpg','In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. Long ago the districts waged war on the Capitol and were defeated. As part of the surrender terms, each district agre...','1st',2010,'Scholastic Press','Literature &  Fiction','9780439023528','978-0439023528',10.99,5,4.00),(35,'Rise of the Dragons (Kings and Sorcerers--Book 1)','Morgan Rice','81e0b4DpWQL.jpg','\"All the ingredients are here for an instant success: plots, counterplots, mystery, valiant knights, and blossoming relationships replete with broken hearts, deception and betrayal. It will keep you entertained for hours, and will satisfy all ages. Recommended for the permanent library of all fantasy readers.\" -Books and Movie Reviews, Roberto Mattos (regarding A Quest of Heroes) From #1 Bestselling author Morgan Rice comes a sweeping new epic fantasy series: RISE OF THE DRAGONS (KINGS AND SORCERERS-Book 1). Kyra, 15, dreams of becoming a famed warrior, like her father, even though she is the only girl in a fort of boys. As she struggles to understand her special skills, her mysterious inner power, she realizes she is different than the others. But a secret is being kept from her about her birth and the prophecy surrounding her, leaving her to wonder who she really is. When Kyra comes of age and the local lord comes to take her away, her father wants to wed her off to save her. Kyra, though, refuses, and she journeys out on her own, into a dangerous wood, where she encounters a wounded dragon-and ignites a series of events that will change the kingdom forever. 15 year old Alec, meanwhile, sacrifices for his brother, taking his place in the draft, and is carted off to The Flames, a wall of flames a hundred feet high that wards off the army of Trolls to the east. On the far side of the kingdom, Merk, a mercenary striving to leave behind his dark past, quests through the wood to become a Watcher of the Towers and help guard the Sword of Fire, the magical source of the kingdom\'s power. But the Trolls want the Sword, too-and they prepare for a massive invasion that could destroy the kingdoms forever. With its strong atmosphere and complex characters, RISE OF THE DRAGONS is a sweeping saga of knights and warriors, of kings and lords, of honor and valor, of magic, destiny, monsters and dragons. It is a story of love and broken hearts, of deception, of ambition and betrayal. It is fantasy at its finest, inviting us into a world that will live with us forever, one that will appeal to all ages and genders. Book #2 in KINGS AND SORCERERS will be published soon. \"[An] entertaining epic fantasy.\" -Kirkus Reviews (regarding A Quest of Heroes) \"The beginnings of something remarkable are there.\" --San Francisco Book Review (regarding A Quest of Heroes) \"Action-packed .... Rice\'s writing is solid and the premise intriguing.\" --Publishers Weekly (regarding A Quest of Heroes) \"A spirited fantasy ....Only the beginning of what promises to be epic young adult series.\" --Midwest Book Review (regarding A Quest of Heroes)','1st',2015,'Morgan Rice','Science Fiction & Fantasy','1632911574','978-1632911575',6.99,25,0.00),(37,'Teach Yourself to Play Guitar: A Quick and Easy Introduction for Beginners','David M. Brewster','51bqZ84+ryL.jpg','(Guitar Educational). Teach Yourself to Play Guitar has been created specifically for the student with no music-reading background. With lesson examples presented in today\'s most popular tab format, which also incorporates simple beat notation for accurate rhythm execution, Teach Yourself to Play Guitar offers the beginning guitarist not only a comprehensive introduction to essential guitar-playing fundamentals, but a quick, effective, uncomplicated and practical alternative to the multitude of traditional self-instructional method books. It also: covers power chords, barre chords, open position scales and chords (major and minor), and single-note patterns and fills; includes lesson examples and song excerpts in a variety of musical styles rock, folk, classical, country and more; familiarizes the student with fretboard organization, chord patterns, hand and finger positions, and guitar anatomy by way of easy-to-interpret diagrams, photos and illustrations; provides complete, concise explanations while keeping text to a minimum; and prepares the student for the option of further guitar instruction.','1st',2004,'Hal Leonard','Arts & Photography Books','0634065408','978-0634065408',3.99,10,0.00),(38,'H is for Hawk','Helen Macdonald','51KopYLR1IL.jpg','When Helen Macdonald\'s father died suddenly on a London street, she was devastated. An experienced falconerÃƒÂ¢??Helen had been captivated by hawks since childhoodÃƒÂ¢??she\'d never before been tempted to train one of the most vicious predators, the goshawk. But in her grief, she saw that the goshawk\'s fierce and feral temperament mirrored her own. Resolving to purchase and raise the deadly creature as a means to cope with her loss, she adopted Mabel, and turned to the guidance of The Once and Future King author T.H. White\'s chronicle The Goshawk to begin her challenging endeavor. Projecting herself \"in the hawk\'s wild mind to tame her\" tested the limits of Macdonald\'s humanity and changed her life.\r\n\r\nHeart-wrenching and humorous, this book is an unflinching account of bereavement and a unique look at the magnetism of an extraordinary beast, with a parallel examination of a legendary writer\'s eccentric falconry. Obsession, madness, memory, myth, and history combine to achieve a distinctive blend of nature writing and memoir from an outstanding literary innovator.','1st',2015,'Grove Press','Biographies & Memoirs','0802123414','978-0802123411',26.00,7,0.00),(39,'The Legend of Zelda: Hyrule Historia','Patrick Thorpe','71nEFeE9mTL.jpg','Dark Horse Books and Nintendo team up to bring you The Legend of Zelda: Hyrule Historia, containing an unparalleled collection of historical information on The Legend of Zelda franchise. This handsome hardcover contains never-before-seen concept art, the full history of Hyrule, the official chronology of the games, and much more! Starting with an insightful introduction by the legendary producer and video-game designer of Donkey Kong, Mario, and The Legend of Zelda, Shigeru Miyamoto, this book is crammed full of information about the storied history of Link\'s adventures from the creators themselves! As a bonus, The Legend of Zelda: Hyrule Historia includes an exclusive comic by the foremost creator of The Legend of Zelda manga ÃƒÂ¢?? Akira Himekawa!','1st',2013,'Dark Horse Books','Comics & Graphic Novels','1616550414','978-1616550417',19.63,6,4.33),(40,'HTML and CSS: Design and Build Websites','Jon Duckett','7138xb2kxSL.jpg','A full-color introduction to the basics of HTML and CSS from the publishers of Wrox! \r\n\r\nEvery day, more and more people want to learn some HTML and CSS. Joining the professional web designers and programmers are new audiences who need to know a little bit of code at work (update a content management system or e-commerce store) and those who want to make their personal blogs more attractive. Many books teaching HTML and CSS are dry and only written for those who want to become programmers, which is why this book takes an entirely new approach.\r\n\r\n    Introduces HTML and CSS in a way that makes them accessible to everyoneÃƒÂ¢??hobbyists, students, and professionalsÃƒÂ¢??and itÃƒÂ¢??s full-color throughout\r\n    Utilizes information graphics and lifestyle photography to explain the topics in a simple way that is engaging\r\n    Boasts a unique structure that allows you to progress through the chapters from beginning to end or just dip into topics of particular interest at your leisure\r\n\r\nThis educational book is one that you will enjoy picking up, reading, then referring back to. It will make you wish other technical topics were presented in such a simple, attractive and engaging way!\r\n\r\nThis book is also available as part of a set in hardcover - Web Design with HTML, CSS, JavaScript and jQuery, 9781119038634; and in softcover - Web Design with HTML, CSS, JavaScript and jQuery, 9781118907443.','1st',2014,'Wiley','Computers & Technology','1118008189','978-1118008188',30.21,10,0.00),(55,'Future Crimes: Everything Is Connected, Everyone Is Vulnerable and What We Can Do About It','Marc Goodman','41J-aMNFTeL.jpg','Technological advances have benefited our world in immeasurable ways, but there is an ominous flip side: our technology can be turned against us. Hackers can activate baby monitors to spy on families, thieves are analyzing social media posts to plot home invasions, and stalkers are exploiting the GPS on smart phones to track their victimsÃƒÂ¢?? every move. We all know todayÃƒÂ¢??s criminals can steal identities, drain online bank accounts, and wipe out computer servers, but thatÃƒÂ¢??s just the beginning. To date, no computer has been created that could not be hackedÃƒÂ¢??a sobering fact given our radical dependence on these machines for everything from our nationÃƒÂ¢??s power grid to air traffic control to financial services. \r\n     Yet, as ubiquitous as technology seems today, just over the horizon is a tidal wave of scientific progress that will leave our heads spinning. If todayÃƒÂ¢??s Internet is the size of a golf ball, tomorrowÃƒÂ¢??s will be the size of the sun. Welcome to the Internet of Things, a living, breathing, global information grid where every physical object will be online. But with greater connections come greater risks. Implantable medical devices such as pacemakers can be hacked to deliver a lethal jolt of electricity and a carÃƒÂ¢??s brakes can be disabled at high speed from miles away. Meanwhile, 3-D printers can produce AK-47s, bioterrorists can download the recipe for Spanish flu, and cartels are using fleets of drones to ferry drugs across borders.\r\n     With explosive insights based upon a career in law enforcement and counterterrorism, Marc Goodman takes readers on a vivid journey through the darkest recesses of the Internet. Reading like science fiction, but based in science fact, Future Crimes explores how bad actors are primed to hijack the technologies of tomorrow, including robotics, synthetic biology, nanotechnology, virtual reality, and artificial intelligence. These fields hold the power to create a world of unprecedented abundance and prosperity. But the technological bedrock upon which we are building our common future is deeply unstable and, like a house of cards, can come crashing down at any moment.\r\n     Future Crimes provides a mind-blowing glimpse into the dark side of technological innovation and the unintended consequences of our connected world. Goodman offers a way out with clear steps we must take to survive the progress unfolding before us. Provocative, thrilling, and ultimately empowering, Future Crimes will serve as an urgent call to action that shows how we can take back control over our own devices and harness technologyÃƒÂ¢??s tremendous power for the betterment of humanityÃƒÂ¢??before itÃƒÂ¢??s too late.','1st',2015,'Doubleday','Law','0385539002','978-0385539005',21.13,4,0.00),(56,'The Girl on the Train: A Novel','Paula Hawkins','81ZkF0csOZL.jpg','Rachel takes the same commuter train every morning. Every day she rattles down the track, flashes past a stretch of cozy suburban homes, and stops at the signal that allows her to daily watch the same couple breakfasting on their deck. SheÃƒÂ¢??s even started to feel like she knows them. ÃƒÂ¢??Jess and Jason,ÃƒÂ¢?? she calls them. Their lifeÃƒÂ¢??as she sees itÃƒÂ¢??is perfect. Not unlike the life she recently lost.\r\n\r\nAnd then she sees something shocking. ItÃƒÂ¢??s only a minute until the train moves on, but itÃƒÂ¢??s enough. Now everythingÃƒÂ¢??s changed. Unable to keep it to herself, Rachel offers what she knows to the police, and becomes inextricably entwined in what happens next, as well as in the lives of everyone involved. Has she done more harm than good?\r\n\r\nCompulsively readable, The Girl on the Train is an emotionally immersive, Hitchcockian thriller and an electrifying debut.','1st',2015,'Riverhead Books','Literature & Fiction','1594633665','978-1594633669',16.17,12,0.00),(57,'Dragon Champion (Age of Fire, Book 1)','E. E. Knight','51MWGzWGOKL.jpg','After escaping those who killed his siblings, Young Auron, a rare, defenseless gray dragon, fears he might be the last of his breed. Armed with nothing but his claws and a boundless determination to survive, he sets off in search of his kind. But to find other dragons-or, at least, find out who\'s killing them off-Auron will have to search a world of mercenary elves, vicious humans, and dangers of all kinds. Finding allies in the strangest places-and himself along the way-Auron is on the trek of a lifetime.','1st',2005,'Roc','Science Fiction & Fantasy','0451460472','978-0451460479',10.88,8,0.00),(66,'Catching Fire (The Second Book of the Hunger Games)','Suzanne Collins','51sdYzYGOuL.jpg','Against all odds, Katniss Everdeen has won the annual Hunger Games with fellow district tribute Peeta Mellark. But it was a victory won by defiance of the Capitol and their harsh rules. Katniss and Peeta should be happy. After all, they have just won for themselves and their families a life of safety and plenty. But there are rumors of rebellion among the subjects, and Katniss and Peeta, to their horror, are the faces of that rebellion. The Capitol is angry. The Capitol wants revenge.\r\n','1st',2013,'Scholastic','Science Fiction & Fantasy','0545586178','978-0545586177',8.32,20,4.50),(67,'Tonight and Always','Nora Roberts','81rjEy5yg-L.jpg','For a change of pace, renowned anthropologist Kasey Wyatt takes a job working for bestselling author Jordan Taylor, who needs helps researching his latest novel about the Plains Indians.\r\n\r\nUpon arriving at Jordan?s impressive Palm Springs estate, Kasey finds all the trappings of a family, but none of the warmth. Jordan?s forbidding mother is immediately suspicious of her, while Jordan?s shy and serious orphaned niece represses her curiosity. Jordan himself is an expert at hiding his emotions behind an aristocratic facade.\r\n\r\nHardly the quiet and bookish woman they were all expecting, Kasey infuses their lives with light and laughter. And suddenly Jordan finds himself drawn to a woman unlike any he has ever desired, one who is able to transform his day-to-day existence into a life worth living?','1st',2014,'Berkley','Romance','0425276791','978-0425276792',10.16,4,0.00),(68,'NightBird','Alice Hoffman','51errxztrCL.jpg','In her first novel for middle-grade readers , bestselling author Alice Hoffman tells a bewitching story of love and friendship that is truly magical.\r\n \r\nTwig lives in Sidwell, where people whisper that fairy tales are real. After all, her town is rumored to hide a monster. And two hundred years ago, a witch placed a curse on Twig?s family that was meant to last forever. But this summer, everything will change when the red moon rises. It?s time to break the spell.\r\n','1st',2015,'Wendy','Children\'s Books','0385389590','978-0385389594',19.99,10,0.00);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booktransaction`
--

DROP TABLE IF EXISTS `booktransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booktransaction` (
  `Book_Book ID` int(11) NOT NULL,
  `OrderQuantity` int(11) DEFAULT NULL,
  `Transaction_Order` int(11) NOT NULL,
  PRIMARY KEY (`Book_Book ID`,`Transaction_Order`),
  KEY `fk_BookTransaction_Transaction1_idx` (`Transaction_Order`),
  KEY `fk_BookTransaction_Book1_idx` (`Book_Book ID`),
  CONSTRAINT `fk_BookTransaction_Book1` FOREIGN KEY (`Book_Book ID`) REFERENCES `book` (`Book ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookTransaction_Transaction1` FOREIGN KEY (`Transaction_Order`) REFERENCES `transaction` (`Order`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booktransaction`
--

LOCK TABLES `booktransaction` WRITE;
/*!40000 ALTER TABLE `booktransaction` DISABLE KEYS */;
INSERT INTO `booktransaction` VALUES (1,1,1),(2,3,1),(4,1,1);
/*!40000 ALTER TABLE `booktransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `Ratings ID` int(11) NOT NULL AUTO_INCREMENT,
  `Stars` enum('1','2','3','4','5') DEFAULT NULL,
  `Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Comments` varchar(1000) DEFAULT NULL,
  `User_User ID` int(11) NOT NULL,
  `Book_Book ID` int(11) NOT NULL,
  PRIMARY KEY (`Ratings ID`,`User_User ID`,`Book_Book ID`),
  KEY `fk_Ratings_Book1_idx` (`Book_Book ID`),
  KEY `fk_Ratings_User1_idx` (`User_User ID`),
  CONSTRAINT `fk_Ratings_Book1` FOREIGN KEY (`Book_Book ID`) REFERENCES `book` (`Book ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ratings_User1` FOREIGN KEY (`User_User ID`) REFERENCES `user` (`User ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (2,'5','2015-02-25 00:26:16','Amazing\r\nRead it many many times',2,2),(3,'4','2015-02-25 00:26:16','MOvies have been good .  Didnt read the book',2,4),(4,'5','2015-02-25 00:26:16','favorite book of my life',1,2),(5,'4','2015-02-25 00:26:16','I thought this was really good.',3,4),(6,'3','2015-02-25 00:26:16','meh',2,1),(7,'3','2015-02-25 00:26:16','good resource for interviewing',3,1),(8,'3','2015-03-10 16:50:41','nice',4,1),(10,'5','2015-03-10 16:54:38','The Legend of Zelda: Hyrule Historia',5,39),(11,'5','2015-03-10 16:57:18','Bought this book 3 weeks before interview. Read the book twice with careful hand-writing practice on each question. Got Amazon offer. The interview had 4 questions and one was in the book. The other 3 were not in the book. This book will not prevent you from getting new questions during interviews. But it does cover most of the common areas that interviewers are interested in. Once you are familiar with the solutions, you have the skills and confidence to solve new questions during interviews.',1,1),(12,'4','2015-03-10 17:08:22','With my video reviews I usually try to include an extended text section to go with the video. However, since my video is already about 7 minutes long, I will try and make the text part of my review smaller. With the video I tried to give you a quick look at most of the sections of Hyrule Historia. Now the lighting may not be perfect and my camera may be too close at times, but hopefully you get an idea of what the book and most of the sections within it look like.\n\nThe book itself is really well put together, and is as good in quality as another Dark Horse book I own, The Art of Alice Madness Returns. Both books look exactly the same in terms of dimensions, and overall print quality. Binding is also very good so you should not worry about it coming apart from looking or reading through it too much.',1,39),(13,'4','2015-03-12 22:57:13','Great book',1,66),(14,'5','2015-03-12 22:58:03','Can I add two ratings',1,66),(15,'4','2015-03-13 02:18:02','Love the cover art',49,39);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `trans_view`
--

DROP TABLE IF EXISTS `trans_view`;
/*!50001 DROP VIEW IF EXISTS `trans_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `trans_view` (
  `Order` tinyint NOT NULL,
  `Tran Date` tinyint NOT NULL,
  `User_User ID` tinyint NOT NULL,
  `Book_Book ID` tinyint NOT NULL,
  `OrderQty` tinyint NOT NULL,
  `Title` tinyint NOT NULL,
  `Category` tinyint NOT NULL,
  `Price` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `Order` int(11) NOT NULL AUTO_INCREMENT,
  `Tran Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `User_User ID` int(11) NOT NULL,
  `Book_Book ID` int(11) NOT NULL,
  `OrderQty` int(11) NOT NULL,
  PRIMARY KEY (`Order`,`User_User ID`),
  KEY `fk_Transaction_User_idx` (`User_User ID`),
  KEY `fk_Book_Book ID_idx` (`Book_Book ID`),
  CONSTRAINT `fk_Transaction_User` FOREIGN KEY (`User_User ID`) REFERENCES `user` (`User ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'2015-03-04 13:50:22',2,1,3),(1,'2015-03-07 17:02:33',3,2,1),(2,'2015-03-07 15:52:16',3,4,1),(3,'2015-03-07 15:52:38',4,2,1),(5,'2015-03-12 17:55:21',1,1,1),(6,'2015-03-12 23:32:14',2,4,2);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User ID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(30) DEFAULT NULL,
  `FirstName` varchar(30) DEFAULT NULL,
  `Password` char(30) DEFAULT NULL,
  `Email Address` char(80) DEFAULT NULL,
  `SignUpDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `LastSignIn` datetime DEFAULT CURRENT_TIMESTAMP,
  `isAdmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`User ID`),
  UNIQUE KEY `Email Address_UNIQUE` (`Email Address`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ramos','Matthew','password','evramos@uw.edu','2015-02-25 00:26:16','2015-02-25 00:26:16',1),(2,'Heidgerken','David','password','david.heidgerken@gmail.com','2015-02-25 00:26:16','2015-02-25 00:26:16',1),(3,'Pidcock','Martha','password','marthapid@gmail.com','2015-02-25 00:26:16','2015-02-25 00:26:16',1),(4,'Walker','Jordan','password','jordoff@gmail.com','2015-02-25 00:26:16','2015-02-25 00:26:16',0),(5,'Campbell','Perry','password','perryseattle@gmail.com','2015-02-25 00:26:16','2015-02-25 00:26:16',0),(6,'Morse','David','password','morse808@uw.edu','2015-02-25 00:26:16','2015-02-25 00:26:16',0),(48,'Christopher','Everett','password','everettzmv@mac.com','2015-03-12 19:38:43','2015-03-12 19:38:43',0),(49,'Temp Last','Temp Name','pass','Temp Email','2015-03-13 02:17:07','2015-03-13 02:17:07',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `trans_view`
--

/*!50001 DROP TABLE IF EXISTS `trans_view`*/;
/*!50001 DROP VIEW IF EXISTS `trans_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trans_view` AS (select `transaction`.`Order` AS `Order`,`transaction`.`Tran Date` AS `Tran Date`,`transaction`.`User_User ID` AS `User_User ID`,`transaction`.`Book_Book ID` AS `Book_Book ID`,`transaction`.`OrderQty` AS `OrderQty`,`book`.`Title` AS `Title`,`book`.`Category` AS `Category`,`book`.`Price` AS `Price` from ((`transaction` join `book`) join `user`) where ((`transaction`.`Book_Book ID` = `book`.`Book ID`) and (`transaction`.`User_User ID` = `user`.`User ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-18 18:26:51
