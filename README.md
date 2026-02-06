# Install Following packages
###### firebase_auth: ^6.1.4
###### firebase_core: ^4.4.0
###### http: ^1.4.0
###### shared_preferences: ^2.5.4
###### provider: ^6.1.5+1
vativeApp
● Allowed Resources: Only co
A
n
s
s
s
ul
e
t
s
o
s
ffi
m
cia
e
l
n
la
t
n
P
gu
o
a
l
g
ic
e
y
manuals, specs, or standa
s
rd library
references for syntax or API help. Using any other resources (e.g., ChatGPT, plugins,
Stackoverflow, forums) is prohibited.
● Original Work: All code and answers provided must be your original work. Plagiarism or
copying code from other sources will result in disqualification.
● Time Management: You are expected to manage your time effectively to complete all
questions. Prioritize clarity and correctness over complexity.
● Code Quality: Write clean, readable, and well-documented code. Follow best practices
for coding style and conventions.
Test Duration: 2 Hours
vativeApps
Task 1: Smart Counter with Business Rules
Create a Flutter screen that includes:
● A counter value displayed on screen
● Buttons for increment and decrement
● A reset button
● Counter value must never go below zero
● When the counter exceeds 15, display a warning message
● Disable the increment button when the value reaches 20
● Use any state management approach (Provider / GetX / Riverpod)
Task 2: Dynamic Form with Conditional Fields
Create a form with the following behavior:
Fields:
● Full Name
● Email Address
● User Type (Dropdown: Student, Employee)
Conditions:
● If Student is selected → show University Name field
● If Employee is selected → show Company Name field
Validation:
● All visible fields are required
● Email must be in valid format
● Submit button should only be enabled when the form is valid
After submission, navigate to a new screen and display the entered data.
vativeApps
Task 3: Firebase Authentication with Session Handling
Implement Firebase Email/Password authentication:
● Login Screen
● Register Screen
● Logout functionality
Extra Requirements:
● Show loading indicator during API calls
● Display meaningful error messages for authentication failures
● Persist user session so the user remains logged in after app restart
Task 4: Search and Ranking
Input:
● A predefined list of items (strings), such as:
○ Flutter Developer
○ Frontend Engineer
○ Backend Developer
○ Mobile App Developer
○ Full Stack Developer
● A search text entered by the user
Task 5: Theme Management with Local Storage
● Implement Light and Dark themes
● Provide a toggle to switch themes
● Save user preference using local storage
● Apply saved theme automatically on app launch
vativeApps
Task 6: Navigation with Data & Result
● Navigate from Screen A to Screen B with a string value
● Screen B allows the user to edit the value
● Return the updated value back to Screen A and display it
Task 7: Animated UI Interaction
Create an animated widget:
● Use AnimatedContainer or AnimationController
● On button press, animate size, color, and border radius
● Animation should feel smooth and user-friendly
Task 8.Responsive Design
Create a responsive layout that adjusts based on the screen size.
● Requirements:
○ Use LayoutBuilder or MediaQuery to determine screen size.
○ Create a layout that switches between a single-column layout on small
screens and a multi-column layout on larger screens.
vativeApps
Task 9: String Analysis Algorithm
Create a screen where user enters a sentence.
Algorithm Requirements:
● Count total words
● Find the most frequent word
● Ignore case sensitivity
● Ignore punctuation
Example:
Input: "Flutter is great, Flutter is fast!"
Output:
Words: 5
Most frequent word: flutter
Task 10: Task Scheduling Algorithm
User enters multiple tasks with:
● Task name
● Start time
● End time
Algorithm Requirements:
● Validate that end time > start time
● Detect overlapping tasks
● Highlight conflicting tasks in the UI
