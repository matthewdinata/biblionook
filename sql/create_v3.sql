-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 06, 2024 at 04:45 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblionook`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `publication_date` date DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `date_added` date NOT NULL,
  `fee` decimal(5,2) NOT NULL,
  `total_copies` int(11) NOT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `thumbnail_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `author`, `isbn`, `publication_date`, `genre`, `summary`, `date_added`, `fee`, `total_copies`, `is_featured`, `thumbnail_url`) VALUES
(1, '1000 Black Umbrella', 'J.K. Randall', '547-9-254-913', '2023-08-25', 'Dystopian', 'In a world teetering on the edge of technological collapse, a young archivist discovers a mysterious black umbrella that allows its wielder to access forgotten memories. As she delves deeper into its powers, she uncovers a conspiracy that threatens to unravel the very fabric of human consciousness. Through a series of increasingly dangerous encounters with shadowy government agents and rogue memory collectors, she must decide whether to use the umbrella\'s power to save humanity or destroy the dangerous artifact forever.', '2024-06-18', '2.00', 7, 0, 'https://bookcoverarchive.com/wp-content/uploads/2016/08/SquareSpace6.jpg'),
(2, 'The Everlasting', 'Ulysses Moore', '442-4-285-278', '2019-11-16', 'Fiction', 'Set in a small coastal town, The Everlasting follows three generations of women bound by a mysterious curse that grants them immortality at a terrible price. Each woman must sacrifice their firstborn child\'s memories to maintain their eternal life, creating a haunting cycle of loss and preservation. As the youngest generation comes of age, she searches for a way to break the curse while grappling with the weight of her family\'s centuries-old decisions.', '2024-07-30', '1.00', 1, 0, 'https://bookcoverarchive.com/wp-content/uploads/2020/07/The-Everlasting-final-cover.jpg'),
(3, 'The Visible Man: A Novel', 'Warren Smith', '664-7-071-201', '2019-12-30', 'Romance', 'When brilliant scientist Sarah Chen develops a serum that makes people temporarily invisible, she never expects to fall in love with her first test subject. Through their unique connection, they explore the boundaries of intimacy and trust while dealing with the ethical implications of invisibility. Their relationship is tested when a rival corporation threatens to steal the formula, forcing them to choose between protecting their discovery and preserving their unlikely romance.', '2024-03-05', '3.00', 9, 0, 'https://bookcoverarchive.com/wp-content/uploads/2015/10/visible-man.jpg'),
(4, 'Alena: A Novel', 'James Jacob', '675-2-685-864', '2018-01-19', 'Romance', 'Set against the backdrop of post-war Prague, Alena tells the story of a young pianist whose music has the supernatural ability to heal emotional trauma. As her reputation grows, she attracts the attention of a mysterious patron with dark motives. While helping others confront their past wounds, she must face her own buried memories and the price of wielding such extraordinary power.', '2024-01-19', '1.00', 5, 0, 'https://bookcoverarchive.com/wp-content/uploads/2015/12/alena.jpg'),
(5, 'Loop', 'Alice Sebold', '140-4-065-537', '2019-07-22', 'Fiction', 'In the aftermath of a devastating family tragedy, three sisters discover they can communicate with the deceased through hand-written letters left in a century-old mailbox. As they navigate their grief through these supernatural correspondences, they uncover long-buried family secrets that challenge everything they believed about their past. Their journey of healing becomes intertwined with a decades-old mystery that only they can solve.', '2024-05-04', '2.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/loop.jpg'),
(6, 'The Paradox of Choice', 'Cristina Henry', '510-9-957-144', '2016-04-25', 'Fantasy', 'In this dark reimagining of Red Riding Hood, a young witch discovers she can control wolves through ancient blood magic passed down through her grandmother\'s grimoire. As a mysterious plague turns humans into wolf-like creatures, she must journey through the cursed forest to find a cure. Along the way, she questions whether humanity deserves saving when the wolves seem more honorable than the humans who hunt them.', '2024-10-07', '2.50', 3, 0, 'https://bookcoverarchive.com/wp-content/uploads/amazon/the_paradox_of_choice.jpg'),
(8, 'Exit Strategy', 'Marcus Chen', '978-0-441-569', '2023-06-15', 'Thriller', 'A cybersecurity expert discovers a hidden backdoor in a major banking system, leading to a race against time to prevent a global financial collapse. As she delves deeper, she realizes the code contains patterns that seem impossibly familiar - patterns she wrote fifteen years ago.', '2024-03-15', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/exit_a.jpg'),
(9, 'About a Mountain', 'Rachel Carson', '978-1-338-671', '2023-09-22', 'Fiction', 'When an environmental journalist investigates a mysterious geological anomaly in Nevada\'s Mount Charleston, she uncovers a decades-old government secret that challenges everything we know about nuclear waste storage and its long-term effects on the surrounding ecosystem.', '2024-04-01', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/about_a_mountain.jpg'),
(10, 'No Longer Human', 'Haruki Sato', '978-0-062-445', '2023-07-10', 'Fiction', 'In near-future Tokyo, a consciousness researcher develops a revolutionary AI therapy program, only to discover his patients are becoming eerily inhuman in their perfection. As the line between enhancement and erasure blurs, he must confront the question of what truly makes us human.', '2024-02-10', '1.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/no_longer_human.large_.jpg'),
(11, 'Lost Decades', 'Alexandra Foster', '978-2-789-112', '2023-10-15', 'Mystery', 'A historical archivist stumbles upon a pattern of missing time periods in various cultures\' histories, all coinciding with major technological leaps. As she investigates these synchronized gaps, she begins experiencing mysterious time slips herself.', '2024-05-20', '2.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/lost_decades.large_.jpg'),
(12, 'Three Armies on the Somme', 'William Barrett', '978-4-567-223', '2023-08-18', 'Biographic', 'Through meticulous research and previously undiscovered personal letters, this gripping account reveals the untold story of three military forces that converged at the Battle of the Somme, changing the course of World War I and modern warfare forever.', '2024-06-05', '1.00', 7, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/three_armies_on_the_somme.jpg'),
(13, 'The Psychopath Test', 'Dr. Rachel Chang', '978-5-891-334', '2023-11-05', 'Thriller', 'A renowned psychiatrist develops a revolutionary test to identify psychopathic behavior, but when her research subjects begin disappearing, she realizes someone is using her work to target people who haven\'t yet committed any crimes.', '2024-07-15', '2.50', 5, 1, 'http://bookcoverarchive.com/wp-content/uploads/2017/01/psychopath-test.jpg'),
(14, 'Once Before Time', 'Prof. Stephen Morris', '978-6-789-445', '2023-12-20', 'Fiction', 'A quantum physicist\'s groundbreaking research into parallel universes leads to the discovery that our universe might be younger than we think, and that time itself might flow in multiple directions simultaneously.', '2024-08-01', '3.00', 4, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/once_before_time.jpg'),
(15, 'Smothered in Hugs', 'Emma Rodriguez', '978-7-123-556', '2024-01-15', 'Romance', 'In this heartwarming tale of found family, a grieving social worker starts a revolutionary therapy program using platonic touch to heal trauma. As her clients begin to heal, she discovers that sometimes the strongest embraces come from strangers.', '2024-09-10', '1.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/smothered_in_hugs.jpg'),
(16, 'Get Used to the Seats', 'James Liu', '978-8-234-667', '2024-02-08', 'Mystery', 'When an old theater\'s renovation reveals mysterious messages carved into the original seats, an architectural historian becomes obsessed with decoding their meaning, leading her down a rabbit hole of century-old disappearances and theatrical superstitions.', '2024-10-01', '3.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/get_used_to_the_seats.large_.jpg'),
(17, 'The Book of Strange New Things', 'Rev. Michael Palmer', '978-9-345-778', '2024-03-14', 'Fantasy', 'A missionary is sent to a distant space colony to minister to an alien species that has specifically requested Earth\'s religious texts. As he translates humanity\'s oldest stories for beings who have no concept of death, he discovers their interest may have darker implications.', '2024-10-15', '2.50', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2016/12/Book-of-Strange-New-Things.jpg'),
(18, 'The Last Skin', 'Nina Blackwood', '978-1-234-889', '2023-11-30', 'Horror', 'In a world where humans can transfer their consciousness between synthetic bodies, a body modification artist discovers a client\'s discarded skin that seems to be growing a consciousness of its own.', '2024-03-20', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/the_last_skin.large_.jpg'),
(19, 'LaserWriter II', 'David Chen', '978-2-567-334', '2023-12-05', 'Fiction', 'Set in the early days of desktop publishing, this nostalgic tech-noir follows a brilliant computer repair technician who discovers that certain printer malfunctions are actually encoding messages from another dimension.', '2024-04-15', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2021/07/0E82FD62-5563-4163-AAC8-40528C8DE6FC.jpeg'),
(20, 'Normal', 'Sarah Matthews', '978-3-789-445', '2024-01-10', 'Thriller', 'When a pioneering neuropsychologist develops a cure for anxiety, her patients begin experiencing an uncanny form of normalcy that spreads like a contagion, raising questions about the true nature of human emotions.', '2024-05-01', '2.50', 6, 1, 'http://bookcoverarchive.com/wp-content/uploads/2016/08/57bf083370c8c486642421.gif'),
(21, 'Politics and Partnerships', 'Dr. Robert Wilson', '978-4-890-567', '2023-10-25', 'Fiction', 'A behind-the-scenes look at how modern political alliances are forged through unlikely partnerships, following five interconnected stories of power brokers navigating the complex landscape of contemporary politics.', '2024-06-10', '1.00', 3, 1, 'http://bookcoverarchive.com/wp-content/uploads/2010/06/9780226109978.jpg'),
(22, 'You Think That\'s Bad', 'Michael Crown', '978-5-123-778', '2023-11-15', 'Thriller', 'A collection of interconnected stories following different characters who discover that their worst fears are just the beginning of a much darker reality unfolding around them.', '2024-07-20', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/you_think_thats_bad.jpg'),
(23, 'The Ghost Sequences', 'Isabella Night', '978-6-456-889', '2023-12-25', 'Horror', 'A data scientist develops an algorithm to analyze patterns in reported ghost sightings, only to discover that the hauntings follow a predictable sequence that\'s about to converge on her location.', '2024-08-05', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2020/12/Eo4nPUVXUAwAp83.jpeg'),
(24, 'That\'s When the Knives Come Down', 'Marcus Black', '978-7-789-990', '2024-01-20', 'Thriller', 'In a high-stakes restaurant kitchen, a celebrated chef\'s pursuit of the perfect dish leads to dangerous obsession when she discovers an ancient cookbook with recipes that seem to alter reality itself.', '2024-09-15', '2.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/10/TWTKCD_cover_front-640x1024.jpg'),
(25, 'The Science of the Bottom Line', 'Dr. Emily Richards', '978-8-901-123', '2024-02-05', 'Fiction', 'A behavioral economist uncovers a pattern in global markets that suggests human decision-making might be influenced by an invisible force, leading to a controversial theory that challenges everything we know about free will in capitalism.', '2024-10-01', '1.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/the_science_of_the_bottom_line.large_.jpg'),
(26, 'Birds of America', 'Catherine West', '978-9-012-234', '2023-11-10', 'Fiction', 'A lyrical collection of interconnected stories following the lives of various Americans whose paths cross with rare and extinct birds, exploring themes of loss, preservation, and the delicate balance between nature and civilization.', '2024-03-25', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/11/birds-of-america.jpg'),
(27, 'Romeo and Juliet', 'William Shakespeare', '978-0-123-345', '2023-12-15', 'Classic', 'This new annotated edition of Shakespeare\'s timeless romance features extensive historical context, cultural commentary, and newly discovered details about the play\'s original performances.', '2024-04-30', '1.00', 7, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/10/9780143128571.jpg'),
(28, 'Alena', 'Maria Pelling', '978-1-234-456', '2024-01-25', 'Mystery', 'When a young curator takes a position at a prestigious art museum, she becomes obsessed with the mysterious disappearance of her predecessor, uncovering a web of deceit spanning decades in the art world.', '2024-06-15', '2.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/12/alena.jpg'),
(29, 'Ugly Man', 'Victor Stone', '978-2-345-567', '2024-02-10', 'Fiction', 'A provocative exploration of beauty standards and identity in the digital age, following a social media influencer who wakes up one day to find his face mysteriously transformed.', '2024-07-25', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/ugly-man.jpg'),
(30, 'And Then There\'s This', 'Hannah Brooks', '978-3-456-678', '2023-11-20', 'Fiction', 'A meta-narrative about viral information and modern fame, following a journalist who becomes the subject of her own story when an investigation into meme culture takes an unexpected turn.', '2024-08-10', '2.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/and_then_theres_this.large_.jpg'),
(31, 'Mountain Tales', 'Daniel Reed', '978-4-567-789', '2023-12-30', 'Fiction', 'A deep dive into the controversy surrounding nuclear waste storage beneath Yucca Mountain, weaving together environmental science, local history, and personal narrative.', '2024-09-20', '2.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/about_a_mountain_1.large_.jpg'),
(32, 'Stolen World', 'Rebecca Sterling', '978-5-678-890', '2024-01-15', 'Thriller', 'An investigation into the underground rare animal trade becomes personal when a wildlife photographer discovers her own images are being used to facilitate illegal trafficking operations.', '2024-10-05', '2.50', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/stolen_world.jpg'),
(33, 'The Twelfth Night', 'William Shakespeare', '978-6-789-901', '2023-11-25', 'Classic', 'A lavishly annotated edition of Shakespeare\'s beloved comedy, featuring new research into the play\'s origins and its influence on modern romantic comedy.', '2024-03-30', '2.00', 7, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/10/Twelfth-Night.jpg'),
(34, 'How I Killed Pluto', 'Dr. Michael Brown', '978-7-890-012', '2023-12-20', 'Biographic', 'A firsthand account from the astronomer responsible for Pluto\'s demotion from planetary status, chronicling the scientific process and personal journey that led to this controversial decision.', '2024-05-05', '1.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/how_i_killed_pluto_and_why_it_had_it_coming.large_.jpg'),
(35, 'Witches of America', 'Alex Mar', '978-8-901-123', '2024-01-30', 'Fantasy', 'An immersive exploration of modern American witchcraft, following a skeptical documentarian who finds herself drawn into the world of contemporary paganism and magic.', '2024-06-20', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/10/witches-of-america.jpg'),
(36, 'Hamlet', 'William Shakespeare', '978-9-012-234', '2024-02-15', 'Classic', 'A groundbreaking new edition of Shakespeare\'s greatest tragedy, featuring contemporary analysis and newly discovered historical context about the play\'s creation.', '2024-07-30', '2.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/2015/10/9780143128540-1.jpg'),
(37, 'A Tenth of a Second', 'Dr. Lisa Chen', '978-0-111-222', '2023-11-30', 'Fiction', 'A scientific exploration of human perception and time, weaving together neuroscience, psychology, and personal narratives to understand how we experience the briefest moments of existence.', '2024-08-15', '3.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/06/9780226093192.jpg'),
(38, 'Not to Disturb', 'Grace Montgomery', '978-1-222-333', '2023-12-25', 'Thriller', 'During a stormy night at an isolated manor, the servants of a wealthy family follow an elaborate plan that seems to anticipate their employers\' every move, raising questions about who is really in control of the household.', '2024-08-15', '3.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/not_to_disturb.jpg'),
(39, 'Adland', 'Thomas Morrison', '978-2-333-444', '2024-01-10', 'Fiction', 'A former advertising executive provides an insider\'s view of the industry\'s golden age through the digital revolution, revealing how the art of persuasion has shaped modern culture and consciousness.', '2024-09-01', '1.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/adland.large_.jpg'),
(40, 'Political Writings 1953-1993', 'Prof. Martha Steele', '978-3-444-555', '2024-02-05', 'Biographic', 'A comprehensive collection of essays and articles spanning four decades, chronicling the evolution of political thought through the Cold War, civil rights movement, and the dawn of the digital age.', '2024-09-15', '1.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/political_writings_19531993.jpg'),
(41, 'To the End of the Land', 'David Grossman', '978-4-555-666', '2023-11-15', 'Fiction', 'A mother sets out on a journey across Israel to escape news of her son\'s military service, weaving together personal history and national destiny in a powerful meditation on love, loss, and the cost of war.', '2024-09-30', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/08/to_the_end_of_the_land.large_.jpg'),
(42, 'I Was a Dancer', 'Jacques d\'Amboise', '978-5-666-777', '2023-12-01', 'Biographic', 'A legendary ballet dancer recalls his journey from the streets of New York to the world\'s greatest stages, offering an intimate look at the dedication, passion, and physical toll of a life devoted to dance.', '2024-10-15', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/i_was_a_dancer.jpg'),
(43, 'Closing Time', 'Sarah Blake', '978-6-777-888', '2024-01-20', 'Fiction', 'On the last night of a historic Manhattan bar\'s existence, the lives of its patrons interweave in unexpected ways, revealing secrets and connections that have spanned decades in the city\'s changing landscape.', '2024-10-20', '2.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/closing_time.large_.jpg'),
(44, 'Imprint', 'Victoria Blake', '978-0-441-570', '2023-07-15', 'Mystery', 'A forensic document examiner discovers a series of mysterious imprints in ancient manuscripts that appear to predict future events. As she races to decode their meaning, she realizes the next prediction points to her own death.', '2024-03-20', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/imprint.jpg'),
(45, 'My Life at First Try', 'Alexander Chen', '978-1-338-672', '2023-08-22', 'Fiction', 'A humorous and poignant memoir of a Chinese immigrant who decides to restart his life completely at age 40, treating each new experience as if it were his first attempt at living.', '2024-04-05', '2.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/my_life_at_first_try.jpg'),
(46, 'The Good Life', 'Sophia Martinez', '978-0-062-446', '2023-09-10', 'Fiction', 'When a minimalist lifestyle guru\'s carefully curated world begins to unravel, she discovers that the perfect life she\'s been selling might be the biggest fraud of all.', '2024-02-15', '2.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_good_life.jpg'),
(47, 'On Wings of Song', 'Maria Rossetti', '978-2-789-113', '2023-10-25', 'Fantasy', 'In a world where music literally allows people to fly, a young opera singer discovers she can soar higher than anyone in history, attracting both wonder and dangerous attention.', '2024-05-25', '2.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/on_wings_of_song_1.jpg'),
(48, 'Race Riots', 'Dr. James Baldwin', '978-4-567-224', '2023-11-18', 'Biographic', 'A comprehensive historical analysis of racial tensions in American cities, examining the social, economic, and political factors that led to major civil unrest throughout the 20th century.', '2024-06-10', '1.50', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/race_riots.jpg'),
(49, 'The Box Man', 'Kobo Abe', '978-5-891-335', '2023-12-05', 'Fiction', 'A surreal tale of a man who abandons his identity to live in a cardboard box on Tokyo\'s streets, observing society from his unique vantage point while being pursued by a mysterious photographer.', '2024-07-20', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_box_man_a_novel.jpg'),
(50, 'Just After Sunset', 'Stephen King', '978-6-789-446', '2024-01-20', 'Horror', 'A collection of haunting stories that explore the thin line between dusk and darkness, where ordinary people face extraordinary horrors in the moments just after the sun goes down.', '2024-08-05', '3.00', 7, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/just_after_sunset_stories.jpg'),
(51, 'Killing Yourself to Live', 'Chuck Klosterman', '978-7-123-557', '2024-02-15', 'Fiction', 'A darkly comic road trip across America visiting the death sites of famous musicians, exploring the strange relationship between mortality and celebrity in popular culture.', '2024-09-15', '3.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/killing_yourself_to_live.jpg'),
(52, 'Faster', 'Dr. Marcus Swift', '978-8-234-668', '2024-03-08', 'Fiction', 'A scientific exploration of humanity\'s obsession with speed, from quantum physics to fast food, examining how our acceleration addiction is reshaping society.', '2024-10-01', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/faster_1.jpg'),
(53, 'Articles of Impeachment', 'Prof. Robert Mueller', '978-9-345-779', '2024-01-14', 'Biographic', 'A detailed examination of the constitutional process of presidential impeachment, analyzing historical cases and their impact on American democracy.', '2024-10-15', '3.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/articles_of_impeachment_against_george_w_bush.jpg'),
(54, 'Varieties of Disturbance', 'Lydia Davis', '978-1-234-890', '2023-11-30', 'Fiction', 'A collection of experimental short stories exploring the subtle disruptions in everyday life, from minor annoyances to existential crises, told with precision and wit.', '2024-03-25', '1.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/varieties_of_disturbance.jpg'),
(55, 'The Year of Magical Thinking', 'Joan Didion', '978-2-567-335', '2023-12-15', 'Biographic', 'A raw and honest memoir exploring grief and survival in the year following the author\'s husband\'s death, examining how loss transforms our understanding of life.', '2024-04-20', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_year_of_magical_thinking.jpg'),
(56, 'Nemesis', 'Isaac Thorne', '978-3-789-446', '2024-01-20', 'Thriller', 'When a series of seemingly random accidents turns out to be orchestrated revenge, a former prosecutor must confront a case she thought she\'d closed decades ago.', '2024-05-10', '1.50', 4, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/nemesis.jpg'),
(57, 'Secret Rendezvous', 'Elena Chang', '978-4-890-568', '2023-10-30', 'Romance', 'A mysterious invitation leads a lonely librarian into a hidden world of midnight meetings and masked strangers, where nothing is quite what it seems.', '2024-06-15', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/secret_rendezvous.jpg'),
(58, 'Say You\'re One of Them', 'Uwem Akpan', '978-5-123-779', '2023-11-25', 'Fiction', 'A powerful collection of stories told through the eyes of African children, each facing moral challenges that force them to confront the complexities of survival and identity.', '2024-07-25', '1.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/say_youre_one_of_them.jpg'),
(59, 'The Middle of the Night', 'Daniel Black', '978-7-890-013', '2023-12-30', 'Thriller', 'An insomniac photographer captures strange occurrences in his neighborhood between midnight and dawn, leading him to discover a hidden world that only exists in the darkest hours.', '2024-05-10', '1.00', 5, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_middle_of_the_night.jpg'),
(60, 'The Filth', 'Grant Morrison', '978-8-901-124', '2024-01-15', 'Fantasy', 'A surreal graphic novel about a secret organization that maintains order in a world increasingly destabilized by reality-bending phenomena and interdimensional threats.', '2024-06-25', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_filth_10.jpg'),
(61, 'Bodies', 'Dr. Alice Chen', '978-9-012-235', '2024-02-28', 'Fiction', 'A medical examiner begins to notice impossible similarities between unrelated bodies, leading her down a rabbit hole of scientific mystery and philosophical questions about identity.', '2024-07-15', '2.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/bodies.jpg'),
(62, 'The Manly Modern', 'Christopher Howard', '978-0-111-223', '2023-11-20', 'Fiction', 'An examination of masculinity in the post-war era, exploring how technological and social changes transformed traditional notions of manhood.', '2024-08-20', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_manly_modern.jpg'),
(63, 'The Clumsiest People in Europe', 'Todd Parker', '978-1-222-334', '2023-12-15', 'Fiction', 'A satirical travelogue based on Victorian-era guidebooks, poking fun at national stereotypes while revealing more about the observers than the observed.', '2024-09-05', '3.00', 4, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_clumsiest_people_in_europe.jpg'),
(64, 'The Glass Bead Game', 'Hermann Hesse', '978-2-333-445', '2024-01-30', 'Fiction', 'In a future scholarly society, an elite game combines all human knowledge into a complex competition of intellect and creativity, challenging the very nature of wisdom and learning.', '2024-09-15', '2.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_glass_bead_game.jpg'),
(65, 'American Nerd', 'Benjamin Nugent', '978-3-444-556', '2024-02-10', 'Fiction', 'A cultural history of the nerd archetype in American society, exploring how social outcasts became cultural innovators and technological pioneers.', '2024-09-30', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/american_nerd.jpg'),
(66, 'The Face of Another', 'Kobo Abe', '978-4-555-667', '2023-11-25', 'Fiction', 'A scientist, disfigured in an accident, creates a perfect mask that allows him to pass as someone else, leading to a disturbing exploration of identity and alienation.', '2024-10-15', '1.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_face_of_another.jpg'),
(67, 'Visual Shock', 'Michael Kammen', '978-5-666-778', '2023-12-10', 'Fiction', 'A provocative examination of controversial art in American history, exploring how visual culture has challenged and shaped social norms.', '2024-08-25', '1.00', 5, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/visual_shock.jpg'),
(68, 'Day of Empire', 'Amy Chua', '978-6-777-889', '2024-01-20', 'Fiction', 'A sweeping analysis of how history\'s hyperpowers rose to global dominance and why they eventually fell, offering crucial lessons for the modern world.', '2024-09-10', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/day_of_empire.jpg'),
(69, 'The Craftsman', 'Richard Sennett', '978-7-888-990', '2024-02-05', 'Fiction', 'An exploration of craftsmanship as a basic human impulse, examining the relationship between hand and mind in making things.', '2024-09-25', '3.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_craftsman.jpg'),
(70, 'The Girls Who Went Away', 'Ann Fessler', '978-8-999-001', '2024-02-20', 'Fiction', 'A powerful oral history of young women who were pressured to give up their babies for adoption in the decades before Roe v. Wade.', '2024-10-05', '3.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_girls_who_went_away.jpg'),
(71, 'Why Europe Will Run the 21st Century', 'Mark Leonard', '978-9-000-112', '2023-11-30', 'Fiction', 'A provocative analysis arguing that European-style soft power and institutional innovation will shape the future more than traditional military might.', '2024-10-20', '2.50', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/why_europe_will_run_the_21st_century.jpg'),
(72, 'Slow Down Arthur, Stick to Thirty', 'Harland Miller', '978-0-111-234', '2023-12-15', 'Fiction', 'A quirky road trip novel following an unlikely friendship between a speed-obsessed teenager and an elderly man determined to make him appreciate life\'s slower moments.', '2024-08-30', '1.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/slow_down_arthur_stick_to_thirty.jpg'),
(73, 'Pluralism', 'Dr. William James', '978-1-222-345', '2024-01-10', 'Fiction', 'A philosophical examination of how diverse beliefs and values can coexist in modern society, challenging both relativism and absolutism.', '2024-09-15', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/pluralism.jpg'),
(74, 'Esther\'s Inheritance', 'Sándor Márai', '978-2-333-456', '2024-02-25', 'Fiction', 'A haunting tale of love, betrayal, and the weight of the past, as a woman confronts the man who destroyed her life when he returns after twenty years.', '2024-09-30', '3.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/esthers_inheritance.jpg'),
(75, 'The Spatial Economy', 'Paul Krugman', '978-3-444-567', '2023-11-15', 'Fiction', 'A groundbreaking analysis of how geography and spatial relationships shape economic development and urban growth.', '2024-10-10', '2.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_spatial_economy.jpg'),
(76, 'The Black Death', 'Philip Ziegler', '978-4-555-678', '2023-12-20', 'Fiction', 'A comprehensive examination of how the medieval plague transformed European society, with startling parallels to modern pandemic responses.', '2024-10-25', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_black_death.jpg'),
(77, 'History in the Making', 'J.H. Elliott', '978-5-666-789', '2024-01-05', 'Fiction', 'A meditation on how historians shape our understanding of the past, examining the evolution of historical methodology and interpretation.', '2024-08-20', '2.50', 5, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/history_in_the_making.jpg'),
(78, 'The Feast of the Goat', 'Mario Vargas Llosa', '978-6-777-890', '2024-02-10', 'Fiction', 'A powerful novel about the final days of a Caribbean dictator, exploring the nature of power, corruption, and the long shadow of political violence.', '2024-09-05', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_feast_of_the_goat.jpg'),
(79, 'Steppenwolf', 'Hermann Hesse', '978-7-888-901', '2024-02-25', 'Classic', 'A philosophical novel about a lonely intellectual who struggles between his human and wolf-like natures, discovering a mysterious theater that changes his perspective on reality.', '2024-09-20', '3.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/steppenwolf.jpg'),
(80, 'The Ruined Map', 'Kobo Abe', '978-8-999-012', '2023-11-20', 'Mystery', 'A private detective\'s search for a missing husband becomes an existential journey as the investigation dissolves the boundaries between reality and imagination.', '2024-10-05', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_ruined_map.jpg'),
(81, 'The Girl Who Played with Fire', 'Stieg Larsson', '978-9-000-123', '2023-12-05', 'Thriller', 'Lisbeth Salander becomes the prime suspect in a murder investigation, forcing her to confront her past while trying to prove her innocence.', '2024-10-20', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_girl_who_played_with_fire.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `borrowing`
--

CREATE TABLE `borrowing` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrow_date` datetime NOT NULL,
  `due_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowing`
--

INSERT INTO `borrowing` (`id`, `user_id`, `book_id`, `borrow_date`, `due_date`) VALUES
(1, 3, 18, '2024-11-02 16:33:38', '2024-11-09 16:33:38'),
(2, 3, 13, '2024-11-02 16:58:12', '2024-11-03 23:00:03'),
(3, 3, 10, '2024-11-02 17:17:06', '2024-11-03 01:03:11'),
(4, 2, 13, '2024-11-02 17:45:42', '2024-11-09 17:45:42'),
(5, 2, 18, '2024-11-02 17:45:49', '2024-11-09 17:45:49'),
(6, 2, 10, '2024-11-02 17:45:56', '2024-11-03 15:08:34'),
(7, 4, 10, '2024-11-02 18:04:50', '2024-11-09 18:04:50'),
(8, 5, 26, '2024-11-03 10:13:12', '2024-11-03 17:13:36'),
(9, 5, 8, '2024-11-03 15:19:46', '2024-11-03 22:46:07'),
(10, 5, 44, '2024-11-03 15:21:17', '2024-11-02 00:00:00'),
(11, 5, 18, '2024-11-03 15:21:51', '2024-11-10 15:21:51'),
(12, 5, 20, '2024-11-03 15:22:33', '2024-11-10 15:22:33'),
(13, 3, 26, '2024-11-03 16:01:14', '2024-11-10 16:01:14'),
(15, 3, 42, '2024-11-03 15:07:21', '2024-11-03 15:07:38'),
(16, 2, 19, '2024-11-03 15:08:51', '2024-11-03 15:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `review_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `user_id`, `book_id`, `rating`, `title`, `content`, `review_date`) VALUES
(1, 2, 10, 2, 'Not for me', 'Tbf, it&#039;s not bad. It&#039;s just, meh.', '2024-11-03 00:48:47'),
(2, 3, 10, 1, 'Much improvement needed.', 'Content and title doesn&#039;t match.', '2024-11-03 00:50:40'),
(3, 4, 10, 5, 'Awesome!', 'Best book ever.', '2024-11-03 01:05:06'),
(4, 2, 19, 5, 'Laserful', 'Hell yea! Great!', '2024-11-03 15:11:01'),
(5, 15, 4, 4, 'Great read!', 'Really enjoyed the character development. The plot twists kept me guessing until the end.', '2024-11-03 16:22:33'),
(6, 8, 10, 3, 'Decent but lengthy', 'Some parts were really engaging, but it dragged in the middle. Worth reading though.', '2024-11-03 17:15:41'),
(7, 22, 46, 5, 'Absolutely brilliant', 'Could not put it down! The world-building is incredible and the ending was perfect.', '2024-11-04 09:30:15'),
(8, 12, 3, 2, 'Disappointing', 'Had high hopes but the story felt rushed and characters were underdeveloped.', '2024-11-04 11:45:22'),
(9, 31, 8, 4, 'Pleasantly surprised', 'Started slow but really picked up. The second half was especially good!', '2024-11-04 14:20:18'),
(10, 17, 18, 5, 'Must read!', 'Such an engaging story! The author really knows how to create tension.', '2024-11-04 15:55:33'),
(11, 25, 13, 3, 'Mixed feelings', 'Interesting premise but the execution could have been better. Still worth checking out.', '2024-11-04 18:10:45'),
(12, 9, 14, 4, 'Very entertaining', 'A fun and engaging read. Really liked the main character\'s journey.', '2024-11-04 19:25:12'),
(13, 28, 20, 5, 'Fantastic novel', 'Beautifully written with amazing attention to detail. Highly recommend!', '2024-11-04 20:40:28'),
(14, 19, 21, 2, 'Needs work', 'Good ideas but the pacing was off. The ending felt rushed.', '2024-11-04 21:15:39'),
(15, 33, 56, 4, 'Solid read', 'Well-crafted story with interesting characters. Really enjoyed the dialogue.', '2024-11-04 22:30:44'),
(16, 11, 59, 5, 'Exceeded expectations', 'What a journey! Definitely going to read it again.', '2024-11-05 08:45:51'),
(17, 27, 63, 3, 'Good but not great', 'Had its moments but didn\'t quite live up to the hype. Still entertaining though.', '2024-11-05 10:20:17'),
(18, 14, 67, 4, 'Really enjoyed it', 'Compelling story with well-developed characters. Looking forward to reading more from this author.', '2024-11-05 12:35:29'),
(19, 23, 4, 5, 'Outstanding thriller', 'The suspense kept me on the edge of my seat. Couldn\'t stop reading!', '2024-11-02 13:22:15'),
(20, 11, 4, 3, 'Good but predictable', 'While well-written, I saw most of the twists coming. Still enjoyable though.', '2024-11-01 19:45:33'),
(21, 29, 4, 4, 'Solid page-turner', 'Fast-paced and engaging. The ending was particularly satisfying.', '2024-10-31 22:15:41'),
(22, 16, 10, 4, 'Very impressive', 'Loved the writing style and character development. A few slow parts but overall great.', '2024-11-03 09:12:28'),
(23, 25, 10, 5, 'Masterfully crafted', 'One of the best books I\'ve read this year. The plot is intricate and satisfying.', '2024-11-02 16:30:19'),
(24, 7, 10, 2, 'Not what I expected', 'Had potential but fell short. The middle section really dragged.', '2024-11-01 14:25:55'),
(25, 13, 46, 4, 'Great weekend read', 'Perfect book for a cozy weekend. Really enjoyed the atmosphere.', '2024-11-04 11:20:33'),
(26, 30, 46, 5, 'Couldn\'t put it down', 'Stayed up all night finishing this one. Absolutely worth it!', '2024-11-03 23:45:17'),
(27, 19, 46, 3, 'Interesting concept', 'The premise is fantastic but the execution could be better. Still worth reading.', '2024-11-02 20:15:42'),
(28, 27, 3, 4, 'Better than expected', 'Was pleasantly surprised by how much I enjoyed this.', '2024-11-03 15:30:22'),
(29, 8, 3, 5, 'Absolutely loved it', 'The character development is fantastic. Will definitely read again!', '2024-11-02 12:40:18'),
(30, 33, 3, 3, 'Decent read', 'Has its moments but isn\'t consistently engaging. Good for a casual read.', '2024-11-01 17:55:39'),
(31, 15, 8, 5, 'Hidden gem', 'Don\'t understand why this isn\'t more popular. Absolutely fantastic!', '2024-11-04 10:25:44'),
(32, 22, 8, 4, 'Very enjoyable', 'Well-written with great pacing. The characters feel real and relatable.', '2024-11-03 16:15:33'),
(33, 9, 8, 3, 'Good but flawed', 'Interesting story but some plot holes. Worth reading despite its issues.', '2024-11-02 19:30:27'),
(34, 28, 18, 4, 'Engaging story', 'Really enjoyed the world-building and character interactions.', '2024-11-03 14:22:51'),
(35, 12, 18, 5, 'Exceptional', 'One of those rare books that keeps you thinking long after finishing.', '2024-11-02 21:35:16'),
(36, 34, 18, 3, 'Mixed feelings', 'Strong start but the ending felt rushed. Still enjoyed most of it.', '2024-11-01 18:45:33'),
(37, 20, 13, 5, 'Brilliant writing', 'The prose is beautiful and the story is captivating. Highly recommend!', '2024-11-04 12:15:29'),
(38, 31, 13, 4, 'Very good read', 'Enjoyed the unique perspective and storytelling style.', '2024-11-03 17:40:22'),
(39, 6, 13, 2, 'Not my cup of tea', 'The writing style didn\'t click with me, but others might enjoy it.', '2024-11-02 15:55:48'),
(40, 24, 14, 5, 'Amazing journey', 'Completely immersive experience. Couldn\'t ask for more!', '2024-11-03 20:30:15'),
(41, 17, 14, 4, 'Really enjoyable', 'Great characters and interesting plot. Minor pacing issues but overall solid.', '2024-11-02 23:45:33'),
(42, 32, 14, 3, 'Decent story', 'Has its moments but doesn\'t quite reach its full potential.', '2024-11-01 16:20:41'),
(43, 10, 20, 4, 'Well crafted', 'Thoughtful and engaging throughout. Really enjoyed the dialogue.', '2024-11-04 13:25:18'),
(44, 26, 20, 5, 'Outstanding', 'Everything about this book works. A must-read!', '2024-11-03 19:15:44'),
(45, 14, 20, 3, 'Good but not great', 'Solid story but doesn\'t break new ground. Worth reading once.', '2024-11-02 22:30:37'),
(46, 21, 21, 4, 'Pleasant surprise', 'Much better than I expected. Really enjoyed the character development.', '2024-11-03 15:40:29'),
(47, 35, 21, 5, 'Excellent read', 'Gripping from start to finish. Highly recommended!', '2024-11-02 18:55:33'),
(48, 7, 21, 3, 'Decent enough', 'Not groundbreaking but entertaining. Good vacation read.', '2024-11-01 21:15:42'),
(49, 18, 56, 5, 'Fantastic book', 'Everything I want in a story. Will definitely read again!', '2024-11-04 11:30:15'),
(50, 29, 56, 4, 'Very good', 'Engaging plot with well-developed characters. Minor pacing issues.', '2024-11-03 14:45:28'),
(51, 13, 56, 3, 'Solid read', 'Good but not great. Worth checking out if you like the genre.', '2024-11-02 17:20:44'),
(52, 16, 59, 4, 'Really enjoyed it', 'Great premise and solid execution. Looking forward to reading more.', '2024-11-03 16:35:19'),
(53, 25, 59, 5, 'Absolutely loved it', 'Couldn\'t put it down! One of my favorites this year.', '2024-11-02 19:50:33'),
(54, 8, 59, 3, 'Pretty good', 'Has its moments. The middle section was particularly strong.', '2024-11-01 22:25:41'),
(55, 30, 63, 4, 'Worth reading', 'Solid story with interesting characters. Really enjoyed it.', '2024-11-04 12:40:28'),
(56, 19, 63, 5, 'Excellent', 'Thoroughly enjoyed every page. Highly recommend!', '2024-11-03 15:55:44'),
(57, 23, 63, 3, 'Good overall', 'Some really strong moments despite a few weak chapters.', '2024-11-02 18:30:37'),
(58, 12, 67, 5, 'Fantastic read', 'Everything works perfectly. A true page-turner!', '2024-11-03 17:45:22'),
(59, 33, 67, 4, 'Very entertaining', 'Well-written and engaging throughout. Minor flaws but still great.', '2024-11-02 20:20:33'),
(60, 15, 67, 3, 'Decent book', 'Not perfect but definitely worth your time.', '2024-11-01 23:15:48'),
(107, 15, 1, 4, 'Really enjoyed this', 'A captivating story with well-developed characters. Highly recommended!', '2024-11-05 13:22:15'),
(108, 23, 1, 3, 'Decent read', 'Had its moments, though pacing was a bit uneven. Still worth checking out.', '2024-11-05 14:15:33'),
(109, 7, 2, 5, 'Couldn\'t put it down', 'Absolutely fantastic! The plot twists kept me guessing.', '2024-11-05 15:30:22'),
(110, 19, 2, 4, 'Solid story', 'Well-written with great character development. Looking forward to reading more.', '2024-11-05 16:45:18'),
(111, 28, 5, 4, 'Great book', 'Engaging from start to finish. The ending was particularly good.', '2024-11-05 17:20:41'),
(112, 11, 5, 5, 'Exceptional', 'One of the best books I\'ve read this year. Beautiful writing.', '2024-11-05 18:10:33'),
(113, 33, 6, 3, 'Mixed feelings', 'Good premise but execution could be better. Still an interesting read.', '2024-11-05 19:25:15'),
(114, 16, 6, 4, 'Pleasantly surprised', 'Better than I expected. The characters really grew on me.', '2024-11-05 20:30:44'),
(115, 31, 9, 4, 'Well worth reading', 'Strong narrative with interesting themes. Really enjoyed it.', '2024-11-06 09:10:33'),
(116, 14, 9, 5, 'Fantastic read', 'Couldn\'t stop reading! The author has a great writing style.', '2024-11-06 10:25:47'),
(117, 22, 11, 3, 'Good but not great', 'Interesting concept but felt a bit rushed in places.', '2024-11-06 11:30:15'),
(118, 27, 11, 4, 'Engaging story', 'Despite some flaws, it\'s a compelling read with good characters.', '2024-11-06 12:45:22'),
(119, 8, 12, 5, 'Loved it', 'Everything about this book works. A must-read!', '2024-11-06 13:55:39'),
(120, 30, 12, 4, 'Very entertaining', 'Fast-paced and engaging throughout. Really enjoyed it.', '2024-11-06 14:20:41'),
(121, 17, 15, 4, 'Great read', 'Solid storytelling with interesting characters. Highly recommend.', '2024-11-06 15:30:18'),
(122, 24, 15, 5, 'Excellent', 'Beautifully written with a satisfying conclusion.', '2024-11-06 16:45:33'),
(123, 12, 16, 3, 'Decent story', 'Has potential but needed more development. Still entertaining.', '2024-11-06 17:55:29'),
(124, 34, 16, 4, 'Pretty good', 'Enjoyable read with some really strong moments.', '2024-11-06 18:20:44'),
(125, 20, 17, 5, 'Amazing book', 'Absolutely loved every page. Can\'t wait to read more!', '2024-11-06 19:30:15'),
(126, 6, 17, 4, 'Very good read', 'Well-crafted story with great character development.', '2024-11-06 20:45:22'),
(127, 29, 19, 4, 'Really good', 'Engaging plot with well-developed characters. Very enjoyable.', '2024-11-06 21:55:33'),
(128, 13, 19, 5, 'Outstanding read', 'One of those books you can\'t put down. Highly recommended!', '2024-11-06 22:20:48'),
(129, 18, 22, 4, 'Very enjoyable', 'Strong characters and compelling plot. Really well done.', '2024-11-07 09:15:22'),
(130, 26, 22, 3, 'Decent story', 'Good ideas but some pacing issues. Worth reading though.', '2024-11-07 10:30:41'),
(131, 10, 23, 5, 'Brilliant!', 'Absolutely fantastic storytelling. Couldn\'t put it down!', '2024-11-07 11:45:33'),
(132, 32, 23, 4, 'Great read', 'Very engaging with some unexpected twists. Really enjoyed it.', '2024-11-07 12:20:18'),
(133, 21, 24, 3, 'Mixed feelings', 'Some really strong moments but also some weak points.', '2024-11-07 13:35:29'),
(134, 7, 24, 4, 'Solid book', 'Well-written with interesting character development.', '2024-11-07 14:50:44'),
(135, 25, 25, 5, 'Exceptional', 'One of my favorites this year. Highly recommend!', '2024-11-07 15:25:15'),
(136, 15, 25, 4, 'Really good', 'Engaging story with a satisfying conclusion.', '2024-11-07 16:40:33'),
(137, 33, 26, 4, 'Worth reading', 'Solid narrative with some great moments. Very entertaining.', '2024-11-07 17:55:48'),
(138, 11, 26, 5, 'Fantastic', 'Loved the writing style and character development.', '2024-11-07 18:20:22'),
(139, 28, 27, 3, 'Pretty good', 'Interesting premise but execution could be better.', '2024-11-07 19:35:41'),
(140, 19, 27, 4, 'Enjoyable read', 'Despite minor flaws, it\'s a compelling story.', '2024-11-07 20:50:33'),
(141, 9, 28, 5, 'Outstanding!', 'Couldn\'t stop reading. Perfect blend of plot and characters.', '2024-11-07 21:15:18'),
(142, 31, 28, 4, 'Very good', 'Well-crafted story with engaging dialogue.', '2024-11-07 22:30:29'),
(143, 16, 29, 4, 'Great book', 'Really enjoyed the author\'s writing style.', '2024-11-08 09:45:44'),
(144, 24, 29, 3, 'Good but flawed', 'Has potential but needed more development.', '2024-11-08 10:20:15'),
(145, 13, 30, 5, 'Loved it!', 'Amazing storytelling from start to finish.', '2024-11-08 11:35:33'),
(146, 34, 30, 4, 'Very enjoyable', 'Strong plot with well-developed characters.', '2024-11-08 12:50:48'),
(147, 22, 31, 4, 'Solid read', 'Engaging story with some unexpected turns.', '2024-11-08 13:15:22'),
(148, 8, 31, 5, 'Excellent', 'Thoroughly enjoyed every page. Highly recommend!', '2024-11-08 14:30:41'),
(149, 30, 32, 3, 'Decent', 'Good moments but inconsistent pacing.', '2024-11-08 15:45:33'),
(150, 17, 32, 4, 'Worth reading', 'Interesting concept with good execution.', '2024-11-08 16:20:18'),
(151, 25, 33, 5, 'Amazing', 'One of those rare books you can\'t put down.', '2024-11-08 17:35:29'),
(152, 12, 33, 4, 'Very good', 'Well-written with memorable characters.', '2024-11-08 18:50:44'),
(153, 20, 34, 4, 'Really enjoyed', 'Solid storytelling with great character arcs.', '2024-11-08 19:15:15'),
(154, 6, 34, 5, 'Fantastic read', 'Exceeded my expectations. Brilliant writing.', '2024-11-08 20:30:33'),
(155, 29, 35, 3, 'Good but not great', 'Interesting premise but needed more polish.', '2024-11-08 21:45:48'),
(156, 14, 35, 4, 'Entertaining', 'Despite some flaws, it\'s an engaging read.', '2024-11-08 22:20:22'),
(157, 27, 36, 5, 'Outstanding', 'Beautiful writing and compelling story.', '2024-11-09 09:35:41'),
(158, 11, 36, 4, 'Very good book', 'Really enjoyed the author\'s style.', '2024-11-09 10:50:33'),
(159, 33, 37, 4, 'Well done', 'Strong narrative with interesting themes.', '2024-11-09 11:15:18'),
(160, 18, 37, 5, 'Excellent read', 'Couldn\'t put it down. Highly recommended!', '2024-11-09 12:30:29'),
(161, 23, 38, 3, 'Decent story', 'Good ideas but execution could be better.', '2024-11-09 13:45:44'),
(162, 15, 38, 4, 'Pretty good', 'Engaging plot with some strong moments.', '2024-11-09 14:20:15'),
(163, 28, 39, 5, 'Brilliant', 'Absolutely loved the storytelling and characters.', '2024-11-09 15:35:33'),
(164, 9, 39, 4, 'Very enjoyable', 'Well-crafted with good pacing throughout.', '2024-11-09 16:50:48'),
(165, 31, 40, 4, 'Good read', 'Solid book with interesting character development.', '2024-11-09 17:15:22'),
(166, 21, 40, 5, 'Fantastic', 'Thoroughly engaging from start to finish.', '2024-11-09 18:30:41'),
(167, 16, 41, 4, 'Great story', 'Engaging plot with well-developed characters. Really enjoyed it.', '2024-11-09 19:45:33'),
(168, 25, 41, 3, 'Decent read', 'Has its moments but some parts drag. Worth checking out though.', '2024-11-09 20:20:18'),
(169, 8, 42, 5, 'Outstanding!', 'Beautifully written and completely absorbing. A must-read!', '2024-11-09 21:35:29'),
(170, 30, 42, 4, 'Very good', 'Strong narrative with interesting themes. Well done.', '2024-11-09 22:50:44'),
(171, 19, 43, 4, 'Really enjoyable', 'Well-crafted story with great character development.', '2024-11-10 09:15:15'),
(172, 27, 43, 5, 'Excellent book', 'Couldn\'t put it down. The ending was perfect.', '2024-11-10 10:30:33'),
(173, 12, 44, 3, 'Mixed feelings', 'Good premise but execution could be better.', '2024-11-10 11:45:48'),
(174, 34, 44, 4, 'Solid read', 'Despite some flaws, it\'s an engaging story.', '2024-11-10 12:20:22'),
(175, 22, 45, 5, 'Loved it', 'Amazing storytelling with memorable characters.', '2024-11-10 13:35:41'),
(176, 7, 45, 4, 'Very enjoyable', 'Well-written with some great plot twists.', '2024-11-10 14:50:33'),
(177, 29, 47, 4, 'Worth reading', 'Engaging narrative with strong character arcs.', '2024-11-10 15:15:18'),
(178, 15, 47, 5, 'Fantastic', 'One of the best books I\'ve read recently.', '2024-11-10 16:30:29'),
(179, 33, 48, 3, 'Good but flawed', 'Interesting ideas but pacing issues.', '2024-11-10 17:45:44'),
(180, 11, 48, 4, 'Pretty good', 'Solid story with some memorable moments.', '2024-11-10 18:20:15'),
(181, 26, 49, 5, 'Brilliant read', 'Absolutely captivating from start to finish.', '2024-11-10 19:35:33'),
(182, 14, 49, 4, 'Very good book', 'Well-crafted with interesting characters.', '2024-11-10 20:50:48'),
(183, 31, 50, 4, 'Enjoyable', 'Strong writing with good character development.', '2024-11-10 21:15:22'),
(184, 18, 50, 5, 'Excellent', 'Thoroughly engaging story. Highly recommend!', '2024-11-10 22:30:41'),
(185, 24, 51, 3, 'Decent story', 'Has potential but needed more polish.', '2024-11-11 09:45:33'),
(186, 9, 51, 4, 'Good read', 'Interesting plot with some great moments.', '2024-11-11 10:20:18'),
(187, 32, 52, 5, 'Amazing', 'Couldn\'t stop reading. Perfect blend of plot and characters.', '2024-11-11 11:35:29'),
(188, 20, 52, 4, 'Very good', 'Well-written with engaging dialogue.', '2024-11-11 12:50:44'),
(189, 15, 53, 4, 'Solid book', 'Really enjoyed the author\'s writing style.', '2024-11-11 13:15:15'),
(190, 28, 53, 3, 'Worth a read', 'Good story despite some rough edges.', '2024-11-11 14:30:33'),
(191, 10, 54, 5, 'Outstanding', 'Fantastic storytelling from beginning to end.', '2024-11-11 15:45:48'),
(192, 33, 54, 4, 'Very enjoyable', 'Strong narrative with well-developed characters.', '2024-11-11 16:20:22'),
(193, 21, 55, 4, 'Great book', 'Engaging plot with some unexpected turns.', '2024-11-11 17:35:41'),
(194, 7, 55, 5, 'Excellent read', 'Thoroughly enjoyed every page.', '2024-11-11 18:50:33'),
(195, 25, 57, 3, 'Decent', 'Good ideas but inconsistent execution.', '2024-11-11 19:15:18'),
(196, 16, 57, 4, 'Pretty good', 'Solid story with interesting themes.', '2024-11-11 20:30:29'),
(197, 30, 58, 5, 'Brilliant', 'One of those books you can\'t put down.', '2024-11-11 21:45:44'),
(198, 13, 58, 4, 'Very good', 'Well-crafted with memorable characters.', '2024-11-11 22:20:15'),
(199, 19, 60, 4, 'Really good', 'Strong storytelling with great character arcs.', '2024-11-12 09:35:33'),
(200, 27, 60, 5, 'Fantastic', 'Exceeded expectations. Brilliant writing.', '2024-11-12 10:50:48'),
(201, 23, 61, 4, 'Well written', 'Strong narrative with compelling characters. Really enjoyed it.', '2024-11-12 11:15:22'),
(202, 11, 61, 3, 'Decent read', 'Interesting premise but uneven pacing. Still worth checking out.', '2024-11-12 12:30:41'),
(203, 34, 62, 5, 'Outstanding', 'Absolutely captivating! Couldn\'t put it down.', '2024-11-12 13:45:33'),
(204, 17, 62, 4, 'Very good', 'Solid storytelling with some great twists.', '2024-11-12 14:20:18'),
(205, 28, 64, 4, 'Really enjoyable', 'Well-crafted plot with interesting character development.', '2024-11-12 15:35:29'),
(206, 9, 64, 5, 'Excellent', 'One of my favorite reads this year.', '2024-11-12 16:50:44'),
(207, 31, 65, 3, 'Mixed thoughts', 'Good moments but needed more consistency.', '2024-11-12 17:15:15'),
(208, 15, 65, 4, 'Worth reading', 'Despite minor flaws, it\'s an engaging story.', '2024-11-12 18:30:33'),
(209, 25, 66, 5, 'Brilliant', 'Amazing storytelling from start to finish.', '2024-11-12 19:45:48'),
(210, 12, 66, 4, 'Very good book', 'Engaging plot with memorable characters.', '2024-11-12 20:20:22'),
(211, 33, 68, 4, 'Great read', 'Strong writing with interesting themes.', '2024-11-12 21:35:41'),
(212, 20, 68, 5, 'Loved it', 'Thoroughly absorbing story. Highly recommended!', '2024-11-12 22:50:33'),
(213, 8, 69, 3, 'Good but flawed', 'Interesting ideas but execution needs work.', '2024-11-13 09:15:18'),
(214, 29, 69, 4, 'Solid story', 'Well-written with some powerful moments.', '2024-11-13 10:30:29'),
(215, 16, 70, 5, 'Fantastic', 'Couldn\'t stop reading. Perfect pacing throughout.', '2024-11-13 11:45:44'),
(216, 26, 70, 4, 'Very enjoyable', 'Strong narrative with great dialogue.', '2024-11-13 12:20:15'),
(217, 13, 71, 4, 'Well done', 'Really enjoyed the author\'s writing style.', '2024-11-13 13:35:33'),
(218, 32, 71, 3, 'Decent book', 'Has potential but needed more development.', '2024-11-13 14:50:48'),
(219, 21, 72, 5, 'Outstanding read', 'Beautiful writing and compelling storyline.', '2024-11-13 15:15:22'),
(220, 7, 72, 4, 'Very good', 'Engaging story with well-drawn characters.', '2024-11-13 16:30:41'),
(221, 30, 73, 4, 'Really good', 'Strong plot with some unexpected turns.', '2024-11-13 17:45:33'),
(222, 18, 73, 5, 'Excellent', 'One of those rare books you can\'t put down.', '2024-11-13 18:20:18'),
(223, 24, 74, 3, 'Worth a read', 'Interesting concept with decent execution.', '2024-11-13 19:35:29'),
(224, 10, 74, 4, 'Pretty good', 'Solid story despite some minor issues.', '2024-11-13 20:50:44'),
(225, 34, 75, 5, 'Amazing', 'Absolutely loved everything about this book.', '2024-11-13 21:15:15'),
(226, 14, 75, 4, 'Very enjoyable', 'Well-crafted with great character arcs.', '2024-11-13 22:30:33'),
(227, 27, 76, 4, 'Good read', 'Engaging narrative with strong themes.', '2024-11-14 09:45:48'),
(228, 11, 76, 5, 'Fantastic', 'Thoroughly enjoyed from start to finish.', '2024-11-14 10:20:22'),
(229, 22, 77, 3, 'Decent story', 'Good ideas but pacing could be better.', '2024-11-14 11:35:41'),
(230, 33, 77, 4, 'Worth reading', 'Interesting plot with some great moments.', '2024-11-14 12:50:33'),
(231, 19, 78, 5, 'Brilliant book', 'Captivating story with excellent writing.', '2024-11-14 13:15:18'),
(232, 28, 78, 4, 'Very good', 'Strong characters and engaging plot.', '2024-11-14 14:30:29'),
(233, 15, 79, 4, 'Solid read', 'Well-written with interesting developments.', '2024-11-14 15:45:44'),
(234, 25, 79, 3, 'Good but flawed', 'Has promise but needs more polish.', '2024-11-14 16:20:15'),
(235, 31, 80, 5, 'Outstanding', 'One of the best books I\'ve read recently.', '2024-11-14 17:35:33'),
(236, 9, 80, 4, 'Very enjoyable', 'Engaging story with great dialogue.', '2024-11-14 18:50:48'),
(237, 20, 81, 4, 'Really good', 'Strong storytelling throughout.', '2024-11-14 19:15:22'),
(238, 16, 81, 5, 'Excellent read', 'Couldn\'t put it down. Highly recommend!', '2024-11-14 20:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `membership_type` enum('free','lite','plus') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password_hash`, `name`, `created_at`, `membership_type`) VALUES
(1, 'brianclark@bing.com', '$2y$10$2G0vudacrMxevzBugLpXPeppBzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Brian Clark', '2024-10-24 21:58:33', 'free'),
(2, 'matt@ntu.com', '$2y$10$tjpv3Z/PuJuFTd9h0f277eIqG.30Z04byideCara5uuhd0jXVeJa.', 'Matthew', '2024-11-02 23:31:13', 'plus'),
(3, 'admin@ntu.com', '$2y$10$kAA5ctpmU11YS6aI0z8/qeqRBb8XJZMp62ZgRJIO80zah2FT8IMpG', 'Admin', '2024-11-02 23:32:21', 'plus'),
(4, 'ntu@ntu.com', '$2y$10$HSThBjafAtfgRXRBGmbcnubaFBThJBBiKuG7RQGXGBZCS3AzVlQJe', 'NTU', '2024-11-03 01:03:46', 'lite'),
(5, 'johndoe@gmail.com', '$2y$10$xYwPOUVv4QRvVmVJgx8hzOODjovvp3BezLIgVT4PGLnIcyear0Hju', 'John Doe', '2024-11-03 09:49:19', 'lite'),
(6, 'james.wilson@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'James Wilson', '2024-11-06 10:00:00', 'free'),
(7, 'sarah.chen@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Sarah Chen', '2024-11-06 10:15:22', 'plus'),
(8, 'michael.patel@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Michael Patel', '2024-11-06 10:32:45', 'lite'),
(9, 'emma.brown@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Emma Brown', '2024-11-06 11:05:33', 'plus'),
(10, 'david.garcia@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'David Garcia', '2024-11-06 11:20:18', 'free'),
(11, 'lisa.taylor@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Lisa Taylor', '2024-11-06 11:45:29', 'plus'),
(12, 'robert.kim@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Robert Kim', '2024-11-06 12:10:41', 'lite'),
(13, 'jennifer.singh@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Jennifer Singh', '2024-11-06 12:30:15', 'free'),
(14, 'william.zhang@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'William Zhang', '2024-11-06 13:00:55', 'plus'),
(15, 'maria.rodriguez@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Maria Rodriguez', '2024-11-06 13:25:33', 'lite'),
(16, 'alex.thompson@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Alex Thompson', '2024-11-06 14:00:12', 'plus'),
(17, 'sophia.lee@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Sophia Lee', '2024-11-06 14:15:33', 'free'),
(18, 'daniel.martinez@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Daniel Martinez', '2024-11-06 14:30:45', 'lite'),
(19, 'olivia.white@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Olivia White', '2024-11-06 14:45:22', 'plus'),
(20, 'ethan.kumar@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Ethan Kumar', '2024-11-06 15:00:18', 'free'),
(21, 'ava.anderson@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Ava Anderson', '2024-11-06 15:15:39', 'plus'),
(22, 'noah.wang@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Noah Wang', '2024-11-06 15:30:44', 'lite'),
(23, 'isabella.santos@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Isabella Santos', '2024-11-06 15:45:51', 'free'),
(24, 'lucas.nguyen@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Lucas Nguyen', '2024-11-06 16:00:29', 'plus'),
(25, 'mia.cohen@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Mia Cohen', '2024-11-06 16:15:33', 'lite'),
(26, 'aiden.patel@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Aiden Patel', '2024-11-06 16:30:12', 'free'),
(27, 'charlotte.kim@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Charlotte Kim', '2024-11-06 16:45:28', 'plus'),
(28, 'liam.gupta@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Liam Gupta', '2024-11-06 17:00:45', 'lite'),
(29, 'amelia.clarke@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Amelia Clarke', '2024-11-06 17:15:19', 'free'),
(30, 'mason.park@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Mason Park', '2024-11-06 17:30:33', 'plus'),
(31, 'evelyn.murphy@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Evelyn Murphy', '2024-11-06 17:45:48', 'lite'),
(32, 'henry.wilson@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Henry Wilson', '2024-11-06 18:00:22', 'free'),
(33, 'scarlett.li@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Scarlett Li', '2024-11-06 18:15:39', 'plus'),
(34, 'sebastian.shah@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Sebastian Shah', '2024-11-06 18:30:41', 'lite'),
(35, 'chloe.brooks@testmail.dev', '$2y$10$2G0vudacrMxevzBugLpX8dh2hzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Chloe Brooks', '2024-11-06 18:45:55', 'free');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `borrowing`
--
ALTER TABLE `borrowing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
