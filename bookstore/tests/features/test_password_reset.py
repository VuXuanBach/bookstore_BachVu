from allauth.account.models import EmailAddress

from bookstore.tests.factories.factory_user import UserFactory
from bookstore.tests.features.test_base import BaseTest, faker


class PasswordResetTest(BaseTest):
    def setUp(self):
        super(PasswordResetTest, self).setUp()

        user = UserFactory(email=faker.login_email())
        EmailAddress.objects.create(user=user, verified=True)

        self.browser.get('{}{}'.format(self.live_server_url, '/accounts/password/reset/'))

    def tearDown(self):
        self.browser.quit()

    def test_can_reset_password_successfully(self):
        self.browser.find_element_by_id('id_email').send_keys(faker.login_email())
        self.browser.find_element_by_id('reset_password_button').click()

        self.assertIn(
            'We have sent you an e-mail. Please contact us if you do not receive it within a few minutes.',
            self.browser.find_element_by_id('verification_content').text)

    def test_reset_password_with_invalid_email(self):
        self.browser.find_element_by_id('id_email').send_keys('something@ea.com')
        self.browser.find_element_by_id('reset_password_button').click()

        self.assertIn('The e-mail address is not assigned to any user account',
                      self.browser.find_element_by_class_name('help-block').text)
