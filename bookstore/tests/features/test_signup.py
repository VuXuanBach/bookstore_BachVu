from django.contrib.auth import get_user_model
from django.core import mail
from django.core.exceptions import ValidationError
from django.test import LiveServerTestCase
from selenium import webdriver


class SignupTest(LiveServerTestCase):
    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(10)
        self.browser.get(self.live_server_url + '/accounts/signup/')

    def tearDown(self):
        self.browser.quit()

    def test_can_signup_successfully(self):
        self.browser.find_element_by_id('id_email').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password1').send_keys('test123456')
        self.browser.find_element_by_id('id_password2').send_keys('test123456')
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn("Verify Your E-mail Address", self.browser.find_element_by_id('verification_title').text)
        self.assertEqual(len(mail.outbox), 1)
        self.assertIn('[BookStore] Please Confirm Your E-mail Address', mail.outbox[0].subject)

    def test_can_signup_successfully_with_all_fields_filled(self):
        self.browser.find_element_by_id('id_email').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password1').send_keys('test123456')
        self.browser.find_element_by_id('id_password2').send_keys('test123456')
        self.browser.find_element_by_id('id_full_name').send_keys('Bach Vu')
        self.browser.find_element_by_id('id_birthday').send_keys('09/28/1991')
        self.browser.find_element_by_id('id_phone').send_keys('123456789')
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn("Verify Your E-mail Address", self.browser.find_element_by_id('verification_title').text)
        self.assertEqual(len(mail.outbox), 1)
        self.assertIn('[BookStore] Please Confirm Your E-mail Address', mail.outbox[0].subject)

    def test_signup_with_empty_field(self):
        self.browser.find_element_by_id('signup_button').click()

        self.assertRaises(ValidationError)

    def test_signup_with_existing_email(self):
        user = get_user_model()
        user.objects.create_user(email='test@ea.com', password='test123456')

        self.browser.find_element_by_id('id_email').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password1').send_keys('test123456')
        self.browser.find_element_by_id('id_password2').send_keys('test123456')
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn("A user is already registered with this e-mail address.",
                      self.browser.find_element_by_class_name('help-block').text)

    def test_signup_with_future_birthday(self):
        user = get_user_model()
        user.objects.create_user(email='test@ea.com', password='test123456')

        self.browser.find_element_by_id('id_email').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password1').send_keys('test123456')
        self.browser.find_element_by_id('id_password2').send_keys('test123456')
        self.browser.find_element_by_id('id_birthday').send_keys('09/28/3000')
        self.browser.find_element_by_id('signup_button').click()

        self.assertIn("A user is already registered with this e-mail address.",
                      self.browser.find_element_by_class_name('help-block').text)
