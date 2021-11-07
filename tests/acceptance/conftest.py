from urllib.parse import urljoin

from pytest import fixture


@fixture(scope="session")
def service_address() -> tuple[str, int]:
    return "localhost", 8080


@fixture(scope="session")
def service_base_url(service_address: tuple[str, int]) -> str:
    return f"http://{service_address[0]}:{service_address[1]}"


@fixture(scope="session")
def health_check_endpoint(service_base_url: str) -> str:
    return urljoin(service_base_url, "/health")
