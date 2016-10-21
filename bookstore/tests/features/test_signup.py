from django.core import mail
from django.core.exceptions import ValidationError

from bookstore.tests.factories.factory_user import UserFactory
from bookstore.tests.features.test_base import BaseTest, faker


class SignupTest(BaseTest):
    def setUp(self):
        super(SignupTest, self).setUp()

        self.browser.get(self.live_server_url + '/accounts/signup/')

    def test_can_signup_successfully(self):
        self.browser.find_element_by_id('id_email').send_keys(faker.email())
        self.browser.find_element_by_id('id_password1').send_keys(faker.login_password())
        self.browser.find_element_by_id('id_password2').send_keys(faker.login_password())
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn('Verify Your E-mail Address', self.browser.find_element_by_id('verification_title').text)
        self.assertEqual(len(mail.outbox), 1)
        self.assertIn('[BookStore] Please Confirm Your E-mail Address', mail.outbox[0].subject)

    def test_can_signup_successfully_with_all_fields_filled(self):
        self.browser.find_element_by_id('id_email').send_keys(faker.email())
        self.browser.find_element_by_id('id_password1').send_keys(faker.login_password())
        self.browser.find_element_by_id('id_password2').send_keys(faker.login_password())
        self.browser.find_element_by_id('id_full_name').send_keys(faker.name())
        self.browser.find_element_by_id('id_birthday').send_keys(faker.past_date())
        self.browser.find_element_by_id('id_phone').send_keys(faker.phone_number())
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn('Verify Your E-mail Address', self.browser.find_element_by_id('verification_title').text)
        self.assertEqual(len(mail.outbox), 1)
        self.assertIn('[BookStore] Please Confirm Your E-mail Address', mail.outbox[0].subject)

    def test_signup_with_empty_field(self):
        self.browser.find_element_by_id('signup_button').click()

        self.assertRaises(ValidationError)

    def test_signup_with_existing_email(self):
        UserFactory(email=faker.login_email())

        self.browser.find_element_by_id('id_email').send_keys(faker.login_email())
        self.browser.find_element_by_id('id_password1').send_keys(faker.login_password())
        self.browser.find_element_by_id('id_password2').send_keys(faker.login_password())
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn("A user is already registered with this e-mail address.",
                      self.browser.find_element_by_class_name('help-block').text)

    def test_signup_with_future_birthday(self):
        self.browser.find_element_by_id('id_email').send_keys(faker.login_email())
        self.browser.find_element_by_id('id_password1').send_keys(faker.login_password())
        self.browser.find_element_by_id('id_password2').send_keys(faker.login_password())
        self.browser.find_element_by_id('id_birthday').send_keys(faker.future_date())
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn('You must choose a date from the past.',
                      self.browser.find_element_by_class_name('help-block').text)
