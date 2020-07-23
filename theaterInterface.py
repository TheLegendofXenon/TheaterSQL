from theaterQueries import * # Import from the theaterQueries.py file

# This function creates the main menu where a user can choose to login as a customer or employee. They can also
# sign up as a customer or employee.
def mainMenu():
	print("")
	while True:
		print("-----------------------------------------------------------------------------------------------")
		print("1. Login as a Customer")
		print("2. Login as an Employee")
		print("3. Sign up as a Customer")
		print("4. Sign up as an Employee")
		print("5. Exit")
		print("-----------------------------------------------------------------------------------------------\n")

		menu_number = int(input("Which type of option would you like to perform? "))
		print("")
		if menu_number == 1:
			customerMenu()
		elif menu_number == 2:
			employeeMenu()
		elif menu_number == 3:
			createCustomer()
		elif menu_number == 4:
			createEmployee()
		elif menu_number == 5:
			print("Goodbye! Come to this movie theatre again!")
			break

# This function creates the customer main menu where certain queries can be performed.
def customerMenu(): 

	# Prompt login
	custLogin = input("What is your login name? ")
	custPass = input("What is your password? ")
	# See if the customer exists
	mycursor.execute("SELECT Name, CustID FROM Customer WHERE LoginName=\'" + custLogin + 
		"\' AND Password=\'" + custPass + "\';")
	loginResult = mycursor.fetchone()
	if loginResult is None:
		print("\nCannot find this account in our list of customers...\n")
		return
	else:
		print("\nYou have successfully logged in " + str(loginResult[0]) + "!\n")
		custID = str(loginResult[1])

	while True:
		print("-----------------------------------------------------------------------------------------------")
		print("1. Find movies based on showtime dates")
		print("2. Find showtimes for movie + format")
		print("3. Find the most watched movie based on your favorite genre")
		print("4. Find the unavailable auditorium at a specific date and time")
		print("5. Find the most watched screen type for a specific movie")
		print("6. Buy a ticket")
		print("7. Find the customer of the month")
		print("8. Tell us how many times you've watched a certain movie")
		print("9. Exit")
		print("-----------------------------------------------------------------------------------------------\n")

		menu_number = int(input("Which option would you like to do? "))
		print("")
		if menu_number == 1:
			movieDate()
		elif menu_number == 2:
			movieFormatShowtime()
		elif menu_number == 3:
			mostWatched()
		elif menu_number == 4:
			availableAuditorium()	
		elif menu_number == 5:
			mostScreenType()
		elif menu_number == 6:
			buyTicket(custLogin, custPass)
		elif menu_number == 7:
			monthCustomer()
		elif menu_number == 8:
			timesWatched(custID)
		elif menu_number == 9:	
			print("Goodbye! Come to this movie theatre again!")
			break

# This function creates the employee main menu where certain queries can be performed.
def employeeMenu():

	# Prompt login
	empLogin = input("What is your login name? ")
	empPass = input("What is your password? ")
	# See if the employee exists
	mycursor.execute("SELECT Name FROM Employee WHERE LoginName=\'" + empLogin + 
		"\' AND Password=\'" + empPass + "\';")
	loginResult = mycursor.fetchone()
	if loginResult is None:
		print("\nCannot find this account in our list of employees...\n")
		return
	else:
		empName = str(loginResult[0])
		print("\nYou have successfully logged in " + empName + "!\n")

	while True:
		print("-----------------------------------------------------------------------------------------------")
		print("1. Tickets sold by current employee")
		print("2. Find the employee of the month")
		print("3. Exit")
		print("-----------------------------------------------------------------------------------------------\n")

		menu_number = int(input("Which option would you like to do? "))
		print("")
		if menu_number == 1:
			employeeTickets(empLogin, empPass)
		elif menu_number == 2:
			monthEmployee()
		elif menu_number == 3:
			print("Goodbye! Come to this movie theatre again!")
			break

# Call the main-menu fuction.
mainMenu()