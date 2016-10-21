import datetime

from faker.providers import BaseProvider


class CustomProvider(BaseProvider):
    def login_email(self):
        return 'test@ea.com'

    def login_password(self):
        return 'test123456'

    def invalid_login_email(self):
        return 'invalid@ea.com'

    def invalid_login_password(self):
        return 'dskjfhuiwehflwfe'

    def past_date(self):
        past_time = datetime.date.today() - datetime.timedelta(days=30)
        return past_time.strftime('%m/%d/%Y')

    def future_date(self):
        past_time = datetime.date.today() + datetime.timedelta(days=30)
        return past_time.strftime('%m/%d/%Y')
