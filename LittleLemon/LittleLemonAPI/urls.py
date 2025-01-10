from django.urls import path
from .views import categories, menu_items, add_to_cart, menu_items_api


urlpatterns = [
    path('categories/', categories, name='categories'),
    path('menu-items/', menu_items, name='menu_items'),
    path('add-to-cart/<int:item_id>/', add_to_cart, name='add_to_cart'),
    path('api/menu-items/', menu_items_api, name='menu_items_api'),
]
