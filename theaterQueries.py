# NOTE: must have mysql.connector python library installed to run
import mysql.connector
from datetime import datetime, timedelta

# This is how to connect to the database
# Make sure host, username, and password match to your phpMyAdmin account
print("Please enter information for your database connection below.")
hostname = input("What is your hostname: ")
inputUser = input("What is your username: ")
inputPass = input("What is your password: ")
theaterDB = mysql.connector.connect(host=hostname, user=inputUser, passwd=inputPass, database="theater")

# Tram's connection
#config = {
#  'user': 'root',
#  'password': 'root',
#  'unix_socket': '/Applications/MAMP/tmp/mysql/mysql.sock',
#  'database': 'theater',
#  'raise_on_warnings': True,
#}
#theaterDB = mysql.connector.connect(**config)
# Making a cursor to locate data in the database
mycursor = theaterDB.cursor()

# This function does a query for movies based on showtime dates
def movieDate():

	# Get the date input
	inputDate = input("What day would you like to see showings? Enter in format YYYY-MM-DD: ")

	# Perform the query and print
	mycursor.execute("SELECT Title, DATE_FORMAT(Date, \'%M-%d-%Y\'), DATE_FORMAT(Time, \'%r\')" + 
	" FROM Movie NATURAL JOIN MovieShowtime WHERE Date=\'" + inputDate + "\';")
	dateResult = mycursor.fetchall()

	for d in dateResult:
		print(d)
	print("")

# This function displays the tickets sold by the current employee.
def employeeTickets(empLogin, empPass):

	# Perform the query and print
	mycursor.execute("SELECT TicketID FROM Employee NATURAL JOIN Ticket WHERE EmpID = SellsTicket AND LoginName=\'" 
		+ empLogin + "\' AND Password=\'" + empPass + "\';")
	knoxResult = mycursor.fetchall()

	for k in knoxResult:
		print(k[0])
	print("")

# This function does a query for movie showtimes based on a movie and format.
def movieFormatShowtime():

	# Get the inputs
	title = input("What is the title of the movie you want to see? ")
	screenType = input("What format do you want to see the movie in? ")
	
	# Perform the query and print
	mycursor.execute("SELECT DATE_FORMAT(Date, \'%M-%d-%Y\'), DATE_FORMAT(Time, \'%r\')" + 
	" FROM Movie NATURAL JOIN MovieShowtime NATURAL " + "JOIN Auditorium WHERE AuditID = Assigned AND Title=\'" + 
	title + "\' AND ScreenType=\'" + screenType + "\';")
	showtimeResult = mycursor.fetchall()

	for s in showtimeResult:
		print(s)
	print("")


# This function creates a new customer and puts it in the customer table.
def createCustomer():
	
	# Get all the inputs
	custName = input("What is your name? ")
	custEmail = input("What is your email? ")
	custPhone = input("What is your phone number? ")
	custLogin = input("What is your login name? ")
	custPass = input("What is your password? ")

	# Get the id of the last customer in the table
	mycursor.execute("SELECT CustID FROM Customer ORDER BY CustID DESC LIMIT 1;")
	lastCustID = mycursor.fetchone()

	# Create the customer
	newCustID = lastCustID[0] + 1
	mycursor.execute("INSERT INTO Customer (Name, Email, PhoneNumber, LoginName, Password)"
		+ "VALUES (%s,%s,%s,%s,%s)", (custName, custEmail, custPhone, custLogin, custPass)) 
	theaterDB.commit() # This function makes sure the insert in the database happens.
	print("Your account has been created! Your customer ID is " + str(newCustID) + ".\n")

# This function creates a new employee and puts it in the employee table.
def createEmployee():
	
	# Get all the inputs
	empName = input("What is your name? ")
	empEmail = input("What is your email? ")
	empPhone = input("What is your phone number? ")
	empLogin = input("What is your login name? ")
	empPass = input("What is your password? ")

	# Get the id of the last employee in the table
	mycursor.execute("SELECT EmpID FROM Employee ORDER BY EmpID DESC LIMIT 1;")
	lastEmpID = mycursor.fetchone()

	# Create the employee
	newEmpID = lastEmpID[0] + 1
	empSalary = 10000 # Starting salary for any employee
	dateStr = str(datetime.now()).split(' ')
	empDOH = dateStr[0] # Get the date of hire for the employee
	empDiscount = 5.00 # Starting discount for any employee
	mycursor.execute("INSERT INTO Employee (Name, Email, PhoneNumber, Salary, DateOfHire,"
		+ " LoginName, Password, Discount)VALUES (%s,%s,%s,%s,%s,%s,%s,%s)", 
		(empName, empEmail, empPhone, empSalary, empDOH, empLogin, empPass, empDiscount)) 
	theaterDB.commit() # This function makes sure the insert in the database happens.
	print("Your account has been created! Your employee ID is " + str(newEmpID) + ".\n")

