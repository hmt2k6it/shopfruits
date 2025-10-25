<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <fmt:setLocale value="vi_VN" />

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Admin Dashboard</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
                <link rel="stylesheet" href="assets/css/admin-style.css">
            </head>

            <body>

                <div class="sidebar">
                    <div class="logo-details">
                        <i class='bx bxs-store-alt'></i>
                        <span class="logo_name">Admin Panel</span>
                    </div>
                    <ul class="nav-links">
                        <li>
                            <a href="#" class="nav-link-item active" data-target="#dashboard-section">
                                <i class='bx bxs-grid-alt'></i>
                                <span class="link_name">Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link-item" data-target="#products-section">
                                <i class='bx bxs-shopping-bag'></i>
                                <span class="link_name">Quản lý Sản phẩm</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link-item" data-target="#orders-section">
                                <i class='bx bxs-cart-alt'></i>
                                <span class="link_name">Quản lý Đơn hàng</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="nav-link-item" data-target="#users-section">
                                <i class='bx bxs-user-account'></i>
                                <span class="link_name">Quản lý User</span>
                            </a>
                        </li>
                        <li class="profile-details">
                            <div class="profile-content">
                                <img src="assets/images/admin-avatar.png" alt="Profile">
                            </div>
                            <div class="name-job">
                                <div class="profile_name">Admin</div>
                                <div class="job">Quản trị viên</div>
                            </div>
                            <a href="logout"><i class='bx bx-log-out'></i></a>
                        </li>
                    </ul>
                </div>

                <section class="home-section">
                    <nav class="home-header">
                        <i class='bx bx-menu'></i>
                        <span class="text">Dashboard</span>
                    </nav>

                    <div class="home-content">

                        <div class="content-section active" id="dashboard-section">
                            <h3>Chào mừng Admin!</h3>
                            <p>Đây là trang quản trị của bạn.</p>
                        </div>

                        <div class="content-section" id="products-section">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3>Quản lý Sản phẩm</h3>
                                <button class="btn btn-primary" data-bs-toggle="modal"
                                    data-bs-target="#addProductModal">
                                    <i class='bx bx-plus'></i> Thêm Sản phẩm
                                </button>
                            </div>

                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ảnh</th>
                                        <th>Tên Sản phẩm</th>
                                        <th>Giá</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${allProducts}">
                                        <tr>
                                            <td>${p.productId}</td>
                                            <td><img src="assets/images/${p.productImage}" alt="${p.productName}"
                                                    width="50"></td>
                                            <td>${p.productName}</td>
                                            <td>
                                                <fmt:formatNumber value="${p.productPrice}" type="currency" />
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-warning btn-edit" data-bs-toggle="modal"
                                                    data-bs-target="#editProductModal" data-id="${p.productId}"
                                                    data-name="${p.productName}" data-price="${p.productPrice}"
                                                    data-desc="${p.productDescription}">
                                                    <i class='bx bxs-edit'></i> Sửa
                                                </button>
                                                <button class="btn btn-sm btn-danger btn-delete" data-bs-toggle="modal"
                                                    data-bs-target="#deleteProductModal" data-id="${p.productId}"
                                                    data-name="${p.productName}">
                                                    <i class='bx bxs-trash'></i> Xóa
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="content-section" id="orders-section">
                            <h3>Quản lý Đơn hàng</h3>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Mã ĐH</th>
                                        <th>Khách hàng (User ID)</th>
                                        <th>Ngày đặt</th>
                                        <th>Tổng tiền</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${allOrders}">
                                        <tr>
                                            <td>${order.orderId}</td>
                                            <td>${order.userId}</td>
                                            <td>
                                                <fmt:formatDate value="${order.orderDate}" pattern="dd-MM-yyyy" />
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${order.totalAmount}" type="currency" />
                                            </td>
                                            <td>
                                                <select class="form-select form-select-sm"
                                                    onchange="updateStatus(this, '${order.orderId}')" name="status">
                                                    <option value="Pending" ${order.status=='Pending' ? 'selected' : ''
                                                        }>Chờ xử lý</option>
                                                    <option value="Processing" ${order.status=='Processing' ? 'selected'
                                                        : '' }>Đang xử lý</option>
                                                    <option value="Shipped" ${order.status=='Shipped' ? 'selected' : ''
                                                        }>Đã giao</option>
                                                    <option value="Cancelled" ${order.status=='Cancelled' ? 'selected'
                                                        : '' }>Đã hủy</option>
                                                </select>
                                            </td>
                                            <td>
                                                <button class="btn btn-sm btn-info btn-view-details"
                                                    data-bs-toggle="modal" data-bs-target="#orderDetailsModal"
                                                    data-orderid="${order.orderId}">
                                                    <i class='bx bxs-detail'></i> Xem chi tiết
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <div class="content-section" id="users-section">
                            <h3>Quản lý Người dùng</h3>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Email</th>
                                        <th>Quyền (Admin)</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${allUsers}">
                                        <tr>
                                            <td>${user.userId}</td>
                                            <td>${user.userName}</td>
                                            <td>${user.email}</td>
                                            <td>${user.is_admin == 1 ? 'Admin' : 'User'}</td>
                                            <td>
                                                <button class="btn btn-sm btn-danger btn-delete-user"
                                                    data-bs-toggle="modal" data-bs-target="#deleteUserModal"
                                                    data-id="${user.userId}" data-name="${user.userName}">
                                                    <i class='bx bxs-trash'></i> Xóa
                                                </button>
                                                <button class="btn btn-sm btn-warning btn-edit-user"
                                                    data-bs-toggle="modal" data-bs-target="#editUserModal"
                                                    data-id="${user.userId}" data-name="${user.userName}"
                                                    data-isadmin="${user.is_admin}">
                                                    <i class='bx bxs-edit'></i> Sửa quyền
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
                <div class="modal fade" id="orderDetailsModal" tabindex="-1">
                    <div class="modal-dialog modal-lg"> <%-- modal-lg cho to hơn --%>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Chi tiết Đơn hàng (Mã: <span id="modal-order-id"></span>)
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Ảnh</th>
                                                <th>Tên Sản phẩm</th>
                                                <th>Số lượng</th>
                                                <th>Giá (tại lúc mua)</th>
                                            </tr>
                                        </thead>
                                        <%-- Dữ liệu sẽ được JS chèn vào đây --%>
                                            <tbody id="orderDetailsBody">
                                                <%-- <tr>
                                                    <td>Loading...</td>
                                                    </tr> --%>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="modal fade" id="deleteUserModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/userCURD" method="POST">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="userId" id="delete-user-id">

                                <div class="modal-header">
                                    <h5 class="modal-title">Xác nhận xóa User</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa user <b id="delete-user-name"></b> không?</p>
                                    <p class="text-danger">Hành động này sẽ xóa cả lịch sử đơn hàng của họ.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-danger">Xóa vĩnh viễn</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="editUserModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/userCURD" method="POST">
                                <input type="hidden" name="action" value="editRole">
                                <input type="hidden" name="userId" id="edit-user-id">

                                <div class="modal-header">
                                    <h5 class="modal-title">Sửa quyền cho User: <b id="edit-user-name"></b></h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label class="form-label">Quyền truy cập</label>
                                        <select class="form-select" name="isAdmin" id="edit-user-isadmin">
                                            <option value="0">User (Người dùng thường)</option>
                                            <option value="1">Admin (Quản trị viên)</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="addProductModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="${pageContext.request.contextPath}/productCURD" method="POST">
                                <input type="hidden" name="action" value="add">
                                <div class="modal-header">
                                    <h5 class="modal-title">Thêm sản phẩm mới</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label class="form-label">Tên sản phẩm</label>
                                        <input type="text" class="form-control" name="productName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Giá</label>
                                        <input type="number" class="form-control" name="productPrice" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mô tả</label>
                                        <textarea class="form-control" name="productDescription" rows="3"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Nguồn gốc</label>
                                        <select class="form-select" name="categoryId" required>
                                            <option value="" disabled selected>-- Chọn Category --</option>
                                            <c:forEach var="cat" items="${allCategories}">
                                                <option value="${cat.categoryId}">${cat.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mùa</label>
                                        <select class="form-select" name="seasonId" required>
                                            <option value="" disabled selected>-- Chọn Mùa --</option>
                                            <c:forEach var="season" items="${allSeasons}">
                                                <option value="${season.seasonId}">${season.seasonName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Đóng</button>
                                    <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="editProductModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="productCURD" method="POST">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="productId" id="edit-product-id">

                                <div class="modal-header">
                                    <h5 class="modal-title">Chỉnh sửa sản phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="mb-3">
                                        <label class="form-label">Tên sản phẩm</label>
                                        <input type="text" class="form-control" name="productName"
                                            id="edit-product-name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Giá</label>
                                        <input type="number" class="form-control" name="productPrice"
                                            id="edit-product-price" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mô tả</label>
                                        <textarea class="form-control" name="productDescription" id="edit-product-desc"
                                            rows="3"></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Nguồn gốc</label>
                                        <select class="form-select" name="categoryId" required>
                                            <option value="" disabled selected>-- Chọn Category --</option>
                                            <c:forEach var="cat" items="${allCategories}">
                                                <option value="${cat.categoryId}">${cat.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mùa</label>
                                        <select class="form-select" name="seasonId" required>
                                            <option value="" disabled selected>-- Chọn Mùa --</option>
                                            <c:forEach var="season" items="${allSeasons}">
                                                <option value="${season.seasonId}">${season.seasonName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Đóng</button>
                                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="deleteProductModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="productCURD" method="POST">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="productId" id="delete-product-id">
                                <div class="modal-header">
                                    <h5 class="modal-title">Xác nhận xóa</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa sản phẩm <b id="delete-product-name"></b> không?</p>
                                    <p class="text-danger">Hành động này không thể hoàn tác.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-danger">Xóa vĩnh viễn</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script type="text/javascript">
                    const contextPath = "${pageContext.request.contextPath}";
                </script>

                <script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
            </body>

            </html>