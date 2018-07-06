namespace :dev do 
  task fetch_user: :environment do 
    User.where.not(role: "admin").destroy_all

    url = "https://uinames.com/api/?ext&region=england"

    8.times do 
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      intro = "It is a long established fact that a reader will be distracted by the readable content of a page"

      user = User.create!(
        name: data["name"],
        intro: intro,
        remote_avatar_url: data["photo"],
        email: data["email"],
        password: data["password"]
        )
      puts "created user #{user.name} "
    end
    puts "new have #{User.count} user data"
  end
end