package com.example;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {

    private Calculator calculator;

    @BeforeEach
    void setUp() {
        // Setup: create Calculator object before each test
        calculator = new Calculator();
        System.out.println("Setup before test");
    }

    @AfterEach
    void tearDown() {
        // Teardown: cleanup resources after each test
        calculator = null;
        System.out.println("Cleanup after test");
    }

    @Test
    void testAddition() {
        // Arrange
        int a = 5;
        int b = 3;

        // Act
        int result = calculator.add(a, b);

        // Assert
        assertEquals(8, result);
    }

    @Test
    void testSubtraction() {
        // Arrange
        int a = 10;
        int b = 4;

        // Act
        int result = calculator.subtract(a, b);

        // Assert
        assertEquals(6, result);
    }
}
