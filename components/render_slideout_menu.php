<?php
function renderSlideoutMenu($id, $title, $content)
{
    ?>
    <div id="<?= e($id) ?>" class="slideout-menu">
        <div class="slideout-content">
            <div class="slideout-header">
                <h2><?= e($title) ?></h2>
                <button class="close-button" aria-label="Close menu">×</button>
            </div>
            <div class="slideout-body">
                <?= $content ?>

                <div class="slideout-payment-details">
                    <h3>Payment Details</h3>
                    <form id="slideout-paymentForm">
                        <div class="slideout-form-group">
                            <label for="slideout-cardholderName">Cardholder Name</label>
                            <input type="text" id="slideout-cardholderName" placeholder="Brian Clark" required>
                        </div>

                        <div class="slideout-form-group">
                            <label for="slideout-email">Email address</label>
                            <input type="email" id="slideout-email" placeholder="example@youremail.com" required>
                        </div>

                        <div class="slideout-form-group">
                            <label for="slideout-cardNumber">Card Number</label>
                            <input type="text" id="slideout-cardNumber" placeholder="1234-5678-1234-5678" maxlength="19"
                                   required>
                        </div>

                        <div class="slideout-form-row">
                            <div class="slideout-form-group">
                                <label for="slideout-expiry">Expiry Date</label>
                                <input type="text" id="slideout-expiry" placeholder="MM/YYYY" maxlength="7" required>
                            </div>

                            <div class="slideout-form-group">
                                <label for="slideout-cvv">CVV</label>
                                <input type="password" id="slideout-cvv" placeholder="•••" maxlength="4" required>
                            </div>
                        </div>

                        <button type="submit" class="slideout-submit-button">Confirm Payment →</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="slideout-overlay"></div>
    </div>
    <?php
}
?>