<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="vi">
    <head>
        <!-- Required Meta Tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap CSS --> 
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <!-- Animate Min CSS -->
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <!-- Flaticon CSS -->
        <link rel="stylesheet" href="assets/fonts/flaticon.css">
        <!-- Boxicons CSS -->
        <link rel="stylesheet" href="assets/css/boxicons.min.css">
        <!-- Owl Carousel Min CSS --> 
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        <!-- Nice Select Min CSS --> 
        <link rel="stylesheet" href="assets/css/nice-select.min.css">
        <!-- Meanmenu CSS -->
        <link rel="stylesheet" href="assets/css/meanmenu.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="assets/css/responsive.css">
        <!-- Theme Dark CSS -->
        <link rel="stylesheet" href="assets/css/theme-dark.css">


        <!-- Favicon -->
        <link rel="icon" type="image/png" href="assets/images/favicon.png">

        <title>Hilo - Organic Food Shop HTML Template</title>
    </head>
    <body>
        <!-- Pre Loader -->
        <div class="preloader">
            <div class="d-table">
                <div class="d-table-cell">
                    <img src="assets/images/preloder-img.png" alt="Images">
                    <h2>Hilo</h2>
                </div>
            </div>
        </div>
        <!-- End Pre Loader -->

        <%@ include file="../includes/header.jsp" %>

        <!-- Product Details Area -->
        <div class="product-details-area pt-100 pb-70">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-12">
                        <div class="product-detls-image">
                            <img style="width: 100%;"src="assets/images/${product.productImage}" alt="Image">
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-12">
                        <div class="product-desc">
                            <h3>${product.productName}</h3>
                            <div class="price">
                                <span class="new-price">${product.productPrice}</span>
                            </div>

                            <div class="product-review">
                                <div class="rating">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star-half'></i>
                                </div>
                                <a href="#" class="rating-count">3 reviews</a>
                            </div>
                            <p>${product.productDescription}</p>

                            <div class="input-count-area">
                                <h3>Quantity</h3>
                                <div class="input-counter">
                                    <span class="minus-btn"><i class='bx bx-minus'></i></span>
                                    <input type="text" value="1">
                                    <span class="plus-btn"><i class='bx bx-plus'></i></span>
                                </div>
                            </div>
                
                            <div class="product-add-btn">
                                <button type="submit" class="default-btn btn-bg-three">
                                    <i class="fas fa-cart-plus"></i> Buy Now!
                                </button>
                                <button type="submit" class="default-btn btn-bg-three">
                                    <i class="fas fa-cart-plus"></i> Add To Cart
                                </button>
                            </div>

                            <div class="product-share">
                                <ul>
                                    <li>
                                        <span>Share:</span>
                                    </li>
                                    <li>
                                        <a href="#" target="_blank">
                                            <i class='bx bxl-facebook' ></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" target="_blank">
                                            <i class='bx bxl-linkedin'></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" target="_blank">
                                            <i class='bx bxl-twitter'></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" target="_blank">
                                            <i class='bx bxl-instagram'></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Details Area End -->

        <!-- Product Tab -->
        <div class="product-tab pb-70">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="tab products-details-tab">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <ul class="tabs">
                                        <li>
                                            <a href="#">
                                                Description
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Reviews
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                Shipping Information
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="col-lg-12 col-md-12">
                                    <div class="tab_content current active pt-45">
                                        <div class="tabs_item current">
                                            <div class="products-tabs-decs">
                                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu neque ut ipsum tempor varius. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam eget ligula eget sem lacinia varius. Maecenas maximus vitae ligula sit amet placerat. Suspendisse elementum porttitor erat tempus malesuada. Vestibulum lorem ipsum, congue sed risus cursus, condimentum luctus nibh. Ut convallis ultrices lorem. Donec blandit purus ac lacus finibus, nec feugiat elit auctor.</p>
                                            </div>
                                        </div>

                                        <div class="tabs_item">
                                            <div class="products-tabs-reviews">
                                                <ul>
                                                    <li>
                                                        <img src="assets/images/products/product-profile1.jpg" alt="Image">
                                                        <h3>Devit M. kolin</h3>
                                                        <div class="content">
                                                            <div class="rating">
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star-half'></i>
                                                            </div>
                                                            <span>19 Jan 2020</span>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip </p>
                                                    </li>

                                                    <li>
                                                        <img src="assets/images/products/product-profile2.jpg" alt="Image">
                                                        <h3>Donam. Markin</h3>
                                                        <div class="content">
                                                            <div class="rating">
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star'></i>
                                                                <i class='bx bxs-star-half'></i>
                                                            </div>
                                                            <span>14 April 2020</span>
                                                        </div>
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip </p>
                                                    </li>
                                                </ul>

                                                <div class="reviews-form">
                                                    <div class="contact-form">
                                                        <h3>Add Your Review</h3>
                                                        <p>Lorem ipsum dolo sit amet, consectetur adipisicing  eiusmod tempor incididun </p>
                                                        <div class="rating">
                                                            <i class='bx bxs-star'></i>
                                                            <i class='bx bxs-star'></i>
                                                            <i class='bx bxs-star'></i>
                                                            <i class='bx bxs-star'></i>
                                                            <i class='bx bxs-star-half'></i>
                                                        </div>
                                                        <form id="contactForm">
                                                            <div class="row">
                                                                <div class="col-lg-6 col-sm-6">
                                                                    <div class="form-group">
                                                                        <input type="text" name="name" id="name" class="form-control" required data-error="Please enter your name" placeholder="Your Name*">
                                                                    </div>
                                                                </div>
                                
                                                                <div class="col-lg-6 col-sm-6">
                                                                    <div class="form-group">
                                                                        <input type="email" name="email_address" id="email_address" required data-error="Please enter email address" class="form-control" placeholder="Email Address*">
                                                                    </div>
                                                                </div>
                                
                                                                <div class="col-lg-12 col-md-12">
                                                                    <div class="form-group">
                                                                        <textarea name="message" class="form-control" id="message" cols="30" rows="8" required data-error="Write your message" placeholder="Your Message"></textarea>
                                                                    </div>
                                                                </div>
                                
                                                                <div class="col-lg-12 col-md-12">
                                                                    <button type="submit" class="default-btn btn-bg-three">
                                                                        Send Your Message
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="tabs_item">
                                            <div class="products-tabs-shipping">
                                                <ul>
                                                    <li>
                                                        Address: 
                                                        <span>Virgil A Stanton, Virginia, USA</span>
                                                    </li>

                                                    <li>
                                                        Phone: 
                                                        <a href="tel:+1(123)-456-7890-3524">+1 (123) 456 7890 3524</a>
                                                    </li>

                                                    <li>
                                                        Email: 
                                                        <a href="mailto:hello@hilo.com">hello@hilo.com</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Product Tab End -->

        <!-- Related Product Area -->
        <div class="related-products-area pb-70">
            <div class="container">
                <div class="section-title text-center">
                    <h2>Related Products</h2>
                </div>
                <div class="row pt-45">
                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="product-img">
                                <a href="shop-details.html">
                                    <img src="assets/images/products/products-img1.png" alt="Product Images">
                                </a>
                                <div class="product-item-tag">
                                    <h3>New</h3>
                                </div>
                                <ul class="product-item-action">
                                    <li><a href="#"><i class='bx bx-repost'></i></a></li>
                                    <li><a href="wishlist.html"><i class='bx bx-heart'></i></a></li>
                                    <li><a href="cart.html"><i class='bx bx-cart'></i></a></li>
                                </ul>
                            </div>

                            <div class="content">
                                <h3><a href="shop-details.html">Organic Butter</a></h3>
                                <div class="rating">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                </div>
                                <span>$12.0/Kg </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="product-img">
                                <a href="shop-details.html">
                                    <img src="assets/images/products/products-img2.png" alt="Product Images">
                                </a>
                                <div class="product-item-tag">
                                    <h3>-22%</h3>
                                </div>
                                <ul class="product-item-action">
                                    <li><a href="#"><i class='bx bx-repost'></i></a></li>
                                    <li><a href="wishlist.html"><i class='bx bx-heart'></i></a></li>
                                    <li><a href="cart.html"><i class='bx bx-cart'></i></a></li>
                                </ul>
                            </div>

                            <div class="content">
                                <h3><a href="shop-details.html">Fresh Carrots</a></h3>
                                <div class="rating">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                </div>
                                <span>$5.0/Kg <del>$7.0/Kg</del></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="product-img">
                                <a href="shop-details.html">
                                    <img src="assets/images/products/products-img3.png" alt="Product Images">
                                </a>
                                <div class="product-item-tag">
                                    <h3>New</h3>
                                </div>
                                <ul class="product-item-action">
                                    <li><a href="#"><i class='bx bx-repost'></i></a></li>
                                    <li><a href="wishlist.html"><i class='bx bx-heart'></i></a></li>
                                    <li><a href="cart.html"><i class='bx bx-cart'></i></a></li>
                                </ul>
                            </div>

                            <div class="content">
                                <h3><a href="shop-details.html">Green Cucumber</a></h3>
                                <div class="rating">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                </div>
                                <span>$2.0/Kg <del>$3.0/Kg</del></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-sm-6">
                        <div class="product-item">
                            <div class="product-img">
                                <a href="shop-details.html">
                                    <img src="assets/images/products/products-img4.png" alt="Product Images">
                                </a>
                                <div class="product-item-tag">
                                    <h3>-10%</h3>
                                </div>
                                <ul class="product-item-action">
                                    <li><a href="#"><i class='bx bx-repost'></i></a></li>
                                    <li><a href="wishlist.html"><i class='bx bx-heart'></i></a></li>
                                    <li><a href="cart.html"><i class='bx bx-cart'></i></a></li>
                                </ul>
                            </div>

                            <div class="content">
                                <h3><a href="shop-details.html">Fresh Pineapple</a></h3>
                                <div class="rating">
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                    <i class='bx bxs-star'></i>
                                </div>
                                <span>$2.0/Kg <del>$3.0/Kg</del></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Related Product Area End -->

        <!-- Footer Area -->
        <footer class="footer-area footer-bg">
            <div class="container">
                <div class="footer-top pt-100 pb-70">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-widget footer-widget-color-2">
                                <div class="footer-logo">
                                    <a href="index.html">
                                        <img src="assets/images/logos/footer-logo.png" class="footer-logo1" alt="Images">
                                        <img src="assets/images/logos/logo-1.png" class="footer-logo2" alt="Images">
                                    </a>
                                </div>
                                <p>
                                    We are one of the best & quality full in market. Let's join.
                                </p>
                                <ul class="footer-list-contact">
                                    <li>
                                        <i class='bx bx-home'></i>
                                        <a href="#">Virgil A Stanton, Virginia, USA</a>
                                    </li>
                                    <li>
                                        <i class='bx bx-phone-call' ></i>
                                        <a href="tel:+1(123)-456-7890">+1 (123) 456 7890</a>
                                    </li>
                                    <li>
                                        <i class='bx bx-envelope'></i>
                                        <a href="mailto:hello@hilo.com">hello@hilo.com</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="footer-widget footer-widget-color-2">
                                <h3>Services</h3>
                                <ul class="footer-list">
                                    <li>
                                        <a href="wordpress-hosting.html" target="_blank">
                                            My Account
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="tracking-order.html" target="_blank">
                                            Tracking Order 
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="customer-services.html" target="_blank">
                                            Customer Services  
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="compare.html" target="_blank">
                                            Compare    
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="wishlist.html" target="_blank">
                                            Wishlist      
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="privacy-policy.html" target="_blank">
                                            Privacy Policy      
                                        </a>
                                    </li> 
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="footer-widget footer-widget-color-2">
                                <h3>Information</h3>
                                <ul class="footer-list">
                                    <li>
                                        <a href="index.html" target="_blank">
                                            Home
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="about.html" target="_blank">
                                            About Us 
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="blog-details.html" target="_blank">
                                            Blog Details  
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="shop-details.html" target="_blank">
                                            Shop Details    
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="testimonials.html" target="_blank">
                                            Testimonials      
                                        </a>
                                    </li> 
                                    <li>
                                        <a href="team.html" target="_blank">
                                            Team      
                                        </a>
                                    </li> 
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="footer-widget footer-widget-color-2">
                                <h3>Follow Us</h3>
                                <p>We are one of the best & quality full  in market. Let's join.</p>
                                <form class="footer-form-area">
                                    <input type="email" class="form-control" placeholder="Email">
                                    <button class="subscribe-btn" type="submit">
                                        <i class='bx bx-paper-plane'></i>
                                    </button>
                                </form>

                                <ul class="social-link">
                                    <li>
                                        <a href="#" target="_blank"><i class='bx bxl-facebook'></i></a>
                                    </li> 
                                    <li>
                                        <a href="#" target="_blank"><i class='bx bxl-twitter'></i></a>
                                    </li> 
                                    <li>
                                        <a href="#" target="_blank"><i class='bx bxl-instagram'></i></a>
                                    </li> 
                                    <li>
                                        <a href="#" target="_blank"><i class='bx bxl-youtube'></i></a>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="copy-right-area-three">
                    <div class="copy-right-text">
                        <p>
                            Copyright @<script>document.write(new Date().getFullYear())</script> Hilo. All Rights Reserved by 
                            <a href="https://hibootstrap.com/" target="_blank">HiBootstrap</a> 
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Area End -->


       <!-- Jquery Min JS -->
        <script src="assets/js/jquery.min.js"></script>
        <!-- Bootstrap Min JS -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <!-- Owl Carousel Min JS -->
        <script src="assets/js/owl.carousel.min.js"></script>
        <!-- Nice Select Min JS -->
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <!-- Wow Min JS -->
        <script src="assets/js/wow.min.js"></script>
        <!-- Meanmenu JS -->
        <script src="assets/js/meanmenu.js"></script>
        <!-- Jquery Ui Min JS -->
        <script src="assets/js/jquery-ui.min.js"></script>
        <!-- Ajaxchimp Min JS -->
        <script src="assets/js/jquery.ajaxchimp.min.js"></script>
        <!-- Form Validator Min JS -->
        <script src="assets/js/form-validator.min.js"></script>
        <!-- Contact Form JS -->
        <script src="assets/js/contact-form-script.js"></script>
        <!-- Mixitup Min JS -->
        <script src="assets/js/mixitup.min.js"></script>
        <!-- Custom JS -->
        <script src="assets/js/custom.js"></script>

    </body>
</html>