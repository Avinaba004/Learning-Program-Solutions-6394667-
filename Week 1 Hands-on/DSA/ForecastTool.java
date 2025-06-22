import java.util.HashMap;

public class ForecastTool {

    static HashMap<Integer, Double> cache = new HashMap<>();

    public static double predictFutureValue(double initialValue, double growthRate, int years) {
        if (years == 0) return initialValue;
        if (cache.containsKey(years)) return cache.get(years);

        double result = (1 + growthRate) * predictFutureValue(initialValue, growthRate, years - 1);
        cache.put(years, result);
        return result;
    }

    public static void main(String[] args) {
        double startValue = 1000;
        double annualGrowth = 0.10;
        int forecastYears = 5;

        double forecast = predictFutureValue(startValue, annualGrowth, forecastYears);
        System.out.println("Predicted Value after " + forecastYears + " years: " + forecast);
    }

    /*
    Analysis:

    Time Complexity (Unoptimized):
    - Without memoization, the recursion recalculates values many times.
    - Time complexity would be exponential: O(2^n)

    Time Complexity (Optimized with Memoization):
    - Each subproblem is solved only once and stored.
    - Time complexity improves to: O(n)

    Optimization Technique Used:
    - Memoization using HashMap to avoid repeated computations.
    - Makes recursion efficient even for large inputs.
    */
}
