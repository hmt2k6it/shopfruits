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

                        <!-- Product Details Area -->
                        <div class="product-details-area pt-100 pb-70">
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="product-detls-image">
                                            <img style="width: 100%;" src="assets/images/${product.productImage}"
                                                alt="Image">
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-12">
                                        <div class="product-desc">
                                            <h3>${product.productName}</h3>
                                            <div class="price">
                                                <span class="new-price">
                                                    <fmt:formatNumber value="${product.productPrice}" type="currency"
                                                        currencySymbol="₫" groupingUsed="true" maxFractionDigits="0" />
                                                    /Kg
                                                </span>
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



                                            <div class="product-add-btn">
                                                <a
                                                    href="${pageContext.request.contextPath}cart?productId=${product.productId}">
                                                    <button type="submit" class="default-btn btn-bg-three">
                                                        <i class="fas fa-cart-plus"></i> Add To Cart
                                                    </button>
                                                </a>
                                            </div>

                                            <div class="product-share">
                                                <ul>
                                                    <li>
                                                        <span>Share:</span>
                                                    </li>
                                                    <li>
                                                        <a href="#" target="_blank">
                                                            <i class='bx bxl-facebook'></i>
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



                        <%@ include file="../includes/footer.jsp" %>


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