from rest_framework.reverse import reverse

from bookstore.tests.factories.factory_user import UserFactory
from bookstore.tests.features.test_base import BaseTest, faker


class LogoutTest(BaseTest):
    def setUp(self):
        super(LogoutTest, self).setUp()

        UserFactory(email=faker.login_email())

        self.client.login(username=faker.login_email(), password=faker.login_password())
        cookie = self.client.cookies['sessionid']
        index_url = '{}{}'.format(self.live_server_url, reverse('bookstore:index'))
        self.browser.get(index_url)
        self.browser.add_cookie({'name': 'sessionid', 'value': cookie.value, 'secure': False, 'path': '/'})
        self.browser.refresh()
        self.browser.get(index_url)

    def tearDown(self):
        self.browser.quit()

    def test_can_logout_successfully(self):
        self.browser.find_element_by_id('base_logout_button').click()

        self.assertIn('login', self.browser.find_element_by_id('base_login_button').text)
