import factory
from django.contrib.auth import get_user_model

from bookstore.tests.features.test_base import faker


class UserFactory(factory.DjangoModelFactory):
    class Meta:
        model = get_user_model()

    email = factory.Sequence(lambda n: 'test%d@ea.com' % n)
    password = faker.login_password()

    @classmethod
    def _prepare(cls, create, **kwargs):
        password = kwargs.pop('password', None)
        user = super(UserFactory, cls)._prepare(create, **kwargs)

        user.raw_password = password
        user.set_password(password)
        if create:
            user.save()

        return user
