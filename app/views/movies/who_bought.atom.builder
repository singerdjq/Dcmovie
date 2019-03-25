atom_feed do |feed|
feed.title "Who bought #{@movie.name}"
feed.update @latest_order.try(:updated_at)

@movie.orders.each do |order|
feed.entry(order) do |entry|
entry.title "Order #{order.id}"
entry.summary type: 'xhtml' do |xhtml|
xhtml.p "Shiiped to #{order.address}"

xhtml.table do 
xhtml.tr do
xhtml.th 'Movie'
xhtml.th 'Quantity'
xhtml.th 'Total price'
end

order.line_items.each do |item|
xhtml.tr do
xhtml.td item.movie.name
xhtml.th item.quantity
xhtml.th number_to_currency item.total_price
end
end

xhtml.tr do
xhtml.th 'total', colspan: 2
xhtml.th number_to_currency \
order.line_items.map(&:total_price).sum
end
end
 
 xhtml.p "Paid by #{order.pay_type}"
 end
 
 entry.author do |author|
 author.name order.name
 author.email order.email
 end
 end
 end
 end
 
