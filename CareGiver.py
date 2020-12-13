
import mysql.connector
from mysql.connector import errorcode

# Haris Naveed
# NaveedCaregiver Database
# Professor Gregory Schaper
# Database Systems

# Connecting with Mysql
def connectToMySQL():
    cnx = mysql.connector.connect(password = 'naveedh', user='naveedh')
    cursor = cnx.cursor()
    return cursor, cnx

# Asking the user what type of person are they using to add or list
def promptQuestionOccupation(keyword):
    print("Are you " + keyword + " a client or caregiver")
    print("Options:\n\tCLIENT\n\tCAREGIVER")
    userInput = input("Enter: ")
    while True:
        if userInput.isalpha():
            if userInput.lower() == 'client' or userInput.lower() == 'caregiver':
                return userInput.lower()
            else:
                userInput = input("You enter a keyword that is not. Try again.\nEnter: ")
        else:
            userInput = input("You enter a number. Try again.\nEnter: ")


# Formatting the DOB for Caregiver
def changingCaregiverAttributes(infoElement):
    month = infoElement[-2]
    year = infoElement[-1]
    infoElement.pop(-1)
    infoElement.pop(-1)
    infoElement[-1] = infoElement[-1] + ", " + month + ", " + year[0:-1]


# Formatting the attributes
def printListInformation2(info,tablename):
    info = info[1:-1]
    infoElement = info.split(", ")
    if tablename == "client":
        changingClientAttributes(infoElement)
    if tablename == 'caregiver':
        changingCaregiverAttributes(infoElement)

    infoList = list()
    for index in range(len(infoElement)):
        if (infoElement[index].startswith("(")):
            infoList.append(infoElement[index][1:])
        if (infoElement[index].endswith("')")):
            if infoElement[index].startswith("datetime.date"):
                infoList.append(infoElement[index][0:])
            infoList.append(infoElement[index][0:-1])
        if infoElement[index].startswith("'") and infoElement[index].endswith("'"):
            infoList.append(infoElement[index][1:-1])
        if infoElement[index].isdigit():
            infoList.append(infoElement[index])
        if infoElement[index].startswith("datetime.date"):
            infoList.append(infoElement[index])
    return infoList

# Formatting the DOB for Client
def changingClientAttributes(infoElement):
    print(infoElement)
    month = infoElement[-3]
    year = infoElement[-2]
    infoElement.remove(month)
    infoElement.remove(year)
    infoElement[-2] = infoElement[-2] + ", " + month + ", " + year


# Printing the information by attributes
def printListInformation(personInfo, tablename):
    personInfoList = printListInformation2(personInfo, tablename)
    print("\n")
    if (tablename =='client'):
        attributes = ["Client_id", "First Name", "Last Name", "ClientType_ID", "Description", "Address", "City", "State", "Zip", "Phone", "Email", "Status", "DOB", "Gender"]
        for index in range(len(attributes)):
            print(attributes[index] + ": " + personInfoList[index])
    if (tablename == 'caregiver'):
        attributes = ['Caregiver_id', 'First Name', 'Last Name', 'Role_ID' , 'Description', 'Address', 'City', 'State', 'Zip', 'Phone', 'Email', 'Status', 'Gender', 'DOB']
        for index in range(len(attributes)):
            print(attributes[index] + ": " + personInfoList[index])

# Connecting to mysql and executing a select statement and fetching all of the data
def listAttribute(cursor):
    print("list")
    tableName = promptQuestionOccupation("listing")
    if tableName == 'client':
        print("Try using Robert Senior or Haris Naveed\n")
    if tableName == 'caregiver':
        print("Try using Carol Smith or Naveed Ashraf\n")
    firstName = input("First name of " + tableName + ": ").strip()
    lastName = input("Last name of " + tableName + ": ").strip()
    while True:
        if firstName.isalpha() and lastName.isalpha():
            # Getting info from client/caregiver
            sql = "SELECT * FROM " + tableName + " WHERE " + tableName +"_firstname = '" + firstName +"' AND " + tableName +"_lastname = '" + lastName + "';"
            cursor.execute(sql)
            personInfo = cursor.fetchall()

            printListInformation(str(personInfo), tableName)
            #print(info)
            break
        if firstName.isdigit() and lastName.isdigit():
            firstName = input("You enter a number. Try again.\nEnter first name of " + tableName +": ").strip()
            lastName = input("You enter a number. Try again.\nEnter last name of " + tableName +": ").strip()



# Connects to mysql to add a client or caregiver
def addAttribute(cursor):
    tableName = promptQuestionOccupation("adding")
    if (tableName == 'client'):
        sql = "INSERT INTO Client(client_firstname, client_lastname, ClientType_ID, client_description, client_Address, client_City, client_State, client_Zip, client_Phone, client_email, client_status, client_DOB, client_gender)" \
              " VALUES('Haris','Naveed', 2, 'Heart Disease', '245 Nazareth Pike', 'Nazareth', 'PA', '18064', '484-678-9067', 'harisnaveed984@gmail.com', 'A','2001-10-09', 'M');"
        print(sql)
        cursor.execute(sql)
        print("Client added.")
    if (tableName == 'caregiver'):
        sql = "INSERT INTO CareGiver(Caregiver_firstname, Caregiver_lastname, ROLE_ID, Caregiver_description, Caregiver_Address, Caregiver_City, Caregiver_State, Caregiver_Zip, Caregiver_Phone, Caregiver_email," \
              "Caregiver_status, Caregiver_gender, Caregiver_DOB) VALUES('Naveed', 'Ashraf', 4, 'Therapy Doctor', '245 Nazareth Pike', 'Nazareth', 'PA', '18014', '484-432-2343', 'naveedashraf12@gmail.com', 'A','M'," \
              "'1973-12-23');"
        print(sql)
        cursor.execute(sql)
        print("Caregiver added.")


# Checks if userinput is list or add properly
def userinputAttribute(cursor):
    userInput = input("Enter: ").strip()

    while True:
        if userInput.isalpha():
            if userInput.lower() =='list' or userInput.lower() == 'add':
                if userInput == 'list':
                    listAttribute(cursor)
                    break
                if userInput == 'add':
                    addAttribute(cursor)
                    break
            else:
                userInput = input("You enter a keyword that is not. Try again.\nEnter: ")
        else:
            userInput = input("You enter a number. Try again.\nEnter: ")



def prompt():
    print("Welcome Naveed's CareGiver Services. We are help our elderly with care and love. CareGiver Database "
          "contains the elderly that are currently living in our wonderful home in Bath, PA. Here are the options.\n")

    print("List info and tasks on a client or caregiver. Type LIST\n")
    print("Add client or caregiver. Type ADD\n")

def main():

    cursor, connection = connectToMySQL()
    cursor.execute("USE NaveedCaregiver;")
    prompt()
    info = userinputAttribute(cursor)

    connection.commit()
    cursor.close()
    connection.close()


main()