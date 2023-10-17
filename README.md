#NPSAction README
##Project Description

The `NPSAction` class is designed for Salesforce and serves as a tool to send Net Promoter Score (NPS) surveys. It integrates seamlessly with Salesforce Flows and can automate the process of survey distribution based on specific criteria.

##Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Author](#author)
- [Version](#version)
- [Date](#date)

##Installation
To use the `NPSAction` class, follow these steps:
1. Ensure you have access to a Salesforce environment.
2. Import the `NPSAction` class into your Salesforce org.
3. Create and configure a Flow in Salesforce that utilizes the `NPSAction` class.
##Usage
The `NPSAction` class is designed to be used within Salesforce Flows. It allows you to automate the sending of NPS surveys to customers based on specific conditions in your Salesforce data.
To use the class, you'll need to create a Flow in Salesforce that invokes the `NPSAction.sendNPS` method. This method processes a list of order records and sends surveys to customers associated with those orders when specific criteria are met.

##Configuration

There are a few key configuration points to consider:
- Ensure that you have valid Salesforce Order and Contact records in your org.
- Verify that the endpoint URL for the NPS survey API is correct in the `sendNPSSurvey` method.
- Set up appropriate API authentication in the `Authorization` header of the HTTP request.
- Customize the JSON data in the `sendNPSSurvey` method according to the requirements of your NPS survey API.

##Contributing
Contributions to the `NPSAction` class and its documentation are welcome. If you'd like to contribute, please follow these guidelines:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test them.
4. Submit a pull request to the main repository.

##Acknowledgments
This project is based on Salesforce development best practices and uses Apex, Salesforce Flow, and HTTP callouts to send NPS surveys.


##Author
This project was authored and is maintained by Masroor.

 ##Version
Current version: 1.0.0

 ##Date
Last updated: 18/10/2023


##limitations or potential problems 

- API Rate Limits: Consider the API rate limits for the NPS service and handle them appropriately, perhaps with back-off strategies.
- Duplicate Emails: Implement a mechanism to prevent sending duplicate emails to customers.
- Error Handling: Enhance the error handling process and ensure errors are returned to the Flow for administrator handling.

