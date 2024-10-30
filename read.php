<?php
// Function to safely escape output
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

require_once "lib/db.php";

$book_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

$book_content = [
    // Page 1
    [
        'chapter' => 'Chapter One',
        'subtitle' => 'The Old House',
        'content' => [
            'Sarah Matthews stood before the iron gates of Thornfield Manor, her grandmother\'s old Victorian house, as the setting sun cast long shadows across the overgrown garden. The key felt heavy in her pocket – a weight that represented both inheritance and responsibility. After fifteen years away, she had returned to the one place she\'d sworn never to revisit.',
            'The evening air carried the sweet scent of wild roses, mixed with something else she couldn\'t quite identify. Ancient oak trees lined the gravel driveway, their branches forming a natural arch overhead. As she pushed open the creaking gate, a gust of wind rustled through the leaves, almost like a whisper of welcome – or warning.',
            'The mansion loomed before her, its weathered facade telling stories of neglect and abandonment. Paint peeled from the window frames like old scabs, and thick ivy had claimed the eastern wall entirely, its tendrils probing between stones as if searching for secrets hidden within. The once-pristine garden had transformed into a wild maze of untamed beauty, nature reclaiming what had once been meticulously maintained by her grandmother\'s careful hands.',
        ]
    ],
    // Page 2
    [
        'content' => [
            'As she approached the front steps, memories flooded back with each footfall on the gravel path. Summer afternoons spent reading in the garden gazebo, the scent of her grandmother\'s fresh-baked cookies wafting through open windows, the sound of classical music drifting from the library where the old Victrola still stood in its corner.',
            'Inside her jacket pocket, her phone buzzed – probably Rebecca checking if she\'d arrived safely. Sarah ignored it. How could she explain to her best friend that standing here felt like stepping into a photograph from her childhood, memories seeping through the cracks in the stone like morning mist?',
            'The real estate agent had suggested selling the property, his eyes gleaming at the prospect of commanding a hefty commission. "Location, location, location," he\'d said with practiced enthusiasm. "Despite its condition, there\'s significant interest in historical properties like this." But Sarah knew she couldn\'t sell. Not yet. Not before she understood why her grandmother\'s last letter had been so insistent that she return.',
            'The key turned with surprising ease in the lock, as if the house had been waiting for her. The door swung open with a low creak that echoed through the empty foyer. Dust motes danced in the thin shafts of evening light that penetrated the grimy windows, creating an almost ethereal atmosphere. The air inside was thick with the musty scent of abandonment, yet underneath it all, she could still detect the faintest trace of her grandmother\'s lavender perfume.',
            'Sarah\'s footsteps echoed on the hardwood floors, each step stirring up memories like the dust beneath her feet. The grandfather clock in the corner stood silent, its hands frozen at 3:47, marking some long-forgotten moment in time. Family portraits lined the walls, their subjects watching her progress with painted eyes that seemed to follow her movement.'
        ]
    ],
    // Page 3
    [
        'content' => [
            'Making her way to the library, Sarah\'s hand trembled slightly as she reached for the brass doorknob. This room had always been her sanctuary during childhood visits, its floor-to-ceiling shelves housing countless adventures and mysteries. The door opened with a protest of unused hinges, and she gasped softly at the sight before her.',
            'Unlike the rest of the house, the library seemed somehow preserved in time. The leather-bound volumes still stood in neat rows, their spines gleaming dully in the fading light. Her grandmother\'s reading chair still sat by the window, a faded bookmark marking a page in the novel left on the side table. The air here was different too – lighter, almost expectant.',
            'The massive oak desk dominated the center of the room, its surface cleared except for a single envelope placed precisely in the middle. The paper wasn\'t dusty like everything else; it looked as if it had been placed there recently. Her name was written across the front in her grandmother\'s distinctive handwriting, the elegant script as familiar as her own reflection.',
            'Memories of countless hours spent in this room washed over her. Her grandmother teaching her to read from worn copies of fairy tales, later discussions about literature that stretched late into the night, and finally, their last conversation here before Sarah left for college, determined never to return to what she then saw as a suffocating small town.'
        ]
    ],
    // Page 4
    [
        'content' => [
            'With trembling fingers, Sarah picked up the envelope. It was sealed with dark red wax, impressed with a symbol she didn\'t recognize – a rose intertwined with what appeared to be a key. The paper was thick and expensive-feeling, unlike the simple stationery her grandmother typically used. Something about it made her pulse quicken, as if she were about to uncover the first clue to a mystery she didn\'t yet understand.',
            'As the last rays of sunlight faded from the windows, Sarah sank into the familiar comfort of her grandmother\'s reading chair. The leather was worn soft in all the same places she remembered, and the subtle scent of old books and furniture polish enveloped her like a welcome embrace. For a moment, she could almost imagine her grandmother sitting across from her, eyes twinkling as she shared another of her endless stories.',
            'The house creaked and settled around her, its familiar sounds both comforting and unsettling in the growing darkness. From somewhere upstairs came the soft sound of fluttering, perhaps birds nesting in one of the unused chimneys. Or perhaps something else entirely. Sarah had always suspected there was more to this house than met the eye, more than what her grandmother had ever revealed.',
            'She traced her finger along the edge of the envelope, feeling the quality of the paper, the slight roughness of the wax seal. Whatever secrets this house held, whatever mysteries lay within this envelope, she knew her journey was only beginning. The real question was: was she ready for what she might discover?'
        ]
    ],
    // Page 5
    [
        'content' => [
            'Taking a deep breath, Sarah broke the seal. The wax cracked cleanly, revealing a letter written in the same elegant hand as the envelope. But as she began to read, she realized this was unlike any letter she\'d received from her grandmother before. The words seemed to shimmer in the dying light, each sentence more puzzling than the last.',
            '"My dearest Sarah," it began, "If you are reading this, then you have finally returned home, and it is time for you to know the truth about Thornfield Manor, about our family, and about the legacy that is now yours to bear. What I am about to tell you may seem impossible, but I assure you, every word is true."',
            'As she read on, the room seemed to grow darker, the shadows in the corners deeper and more pronounced. Or perhaps it was just her imagination, fueled by the extraordinary claims laid out on the pages before her. The history of Thornfield Manor, it seemed, was far more complex and mysterious than she\'d ever imagined.',
            'A sudden gust of wind rattled the windows, making Sarah jump. She looked up from the letter to find that night had fallen completely, the room now illuminated only by moonlight filtering through the dusty panes. And in that silvery light, she could have sworn she saw something move among the bookshelves – a flash of movement, there and gone in an instant, like a page turning in a book with no hands to guide it.'
        ]
    ],
    // Page 6
    [
        'chapter' => 'Chapter Two',
        'subtitle' => 'The Hidden Room',
        'content' => [
            'Sarah awoke the next morning with a sense of purpose. The letter from her grandmother had revealed secrets she could hardly believe, but she knew she had to uncover the truth. The first step was to find the hidden room mentioned in the letter.',
            'The instructions were vague, but they pointed to a part of the house she had rarely visited – the attic. Gathering her courage, she made her way up the narrow staircase, each step creaking under her weight. The air grew colder as she ascended, and the light dimmed, casting eerie shadows on the walls.',
            'At the top of the stairs, she found a small door, almost hidden behind a stack of old trunks. With a deep breath, she pushed it open, revealing a dusty, cobweb-filled space. The attic was filled with forgotten relics of the past – old furniture, trunks filled with clothes, and boxes of books. But it was the far corner that caught her attention.',
            'There, behind an old wardrobe, she found a small, ornate door. It was unlike any other door in the house, intricately carved with symbols she didn\'t recognize. Her heart raced as she reached for the handle, half expecting it to be locked. But to her surprise, it turned easily, and the door swung open to reveal a hidden room.'
        ]
    ],
    // Page 7
    [
        'content' => [
            'The hidden room was small and dimly lit, with only a single window allowing a sliver of light to filter in. The walls were lined with shelves, filled with books and strange artifacts. In the center of the room stood a pedestal, upon which rested an old, leather-bound book.',
            'Sarah approached the pedestal, her eyes fixed on the book. It looked ancient, its cover worn and faded. She reached out and gently opened it, revealing pages filled with handwritten notes and sketches. The handwriting was her grandmother\'s, but the contents were unlike anything she had ever seen.',
            '"The secrets of Thornfield Manor," the first page read. As she flipped through the pages, she found detailed accounts of the house\'s history, its previous owners, and the strange occurrences that had taken place over the years. There were references to hidden passages, secret rooms, and even mentions of a hidden treasure.',
            'Her grandmother had clearly spent years researching the house, uncovering its mysteries and documenting her findings. But why had she kept it all a secret? And why had she insisted that Sarah return to the house? The answers, it seemed, were hidden within the pages of the book.',
            'As she read on, Sarah felt a growing sense of unease. The more she learned about the house, the more she realized how little she truly knew. But one thing was clear – her grandmother had left her a legacy, and it was up to her to uncover the truth. With a determined look, she closed the book and made her way back downstairs, ready to face whatever challenges lay ahead.'
        ]
    ],
];

