"""Module to run automated browser-based login tests on SauceDemo using Alumni framework."""

import os
import unittest
from dotenv import load_dotenv
from selenium.webdriver import Chrome
from alumnium import Alumni


def load_env_variables():
    """Load and validate required environment variables from a .env file."""
    load_dotenv()

    model = os.getenv("ALUMNIUM_MODEL2")
    google_api_key = os.getenv("GOOGLE_API_KEY")

    if not google_api_key:
        raise ValueError("GOOGLE_API_KEY is not defined in the .env file")
    if not model:
        raise ValueError("ALUMNIUM_MODEL2 is not defined in the .env file")

    os.environ["GOOGLE_API_KEY"] = google_api_key
    os.environ["ALUMNIUM_MODEL"] = model


class BaseTest(unittest.TestCase):
    """Base test class to initialize and clean up the Chrome WebDriver."""

    def setUp(self):
        self.driver = Chrome()
        self.driver.get("https://www.saucedemo.com/")
        self.alumni = Alumni(self.driver)

    def tearDown(self):
        self.driver.quit()


class TestSauceDemoLogin(BaseTest):
    """Test case to verify successful login and redirection to inventory page."""

    def test_login_redirects_to_inventory(self):
        """Verify that login with valid credentials redirects to the inventory page."""
        self.alumni.do("enter username 'standard_user'")
        self.alumni.do("enter password 'secret_sauce'")
        self.alumni.do("click on login")

        current_url = self.alumni.get("url contains inventory.html")
        expected_url = "https://www.saucedemo.com/inventory.html"

        self.assertEqual(
            current_url,
            expected_url,
            f"Expected URL to be {expected_url}, but got {current_url}",
        )


if __name__ == "__main__":
    load_env_variables()
    unittest.main()
