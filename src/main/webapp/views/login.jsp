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

          <title>Hilo - Organic Food Shop HTML Template</title>
        </head>

        <body>
          <!-- Pre Loader -->
          <div class="preloader">
            <div class="d-table">
              <div class="d-table-cell">
                <img src="assets/images/preloder-img.png" alt="Images" />
                <h2>Hilo</h2>
              </div>
            </div>
          </div>
          <!-- End Pre Loader -->
          <%@ include file="../includes/header.jsp" %>
            <!-- User Area -->
            <div class="user-area pt-100 pb-70">
              <div class="container">
                <div class="user-width">
                  <div class="user-form">
                    <div class="contact-form">
                      <h2>Đăng nhập</h2>
                      <form action="login" method="post">
                        <div class="row">
                          <div class="col-lg-12">
                            <div class="form-group">
                              <p class="text-danger">${mess}</p>
                              <input name="username" type="text" class="form-control" required
                                data-error="Vui lòng nhập tên đăng nhập" placeholder="Nhập tên đăng nhập" />
                            </div>
                          </div>

                          <div class="col-12">
                            <div class="form-group">
                              <input name="password" class="form-control" type="password" placeholder="Nhập mật khẩu" />
                            </div>
                          </div>

                          <div class="col-lg-12 form-condition">
                            <div class="agree-label">
                              <input type="checkbox" id="chb1" />
                              <label for="chb1">
                                Remember Me
                                <a class="forget" href="forget-password.html">Forgot My Password?</a>
                              </label>
                            </div>
                          </div>

                          <div class="col-lg-12">
                            <button type="submit" class="default-btn btn-bg-three">
                              Đăng nhập
                            </button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- User Area End -->
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