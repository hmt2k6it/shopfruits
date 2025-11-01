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
                        <!-- Start Cart Area -->
                        <section class="cart-wraps-area ptb-100">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                        <form action="checkout" method="post">
                                            <div class="cart-wraps">
                                                <div class="cart-table table-responsive">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Sản phẩm</th>
                                                                <th scope="col">Tên</th>
                                                                <th scope="col">Đơn giá</th>
                                                                <th scope="col">Số lượng</th>
                                                                <th scope="col">Thành tiền</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <c:if test="${empty cart.items}">
                                                                <tr>
                                                                    <td colspan="5"
                                                                        style="text-align: center; padding: 20px;">
                                                                        Giỏ hàng của bạn không có gì.
                                                                    </td>
                                                                </tr>
                                                            </c:if>

                                                            <c:forEach var="item" items="${cart.items}">
                                                                <tr data-product-id="${item.product.productId}">
                                                                    <td class="product-thumbnail">
                                                                        <a href="${pageContext.request.contextPath}">
                                                                            <img src="assets/images/${item.product.productImage}"
                                                                                alt="${item.product.productName}">
                                                                        </a>
                                                                    </td>

                                                                    <td class="product-name">
                                                                        <a
                                                                            href="${pageContext.request.contextPath}">${item.product.productName}</a>
                                                                    </td>

                                                                    <td class="product-price">
                                                                        <span class="unit-amount">
                                                                            <fmt:formatNumber
                                                                                value="${item.product.productPrice}"
                                                                                type="currency" />
                                                                        </span>
                                                                    </td>

                                                                    <td class="product-quantity">
                                                                        <div class="input-counter">
                                                                            <span class="minus-btn">
                                                                                <i class='bx bx-minus'></i>
                                                                            </span>
                                                                            <input type="text"
                                                                                class="product-quantity-input"
                                                                                value="${item.quantity}">
                                                                            <span class="plus-btn">
                                                                                <i class='bx bx-plus'></i>
                                                                            </span>
                                                                        </div>
                                                                    </td>

                                                                    <td class="product-subtotal">
                                                                        <span class="subtotal-amount">
                                                                            <fmt:formatNumber
                                                                                value="${item.product.productPrice * item.quantity}"
                                                                                type="currency" />
                                                                        </span>

                                                                        <a href="removeFromCart?productId=${item.product.productId}"
                                                                            class="remove">
                                                                            <i class='bx bx-trash'></i>
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="cart-buttons">
                                                    <div class="row align-items-center">
                                                        <div class="col-lg-7 col-sm-7 col-md-7">
                                                            <div class="continue-shopping-box">
                                                                <a href="#${pageContext.request.contextPath}/shop"
                                                                    class="
                                                                    default-btn btn-bg-three">
                                                                    Tiếp tục mua
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="cart-totals">
                                                        <h3>Cart Totals</h3>
                                                        <ul>
                                                            <li>Tổng tiền
                                                                <span>
                                                                    <fmt:formatNumber value="${cart.totalPrice}"
                                                                        type="currency" />
                                                                </span>
                                                            </li>
                                                            <li>Phí Ship<span>
                                                                    <fmt:formatNumber value="30000" type="currency" />
                                                                </span></li>
                                                            <li><b>Tổng cộng</b>
                                                                <span><b>
                                                                        <fmt:formatNumber
                                                                            value="${cart.totalPrice + 30000}"
                                                                            type="currency" />
                                                                    </b></span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="shipping-address-box"
                                                        style="margin-top: 20px; text-align: left;">
                                                        <h4 style="margin-bottom: 15px;">Thông tin giao hàng:</h4>
                                                        <div class="form-group" style="margin-bottom: 10px;">
                                                            <label for="shipping_address">Địa chỉ nhận hàng:</label>
                                                            <input type="text" class="form-control"
                                                                name="shippingAddress" id="shipping_address"
                                                                placeholder="Nhập địa chỉ của bạn" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="shipping_phone">Số điện thoại:</label>
                                                            <input type="text" class="form-control" name="shippingPhone"
                                                                id="shipping_phone" placeholder="Nhập SĐT của bạn"
                                                                required>
                                                        </div>
                                                    </div>
                                                    <div class="payment-method-options"
                                                        style="margin-top: 20px; margin-bottom: 30px; text-align: left;">
                                                        <h4 style="margin-bottom: 15px;">Chọn phương thức thanh
                                                            toán:</h4>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                name="paymentMethod" id="payment_cod" value="COD"
                                                                checked>
                                                            <label class="form-check-label" for="payment_cod">
                                                                Thanh toán khi nhận hàng (COD)
                                                            </label>
                                                        </div>
                                                        <div class="form-check" style="margin-top: 10px;">
                                                            <input class="form-check-input" type="radio"
                                                                name="paymentMethod" id="payment_bank"
                                                                value="BankTransfer">
                                                            <label class="form-check-label" for="payment_bank">
                                                                Chuyển khoản ngân hàng
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="default-btn btn-bg-three">
                                                        Xác nhận đơn hàng
                                                    </button>
                                                </div>
                                            </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                            </div>
                        </section>
                        <!-- End Cart Area -->
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
                            <script type="text/javascript">
                                const contextPath = "${pageContext.request.contextPath}";
                            </script>
                            <script src="assets/js/add.js"></script>

                </body>

                </html>