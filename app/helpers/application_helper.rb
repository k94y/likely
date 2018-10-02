module ApplicationHelper
  def add_dot_to_price(text)
      res = ""
      text_array = text.to_s.split("").reverse
      text_array.each_with_index{ |v, i|
          res.insert(0, v.to_s)
          if i < (text_array.length-1) && (i+1)%3 == 0 then
              res.insert(0, ',')
          end
      }
      return res
  end

	def simple_time(time)
		time.strftime("%Y-%m-%d %H:%M:%S")
	end
	# 時刻をシンプルに表示する用。日本時間の設定は config/application.rb にて

end
