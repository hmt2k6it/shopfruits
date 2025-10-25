package models;

import java.util.Collection; // Import Collection
import java.util.HashMap;
import java.util.Map;

public class Cart {

    // Dùng Map để lưu, với Key là ProductID (Integer), Value là Item
    private Map<Integer, Item> items;

    public Cart() {
        items = new HashMap<>();
    }

    // Phương thức chính: Thêm sản phẩm vào giỏ
    public void addItem(Product product, int quantity) {
        int productId = product.getProductId();

        if (items.containsKey(productId)) {
            // ----- Sản phẩm đã có trong giỏ -----
            // Chỉ cần lấy item cũ ra và cộng dồn số lượng
            Item oldItem = items.get(productId);
            oldItem.setQuantity(oldItem.getQuantity() + quantity);
        } else {
            // ----- Sản phẩm chưa có trong giỏ -----
            // Tạo item mới và bỏ vào giỏ
            Item newItem = new Item(product, quantity);
            items.put(productId, newItem);
        }
    }

    /**
     * Trả về một Collection các Item (để JSTL dễ lặp)
     */
    public Collection<Item> getItems() {
        return items.values(); // Trả về Collection các giá trị (Item)
    }

    /**
     * (Hàm này để dùng nếu bạn muốn lặp Map trong JSTL)
     * Trả về đối tượng Map gốc.
     */
    public Map<Integer, Item> getItemsMap() {
        return items;
    }

    /**
     * Tính tổng tiền của giỏ hàng
     */
    public int getTotalPrice() {
        int total = 0;
        // Lặp qua Collection các giá trị (Item)
        for (Item item : items.values()) {
            total += item.getQuantity() * item.getProduct().getProductPrice();
        }
        return total;
    }

    /**
     * Kiểm tra giỏ hàng có rỗng không
     */
    public boolean isEmpty() {
        return items.isEmpty();
    }
}