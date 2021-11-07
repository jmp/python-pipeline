from socket import create_connection

import pytest
import requests
from pytest import mark
from pytest_bdd import given, scenario, then, when
from requests import Response


@mark.acceptance
@scenario("features/health_check.feature", "Checking the health of a running service")
def test_checking_health_of_running_service() -> None:
    pass


@given("the service is up and running")
def service_is_up_and_running(service_address: tuple[str, int]) -> None:
    try:
        with create_connection(service_address):
            return
    except OSError:
        host, port = service_address
        pytest.fail(f"Service is not running on {host}:{port}")


@when("I perform a health check", target_fixture="response")
def perform_health_check(health_check_endpoint: str) -> Response:
    return requests.get(health_check_endpoint)


@then("the service should indicate that it is healthy")
def service_is_healthy(response: Response) -> None:
    assert response.status_code == 200
