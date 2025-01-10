defmodule DsStationWeb.DashboardLive do
  use DsStationWeb, :live_view
  import Number.Currency

  def mount(_params, _session, socket) do
    orders = DsStation.Dashboard.list_orders_by_user()

    {:ok, assign(socket, orders: orders)}
  end

  def render(assigns) do
    ~H"""
    <h1>Dashboard</h1>

    <table>
      <thead>
        <tr>
          <th class="id">
            #
          </th>
          <th>
            Número do Pedido
          </th>
          <th>
            Produto
          </th>
          <th>
            Quantidade
          </th>
          <th>
            Preço
          </th>
        </tr>
      </thead>
      <tbody>
        <tr :for={order <- @orders}>
          <td class="id">
            {order.order_number}
          </td>
          <td>
            {order.name}
          </td>
          <td>
            {order.quantity}
          </td>
          <td class="price">
            {number_to_currency(order.price)}
          </td>
        </tr>
      </tbody>
    </table>
    """
  end
end
