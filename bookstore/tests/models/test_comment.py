from django.test import TestCase

from bookstore.tests.factories.factory_comment import CommentFactory


class CommentMethodTests(TestCase):
    def test_str(self):
        comment = CommentFactory(content='good')
        self.assertEqual(str(comment), 'good')
