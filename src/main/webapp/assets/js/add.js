$(document).ready(function () {

    // Bắt sự kiện nhấn nút CỘNG (Chỉ gửi giá trị hiện tại)
    $('.plus-btn').on('click', function () {
        // 1. Tìm ô input bên cạnh
        var $input = $(this).siblings('.product-quantity-input');
        
        // 2. Lấy giá trị HIỆN TẠI từ ô input
        var currentQuantity = parseInt($input.val());
        
        // 3. Kiểm tra xem có phải số hợp lệ không
        if (isNaN(currentQuantity) || currentQuantity < 1) {
            currentQuantity = 1; // Nếu không hợp lệ, gửi đi số 1
            $input.val(1); // Cập nhật lại ô input cho đúng
        }
        
        // 4. Gọi hàm gửi cập nhật về server với giá trị đã đọc
        updateCartQuantity($(this), currentQuantity);
    });

    // Bắt sự kiện nhấn nút TRỪ (Chỉ gửi giá trị hiện tại)
    $('.minus-btn').on('click', function () {
        // 1. Tìm ô input
        var $input = $(this).siblings('.product-quantity-input');
        
        // 2. Lấy giá trị HIỆN TẠI
        var currentQuantity = parseInt($input.val());
        
        // 3. Kiểm tra
        if (isNaN(currentQuantity) || currentQuantity < 1) {
            currentQuantity = 1; // Nếu không hợp lệ, gửi đi số 1
            $input.val(1); // Cập nhật lại ô input
        }
        
        // 4. Gọi hàm gửi cập nhật về server
        updateCartQuantity($(this), currentQuantity);
    });

    /**
     * Hàm này dùng AJAX (fetch) để gửi số lượng mới về Servlet.
     * @param {object} button Nút (+) hoặc (-) vừa nhấn.
     * @param {int} quantity Số lượng đọc được từ ô input.
     */
    function updateCartQuantity(button, quantity) {
        var productId = button.closest('tr').data('product-id');

        if (!productId) {
            console.error("Không tìm thấy product-id trên thẻ <tr> cha.");
            alert("Lỗi: Không thể xác định sản phẩm.");
            return;
        }

        // Dùng biến 'contextPath' đã khai báo trong JSP
        fetch(contextPath + '/updateQuantity', { 
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `productId=${productId}&quantity=${quantity}` // Gửi số lượng đọc được
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok: ' + response.statusText);
            }
            return response.json(); 
        })
        .then(data => {
            if (data.status === 'success') {
                console.log('Cập nhật số lượng thành công (đã gửi quantity=' + quantity + ')');
                location.reload(); // Tải lại để xem kết quả
            } else {
                alert('Lỗi cập nhật số lượng từ server.');
                console.error('Server response:', data); 
            }
        })
        .catch(error => {
            console.error('Fetch Error:', error);
            alert('Lỗi kết nối hoặc xử lý dữ liệu: ' + error.message);
        });
    }

    // --- (Code xử lý modal giữ nguyên) ---
    // ...
});