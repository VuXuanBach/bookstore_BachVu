from unittest import TestCase

from django.test import Client
from rest_framework.reverse import reverse

from bookstore.constants import STATUS_CODE_OK


class IndexViewTest(TestCase):
    def setUp(self):
        self.client = Client()

    def test_index_view(self):
        response = self.client.get(reverse('bookstore:index'))
        self.assertEqual(response.status_code, STATUS_CODE_OK)
