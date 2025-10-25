// HÀM 1: CẬP NHẬT TRẠNG THÁI
function updateStatus(selectElement, orderId) {
    const newStatus = selectElement.value;

    // SỬA LỖI: Thêm 'contextPath' để có đường dẫn đúng
    fetch(contextPath + '/updateStatus', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `orderId=${orderId}&newStatus=${newStatus}`
    })
        .then(response => response.text())
        .then(data => {
            if (data === 'success') {
                alert('Cập nhật trạng thái thành công!');
            } else {
                alert('Cập nhật thất bại, vui lòng thử lại.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Lỗi: ' + error);
        });
}

// HÀM 2: CODE JQUERY (Khi trang tải xong)
$(document).ready(function () {

    // --- 1. Xử lý Sidebar ---
    let sidebar = $('.sidebar');
    let menuBtn = $('.home-header .bx-menu');

    menuBtn.on('click', function () {
        sidebar.toggleClass('close');
    });

    // --- 2. Xử lý chuyển Tab ---
    $('.nav-link-item').on('click', function (e) {
        e.preventDefault();
        $('.nav-link-item.active').removeClass('active');
        $(this).addClass('active');
        let targetId = $(this).data('target');
        $('.content-section.active').removeClass('active');
        $(targetId).addClass('active');
        let linkName = $(this).find('.link_name').text();
        $('.home-header .text').text(linkName);
    });

    // --- 3. Xử lý Modal SỬA (EDIT) Product ---
    $('#editProductModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let id = button.data('id');
        let name = button.data('name');
        let price = button.data('price');
        let desc = button.data('desc');
        let modal = $(this);
        modal.find('#edit-product-id').val(id);
        modal.find('#edit-product-name').val(name);
        modal.find('#edit-product-price').val(price);
        modal.find('#edit-product-desc').val(desc);
    });

    // --- 4. Xử lý Modal XÓA (DELETE) Product ---
    $('#deleteProductModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let id = button.data('id');
        let name = button.data('name');
        let modal = $(this);
        modal.find('#delete-product-id').val(id);
        modal.find('#delete-product-name').text(name);
    });

    // --- 5. Xử lý Modal SỬA (EDIT) User ---
    $('#editUserModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let id = button.data('id');
        let name = button.data('name');
        let isAdmin = button.data('isadmin');
        let modal = $(this);
        modal.find('#edit-user-id').val(id);
        modal.find('#edit-user-name').text(name);
        modal.find('#edit-user-isadmin').val(isAdmin);
    });

    // --- 6. Xử lý Modal XÓA (DELETE) User ---
    $('#deleteUserModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let id = button.data('id');
        let name = button.data('name');
        let modal = $(this);
        modal.find('#delete-user-id').val(id);
        modal.find('#delete-user-name').text(name);
    });

    // --- 7. Xử lý Modal XEM CHI TIẾT ĐƠN HÀNG ---
    $('#orderDetailsModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let orderId = button.data('orderid');
        let modal = $(this);
        let modalBody = modal.find('#orderDetailsBody');

        modal.find('#modal-order-id').text(orderId);
        modalBody.empty().html('<tr><td colspan="4">Loading...</td></tr>');

        // SỬA LỖI: Thêm 'contextPath'
        fetch(contextPath + `/getOrderDetails?orderId=${orderId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(details => {
                modalBody.empty();
                if (details.length === 0) {
                    modalBody.html('<tr><td colspan="4">Đơn hàng này không có chi tiết.</td></tr>');
                    return;
                }

                details.forEach(item => {
                    // SỬA LỖI: Dùng biến 'contextPath' (JS) thay vì thẻ JSP
                    const imagePath = contextPath + "/assets/images/" + item.productImage;
                    const priceVND = item.priceAtPurchase.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                    
                    const row = `
                        <tr>
                            <td><img src="${imagePath}" alt="${item.productName}" width="50"></td>
                            <td>${item.productName}</td>
                            <td>${item.quantity}</td>
                            <td>${priceVND}</td>
                        </tr>
                    `;
                    modalBody.append(row);
                });
            })
            .catch(error => {
                console.error('Error:', error);
                modalBody.html('<tr><td colspan="4">Không thể tải chi tiết đơn hàng. (Lỗi: ' + error.message + ')</td></tr>');
            });
    });
});