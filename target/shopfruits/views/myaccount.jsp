<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <!-- My Account Area -->
        <div class="my-account-area ptb-100">
            <div class="container">
                <div class="tab account-tab">
                    <div class="row">
                        <div class="col-lg-4">
                            <ul class="tabs">
                                <li>
                                    <a href="#">
                                        My Account
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        My Order 
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Address
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Log Out
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-8">
                            <div class="tab_content current active">
                                <div class="tabs_item current">
                                    <div class="account-tab-item">
                                        <div class="account-details">
                                            <h2>Profile Details</h2>
                                            <div class="account-profile">
                                                <div class="account-profile-img">
                                                    <img src="assets/images/products/product-profile1.jpg" alt="Images">
                                                </div>
                                                <ul>
                                                    <li><a href="#">Upload</a></li>
                                                    <li><a href="#">Remove</a></li>
                                                </ul>
                                            </div>

                                            <div class="account-form">
                                                <form>
                                                    <div class="row">
                                                        <div class="col-lg-6">
                                                            <div class="form-group">
                                                                <input type="text"  class="form-control" placeholder="Megan">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <div class="form-group">
                                                                <input type="text"  class="form-control" placeholder="Fox">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <input type="email"  class="form-control" placeholder="megan@hello.com">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" placeholder="+501-529-1747">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="account-form">
                                                <h3>Change Password</h3>
                                                <form>
                                                    <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <input type="password"  class="form-control" placeholder="Current Password">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <input type="password"  class="form-control" placeholder="New Password">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-12">
                                                            <div class="form-group">
                                                                <input type="password"  class="form-control" placeholder="Confirm Password">
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-4 col-md-6">
                                                            <button type="submit" class="default-btn btn-bg-three">
                                                                Confirm
                                                            </button>
                                                        </div>

                                                        <div class="col-lg-8 col-md-6">
                                                            <button type="submit" class="default-btn btn-bg-three">
                                                                Cancel
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tabs_item">
                                    <div class="account-tab-item">
                                        <div class="checkout-order">
                                            <h2>My Orders</h2>
                                            <h3 class="title-item">Item Description & Amount <span>Cash</span></h3>
                                            <ul class="checkout-product">
                                                <li>
                                                    <img src="assets/images/products/products-img1.png" alt="Images">
                                                    <h3>Organic Butter</h3>
                                                    <span>$2.0</span>
                                                    <div class="price-tag">$18.0</div>
                                                </li>

                                                <li>
                                                    <img src="assets/images/products/products-img2.png" alt="Images">
                                                    <h3>Fresh Carrots</h3>
                                                    <span>$25.0</span>
                                                    <div class="price-tag">$225.0</div>
                                                </li>
                                            </ul>

                                            <div class="total-amount">
                                                <h2 class="amount-title">Sub Total Amount <span>$243.0</span></h2>
                                                <h3 class="vat-title">Vat (5%) <span>$12.0</span></h3>
                                                <h3 class="total-title">Total Amount<span>$255.0</span></h3>
                                            </div>

                                            <div class="amount-btn">
                                                <a href="#" class="default-btn btn-bg-three">Next</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tabs_item">
                                    <div class="account-tab-item">
                                        <div class="address-details">
                                            <h2>My Addresses <a href="#" class="address-edit">Edit</a></h2>
                                            <p>New Jersey</p>
                                            <span>2873 Yorkshire Circle, NC, Carolina</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="tabs_item">
                                    <div class="account-tab-item">
                                        <div class="contact-form">
                                            <h2>Log In</h2>
                                            <form>
                                                <div class="row">
                                                    <div class="col-lg-12 ">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" required data-error="Please enter your Username or Email" placeholder="Username or Email">
                                                        </div>
                                                    </div>
                
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <input class="form-control" type="password" name="password" placeholder="Password">
                                                        </div>
                                                    </div>
                
                                                    <div class="col-lg-12 form-condition">
                                                        <div class="agree-label">
                                                            <input type="checkbox" id="chb1">
                                                            <label for="chb1">
                                                                Remember Me <a class="forget" href="forget-password.html">Forgot My Password?</a>
                                                            </label>
                                                        </div>
                                                    </div>
                    
                                                    <div class="col-lg-12 ">
                                                        <button type="submit" class="default-btn btn-bg-three">
                                                            Log In Now
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- My Account Area End -->

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