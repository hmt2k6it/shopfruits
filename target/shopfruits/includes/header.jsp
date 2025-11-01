<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <fmt:setLocale value="vi_VN" />
      <c%@ page isELIgnored="false" %>
        <!-- Top Header Start -->
        <header class="top-header top-header-bg">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-lg-3 col-md-4">
                <div class="top-header-social">
                  <ul>
                    <li>
                      <a href="https://github.com/hmt2k6it/shopfruits" target="_blank">
                        <i class="bx bxl-facebook"></i>
                      </a>
                    </li>
                    <li>
                      <a href="https://github.com/hmt2k6it/shopfruits" target="_blank">
                        <i class="bx bxl-twitter"></i>
                      </a>
                    </li>
                    <li>
                      <a href="https://github.com/hmt2k6it/shopfruits" target="_blank">
                        <i class="bx bxl-instagram"></i>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>

              <div class="col-lg-9 col-md-8">
                <div class="top-header-right">
                  <div class="top-header-right-item">
                    <ul class="top-header-list">
                      <c:choose>
                        <c:when test="${not empty sessionScope.account}">
                          <li>
                            <a href="${pageContext.request.contextPath}/comesoon">
                              Chào, ${sessionScope.account.userName}
                            </a>
                          </li>

                          <c:if test="${sessionScope.account.is_admin == 1}">
                            <li>
                              <a href="${pageContext.request.contextPath}/dashboard">Go to Dashboard</a>
                            </li>
                          </c:if>

                          <li>
                            <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                          </li>
                        </c:when>

                        <c:otherwise>
                          <li>
                            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                          </li>
                          <li>
                            <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
                          </li>
                        </c:otherwise>
                      </c:choose>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </header>
        <!-- Top Header End -->
        <!-- Start Navbar Area -->
        <div class="navbar-area">
          <!-- Menu For Mobile Device -->
          <div class="mobile-nav">
            <a href="index.html" class="logo">
              <img src="assets/images/logos/logo-1.png" alt="Logo" />
            </a>
          </div>

          <!-- Menu For Desktop Device -->
          <div class="main-nav">
            <div class="container">
              <nav class="navbar navbar-expand-md navbar-light">
                <a class="navbar-brand" href="home">
                  <img src="assets/images/logos/logo-1.png" alt="Logo" />
                </a>

                <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                  <ul class="navbar-nav m-auto">
                    <li class="nav-item">
                      <a href="${pageContext.request.contextPath}/home" class="nav-link active"> Home </a>
                    </li>
                    <li class="nav-item">
                      <a href="${pageContext.request.contextPath}/shop" class="nav-link"> Shop </a>
                    </li>
                    <li class="nav-item">
                      <a href="${pageContext.request.contextPath}/viewCart" class="nav-link"> Xem giỏ hàng </a>
                    </li>
                  </ul>
                  <div class="nav-right-side">
                    <ul class="nav-right-list">
                      <li class="cart-span">
                        <a href="${pageContext.request.contextPath}/viewCart"><i class="bx bx-cart"></i></a>
                        <c:choose>
                          <c:when test="${cart.size != 0}">
                            <span>${cart.size}</span>
                          </c:when>
                          <c:otherwise>
                            <span>0</span>
                          </c:otherwise>
                        </c:choose>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
            </div>
          </div>

          <div class="side-nav-responsive">
            <div class="container">
              <div class="dot-menu">
                <div class="circle-inner">
                  <div class="circle circle-one"></div>
                  <div class="circle circle-two"></div>
                  <div class="circle circle-three"></div>
                </div>
              </div>

              <div class="container">
                <div class="side-nav-inner">
                  <div class="side-nav justify-content-center align-items-center">
                    <div class="side-nav-item">
                      <ul class="nav-right-list">
                        <li class="cart-span">
                          <a href="${pageContext.request.contextPath}/viewCart"><i class="bx bx-cart"></i></a>
                          <c:choose>
                            <c:when test="${cart.size != 0}">
                              <span>${cart.size}</span>
                            </c:when>
                            <c:otherwise>
                              <span>0</span>
                            </c:otherwise>
                          </c:choose>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- End Navbar Area -->