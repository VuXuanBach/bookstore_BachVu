from django.template.response import TemplateResponse
from django.views.generic import View


class IndexView(View):
    template = "bookstore/index.html"

    def get(self, request):
        context = {}
        # view logic
        return TemplateResponse(request, self.template, context)