// Pagination logic
$pages_per_view = 1;
$total_pages = 7;
$total_pages = count($book_content);
$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$current_page = max(1, min($total_pages, $current_page));

if ($book_id > 0) {
    $sql = "SELECT title, thumbnail_url, author, summary, isbn FROM Book WHERE id = ?";
    $stmt = $db->prepare($sql);
    $stmt->bind_param("i", $book_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $book = null;
    if ($result->num_rows > 0) {
        $book = $result->fetch_assoc();
    }
    $stmt->close();
} else {
    $book = null;
}

if (!$book) {
    header('Location: index.php');
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - <?php echo e($book['title']); ?></title>
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/read.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    $current_script = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_script);
    ?>
    <div class="main-content">

        <div class="book-display">
            <?php if ($current_page === 1): ?>
                <div class="title-page">
                    <h1><?php echo e($book['title']); ?></h1>
                    <h3>by</h3>
                    <h2><?php echo e($book['author']); ?></h2>
                </div>

                <div class="book-info">
                    <img src="<?php echo e($book['thumbnail_url']); ?>" alt="<?php echo e($book['title']); ?> cover"
                         class="book-thumbnail">
                </div>
            <?php endif; ?>

            <?php
            $page = $book_content[$current_page - 1];
            if (isset($page['chapter'])):
                ?>
                <div class="chapter-title">
                    <h2><?php echo e($page['chapter']); ?></h2>
                    <h3><?php echo e($page['subtitle']); ?></h3>
                </div>
            <?php endif; ?>

            <div class="text">
                <?php foreach ($page['content'] as $paragraph): ?>
                    <p><?php echo e($paragraph); ?></p>
                <?php endforeach; ?>
            </div>

            <div class="page-number"><?php echo $current_page; ?></div>
        </div>

        <div class="pagination">
            <?php if ($current_page > 1): ?>
                <a href="?id=<?= $book_id ?>&page=<?= $current_page - 1 ?>" class="page-nav">&lt;</a>
            <?php else: ?>
                <span class="page-nav disabled">&lt;</span>
            <?php endif; ?>

            <span class="page-indicator">Page <?= $current_page ?> of <?= $total_pages ?></span>

            <?php if ($current_page < $total_pages): ?>
                <a href="?id=<?= $book_id ?>&page=<?= $current_page + 1 ?>" class="page-nav">&gt;</a>
            <?php else: ?>
                <span class="page-nav disabled">&gt;</span>
            <?php endif; ?>
        </div>
    </div>
</body>

</html>