from django.test import LiveServerTestCase
from faker import Factory as FakerFactory
from selenium import webdriver

from bookstore.tests.factories.custom_provider import CustomProvider

faker = FakerFactory.create()
faker.add_provider(CustomProvider)


class BaseTest(LiveServerTestCase):
    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(10)

    def tearDown(self):
        self.browser.quit()
