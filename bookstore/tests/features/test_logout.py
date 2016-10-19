from django.contrib.auth import get_user_model
from django.test import LiveServerTestCase
from selenium import webdriver


class LogoutTest(LiveServerTestCase):
    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(10)

        user = get_user_model().objects.create_user(email='test@ea.com', password='test123456')
        user.save()

        self.client.login(username='test@ea.com', password='test123456')
        cookie = self.client.cookies['sessionid']
        self.browser.get(self.live_server_url + '/bookstore/')
        self.browser.add_cookie({'name': 'sessionid', 'value': cookie.value, 'secure': False, 'path': '/'})
        self.browser.refresh()
        self.browser.get(self.live_server_url + '/bookstore/')

    def tearDown(self):
        self.browser.quit()

    def test_can_logout_successfully(self):
        self.browser.find_element_by_id('base_logout_button').click()

        self.assertIn("login", self.browser.find_element_by_id('base_login_button').text)
