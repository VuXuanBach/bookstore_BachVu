from allauth.account.models import EmailAddress
from django.core.exceptions import ValidationError

from bookstore.tests.factories.factory_user import UserFactory
from bookstore.tests.features.test_base import BaseTest, faker


class LoginTest(BaseTest):
    def setUp(self):
        super(LoginTest, self).setUp()

        self.user = UserFactory(email=faker.login_email())
        EmailAddress.objects.create(user=self.user, verified=True)

        self.browser.get('{}{}'.format(self.live_server_url, '/accounts/login/'))

    def test_can_login_successfully(self):
        self.browser.find_element_by_id('id_login').send_keys(self.user.email)
        self.browser.find_element_by_id('id_password').send_keys(faker.login_password())
        self.browser.find_element_by_id('login_button').click()

        self.assertIn("logout", self.browser.find_element_by_id('base_logout_button').text)

    def test_login_with_empty_field(self):
        self.browser.find_element_by_id('login_button').click()

        self.assertRaises(ValidationError)

    def test_login_with_incorrect_information(self):
        self.browser.find_element_by_id('id_login').send_keys(faker.invalid_login_email())
        self.browser.find_element_by_id('id_password').send_keys(faker.invalid_login_password())
        self.browser.find_element_by_id('login_button').click()

        self.assertIn('The e-mail address and/or password you specified are not correct.',
                      self.browser.find_element_by_class_name('alert').text)
