<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Fruitables - Vegetable Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet" />
  </head>

  <body>
    <%@ include file="views/includes/header.jsp" %>
    <!-- Hero Start -->
    <div class="container-fluid py-5 mb-5 hero-header">
      <div class="container py-5">
        <div class="row g-5 align-items-center">
          <div class="col-md-12 col-lg-7">
            <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
            <h1 class="mb-5 display-3 text-primary">
              Organic Veggies & Fruits Foods
            </h1>
            <div class="position-relative mx-auto">
              <input
                class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill"
                type="number"
                placeholder="Search"
              />
              <button
                type="submit"
                class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100"
                style="top: 0; right: 25%"
              >
                Submit Now
              </button>
            </div>
          </div>
          <div class="col-md-12 col-lg-5">
            <div
              id="carouselId"
              class="carousel slide position-relative"
              data-bs-ride="carousel"
            >
              <div class="carousel-inner" role="listbox">
                <div class="carousel-item active rounded">
                  <img
                    src="img/hero-img-1.png"
                    class="img-fluid w-100 h-100 bg-secondary rounded"
                    alt="First slide"
                  />
                  <a href="#" class="btn px-4 py-2 text-white rounded"
                    >Fruites</a
                  >
                </div>
                <div class="carousel-item rounded">
                  <img
                    src="img/hero-img-2.jpg"
                    class="img-fluid w-100 h-100 rounded"
                    alt="Second slide"
                  />
                  <a href="#" class="btn px-4 py-2 text-white rounded"
                    >Vesitables</a
                  >
                </div>
              </div>
              <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#carouselId"
                data-bs-slide="prev"
              >
                <span
                  class="carousel-control-prev-icon"
                  aria-hidden="true"
                ></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#carouselId"
                data-bs-slide="next"
              >
                <span
                  class="carousel-control-next-icon"
                  aria-hidden="true"
                ></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Hero End -->
    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5" id="products-section">
      <div class="container py-5">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="col-lg-4 text-start">
              <h1>Our Organic Products</h1>
            </div>
            <div class="col-lg-8 text-end">
              <ul class="nav nav-pills d-inline-flex text-center mb-5">
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill ${activeCategory == 0 ? 'active' : ''}"
                    href="home?activeCategory=0#products-section"
                  >
                    <span class="text-dark" style="width: 130px"
                      >All Products</span
                    >
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex py-2 m-2 bg-light rounded-pill ${activeCategory == 2 ? 'active' : ''}"
                    href="home?activeCategory=2#products-section"
                  >
                    <span class="text-dark" style="width: 130px"
                      >Vegetables</span
                    >
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill ${activeCategory == 1 ? 'active' : ''}"
                    href="home?activeCategory=1#products-section"
                  >
                    <span class="text-dark" style="width: 130px">Fruits</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill ${activeCategory == 3 ? 'active' : ''}"
                    href="home?activeCategory=3#products-section"
                  >
                    <span class="text-dark" style="width: 130px">Bread</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill ${activeCategory == 4 ? 'active' : ''}"
                    href="home?activeCategory=4#products-section"
                  >
                    <span class="text-dark" style="width: 130px">Meat</span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="tab-content">
            <div id="tab-1" class="tab-pane fade active show p-0">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <c:forEach var="product" items="${pageProducts}">
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="img/${product.productImage}"
                              class="img-fluid w-100 rounded-top"
                              alt=""
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            ${product.category.categoryName}
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom"
                          >
                            <h4>${product.productName}</h4>
                            <p>${product.productDescription}</p>
                            <div class="justify-content-between flex-lg-wrap">
                              <p class="text-dark fs-5 fw-bold mb-0">
                                <fmt:formatNumber
                                  value="${product.productPrice}"
                                  type="currency"
                                  currencySymbol="vnđ"
                                  maxFractionDigits="2"
                                />
                                /
                                <c:choose>
                                  <c:when
                                    test="${product.category.categoryId == 3}"
                                  >
                                    cái
                                  </c:when>
                                  <c:otherwise> kg</c:otherwise>
                                </c:choose>
                              </p>
                              <a
                                href="#"
                                class="btn border border-secondary rounded-pill px-3 text-primary"
                                ><i
                                  class="fa fa-shopping-bag me-2 text-primary"
                                ></i>
                                Add to cart</a
                              >
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                  <c:if test="${totalPages > 1}">
                    <div class="col-12">
                      <ul class="pagination d-flex justify-content-center mt-5">
                        <li
                          class="page-item ${currentPage == 1 ? 'disabled' : ''}"
                        >
                          <a
                            class="rounded page-link"
                            href="home?activeCategory=${activeCategory}&activePage=${currentPage - 1}#products-section"
                            >«</a
                          >
                        </li>

                        <c:forEach var="i" begin="1" end="${totalPages}">
                          <li
                            class="page-item ${i == currentPage ? 'active' : ''}"
                          >
                            <a
                              class="rounded page-link"
                              href="home?activeCategory=${activeCategory}&activePage=${i}#products-section"
                              >${i}</a
                            >
                          </li>
                        </c:forEach>

                        <li
                          class="page-item ${currentPage == totalPages ? 'disabled' : ''}"
                        >
                          <a
                            class="rounded page-link"
                            href="home?activeCategory=${activeCategory}&activePage=${currentPage + 1}#products-section"
                            >»</a
                          >
                        </li>
                      </ul>
                    </div>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Fruits Shop End-->
    <!-- Bestsaler Product Start -->
    <div class="container-fluid py-5">
      <div class="container py-5">
        <div class="text-center mx-auto mb-5" style="max-width: 700px">
          <h1 class="display-4">Bestseller Products</h1>
          <p>
            Latin words, combined with a handful of model sentence structures,
            to generate Lorem Ipsum which looks reasonable.
          </p>
        </div>
        <div class="row g-4">
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="img/best-product-1.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="img/best-product-2.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="img/best-product-3.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="img/best-product-4.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="img/best-product-5.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-xl-4">
            <div class="p-4 rounded bg-light">
              <div class="row align-items-center">
                <div class="col-6">
                  <img
                    src="img/best-product-6.jpg"
                    class="img-fluid rounded-circle w-100"
                    alt=""
                  />
                </div>
                <div class="col-6">
                  <a href="#" class="h5">Organic Tomato</a>
                  <div class="d-flex my-3">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                  <h4 class="mb-3">3.12 $</h4>
                  <a
                    href="#"
                    class="btn border border-secondary rounded-pill px-3 text-primary"
                    ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                    cart</a
                  >
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="img/fruite-item-1.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-4">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="#"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="img/fruite-item-2.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-4">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="#"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="img/fruite-item-3.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-4">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="#"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-6 col-xl-3">
            <div class="text-center">
              <img
                src="img/fruite-item-4.jpg"
                class="img-fluid rounded"
                alt=""
              />
              <div class="py-2">
                <a href="#" class="h5">Organic Tomato</a>
                <div class="d-flex my-3 justify-content-center">
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star text-primary"></i>
                  <i class="fas fa-star"></i>
                </div>
                <h4 class="mb-3">3.12 $</h4>
                <a
                  href="#"
                  class="btn border border-secondary rounded-pill px-3 text-primary"
                  ><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Bestsaler Product End -->

    <!-- Fact Start -->
    <div class="container-fluid py-5">
      <div class="container">
        <div class="bg-light p-5 rounded">
          <div class="row g-4 justify-content-center">
            <div class="col-md-6 col-lg-6 col-xl-3">
              <div class="counter bg-white rounded p-5">
                <i class="fa fa-users text-secondary"></i>
                <h4>satisfied customers</h4>
                <h1>1963</h1>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 col-xl-3">
              <div class="counter bg-white rounded p-5">
                <i class="fa fa-users text-secondary"></i>
                <h4>quality of service</h4>
                <h1>99%</h1>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 col-xl-3">
              <div class="counter bg-white rounded p-5">
                <i class="fa fa-users text-secondary"></i>
                <h4>quality certificates</h4>
                <h1>33</h1>
              </div>
            </div>
            <div class="col-md-6 col-lg-6 col-xl-3">
              <div class="counter bg-white rounded p-5">
                <i class="fa fa-users text-secondary"></i>
                <h4>Available Products</h4>
                <h1>789</h1>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Fact Start -->

    <!-- Tastimonial Start -->
    <div class="container-fluid testimonial py-5">
      <div class="container py-5">
        <div class="testimonial-header text-center">
          <h4 class="text-primary">Our Testimonial</h4>
          <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
        </div>
        <div class="owl-carousel testimonial-carousel">
          <div class="testimonial-item img-border-radius bg-light rounded p-4">
            <div class="position-relative">
              <i
                class="fa fa-quote-right fa-2x text-secondary position-absolute"
                style="bottom: 30px; right: 0"
              ></i>
              <div class="mb-4 pb-4 border-bottom border-secondary">
                <p class="mb-0">
                  Lorem Ipsum is simply dummy text of the printing Ipsum has
                  been the industry's standard dummy text ever since the 1500s,
                </p>
              </div>
              <div class="d-flex align-items-center flex-nowrap">
                <div class="bg-secondary rounded">
                  <img
                    src="img/testimonial-1.jpg"
                    class="img-fluid rounded"
                    style="width: 100px; height: 100px"
                    alt=""
                  />
                </div>
                <div class="ms-4 d-block">
                  <h4 class="text-dark">Client Name</h4>
                  <p class="m-0 pb-3">Profession</p>
                  <div class="d-flex pe-5">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="testimonial-item img-border-radius bg-light rounded p-4">
            <div class="position-relative">
              <i
                class="fa fa-quote-right fa-2x text-secondary position-absolute"
                style="bottom: 30px; right: 0"
              ></i>
              <div class="mb-4 pb-4 border-bottom border-secondary">
                <p class="mb-0">
                  Lorem Ipsum is simply dummy text of the printing Ipsum has
                  been the industry's standard dummy text ever since the 1500s,
                </p>
              </div>
              <div class="d-flex align-items-center flex-nowrap">
                <div class="bg-secondary rounded">
                  <img
                    src="img/testimonial-1.jpg"
                    class="img-fluid rounded"
                    style="width: 100px; height: 100px"
                    alt=""
                  />
                </div>
                <div class="ms-4 d-block">
                  <h4 class="text-dark">Client Name</h4>
                  <p class="m-0 pb-3">Profession</p>
                  <div class="d-flex pe-5">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="testimonial-item img-border-radius bg-light rounded p-4">
            <div class="position-relative">
              <i
                class="fa fa-quote-right fa-2x text-secondary position-absolute"
                style="bottom: 30px; right: 0"
              ></i>
              <div class="mb-4 pb-4 border-bottom border-secondary">
                <p class="mb-0">
                  Lorem Ipsum is simply dummy text of the printing Ipsum has
                  been the industry's standard dummy text ever since the 1500s,
                </p>
              </div>
              <div class="d-flex align-items-center flex-nowrap">
                <div class="bg-secondary rounded">
                  <img
                    src="img/testimonial-1.jpg"
                    class="img-fluid rounded"
                    style="width: 100px; height: 100px"
                    alt=""
                  />
                </div>
                <div class="ms-4 d-block">
                  <h4 class="text-dark">Client Name</h4>
                  <p class="m-0 pb-3">Profession</p>
                  <div class="d-flex pe-5">
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                    <i class="fas fa-star text-primary"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Tastimonial End -->
    <%@ include file="views/includes/footer.jsp" %>
  </body>
</html>
