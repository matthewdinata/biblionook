<?php
function renderReview($modalId)
{
    // Remove hardcoded book data - will be populated via JavaScript
    ?>
    <div id="<?= e($modalId) ?>" class="slideout-menu">
        <div class="slideout-content">
            <div class="slideout-header">
                <h2>How was your experience?</h2>
                <button class="close-button" aria-label="Close menu">×</button>
            </div>

            <div class="slideout-body">
                <p class="review-subtitle">
                    Share your thoughts and help fellow readers discover their next great read
                </p>
                <form id="reviewForm" class="review-form">
                    <div class="book-details">
                        <div class="book-image">
                            <img src="" alt="" class="cover-image" id="review-book-cover">
                        </div>

                        <div class="book-info">
                            <h2 class="book-title" id="review-book-title"></h2>
                            <p class="book-meta" id="review-book-meta"></p>
                            <div class="rating-input">
                                <?php for ($i = 5; $i >= 1; $i--): ?>
                                    <input type="radio" id="star<?= $i ?>" name="rating" value="<?= $i ?>" class="star-input">
                                    <label for="star<?= $i ?>" class="star-label" title="<?= $i ?> stars">
                                        <img src="assets/icons/star-empty.svg" alt="<?= $i ?> stars" class="star-icon empty">
                                        <img src="assets/icons/star-filled.svg" alt="<?= $i ?> stars" class="star-icon filled">
                                    </label>
                                <?php endfor; ?>
                            </div>
                            <div class="slideout-form-group">
                                <label for="reviewTitle">Review Title</label>
                                <input type="text" id="reviewTitle" name="reviewTitle" placeholder="Splendid!">
                            </div>

                            <div class="slideout-form-group">
                                <label for="reviewContent">Content</label>
                                <textarea id="reviewContent" name="reviewContent"
                                    placeholder="This book is a pure example of art poured into words..."></textarea>
                            </div>

                            <button type="submit" class="submit-review-button">
                                Add Review →
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="slideout-overlay"></div>
    </div>
    <?php
}
?>