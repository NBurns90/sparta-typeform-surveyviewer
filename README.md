# sparta-typeform-surveyviewer

## Software
A web application built using Ruby on Rails 5.1.5, jQuery, JSON, Active Record, SCSS and HTML 5.

## Installation
1. Go to https://github.com/NBurns90/sparta-typeform-surveyviewer
2. Download Zip file
3. In app folder, open with rails server
4. Go to http://localhost:3000/ in your browser to launch the app
5. Enjoy!

## How it works
Once you have the application open on the main page, you can see all the survey responses given in one table. You are able to see all the NPS scores for every trainer from Sparta.

You are able to refine your searches by clicking on the dropdown bar and can select any trainer. Once you click on the trainer, the table will only show responses for that specific trainer. As well as this you are only able to see the NPS score of the trainer selected. If you select the 'blank trainer' at the bottom of the list, all trainers will be displayed again.

## Task Requirements
1. Allow responses from Typeform survey to be visually enhanced.
2. Gather user stories and requirements from product owner.
3. Provide filtering of the survey responses.
4. Create formula to show the NPS score of each trainer.

## Approach
### Product Owner
The product owner sends out surveys made on Typeform to people at the Sparta academy to gather feedback about the trainers who were currently teaching at the academy. In its current form the product owner was only able to see the responses in excel and did not like how the data was visually presented. The other problem which needed to be solved was that Typeform does not display the Net promoter score for each trainer. This is something our product owner wanted us to implement.

### User Stories
To get a clear idea of what the web app should look like and which functions should be implemented, we needed to set up a meeting with the product owner to gather the requirements and user stories.

In this meeting the product owner gave a list of functions they wanted included, and a basic design.

This originally included:
1. Data to be visualised in charts
2. A table of responses that can be filtered by trainer, date, questions, gender and many other attributes.
3. A function to create new survey forms.

A problem which occurred here was that we soon realised was that our product owner asked for more functions than what we could produce in one week. We later on had to relay this information to the product owner, so they could decide to say no to certain functions - such as the ability to create surveys and display data as charts.


### Wireframes
Once we had gathered all the user stories and basic design features the product owner wanted, we drew up some wireframes to give us a clearer understanding of the user keystrokes.

![Wireframe](./app/assets/images/IMG_20180226_133651.jpg)
![Wireframe](./app/assets/images/20180226_153210.jpg)
![Wireframe](./app/assets/images/20180226_153205.jpg)

## Sprints
For this project we were to use the agile methodology as a basis to our work style. To help follow our own progress we used Trello.

https://trello.com/b/4XvcXcpQ/sparta-student-survey-app

### Sprint 1
In sprint one we were to produce a minimum viable product. This was to be a complete working web app at its most basic level. All the key functions had to be working.

### Issues in sprint 1
#### Managing user stories
One of the main issues in sprint 1 was that we tried developing functions which were outside our scope. We used pair programming techniques to produce the functions unnecessary for MVP. One team worked on producing the function to be able to transfer the data from Typeform to the web app and the other team worked on translating the data into visual charts. We also told our product owner we would be able to produce a table which filters by a number of attributes. We believed we could do it in 2 - 3 days. This prevented us from producing an MVP in the given time. Lessons were learned and we changed the way we gathered user stories for sprint 2.

#### Typeform API vs Database
Another issue we had was deciding what method to use when transferring the data from the survey to the web app. Our first idea was to create a function which would allow the user to import the responses from a .csv file, which would automatically be inputted into a Postgresql database. After some research, we also found out that Typeform had its own API where you are able to receive all the responses in a JSON format. After a meeting with the product owner, it was decided that they wanted to use the JSON method as it would save the user from importing the file and instead, would automatically receive the data from Typeform.

### Sprint 2
After a meeting with our product owner where we took the opportunity to plan, weight, and decide our user stories that would be carried into the second sprint. For example, we decided that graphing from a JSON was outside our scope, and so that user story would be a much lower priority. With some research we built a custom dropdown menu using jQuery that would filter results by trainer. This would also filter the displayed NPS score.

### Contributors
- [Nathaniel Burns](https://github.com/NBurns90)
- [Ben Robinson](https://github.com/bjorobinson)
- [Christian Bryant](https://github.com/cbryant93)
- [Mahboob Rahman](https://github.com/Mahboobr)
- [Muhammed-Rayhaan Uddin](https://github.com/MoRUddin)