# This function finds the most watched movie based on genre
def mostWatched():

	# Get the genre
	genre = input("What is your favorite movie genre? ")
	# Perform the query and print
	mycursor.execute("SELECT Title FROM Ticket NATURAL JOIN Movie NATURAL JOIN MovieShowtime WHERE Category = \'" +
	genre + "\' GROUP BY Title ORDER BY COUNT(Title) DESC LIMIT 1;")
	genresResult = mycursor.fetchone()

	print("The most watched " + genre + " movie is ")
	for x in genresResult:
		print(x)

# This function finds the unavailable auditoriums at a specific date and time
# Endtime = starttime + length of a movie
def unavailableAuditorium():

	# get date and time
	date = input("Enter the date: ")
	time = input("Enter the time: ")

	#Perform query and print
	mycursor.execute("SELECT AuditID, ScreenType, Capacity, DATE_FORMAT(Date, \'%M-%d-%Y\'), DATE_FORMAT(Time, \'%r\')," +
	"DATE_FORMAT(ADDTIME(Length,Time), \'%r\') FROM Movie NATURAL JOIN " +
	"MovieShowtime NATURAL JOIN Auditorium WHERE Date=\'" + date + "\' AND Time <= \'" +
	time + "\' AND ADDTIME(Length,Time) >= \'" + time + "\' AND AuditID = Assigned;")
	dateResult = mycursor.fetchall()

	for x in dateResult:
		print(x)

# This function finds the screen type customers watch most for a specific movie
def mostScreenType():

	# get the title
	title = input("Which movie are you looking for? ")

	#Perform query and print
	mycursor.execute("SELECT ScreenType, Title from Ticket natural join MovieShowtime natural join Auditorium NATURAL JOIN Movie " + 
	"where AuditID = Assigned AND Title = \'" + title + "\' Group by ScreenType order by COUNT(ScreenType) DESC LIMIT 1;")
	screenResult = mycursor.fetchall()

	for x in screenResult:
		print(x)
	

def buyTicket(custLogin, custPass):
	# Find CustID
	mycursor.execute("SELECT CustID FROM Customer WHERE LoginName=\'" 
		+ custLogin + "\' AND Password=\'" + custPass + "\';")
	IDResult = mycursor.fetchone()

	# Get showing info
	while True:
		title = input("Which movie are you looking for? ")
		date = input("Enter the date (YYYY-MM_DD) you want to see this movie: ")
		time = input("Enter the time (HH:MM:SS) you want to see this movie: ")

		mycursor.execute("SELECT Title, Category, DATE_FORMAT(Date, \'%M-%d-%Y\'), DATE_FORMAT(Time, \'%r\'), ShowID FROM Movie natural join MovieShowtime" 
		+ " WHERE Title = \'" + title + "\' AND Date = \'" + date + "\' AND Time = \'" + time + "\';")
		ticket = mycursor.fetchone()

		if ticket is None:
			print("\nCannot find this showing...\n" + "Please enter the information again\n")
		else:
			print("\nYou have found a showing!\n" + 
			ticket[0] + " on " + ticket[2] + " at " +  ticket[3] + "\n")
			#print(ticket[4])
			# get payment method
			payment = input("It is $12.00. How do you want to pay for this ticket? ")
			while True:
				seat = input("Where do you want to sit? Enter a row followed by a number: ")
				# See if the seat is available
				mycursor.execute("SELECT ShowID, RowNumber FROM Ticket WHERE ShowID=\'" + str(ticket[4]) + 
				"\' AND RowNumber=\'" + seat + "\';")
				seatResult = mycursor.fetchone()
				if seatResult is None:
					print("\nThe seat is available\n")
					break
				else:
					print("\nThe seat is unavailable. Please choose another seat!")
			break

	# Create a new ticket

	# Get the id of the last ticket in the table
	mycursor.execute("SELECT TicketID FROM Ticket ORDER BY TicketID DESC LIMIT 1;")
	lastTicketID = mycursor.fetchone()

	newTicketID = lastTicketID[0] + 1
	mycursor.execute("INSERT INTO Ticket (TicketID, BuysTicket, SellsTicket, ShowID,"
		+ " RowNumber, Price, PaymentMethod) VALUES (%s,%s,%s,%s,%s,%s,%s)", 
		(newTicketID, IDResult[0], 0, ticket[4], seat, 12.00, payment)) 
	theaterDB.commit()
	print("The ticket " +  str(newTicketID)  + " is successfully booked!")

