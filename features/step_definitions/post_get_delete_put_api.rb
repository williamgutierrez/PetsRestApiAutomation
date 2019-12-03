Given(/^When I make a Post to Pets with name "([^"]*)" and status "([^"]*)" with id "([^"]*)"$/) do |name, status,id|
 opt=  {
           :id => "#{id}",
                  :category=> {
                      :id=> 3,
                      :name=> "string"
                  },
                  :name=> "#{name}",
                  :photoUrls=> [
                      "string"
                  ],
                  :tags=> [
                      {
                          :id=> 0,
                          :name=> "string"
                      }
                  ],
                  :status=> "#{status}"

  }
 puts opt
 #@response = HTTParty.post("http://petstore.swagger.io/#{route}",opt)
  @response = HTTParty.post("http://petstore.swagger.io/v2/pet",:body => opt.to_json, :headers=>{'Content-type'=>'application/json'})
  puts "Create the Pet with id: #{id} y nombre : #{name}"
end
When(/^Post create Pets it should return a response with a (\d+) response /)  do |code|
  expect(@response.code).to eql(code.to_i)
  puts "CREADO"
  puts"========================================================================"
end

#****************************************************************************
Given(/^delete pets with id "([^"]*)"$/) do |id|
  #puts "valor de id => #{id} "
  @response = HTTParty.delete("http://petstore.swagger.io/v2/pet/#{id}")
  puts "Pet Removed id :#{id}"
end
When(/^delete it should return a response with a (\d+)$/) do |code|
  expect(@response.code).to eql(code.to_i)
  puts "ELIMINADO"
  puts"========================================================================"
end

#*************************************************************************
Given(/^No found pets to id "([^"]*)"$/) do |id|
@response = HTTParty.get("http://petstore.swagger.io/v2/pet/#{id}")
  puts"checking that the pet was removed id: #{id}"
end
When(/^get pets for id response with a (\d+)$/) do |code|
  puts code.to_i
  expect(@response.code).to eql(code.to_i)
  puts "verified"
  puts"========================================================================"
end

#*********************************************************
Given(/^puts to change name "([^"]*)" with id "([^"]*)"$/) do |name,id|
  changedatoId={
      :id => "#{id}",
      :category=> {
          :id=> 3,
          :name=> "string"
      },
      :name=> "#{name}",
      :photoUrls=> [
          "string"
      ],
      :tags=> [
          {
              :id=> 0,
              :name=> "string"
          }
      ],
      :status=> "available"

  }
  puts changedatoId
  @response = HTTParty.post("http://petstore.swagger.io/v2/pet",:body => changedatoId.to_json, :headers=>{'Content-type'=>'application/json'})
  puts "Pet name changed id: #{id} y Nuevo nombre :#{name} "
end
When(/^Change name Pets it should return response (\d+)$/) do |code|
    expect(@response.code).to eql(code.to_i)
  puts "MODIFICADO"
    puts"========================================================================"

end







