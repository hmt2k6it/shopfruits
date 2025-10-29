<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <fmt:setLocale value="vi_VN" />
      <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
          <!-- Required Meta Tags -->
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />

          <!-- Bootstrap CSS -->
          <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
          <!-- Animate Min CSS -->
          <link rel="stylesheet" href="assets/css/animate.min.css" />
          <!-- Flaticon CSS -->
          <link rel="stylesheet" href="assets/fonts/flaticon.css" />
          <!-- Boxicons CSS -->
          <link rel="stylesheet" href="assets/css/boxicons.min.css" />
          <!-- Owl Carousel Min CSS -->
          <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
          <link rel="stylesheet" href="assets/css/owl.theme.default.min.css" />
          <!-- Nice Select Min CSS -->
          <link rel="stylesheet" href="assets/css/nice-select.min.css" />
          <!-- Meanmenu CSS -->
          <link rel="stylesheet" href="assets/css/meanmenu.css" />
          <!-- Style CSS -->
          <link rel="stylesheet" href="assets/css/style.css" />
          <!-- Responsive CSS -->
          <link rel="stylesheet" href="assets/css/responsive.css" />
          <!-- Theme Dark CSS -->
          <link rel="stylesheet" href="assets/css/theme-dark.css" />

          <!-- Favicon -->
          <link rel="icon" type="image/png" href="assets/images/favicon.png" />

          <title>Shop Fruits - Bán trái cây online</title>
        </head>

        <body>
          <!-- Pre Loader -->
          <div class="preloader">
            <div class="d-table">
              <div class="d-table-cell">
                <img src="assets/images/preloder-img.png" alt="Images" />
                <h2>ShopFruits</h2>
              </div>
            </div>
          </div>
          <!-- End Pre Loader -->
          <%@ include file="includes/header.jsp" %>
            <!-- New Arrival Area -->
            <section class="new-arrival-area pt-100 pb-70">
              <div class="container">
                <div class="section-title text-center">
                  <h2>Sản phẩm theo nguồn gốc</h2>
                </div>

                <div class="row pt-45">
                  <c:forEach var="product" items="${productPage}">
                    <div class="col-lg-3 col-sm-6">
                      <div class="new-arrival-item">
                        <div class="arrival-img">
                          <a href="shopdetail?productId=${product.productId}">
                            <img src="assets/images/${product.productImage}" alt="Product Images" />
                          </a>
                          <div class="arrival-item-tag">
                            <h3>${product.category.categoryName}</h3>
                          </div>
                          <ul class="arrival-item-action">
                            <li>
                              <a href="${pageContext.request.contextPath}/cart?productId=${product.productId}"><i
                                  class="bx bx-cart"></i></a>
                            </li>
                          </ul>
                        </div>

                        <div class="content">
                          <h3>
                            <a
                              href="${pageContext.request.contextPath}/shopdetail?productId=${product.productId}">${product.productName}</a>
                          </h3>
                          <span>
                            <fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="₫"
                              groupingUsed="true" maxFractionDigits="0" />
                            /Kg
                          </span>
                        </div>
                      </div>
                    </div>
                  </c:forEach>
                  <c:if test="${pagination > 0}">
                    <div class="col-lg-12 col-md-12 text-center">
                      <div class="pagination-area">
                        <c:choose>
                          <c:when test="${activePage <= 1}">
                            <span class="prev page-numbers disabled">
                              <i class="bx bx-chevron-left"></i>
                            </span>
                          </c:when>

                          <c:otherwise>
                            <a href="${pageContext.request.contextPath}/home?activePage=${activePage-1}"
                              class="prev page-numbers">
                              <i class="bx bx-chevron-left"></i>
                            </a>
                          </c:otherwise>
                        </c:choose>

                        <c:forEach var="i" begin="1" end="${pagination}">
                          <a href="${pageContext.request.contextPath}/home?activePage=${i}"
                            class="page-numbers ${i == activePage ? 'current' : ''}">${i}</a>
                        </c:forEach>

                        <c:choose>
                          <c:when test="${activePage >= pagination}">
                            <span class="next page-numbers disabled">
                              <i class="bx bx-chevron-right"></i>
                            </span>
                          </c:when>

                          <c:otherwise>
                            <a href="${pageContext.request.contextPath}/home?activePage=${activePage+1}"
                              class="next page-numbers">
                              <i class="bx bx-chevron-right"></i>
                            </a>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                  </c:if>
                </div>
              </div>
            </section>
            <!-- New Arrival Area End -->

            <!-- Choose Area -->
            <div class="choose-area pt-100 pb-70">
              <div class="container">
                <div class="section-title text-center">
                  <h2>Lý do chọn chúng tôi</h2>
                </div>
                <div class="row pt-45">
                  <div class="col-lg-4 col-sm-6">
                    <div class="choose-card">
                      <i class="flaticon-24-hours"></i>
                      <h3>Hỗ trợ 24/7</h3>
                      <p>
                        Khách hàng có thể đổi trả, khiếu nại sản phẩm bất cứ lúc nào.
                      </p>
                    </div>
                  </div>

                  <div class="col-lg-4 col-sm-6">
                    <div class="choose-card">
                      <i class="flaticon-leaf"></i>
                      <h3>100% Trái cây sạch</h3>
                      <p>
                        Sản phẩm được chọn lọc kỹ càng, đảm bảo an toàn vệ sinh thực phẩm.
                      </p>
                    </div>
                  </div>

                  <div class="col-lg-4 col-sm-6 offset-lg-0 offset-sm-3">
                    <div class="choose-card">
                      <i class="flaticon-service"></i>
                      <h3>Giao hàng tận nhà</h3>
                      <p>
                        Giao hàng nhanh chóng, đúng hẹn tận nơi theo yêu cầu của khách
                        hàng.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Choose Area End -->

            <!-- Trending Area -->
            <div class="trending-area pt-100 pb-70">
              <div class="container">
                <div class="section-title text-center">
                  <h2>Sản phẩm theo mùa</h2>
                </div>
                <div class="row pt-45">
                  <div class="col-lg-12">
                    <div class="row">
                      <c:forEach var="product" items="${productPage}">
                        <div class="col-lg-3 col-sm-6">
                          <div class="trending-item">
                            <div class="trending-img">
                              <a href="${pageContext.request.contextPath}/shopdetail?productId=${product.productId}">
                                <img src="assets/images/${product.productImage}" alt="Product Images" />
                              </a>
                              <div class="trending-item-tag">
                                <h3>${product.season.seasonName}</h3>
                              </div>
                              <ul class="trending-item-action">
                                <li>
                                  <a href="${pageContext.request.contextPath}/cart?productId=${product.productId}"><i
                                      class="bx bx-cart"></i></a>
                                </li>
                              </ul>
                            </div>

                            <div class="content">
                              <h3>
                                <a
                                  href="${pageContext.request.contextPath}/shopdetail?productId=${product.productId}">${product.productName}</a>
                              </h3>
                              <div class="rating">
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                                <i class="bx bxs-star"></i>
                              </div>
                              <span>
                                <fmt:formatNumber value="${product.productPrice}" type="currency" currencySymbol="₫"
                                  groupingUsed="true" maxFractionDigits="0" />
                                /Kg
                              </span>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Trending Area End -->

            <!-- Brand Area -->
            <div class="brand-area pb-100">
              <div class="container">
                <div class="brand-slider owl-carousel owl-theme">
                  <div class="brand-item">
                    <img src="assets/images/brand-logo/brand-img1.png" alt="Images" />
                  </div>
                  <div class="brand-item">
                    <img src="assets/images/brand-logo/brand-img2.png" alt="Images" />
                  </div>
                  <div class="brand-item">
                    <img src="assets/images/brand-logo/brand-img3.png" alt="Images" />
                  </div>
                  <div class="brand-item">
                    <img src="assets/images/brand-logo/brand-img4.png" alt="Images" />
                  </div>
                  <div class="brand-item">
                    <img src="assets/images/brand-logo/brand-img5.png" alt="Images" />
                  </div>
                  <div class="brand-item">
                    <img src="assets/images/brand-logo/brand-img2.png" alt="Images" />
                  </div>
                </div>
              </div>
            </div>
            <!-- Brand Area End -->
            <%@ include file="includes/footer.jsp" %>
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