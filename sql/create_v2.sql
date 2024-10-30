-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2024 at 02:45 PM
-- Server version: 10.4.24-MariaDB
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
(7, 'The Bees', 'Laline Paull', '149-5-157-965', '2021-01-24', 'Romance', 'On an isolated flower farm in rural Vermont, a peculiar romance blossoms between a reclusive beekeeper and a botanical researcher studying the disappearance of native pollinators. Their relationship deepens as they discover the bees on the farm exhibit unusual intelligence and possibly supernatural abilities. As they work to protect their extraordinary apiary from exploitative corporations, they must decide whether to share their discovery with the world or keep the magical secret of the bees to themselves.', '2024-10-20', '2.50', 9, 0, 'https://bookcoverarchive.com/wp-content/uploads/2015/10/visible-man.jpg'),
(8, 'Exit Strategy', 'Marcus Chen', '978-0-441-569', '2023-06-15', 'Thriller', 'A cybersecurity expert discovers a hidden backdoor in a major banking system, leading to a race against time to prevent a global financial collapse. As she delves deeper, she realizes the code contains patterns that seem impossibly familiar - patterns she wrote fifteen years ago.', '2024-03-15', '2.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/exit_a.jpg'),
(9, 'About a Mountain', 'Rachel Carson', '978-1-338-671', '2023-09-22', 'Fiction', 'When an environmental journalist investigates a mysterious geological anomaly in Nevada\'s Mount Charleston, she uncovers a decades-old government secret that challenges everything we know about nuclear waste storage and its long-term effects on the surrounding ecosystem.', '2024-04-01', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/about_a_mountain.jpg'),
(10, 'No Longer Human', 'Haruki Sato', '978-0-062-445', '2023-07-10', 'Fiction', 'In near-future Tokyo, a consciousness researcher develops a revolutionary AI therapy program, only to discover his patients are becoming eerily inhuman in their perfection. As the line between enhancement and erasure blurs, he must confront the question of what truly makes us human.', '2024-02-10', '1.50', 6, 1, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/no_longer_human.large_.jpg'),
(11, 'Lost Decades', 'Alexandra Foster', '978-2-789-112', '2023-10-15', 'Mystery', 'A historical archivist stumbles upon a pattern of missing time periods in various cultures\' histories, all coinciding with major technological leaps. As she investigates these synchronized gaps, she begins experiencing mysterious time slips herself.', '2024-05-20', '2.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/lost_decades.large_.jpg'),
(12, 'Three Armies on the Somme', 'William Barrett', '978-4-567-223', '2023-08-18', 'Biographic', 'Through meticulous research and previously undiscovered personal letters, this gripping account reveals the untold story of three military forces that converged at the Battle of the Somme, changing the course of World War I and modern warfare forever.', '2024-06-05', '1.00', 7, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/three_armies_on_the_somme.jpg'),
(13, 'The Psychopath Test', 'Dr. Rachel Chang', '978-5-891-334', '2023-11-05', 'Thriller', 'A renowned psychiatrist develops a revolutionary test to identify psychopathic behavior, but when her research subjects begin disappearing, she realizes someone is using her work to target people who haven\'t yet committed any crimes.', '2024-07-15', '2.50', 5, 1, 'http://bookcoverarchive.com/wp-content/uploads/2017/01/psychopath-test.jpg'),
(14, 'Once Before Time', 'Prof. Stephen Morris', '978-6-789-445', '2023-12-20', 'Fiction', 'A quantum physicist\'s groundbreaking research into parallel universes leads to the discovery that our universe might be younger than we think, and that time itself might flow in multiple directions simultaneously.', '2024-08-01', '3.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/once_before_time.jpg'),
(15, 'Smothered in Hugs', 'Emma Rodriguez', '978-7-123-556', '2024-01-15', 'Romance', 'In this heartwarming tale of found family, a grieving social worker starts a revolutionary therapy program using platonic touch to heal trauma. As her clients begin to heal, she discovers that sometimes the strongest embraces come from strangers.', '2024-09-10', '1.50', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/smothered_in_hugs.jpg'),
(16, 'Get Used to the Seats', 'James Liu', '978-8-234-667', '2024-02-08', 'Mystery', 'When an old theater\'s renovation reveals mysterious messages carved into the original seats, an architectural historian becomes obsessed with decoding their meaning, leading her down a rabbit hole of century-old disappearances and theatrical superstitions.', '2024-10-01', '3.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/get_used_to_the_seats.large_.jpg'),
(17, 'The Book of Strange New Things', 'Rev. Michael Palmer', '978-9-345-778', '2024-03-14', 'Fantasy', 'A missionary is sent to a distant space colony to minister to an alien species that has specifically requested Earth\'s religious texts. As he translates humanity\'s oldest stories for beings who have no concept of death, he discovers their interest may have darker implications.', '2024-10-15', '2.50', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2016/12/Book-of-Strange-New-Things.jpg'),
(18, 'The Last Skin', 'Nina Blackwood', '978-1-234-889', '2023-11-30', 'Horror', 'In a world where humans can transfer their consciousness between synthetic bodies, a body modification artist discovers a client\'s discarded skin that seems to be growing a consciousness of its own.', '2024-03-20', '2.00', 5, 1, 'http://bookcoverarchive.com/wp-content/uploads/2010/09/the_last_skin.large_.jpg'),
(19, 'LaserWriter II', 'David Chen', '978-2-567-334', '2023-12-05', 'Fiction', 'Set in the early days of desktop publishing, this nostalgic tech-noir follows a brilliant computer repair technician who discovers that certain printer malfunctions are actually encoding messages from another dimension.', '2024-04-15', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/2021/07/0E82FD62-5563-4163-AAC8-40528C8DE6FC.jpeg'),
(20, 'Normal', 'Sarah Matthews', '978-3-789-445', '2024-01-10', 'Thriller', 'When a pioneering neuropsychologist develops a cure for anxiety, her patients begin experiencing an uncanny form of normalcy that spreads like a contagion, raising questions about the true nature of human emotions.', '2024-05-01', '2.50', 6, 1, 'http://bookcoverarchive.com/wp-content/uploads/2016/08/57bf083370c8c486642421.gif'),
(21, 'Politics and Partnerships', 'Dr. Robert Wilson', '978-4-890-567', '2023-10-25', 'Fiction', 'A behind-the-scenes look at how modern political alliances are forged through unlikely partnerships, following five interconnected stories of power brokers navigating the complex landscape of contemporary politics.', '2024-06-10', '1.00', 3, 0, 'http://bookcoverarchive.com/wp-content/uploads/2010/06/9780226109978.jpg'),
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
(46, 'The Good Life', 'Sophia Martinez', '978-0-062-446', '2023-09-10', 'Fiction', 'When a minimalist lifestyle guru\'s carefully curated world begins to unravel, she discovers that the perfect life she\'s been selling might be the biggest fraud of all.', '2024-02-15', '2.00', 3, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_good_life.jpg'),
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
(59, 'The Middle of the Night', 'Daniel Black', '978-7-890-013', '2023-12-30', 'Thriller', 'An insomniac photographer captures strange occurrences in his neighborhood between midnight and dawn, leading him to discover a hidden world that only exists in the darkest hours.', '2024-05-10', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_middle_of_the_night.jpg'),
(60, 'The Filth', 'Grant Morrison', '978-8-901-124', '2024-01-15', 'Fantasy', 'A surreal graphic novel about a secret organization that maintains order in a world increasingly destabilized by reality-bending phenomena and interdimensional threats.', '2024-06-25', '1.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_filth_10.jpg'),
(61, 'Bodies', 'Dr. Alice Chen', '978-9-012-235', '2024-02-28', 'Fiction', 'A medical examiner begins to notice impossible similarities between unrelated bodies, leading her down a rabbit hole of scientific mystery and philosophical questions about identity.', '2024-07-15', '2.00', 6, 1, 'http://bookcoverarchive.com/wp-content/uploads/amazon/bodies.jpg'),
(62, 'The Manly Modern', 'Christopher Howard', '978-0-111-223', '2023-11-20', 'Fiction', 'An examination of masculinity in the post-war era, exploring how technological and social changes transformed traditional notions of manhood.', '2024-08-20', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_manly_modern.jpg'),
(63, 'The Clumsiest People in Europe', 'Todd Parker', '978-1-222-334', '2023-12-15', 'Fiction', 'A satirical travelogue based on Victorian-era guidebooks, poking fun at national stereotypes while revealing more about the observers than the observed.', '2024-09-05', '3.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_clumsiest_people_in_europe.jpg'),
(64, 'The Glass Bead Game', 'Hermann Hesse', '978-2-333-445', '2024-01-30', 'Fiction', 'In a future scholarly society, an elite game combines all human knowledge into a complex competition of intellect and creativity, challenging the very nature of wisdom and learning.', '2024-09-15', '2.50', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_glass_bead_game.jpg'),
(65, 'American Nerd', 'Benjamin Nugent', '978-3-444-556', '2024-02-10', 'Fiction', 'A cultural history of the nerd archetype in American society, exploring how social outcasts became cultural innovators and technological pioneers.', '2024-09-30', '2.00', 4, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/american_nerd.jpg'),
(66, 'The Face of Another', 'Kobo Abe', '978-4-555-667', '2023-11-25', 'Fiction', 'A scientist, disfigured in an accident, creates a perfect mask that allows him to pass as someone else, leading to a disturbing exploration of identity and alienation.', '2024-10-15', '1.00', 6, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/the_face_of_another.jpg'),
(67, 'Visual Shock', 'Michael Kammen', '978-5-666-778', '2023-12-10', 'Fiction', 'A provocative examination of controversial art in American history, exploring how visual culture has challenged and shaped social norms.', '2024-08-25', '1.00', 5, 0, 'http://bookcoverarchive.com/wp-content/uploads/amazon/visual_shock.jpg'),
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
  `payment_id` int(11) DEFAULT NULL,
  `borrow_date` datetime NOT NULL,
  `due_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_type` enum('membership','borrowing') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'brianclark@bing.com', '$2y$10$2G0vudacrMxevzBugLpXPeppBzt7x0EVdGTXhW/vF/k55dyQ8pN2i', 'Brian Clark', '2024-10-24 21:58:33', 'free');

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
  ADD KEY `book_id` (`book_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  ADD CONSTRAINT `borrowing_ibfk_3` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

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
