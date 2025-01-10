defmodule DsStation.Dashboard do
  alias DsStation.Order.Order

  def list_orders_by_user() do
    [
      %Order{order_number: 1, name: "iPhone 15 Pro", quantity: 2, price: 999},
      %Order{order_number: 2, name: "MacBook Air M2", quantity: 1, price: 1299},
      %Order{order_number: 3, name: "AirPods Pro", quantity: 3, price: 249},
      %Order{order_number: 4, name: "iPad Air", quantity: 4, price: 599},
      %Order{order_number: 5, name: "Apple Watch Series 9", quantity: 5, price: 399},
      %Order{order_number: 6, name: "Samsung Galaxy S24", quantity: 2, price: 899},
      %Order{order_number: 7, name: "Sony WH-1000XM5", quantity: 3, price: 399},
      %Order{order_number: 8, name: "Nintendo Switch OLED", quantity: 1, price: 349},
      %Order{order_number: 9, name: "DJI Mini 3 Pro", quantity: 2, price: 759},
      %Order{order_number: 10, name: "LG C3 OLED 65", quantity: 1, price: 1999}
    ]
  end
end
