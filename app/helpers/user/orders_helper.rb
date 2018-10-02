module User::OrdersHelper
    def get_sum(order)
        sum = 0
        order.order_details.each{|o|
            sum += o.price * o.number
        }
        return sum.to_s(:delimited)
    end

    def get_shipment_status(order)
        status = order.shipment_status
        case status
        when 0 then
            return "準備中"
        when 1 then
            return "発送済"
        when 2 then
            return "到着済"
        end
    end
end
