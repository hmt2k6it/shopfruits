<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%@ page
isELIgnored="false" %>
<fmt:setLocale value="vi_VN" />
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
    <%@ include file="includes/header.jsp" %>
    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5" id="products-section">
      <div class="container py-5">
        <h1 class="mb-4">Fresh fruits shop</h1>
        <div class="row g-4">
          <div class="col-lg-12">
            <div class="row g-4">
              <div class="col-xl-3">
                <div class="input-group w-100 mx-auto d-flex">
                  <input
                    type="search"
                    class="form-control p-3"
                    placeholder="keywords"
                    aria-describedby="search-icon-1"
                  />
                  <span id="search-icon-1" class="input-group-text p-3"
                    ><i class="fa fa-search"></i
                  ></span>
                </div>
              </div>
              <div class="col-6"></div>
              <div class="col-xl-3">
                <div
                  class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4"
                >
                  <label for="fruits">Default Sorting:</label>
                  <select
                    id="fruits"
                    name="fruitlist"
                    class="border-0 form-select-sm bg-light me-3"
                    form="fruitform"
                  >
                    <option value="volvo">Nothing</option>
                    <option value="saab">Popularity</option>
                    <option value="opel">Organic</option>
                    <option value="audi">Fantastic</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="row g-4">
              <div class="col-lg-3">
                <div class="row g-4">
                  <div class="col-lg-12">
                    <div class="mb-3">
                      <h4>Categories</h4>
                      <ul class="list-unstyled fruite-categorie">
                        <c:forEach var="category" items="${allCategories}">
                          <li>
                            <div
                              class="d-flex justify-content-between fruite-name"
                            >
                              <a
                                href="shop?activeCategory=${category.categoryId}#products-section"
                                ><i class="fas fa-apple-alt me-2"></i
                                >${category.categoryName}</a
                              >
                              <span
                                >${categoryWithSize[category.categoryName]}</span
                              >
                            </div>
                          </li>
                        </c:forEach>
                      </ul>
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="mb-3">
                      <h4 class="mb-2">Price</h4>
                      <input
                        type="range"
                        class="form-range w-100"
                        id="rangeInput"
                        name="rangeInput"
                        min="0"
                        max="500"
                        value="0"
                        oninput="amount.value=rangeInput.value"
                      />
                      <output
                        id="amount"
                        name="amount"
                        min-velue="0"
                        max-value="500"
                        for="rangeInput"
                        >0</output
                      >
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="mb-3">
                      <h4>Additional</h4>
                      <div class="mb-2">
                        <input
                          type="radio"
                          class="me-2"
                          id="Categories-1"
                          name="Categories-1"
                          value="Beverages"
                        />
                        <label for="Categories-1"> Organic</label>
                      </div>
                      <div class="mb-2">
                        <input
                          type="radio"
                          class="me-2"
                          id="Categories-2"
                          name="Categories-1"
                          value="Beverages"
                        />
                        <label for="Categories-2"> Fresh</label>
                      </div>
                      <div class="mb-2">
                        <input
                          type="radio"
                          class="me-2"
                          id="Categories-3"
                          name="Categories-1"
                          value="Beverages"
                        />
                        <label for="Categories-3"> Sales</label>
                      </div>
                      <div class="mb-2">
                        <input
                          type="radio"
                          class="me-2"
                          id="Categories-4"
                          name="Categories-1"
                          value="Beverages"
                        />
                        <label for="Categories-4"> Discount</label>
                      </div>
                      <div class="mb-2">
                        <input
                          type="radio"
                          class="me-2"
                          id="Categories-5"
                          name="Categories-1"
                          value="Beverages"
                        />
                        <label for="Categories-5"> Expired</label>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <h4 class="mb-3">Featured products</h4>
                    <div
                      class="d-flex align-items-center justify-content-start"
                    >
                      <div
                        class="rounded me-4"
                        style="width: 100px; height: 100px"
                      >
                        <img
                          src="img/featur-1.jpg"
                          class="img-fluid rounded"
                          alt=""
                        />
                      </div>
                      <div>
                        <h6 class="mb-2">Big Banana</h6>
                        <div class="d-flex mb-2">
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="d-flex mb-2">
                          <h5 class="fw-bold me-2">2.99 $</h5>
                          <h5 class="text-danger text-decoration-line-through">
                            4.11 $
                          </h5>
                        </div>
                      </div>
                    </div>
                    <div
                      class="d-flex align-items-center justify-content-start"
                    >
                      <div
                        class="rounded me-4"
                        style="width: 100px; height: 100px"
                      >
                        <img
                          src="img/featur-2.jpg"
                          class="img-fluid rounded"
                          alt=""
                        />
                      </div>
                      <div>
                        <h6 class="mb-2">Big Banana</h6>
                        <div class="d-flex mb-2">
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="d-flex mb-2">
                          <h5 class="fw-bold me-2">2.99 $</h5>
                          <h5 class="text-danger text-decoration-line-through">
                            4.11 $
                          </h5>
                        </div>
                      </div>
                    </div>
                    <div
                      class="d-flex align-items-center justify-content-start"
                    >
                      <div
                        class="rounded me-4"
                        style="width: 100px; height: 100px"
                      >
                        <img
                          src="img/featur-3.jpg"
                          class="img-fluid rounded"
                          alt=""
                        />
                      </div>
                      <div>
                        <h6 class="mb-2">Big Banana</h6>
                        <div class="d-flex mb-2">
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star text-secondary"></i>
                          <i class="fa fa-star"></i>
                        </div>
                        <div class="d-flex mb-2">
                          <h5 class="fw-bold me-2">2.99 $</h5>
                          <h5 class="text-danger text-decoration-line-through">
                            4.11 $
                          </h5>
                        </div>
                      </div>
                    </div>
                    <div class="d-flex justify-content-center my-4">
                      <a
                        href="#"
                        class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100"
                        >Vew More</a
                      >
                    </div>
                  </div>
                  <div class="col-lg-12">
                    <div class="position-relative">
                      <img
                        src="img/banner-fruits.jpg"
                        class="img-fluid w-100 rounded"
                        alt=""
                      />
                      <div
                        class="position-absolute"
                        style="
                          top: 50%;
                          right: 10px;
                          transform: translateY(-50%);
                        "
                      >
                        <h3 class="text-secondary fw-bold">
                          Fresh <br />
                          Fruits <br />
                          Banner
                        </h3>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-9">
                <div class="row g-4 justify-content-center">
                  <c:forEach var="product" items="${pageProducts}">
                    <div class="col-md-6 col-lg-6 col-xl-4">
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
                          <h4 class="text-center">${product.productName}</h4>
                          <p>${product.productDescription}</p>
                          <div
                            class="d-flex justify-content-between flex-lg-wrap"
                          >
                            <p class="text-dark fs-5 fw-bold mb-0">
                              <fmt:formatNumber
                                value="${product.productPrice}"
                                type="currency"
                                currencySymbol="vnđ"
                                maxFractionDigits="2"
                              />
                              / kg
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
                  <c:if test="${totalPages > 1}">
                    <div class="col-12">
                      <ul class="pagination d-flex justify-content-center mt-5">
                        <li
                          class="page-item ${currentPage == 1 ? 'disabled' : ''}"
                        >
                          <a
                            class="rounded page-link"
                            href="shop?activeCategory=${activeCategory}&activePage=${currentPage - 1}#products-section"
                            >«</a
                          >
                        </li>

                        <c:forEach var="i" begin="1" end="${totalPages}">
                          <li
                            class="page-item ${i == currentPage ? 'active' : ''}"
                          >
                            <a
                              class="rounded page-link"
                              href="shop?activeCategory=${activeCategory}&activePage=${i}#products-section"
                              >${i}</a
                            >
                          </li>
                        </c:forEach>

                        <li
                          class="page-item ${currentPage == totalPages ? 'disabled' : ''}"
                        >
                          <a
                            class="rounded page-link"
                            href="shop?activeCategory=${activeCategory}&activePage=${currentPage + 1}#products-section"
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
    <%@ include file="includes/footer.jsp" %>
  </body>
</html>
