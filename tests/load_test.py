from locust import HttpUser, task, between
from src.utils import get_sum


class QuickstartUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def sum(self):
        for _ in range(10):
            get_sum(_, 3)