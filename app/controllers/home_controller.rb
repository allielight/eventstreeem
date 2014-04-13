class HomeController < ApplicationController

def index
	@instagram = Instagram.user_recent_media("428478422", {:count => 1})
end

end