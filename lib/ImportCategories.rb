
require 'rest-client'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

module Import
  class ImportCategories


    def self.importRest

      #Connect to tom-sbychkov
      #response = RestClient.get 'tom-sbychkov.rhcloud.com/ordersServer/category'
      #response
      RestClient.get('tom-sbychkov.rhcloud.com/ordersServer/category'){ |response, request, result, &block|
        case response.code
          when 200
            p "It worked !"
            cats = JSON.parse(response.force_encoding('utf-8') )
            cats.each{|cat|
              if cat["parent"].nil?
                #  p cat["code"]
                p cat
                pc=Shoppe::ProductCategory.new
                if Shoppe::ProductCategory.find_by(permalink:cat["code"]).present?
                  # do something to update
                else

                  pc.permalink=cat[code]
                  pc.name=cat[name]

                end
              else
               catparent= Shoppe::ProductCategory.find_by(permalink:cat["parent"]["code"])

              end

            }
          when 423
            raise SomeCustomExceptionIfYouWant
          else
            response.return!(request, result, &block)
        end
      }


    end

  end
end
ImportCategories.importRest
