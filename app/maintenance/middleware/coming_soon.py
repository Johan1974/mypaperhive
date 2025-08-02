from django.shortcuts import render

class ComingSoonMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        host = request.get_host().split(':')[0]

        if host in ["localhost", "127.0.0.1"]:
            return self.get_response(request)

        if host in ["mypaperhive.com", "www.mypaperhive.com"]:
            if request.path.startswith('/admin') or request.path.startswith('/static'):
                return self.get_response(request)

            return render(request, "coming_soon.html")

        return self.get_response(request)
