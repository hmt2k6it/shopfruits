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
          <%@ include file="../includes/header.jsp" %>
            <!-- Product Area -->
            <div class="product-area pt-100 pb-70">
              <div class="container-fluid m-0">
                <div class="container-max">
                  <div class="row">
                    <div class="col-lg-9">
                      <div class="product-topper">
                        <div class="row">
                          <div class="col-lg-8 col-md-8">
                            <div class="product-topper-title">
                              <h3>
                                Tất cả sản phẩm
                                <span><span>( Hiểm thị ${startIndex+1}-${endIndex} của
                                    ${totalProducts} kết quả)</span></span>
                              </h3>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <c:forEach var="product" items="${productPage}">
                          <div class="col-lg-4 col-sm-6">
                            <div class="product-item">
                              <div class="product-img">
                                <a href="shopdetail?productId=${product.productId}">
                                  <img src="assets/images/${product.productImage}" alt="Product Images" />
                                </a>
                                <div class="product-item-tag">
                                  <h3>
                                    ${product.category.categoryName},
                                    ${product.season.seasonName}
                                  </h3>
                                </div>
                                <ul class="product-item-action">
                                  <li>                                
                                    <a href="cart?productId=${product.productId}"><i class="bx bx-cart"></i></a>
                                  </li>
                                </ul>
                              </div>

                              <div class="content">
                                <h3>
                                  <a href="shop-details.html">${product.productName}</a>
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
                                  <a href="shop?activePage=${activePage-1}" class="prev page-numbers">
                                    <i class="bx bx-chevron-left"></i>
                                  </a>
                                </c:otherwise>
                              </c:choose>

                              <c:forEach var="i" begin="1" end="${pagination}">
                                <a href="shop?activePage=${i}"
                                  class="page-numbers ${i == activePage ? 'current' : ''}">${i}</a>
                              </c:forEach>

                              <c:choose>
                                <c:when test="${activePage >= pagination}">
                                  <span class="next page-numbers disabled">
                                    <i class="bx bx-chevron-right"></i>
                                  </span>
                                </c:when>

                                <c:otherwise>
                                  <a href="shop?activePage=${activePage+1}" class="next page-numbers">
                                    <i class="bx bx-chevron-right"></i>
                                  </a>
                                </c:otherwise>
                              </c:choose>
                            </div>
                          </div>
                        </c:if>
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="product-side-bar">
                        <div class="search-widget">
                          <form class="search-form" action="search" method="post">
                            <input name="productName" value="${productName}" type="text" class="form-control"
                              placeholder="Tìm kiếm trái cây..." />
                            <button type="submit">
                              <i class="bx bx-search"></i>
                            </button>
                          </form>
                        </div>
                        <div class="product-side-bar-widget">
                          <h3 class="title">Trái cây nội & ngoại</h3>
                          <div class="product-side-categories">
                            <ul>
                              <c:forEach var="category" items="${allCategories}">
                                <li class="${category.categoryId == activeCate ? 'active' : ''}">
                                  <a href="shop?activeCate=${category.categoryId}">${category.categoryName}</a>
                                </li>
                              </c:forEach>
                            </ul>
                          </div>
                        </div>

                        <div class="product-side-bar-widget">
                          <h3 class="title">Trái cây theo mùa</h3>
                          <div class="product-side-categories">
                            <ul>
                              <c:forEach var="season" items="${allSeasons}">
                                <li class="${season.seasonId == activeSeason ? 'active' : ''}">
                                  <a href="shop?activeSeason=${season.seasonId}">${season.seasonName}</a>
                                </li>
                              </c:forEach>
                            </ul>
                          </div>
                        </div>

                        <div class="product-side-bar-widget">
                          <h3 class="title">High Rated Product</h3>
                          <div class="product-popular-post">
                            <article class="item">
                              <a href="news-details.html" class="thumb">
                                <span class="full-image cover bg1" role="img"></span>
                              </a>
                              <div class="info">
                                <h4 class="title-text">
                                  <a href="news-details.html"> Fresh Organic Meat </a>
                                </h4>
                                <p>$12.0 <del>$15.5</del></p>
                              </div>
                            </article>

                            <article class="item">
                              <a href="news-details.html" class="thumb">
                                <span class="full-image cover bg2" role="img"></span>
                              </a>
                              <div class="info">
                                <h4 class="title-text">
                                  <a href="news-details.html"> Fresh Pineapple </a>
                                </h4>
                                <p>$3.50 <del>$4.0</del></p>
                              </div>
                            </article>

                            <article class="item">
                              <a href="news-details.html" class="thumb">
                                <span class="full-image cover bg3" role="img"></span>
                              </a>
                              <div class="info">
                                <h4 class="title-text">
                                  <a href="news-details.html"> Fresh Banana </a>
                                </h4>
                                <p>$1.2 <del>$1.5</del></p>
                              </div>
                            </article>

                            <article class="item">
                              <a href="news-details.html" class="thumb">
                                <span class="full-image cover bg4" role="img"></span>
                              </a>
                              <div class="info">
                                <h4 class="title-text">
                                  <a href="news-details.html"> Rear Organic Saffron </a>
                                </h4>
                                <p>$124.0</p>
                              </div>
                            </article>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Product Area End -->

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