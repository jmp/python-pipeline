Feature: Health check
    The service should have a health check functionality
    that can be to determine whether or not the service is
    up and running.

    Scenario: Checking the health of a running service
        Given the service is up and running
        When I perform a health check
        Then the service should indicate that it is healthy
