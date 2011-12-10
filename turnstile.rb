#!/usr/bin/env ruby

require "sqlite3"
require "digest/sha1"

db = SQLite3::Database.new "turnstile.db"

while gets != "exit\n" do
	uid = `scriptor get_uid`.match(/ff ca 00 00 00\n<\s(.*?)\s:/) {$1}
	
	if uid == nil
		puts "No UID"
	else 
		puts "UID fetched"

		sha1 = Digest::SHA1.hexdigest uid

		if !(db.execute "SELECT sha1 FROM voters WHERE sha1 = '#{sha1}'").empty?
			puts "UID already present"
		else
			db.execute "INSERT INTO voters VALUES ('#{sha1}')"
			puts "UID ok"
		end
	end
end
