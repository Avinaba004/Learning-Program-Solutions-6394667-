package com.example;

import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class MyServiceTest {

    @Test
    public void testExternalApi() {
        // Step 1: Create a mock of the ExternalApi
        ExternalApi mockApi = mock(ExternalApi.class);

        // Step 2: Stub the getData() method to return "Mock Data"
        when(mockApi.getData()).thenReturn("Mock Data");

        // Step 3: Inject the mock into the service
        MyService service = new MyService(mockApi);

        // Step 4: Call the service method
        String result = service.fetchData();

        // Step 5: Verify the result
        assertEquals("Mock Data", result);
    }
}
