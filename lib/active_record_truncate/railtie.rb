module ActiveRecordTruncate

	class Railtie < Rails::Railtie
		initializer "active_record_truncate gem initialization" do
			ActiveRecord::Base.send :include, ActiveRecordTruncate::Base
			
		end
	end

end

