# Turnstile

This tool uses the NFC chips on the student identity cards of the Otto-von-Guericke-Universität Magdeburg to quickly check if someone has been scanned before.

The UIDs are SHA1 hashed before there are stored in a Sqlite3 database.

## Depencies

- ruby
- sqlite3
- scriptor, from pcsc\_tools

## Install

	$ cd turnstyle
	$ gem install sqlite3
	$ sqlite3 turnstyle.db
	sqlite> create table voters (sha1 char(40));
