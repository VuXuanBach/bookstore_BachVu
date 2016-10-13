from allauth.account.models import EmailAddress
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from django.test import LiveServerTestCase
from selenium import webdriver


class LoginTest(LiveServerTestCase):
    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.implicitly_wait(3)
        user = get_user_model().objects.create_user(email='test@ea.com', password='test123456')
        user.save()
        EmailAddress.objects.create(user=user, verified=True)
        self.browser.get(self.live_server_url + '/accounts/login/')

    def tearDown(self):
        self.browser.quit()

    def test_can_login_successfully(self):
        self.browser.find_element_by_id('id_login').send_keys('test@ea.com')
        self.browser.find_element_by_id('id_password').send_keys('test123456')
        self.browser.find_element_by_class_name('btn').click()

        self.assertEqual(self.browser.find_element_by_id('logout').text, "Logout")

    def test_login_with_empty_field(self):
        self.browser.find_element_by_class_name('btn').click()

        self.assertRaises(ValidationError)

    def test_login_with_incorrect_information(self):
        self.browser.find_element_by_id('id_login').send_keys('test1@ea.com')
        self.browser.find_element_by_id('id_password').send_keys('test1234561')
        self.browser.find_element_by_class_name('btn').click()

        self.assertEqual(self.browser.find_element_by_class_name('errorlist').text,
                         "The e-mail address and/or password you specified are not correct.")
