module ApplicationHelper

	def simple_time(time)
		time.strftime("%Y-%m-%d %H:%M:%S")
	end
	# 時刻をシンプルに表示する用。日本時間の設定は config/application.rb にて

end
