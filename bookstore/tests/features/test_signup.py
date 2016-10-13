from django.contrib.auth import get_user_model
from django.core import mail
from django.core.exceptions import ValidationError
from django.test import LiveServerTestCase
from selenium import webdriver


class SignupTest(LiveServerTestCase):
    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(3)
        self.browser.get(self.live_server_url + '/accounts/signup/')

    def tearDown(self):
        self.browser.quit()

    def test_can_signup_successfully(self):
        self.browser.find_element_by_id('id_email').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password1').send_keys('test123456')
        self.browser.find_element_by_id('id_password2').send_keys('test123456')
        self.browser.find_element_by_class_name('btn').click()

        self.assertEqual(self.browser.find_element_by_id('verification_title').text, "Verify Your E-mail Address")
        self.assertEqual(len(mail.outbox), 1)
        self.assertEqual(mail.outbox[0].subject, '[BookStore] Please Confirm Your E-mail Address')

    def test_signup_with_empty_field(self):
        self.browser.find_element_by_class_name('btn').click()

        self.assertRaises(ValidationError)

    def test_signup_with_existing_email(self):
        user = get_user_model()
        user.objects.create_user(email='test@ea.com', password='test123456')

        self.browser.find_element_by_id('id_email').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password1').send_keys('test123456')
        self.browser.find_element_by_id('id_password2').send_keys('test123456')
        self.browser.find_element_by_class_name('btn').click()

        self.assertEqual(self.browser.find_element_by_class_name('errorlist').text,
                         "A user is already registered with this e-mail address.")
