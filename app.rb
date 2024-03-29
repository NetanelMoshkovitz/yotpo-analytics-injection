require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/graph'
require 'active_record'
require 'yaml'
require 'rest_client'

DB_CONFIG = YAML::load(File.open('config/database.yml'))

set :database_file, "config/database.yml"

class Purchase < ActiveRecord::Base
end

class ConversionOrder < ActiveRecord::Base
end

class App < Sinatra::Application
  get '/' do
    #"#{User.last.email}"
    last_id1=Purchase.last.id.to_i
    last_id2=ConversionOrder.last.id.to_i
    i=0
    j=0
    until Purchase.where(:id=>i).first!=nil
      i=rand(last_id1)
    end
    until ConversionOrder.where(:id=>j).first!=nil
      j=rand(last_id2)
    end
    @purchase=Purchase.find(i)
    @conversion_order=ConversionOrder.find(j)
    values   = {:data =>
                    {:conversion_order =>[
                         {:account_id =>@conversion_order.account_id, :order_id=>@conversion_order.order_id,:amount=>@conversion_order.amount,:currency =>@conversion_order.currency,:reference =>@conversion_order.reference,:created_at=>@conversion_order.created_at.to_date}],
                     :purchase =>[
                         {:account_id=>@purchase.account_id,:reference =>@purchase.reference,:user_email=>@purchase.user_email,:order_id=>@purchase.order_id,:user_name=>@purchase.user_name,:order_date=>@purchase.order_date.to_date,:product_currency=>@purchase.product_currency,:product_sku=>@purchase.product_sku,:product_url=>@purchase.product_url,:product_name=>@purchase.product_name,:product_image=>@purchase.product_image,:product_description=>@purchase.product_description,:product_price=>@purchase.product_price,:created_at=>@purchase.created_at.to_date}]}}.to_json
    headers  = {:content_type => "application/json"}
    response = RestClient.post "http://analytics.yotpo.com/track", values, headers

    erb :index

  end

end
