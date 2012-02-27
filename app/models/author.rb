class Author < User
	has_many :todos
	has_many :comments
end
