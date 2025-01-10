from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import MenuItem
from .serializers import MenuItemSerializer

def categories(request):
    categories = Category.objects.all()
    return render(request, 'categories.html', {'categories': categories})

def menu_items(request):
    items = MenuItem.objects.all()
    return render(request, 'menu_items.html', {'items': items})

def add_to_cart(request, item_id):
    menuitem = get_object_or_404(MenuItem, id=item_id)
    cart_item, created = Cart.objects.get_or_create(
        user=request.user,
        menuitem=menuitem,
        defaults={'quantity': 1, 'unit_price': menuitem.price, 'price': menuitem.price}
    )
    
    if not created:
        cart_item.quantity += 1
        cart_item.price = cart_item.unit_price * cart_item.quantity
        cart_item.save()

    return redirect('menu_items')


@api_view(['GET', 'POST'])
def menu_items_api(request):
    if request.method == 'GET':
        menu_items = MenuItem.objects.all()
        serializer = MenuItemSerializer(menu_items, many=True)
        return Response(serializer.data)

    elif request.method == 'POST':
        serializer = MenuItemSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)