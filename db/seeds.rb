

ALPHABET = "abcdefghijklmnopqrstuvwxyz".split("")
GENDERS = ['male', 'female', 'm', 'f', 'woman', 'man', 'non-binary', '']
LOREM_IPSUM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat orci lectus, eget ultricies velit malesuada eget. Donec ut ipsum enim. Proin aliquam varius erat, eget semper orci pretium ac. Praesent semper, ligula eu molestie mattis, arcu massa sagittis justo, sit amet pellentesque diam nibh at augue. Sed imperdiet varius ante eget sollicitudin. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec justo suscipit, lobortis velit non, suscipit mauris. In hac habitasse platea dictumst. In vitae suscipit ex, sollicitudin sollicitudin arcu. Cras at mauris non magna lobortis pretium rhoncus nec felis. Donec vehicula diam eu feugiat malesuada. Sed ullamcorper libero malesuada, tincidunt nisi at, molestie lectus. Mauris ullamcorper tincidunt neque, ut elementum lacus accumsan eget. Phasellus at felis eu ipsum consectetur ullamcorper at nec nisi.
Pellentesque vitae erat quis lorem tempor ornare. Sed pharetra diam ut massa ullamcorper, lobortis hendrerit felis pharetra. Ut ante lacus, sollicitudin ut porttitor eleifend, consectetur et tellus. Curabitur ut molestie turpis. Pellentesque pellentesque orci sed lectus consectetur laoreet. Donec dolor ligula, finibus nec justo vel, facilisis pellentesque nunc. Morbi mattis pulvinar enim, congue accumsan orci placerat id. Cras aliquam diam vitae neque laoreet, quis elementum felis porttitor. Praesent et mauris ac risus semper feugiat.
Nulla nec interdum metus. Fusce ut tortor id nisi hendrerit pellentesque. Suspendisse ultrices in dolor interdum mattis. Aliquam finibus nulla finibus purus porttitor, id vehicula nulla laoreet. Curabitur cursus nulla sit amet diam ultrices laoreet. Aliquam ante dolor, mollis quis ante eu, egestas rutrum erat. Mauris sodales lectus at lorem scelerisque efficitur. Donec ac sem vitae dolor venenatis ornare. Pellentesque imperdiet sem in ipsum mattis tincidunt. Praesent porttitor ac urna ut tempor. Ut libero nunc, ullamcorper nec hendrerit elementum, pharetra eu arcu.
Duis in ligula suscipit, finibus libero et, vestibulum justo. Nullam ac tristique arcu. Maecenas at molestie urna. Vestibulum erat risus, tempus nec bibendum et, bibendum vitae ante. Ut nunc ante, iaculis placerat elit eu, mattis pellentesque dolor. Quisque vitae dolor at felis feugiat cursus in non nulla. Quisque vel iaculis odio, eu dapibus metus. Nam dapibus malesuada orci, tincidunt faucibus metus dignissim vel. Duis sed tincidunt nisl, quis malesuada eros. Morbi risus ipsum, venenatis ut consectetur sit amet, tempor eu nisl. Sed a sollicitudin enim. Nulla hendrerit, quam non ornare porttitor, lorem purus sagittis neque, a semper est turpis eu felis. Integer scelerisque est at tellus rutrum porta.
Etiam eu auctor elit. Praesent mollis, nunc sodales ullamcorper porta, tortor magna ultricies tortor, interdum maximus lectus sapien sed urna. Nullam non eros posuere, semper ante sit amet, rutrum eros. Mauris efficitur metus id interdum cursus. Nam eu nisi nisi. Proin nec dignissim metus, venenatis commodo risus. Proin gravida ipsum nec metus vehicula fermentum. Etiam scelerisque enim ante, ac suscipit diam dignissim sit amet. Phasellus dictum tincidunt augue quis finibus. Donec vel rutrum ligula, non congue sapien. In dictum velit eu laoreet pellentesque. Phasellus ligula arcu, faucibus eu malesuada nec, gravida in sem. Donec vel ex hendrerit, sagittis tellus eu, egestas mi. Nullam felis elit, faucibus nec mollis nec, accumsan sit amet dolor.</p>"
LOREM_IPSUM_SHORT = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat orci lectus, eget ultricies velit malesuada eget. Donec ut ipsum enim. Proin aliquam varius erat, eget semper orci pretium ac. Praesent semper, ligula eu molestie mattis, arcu massa sagittis justo, sit amet pellentesque diam nibh at augue. Sed imperdiet varius ante eget sollicitudin. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec justo suscipit, lobortis velit non, suscipit mauris. In hac habitasse platea dictumst. In vitae suscipit ex, sollicitudin sollicitudin arcu. Cras at mauris non magna lobortis pretium rhoncus nec felis. Donec vehicula diam eu feugiat malesuada. Sed ullamcorper libero malesuada, tincidunt nisi at, molestie lectus. Mauris ullamcorper tincidunt neque, ut elementum lacus accumsan eget. Phasellus at felis eu ipsum consectetur ullamcorper at nec nisi."
ACTIVITY_OPTS = ["Skydiving", "Run a Marathon", "Publish a Book", "Date a Supermodel", "Visit Europe", "Learn to Play Guitar", "See a Broadway Show", "View the Northern Lights", "Drive Across the Continent", "Get My GED", "Learn Ruby on Rails"]

20.times do
    rand_name = ALPHABET.sample(rand(5..11)).join("").titlecase
    rand_year = rand(1950..2000)
    User.create(name: rand_name, 
        birthdate: DateTime.strptime("12/01/#{rand_year}", "%m/%d/%Y"),
        gender: GENDERS.sample(),
        alive: true,
        password_digest: BCrypt::Password.create('inspiration')
    )
end

ACTIVITY_OPTS.each do |option|
    Activity.create(name: option, description: LOREM_IPSUM_SHORT)
end

50.times do
    selected_user = User.all.sample
    selected_activity = Activity.all.sample
    UserExperience.create(user: selected_user, activity: selected_activity, completed: false)
end

20.times do
    story_title = ALPHABET.sample(rand(15..50)).join("")
    user_exp = UserExperience.all.sample
    Story.create(title: story_title, content: "#{LOREM_IPSUM} #{rand}", user_experience: user_exp) 
end

UserExperience.find(1).update(completed: true)
UserExperience.find(2).update(completed: true)
UserExperience.find(3).update(completed: true)
UserExperience.find(4).update(completed: true)
UserExperience.find(5).update(completed: true)
User.find(10).update(alive: false)

Category.create(name: "Yodeling")
Category.create(name: "Outdoors")
Category.create(name: "Travel")
Category.create(name: "Adventure")
Category.create(name: "Personal Growth")

Category.create(name: "Exercise")
Category.create(name: "Potent Potables")
Category.create(name: "Skills")
Category.create(name: "Relationships")
Category.create(name: "Sports")

20.times do
    selected_category = Category.all.sample
    selected_activity = Activity.all.sample
    CategoryActivity.create(category: selected_category, activity: selected_activity)
end