#This query finds the customer of the month based on the number of their tickets bought in a month 
def monthCustomer():

	# get the month
	mon = input("Please enter the month (1-12): ")

	#qeuery
	mycursor.execute("SELECT CustID, Name FROM MovieShowtime natural join Ticket natural join Customer " + 
	"where BuysTicket = CustID AND month(date) = \'" + mon + "\' group by CustID order by count(CustID) DESC LIMIT 1;")
	custResult = mycursor.fetchall()

	for x in custResult:
		print(x)

#This query finds the employee of the month based on the number of their tickets sold in a month 
def monthEmployee():
	# get the month
	mon = input("Please enter the month (1-12): ")

	#query
	mycursor.execute("SELECT EmpID, Name FROM MovieShowtime natural join Ticket natural join Employee " + 
	"where SellsTicket = EmpID AND month(date) = \'" + mon + "\' group by EmpID order by count(EmpID) DESC LIMIT 1;")
	empResult = mycursor.fetchall()

	for x in empResult:
		print(x)

# This function lets a user tell the theatre how many times they watched a movie.
def timesWatched(custID):
	
	# Get all the inputs
	title = input("What is the movie's name? ")
	# Check to make sure the movie exists in the database
	mycursor.execute("SELECT MovieID FROM Movie WHERE Title=\'" + title + "\';")
	titleResult = mycursor.fetchone()
	if titleResult is None:
		print("This movie is not found in our theater's history...\n")
		return
	movieID = str(titleResult[0])
	times = input("How many times have you watched this movie? ")

	# Get the id of the last customer in the table
	# Perform the query and print
	mycursor.execute("SELECT MovieID FROM Watched NATURAL JOIN Movie WHERE Title=\'" + title + "\';")
	movieIDResult = mycursor.fetchone()

	if movieIDResult is None:	# Not in the watched table (INSERT)

		mycursor.execute("INSERT INTO Watched (CustID, MovieID, NumOfTimes)"
			+ "VALUES (%s,%s,%s)", (custID, movieID, times)) 
		theaterDB.commit() # This function makes sure the insert in the database happens.
		print("We have created your number of watched times for this movie.\n")
	else:	# In the watched table (UPDATE)
		movieID = str(movieIDResult[0])
		mycursor.execute("UPDATE Watched SET NumOfTimes = \'" + times + "\' WHERE " +
			"CustID = \'" + custID + "\' AND MovieID = \'" + movieID + "\';") 
		theaterDB.commit() # This function makes sure the update in the database happens.
		print("We have updated your number of watched times for this movie.\n")


# One-Time Queries

# This function creates a view for the customers without the login or password.
def customerView():
	
	mycursor.execute("CREATE VIEW CustomerView AS SELECT CustID, Name, Email, PhoneNumber " + 
		"FROM Customer;")
	theaterDB.commit() 

# This function creates a view for the employees without the login or password.
def employeeView():
	
	mycursor.execute("CREATE VIEW EmployeeView AS SELECT EmpID, Name, Email, PhoneNumber " + 
		"FROM Employee;")
	theaterDB.commit() 

# This function creates a Table for the Watched(Customer, Movie) relationship.
def createWatched():
	
	mycursor.execute("CREATE TABLE Watched(" +
		"WatchID int NOT NULL AUTO_INCREMENT, CustID int, MovieID int, " +
		"FOREIGN KEY (CustID) REFERENCES Customer(CustID)," +
		"FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)," +
		"PRIMARY KEY (WatchID),"
		"NumOfTimes int) ENGINE=INNODB;")
	theaterDB.commit()