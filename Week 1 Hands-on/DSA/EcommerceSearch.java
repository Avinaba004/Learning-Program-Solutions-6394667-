import java.util.Arrays;
import java.util.Comparator;

public class EcommerceSearch {

    static class Product {
        int productId;
        String productName;
        String category;

        public Product(int productId, String productName, String category) {
            this.productId = productId;
            this.productName = productName;
            this.category = category;
        }
    }

    public static int linearSearch(Product[] products, int targetId) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].productId == targetId) {
                return i;
            }
        }
        return -1;
    }

    public static int binarySearch(Product[] products, int targetId) {
        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));
        int left = 0, right = products.length - 1;
        while (left <= right) {
            int mid = (left + right) / 2;
            if (products[mid].productId == targetId)
                return mid;
            else if (products[mid].productId < targetId)
                left = mid + 1;
            else
                right = mid - 1;
        }
        return -1;
    }

    public static void main(String[] args) {
        Product[] products = {
            new Product(103, "Mouse", "Electronics"),
            new Product(101, "Laptop", "Electronics"),
            new Product(105, "Chair", "Furniture"),
            new Product(102, "Phone", "Electronics"),
            new Product(104, "Desk", "Furniture")
        };

        int targetId = 102;

        int indexLinear = linearSearch(products, targetId);
        System.out.println("Linear Search - Found at index: " + indexLinear);

        int indexBinary = binarySearch(products, targetId);
        System.out.println("Binary Search - Found at index: " + indexBinary);

        System.out.println("\nAnalysis:");
        System.out.println("Linear Search: Best O(1), Average/Worst O(n)");
        System.out.println("Binary Search: Best O(1), Average/Worst O(log n)");
        System.out.println("Binary search is faster for sorted large datasets.");
    }
}
