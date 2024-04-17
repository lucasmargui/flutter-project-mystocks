<div align="center">

# MyStock Project #

</div>
<br>


<div align="center">

##Main

</div>

------------------------------------

The "main.dart" file is where you configure and define the entire initial structure of the application, including defining the tree of widgets that make up the user interface, defining navigation routes, and any initialization logic required by your application .

<details>
 <summary>Click to show details about "main.dart" </summary>

------------------------------------

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/8d9af620-4a09-46ca-9a06-2536b0af23f6" style="width:90%">

</div>


<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f9d5646e-b433-47b5-add1-c771e2884425" style="width:90%">
</div>

<hr>

- WidgetsFlutterBinding.ensureInitialized(): This method ensures that Flutter widgets are initialized before any other operations. It's an important step, especially when working with asynchronous APIs like Firebase.

- setupDependencies() : This function is called to configure the application dependencies. This may include configuring services, instantiating objects or any other initialization necessary before starting the application. In this case we are initializing the controllers, services and repositories registered through the installed getIt package, being able to access these classes and their properties from any part of the application

</details>

------------------------------------

<br>
<div align="center">

## App

</div>

------------------------------------
Defines the basic structure of the application, including theme settings, routes, and widget associations for each specific route. It organizes the application flow and defines how each screen should be constructed and displayed.

<details>
 <summary>Click to show details about "app.dart"</summary>

------------------------------------

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/87837e0b-ebd4-4070-a6a4-3ca4c3428d6d" style="width:90%">

</div>

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/ae6d8af8-bed4-40e8-8ca0-d3347212bdb0" style="width:90%">

</div>


 Each named route is mapped to a corresponding widget such as OnboardingPage, SplashPage, SignUpPage, etc. The app uses named routes to navigate between different screens or pages. Additionally, the "transaction" route takes arguments, which are used to pass additional information to the TransactionPage page. This passed argument is to identify whether a transaction was passed, if yes it means that we are editing a transaction from the "GenerateTransactionList.transactions" list, if not, a new transaction is being added to the "GenerateTransactionList.transactions" list.

</details>

------------------------------------
<br>
<div align="center">

##Locator

</div>

------------------------------------
Defines a dependency injection container using GetIt and configures a specific implementation. This allows, for example, the AuthService class to be easily replaceable by other implementations without modifying the client code, promoting modularity and testability of the application.

<details>
 <summary>Click to show details about "locator.dart"</summary>

------------------------------------

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/1b8478b9-4900-4c77-94bc-69cddb76028d" style="width:90%">

</div>

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/a40cd655-6878-4383-a2ea-98ad9e0c3bdb" style="width:90%">

</div>


<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b655b80a-2621-45de-bf64-e1d944872487" style="width:90%">

</div>


Configures and initializes a dependency manager using the GetIt library. It defines an object called "locator" as an instance of GetIt.

Then there is a function called "setupDependencies()" that registers different types of services and controllers in the "locator" and is called on main.dart initialization:

------------------------------------

- AuthService is registered as a lazy singleton using registerLazySingleton. This means that a single AuthService instance will be created and shared whenever necessary.

 ------------------------------------

- SecureStorageService, UserDataService, SplashController, SignInController, SignUpController, TransactionRepository, HomeController and BalanceController are registered as factories using registerFactory. This means that a new instance will be created whenever one of these dependencies is requested.

 ------------------------------------

- Some dependencies, such as UserDataService and HomeController, receive parameters in their constructors, which are resolved by GetIt using other previously registered dependencies.


<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/02cca10f-17e5-4909-b4b0-5f0122e63269" style="width:90%">

</div>

The HomeController configuration in the locator includes TransactionRepositoryImpl dependency injection. This allows that, when registering the HomeController, we can use the locator to retrieve the previously registered TransactionRepository. Within the HomeController, we can then access all the methods defined in the TransactionRepository implementation, that is, in the TransactionRepositoryImpl.


<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/3f65a7e7-1808-4bde-9a6c-823ad07b3c97" style="width:90%">

</div>

</details>


------------------------------------
<br>
<div align="center">

## Common

</div>

------------------------------------

Contains shared functionality or resources that are used in different parts of the project. Avoiding code duplication and centralizing features that are frequently used in various parts of the application.



<details>
 <summary>Click to show details about common</summary>

------------------------------------


### constants
Contains files or modules that define constants or fixed values ​​that are used in different parts of the code. These constants can include values ​​such as settings, API keys, URLs, error messages, HTTP status codes, and other information that is used in various parts of the system.


<details>
 <summary>Click to show details about constants</summary>


------------------------------------

- app_colors.dart : Defines a class called AppColors that contains various color constants used in an application.

 ------------------------------------

- app_text_styles.dart : Defines a class called AppTextStyles that contains various text style constants used in an application.

 ------------------------------------

- date.dart: Defines methods of accessing time-related constants

 ------------------------------------

- keys.dart: Defines a class called Keys that contains static constants representing keys used for testing widgets in a Flutter application.

 ------------------------------------

- routes.dart : Defines a class called NamedRoute. This class defines named routes

 ------------------------------------

- constants.dart: a set of export declarations in a Dart file



</details>


------------------------------------

### date
Directory that contains a file responsible for customizing exceptions. In this directory, you can find files that define custom exception classes, handle exception handling in a project-specific way, or provide functions for handling errors in a more granular way.

<details>
 <summary>Click for date details. </summary>

------------------------------------

- data_result.dart: defines a simple abstract class "DataResult" and its two implementations "_SuccessResult" and "_FailureResult". Used to deal with results that may be successful or represent a failure, and it provides a convenient way of working with these results using the fold method.

 <div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/7f062c07-a2f2-46cf-91ef-2367edd5d380" style="width:60%">
</div>

------------------------------------

- exceptions.dart: defines a hierarchy of custom exceptions

------------------------------------

- data: a set of export declarations in a Dart file

</details>

------------------------------------

### extensions
Contains additional extensions or add-ons to the main project. These extensions may include additional functionality, specific modules, plugins or any other type of code that extends or enhances the main project in some way.



<details>
 <summary>Click to show details about extensions. </summary>

------------------------------------

- date_formatter.dart: Defines an extension called DateTimeFormatter for the DateTime class. This means that all DateTime instances will have access to the methods defined in this extension without having to modify the original DateTime class.

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f874225b-4686-4cf0-a4e7-356a65b6b7c3" style="width:60%">
</div>

 ------------------------------------

- page_controller_ext.dart: Defines an extension for the PageController class and an enumeration called BottomAppBarItem intended for a bottom navigation bar.

 ------------------------------------

- sizes.dart: Defines a Sizes class that is responsible for helping adapt sizes and layouts to different mobile devices and also defines an extension for the num type (integers and doubles) that adds two properties, w and h, to facilitate calculation and the adaptation of sizes in relation to the size of the device.

 ------------------------------------

- types_ext: The first extension is called BoolExt and extends the bool class. It adds a method called toInt(), which converts a Boolean value to an integer. If the Boolean value is true, the method returns 1; otherwise, it returns 0. The second extension is called StringExt and extends the String class. It adds three methods:

 ------------------------------------

- extensions: a set of export declarations in a Dart file


</details>

------------------------------------

### features
 Files related to specific functionalities of the system or application are stored. These features can be grouped into folders or modules within the "features" directory, making code organization and maintenance easier. Because they are features that are used in different parts of the project, they are included in commons

<details>
 <summary>Click to show details about features. </summary>

------------------------------------


<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/950461f8-3b2f-4180-a091-ffad181d4be6" style="width:45%">

</div><br>

------------------------------------

#### balance


- balance_controller.dart: Encapsulates a class called "BalanceController", which is responsible for controlling the state of financial balances in different parts of the application. Specifically, this class covers the logic for obtaining, calculating and updating these balances, which are based on the transactions present in the "GenerateTransactionList().transactions" class instance. The latter serves as a simulation of a data repository. In the constructor of the "BalanceController" class, a parameter "TransactionRepository transactionRepository" is specified, which is registered using the "locator". When using "locator" to retrieve an instance of "BalanceController", the object registered in "locator.dart" with "TransactionRepository" will be returned.

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/f0c4187c-2dc6-4bd9-82db-1c395b848bde" style="width:45%">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/e95d7bdc-d8aa-439b-a4c8-81d6cdcce893" style="width:45%">
</div>


<div align="center">
<h3> Flow to access methods through the controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/dd429985-95dd-4fed-8eb3-7c436e58feb4" style="width:100%">
</div>

 ------------------------------------

- ballance_state.dart: Classes that allow you to model different states

<div align="center">
<h3> Flow of states </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/1cac6e6a-3150-41ab-9fad-3c4e47876c4f" style="width:75%">
</div>

 ------------------------------------

- balance: a set of export declarations in a Dart file

 ------------------------------------

#### transactions



- trasaction_controller.dart: Encapsulates a class called TransactionController where transaction states are centrally managed and notify interested widgets when there are changes. It also makes use of repositories (TransactionRepository) present in the "GenerateTransactionList().transactions" class instance to interact with transaction data and a secure storage service (SecureStorageService) to handle the security of sensitive data.

 ------------------------------------

<div align="center">
<h3> Flow to access methods through the controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/43712960-3df2-48f2-8b5f-526a67ad4412" style="width:100%">
</div>

 ------------------------------------

- transaction_state.dart: Classes that allow you to model different states

<div align="center">
<h3> Flow of states </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b2d0092e-6dc7-403a-8f80-73571c2498fa" style="width:100%">
</div>

 ------------------------------------

- transaction.dart: a set of export declarations in a Dart file


</details>

 ------------------------------------


### models
The application data models are stored. These models represent the main entities of the system and define the structure and behavior of the data that will be manipulated by the application.


<details>
 <summary>Click to show details about models. </summary>

------------------------------------

- agreements_model.dart : Define AgreementsModel. Its properties include a title (title), a path to the asset (assetPath), and a named route (namedRoute).

 ------------------------------------

- balances_model.dart: Defines BalancesModel and has three properties: totalIncome, totalOutcome and totalBalance, which represent, respectively, total income, total expenses and total balance.

 ------------------------------------

- transaction_model.dart: Defines TransactionModel, and the properties used are description, category, value, date, status, createdAt, id, userId and syncStatus.

 ------------------------------------

- user_model.dart: Defines UserModel and has the following properties: id, name, email and password.

 ------------------------------------

- models.dart: a set of export declarations in a Dart file


</details>

------------------------------------

### uses

Contains files and modules with auxiliary or utility functions that are used in different parts of the project. These roles may include:


<details>
 <summary>Click to show details about utils. </summary>

------------------------------------

- money_mask_controller.dart : Defines a class called MoneyMaskedTextController, which is a subclass of TextEditingController. This class is used to control and format monetary values ​​in a text field.

<div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/d250f3d2-c76c-4b20-9eea-023264fd96f4" style="width:50%">
</div>

 ------------------------------------

- uppercase_text_formatter.dart : This class is used to format text entered into a text input field so that all letters are converted to uppercase.

 <div align="center">
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/3d4ade86-525a-452b-a7c2-74ac24d3b67a" style="width:50%">
</div>

 ------------------------------------

- validator.dart: Defines a class called Validator with static methods to validate different types of input such as name, email, password and password confirmation.

<div align="center">
 <h3> Form validation </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/24ad355a-21ad-47e9-bcfd-d2325f14c39f" style="width:100%">
</div>

 ------------------------------------

- utils: a set of export declarations in a Dart file


</details>

------------------------------------
### widgets

Contains components or user interface (UI) elements that are shared and reused across multiple parts of the project. These widgets can include buttons, input fields, progress bars, or any other interface element that is common and used in different parts of the application.

<details>
 <summary>Click to show details about widgets. </summary>

------------------------------------

- app_header.dart: A component that represents the application header, usually containing the logo, title and possibly navigation buttons.

 ------------------------------------

- base_page.dart: A base page that can be extended by other pages to provide common functionality such as the basic layout structure and navigation logic.

 ------------------------------------

- custom_bottom_app_bar.dart: A custom bottom navigation bar that can contain icons, text and navigation functionality for different parts of the application.

 ------------------------------------

- custom_bottom_sheet.dart: A component that displays a custom bottom panel, often used to present additional action options or contextual information.

 ------------------------------------

- custom_circular_progress_indicator.dart: A custom circular progress indicator that can be used to indicate loading or background processing.

 ------------------------------------

- custom_snackbar.dart: A custom component to display temporary messages at the bottom of the screen, generally used to provide feedback to the user about actions taken.

 ------------------------------------

- custom_text_form_field.dart: A custom text form field that can include specific validations, styles, and other customizations.

 ------------------------------------

- custom_text_title.dart: A custom text title component used for section titles, page headers, etc.

 ------------------------------------

- greetings.dart: A component that can be used to display personalized greetings based on different conditions, such as the time of day or the user's state.

 ------------------------------------

- multi_text_button.dart: A custom button that can display multiple lines of text and possibly icons, used for specific actions in the application.

 ------------------------------------

- notification_widget.dart: A component that displays notifications or alerts to the user, such as error messages, warnings or confirmations.

 ------------------------------------

- password_form_field.dart: A custom form field specific to password entry, usually including text hiding and validation functionalities.

 ------------------------------------

- primary_button.dart: A primary prominent button in the application, generally used for main or prominent actions.

 ------------------------------------

- transaction_listview.dart: A component that displays a list of transactions or items, with options for filtering, sorting and additional interactions.

 ------------------------------------

- widgets.dart: An aggregation file that imports and exports all custom widgets available in the application, facilitating access and use in other parts of the project.


</details>

</details>

------------------------------------

<br>
<div align="center">

## Features

</div>

------------------------------------

The "features" directory is an organizational approach adapting the principles of "Flux Architecture", which divides the application into three main components: the view (page), the controller (controller) and state
(state)

<details>
 <summary>Click to show feature details</summary>



------------------------------------

### home

Application home page, where the main features and functionalities are displayed to the user immediately after logging in.

<details>
 <summary>Click to show details about home </summary>

------------------------------------

- home_controller.dart: Defines HomeController, manages the state and business logic related to the application's home screen, searches transactions from the repository, orders them and updates the screen state according to the search result. It also provides access to transaction data and the page controller

 ------------------------------------

- home_page_view.dart: Defines the structure and logic for the home page of a Flutter application, integrating the different components and controllers required for functionality such as navigating between screens, adding transactions, and displaying information.

 When floatingActionButton is pressed, it waits for navigation to the '/transaction' route using the Navigator.pushNamed. After navigation, it checks that the returned result is not null. Depending on the current PageController page, different controller methods (homeController, statsController, walletController and balanceController) are called to update the application data

 <div align="center">
 <h3> PageController </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/7558867f-174f-44c7-b8be-76522365cafa" style="width:70%">
</div><br>

 ------------------------------------

- home_page.dart: HomePage establishes communication with HomeController and BalanceController controllers, to obtain data, such as transactions and balances. This communication occurs through the invocation of the _homeController.getAllTransactions() and _balanceController.getBalances() methods during the initialization phase (initState).

 Subsequently, the data obtained is used in different parts of the interface. The BalanceCardWidget is configured to receive the _balanceController, thus allowing access and use of balance data. On the other hand, the TransactionListView receives the available transactions through the _homeController.transactions property, whose values ​​are initialized during initState.

 <div align="center">
 <h3> Controllers </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/a88aa315-3c31-4dbd-9b93-c5ec10ccf7c6" style="width:100%">
</div><br>


 ------------------------------------

- home_page.state: Classes that allow you to model different states

 ------------------------------------

- home.dart: a set of export declarations in a Dart file


</details>


------------------------------------
### onboarding:

Introduction or tutorial page for new users, providing information on how to use the application and its features.

<details>
 <summary>Click to show onboarding details. </summary>

------------------------------------

- onboarding_page.dart: Defines the structure and basic content of an onboarding page in an application.

 ------------------------------------

- onboarding.dart: a set of export declarations in a Dart file.

</details>

------------------------------------

### profile:

Page where users can view and edit their personal information and log out.

<details>
 <summary>Click to show profile details</summary>

------------------------------------

- profile_controller.dart : Defines the profile "controller" responsible for managing the state and operations related to the user profile, such as getting user data, updating the username, updating the password, and deleting the account.

 ------------------------------------

- profile_page.dart: ProfilePage establishes communication with ProfileController controllers, to obtain user data. This communication occurs through the invocation of the _homeController.getUserData() methods during the initialization phase (initState).


 <div align="center">
 <h3> Controllers </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/03a681f6-5b2b-455e-a02a-48dbae1b091b" style="width:100%">
</div><br>

 ------------------------------------

- profile_state.dart: Classes that allow you to model different states

</details>

 ------------------------------------


### sign_in:

Login page where users enter their credentials to access the application.

<details>
 <summary>Click to show details about sign_in </summary>

------------------------------------

- sign_in_controller.dart: Basic framework for managing the state and logic behind the login screen in a Flutter application, addressing the different possible states during the user authentication process.

 ------------------------------------

- sign_in_page.dart: A functional login page with input validation, login processing and handling of loading, success and error states.


<div align="center">
 <h3> Controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/8803aada-9ba7-4379-b38c-4cae2cf1eb6a" style="width:100%">
</div><br>

Form: Form(key: _formKey) defines a form widget that can be referenced and manipulated in other parts of the application, using the _formKey key to access and control its state. FormState is a class that maintains the state of the Form widget.
It is used to perform actions such as validating, saving or resetting the form state. By using _formKey, you can access methods and properties of the FormState associated with the Form widget by performing form validations, saving data or resetting the form state, among other operations .

<div align="center">
 <h3> Form </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b2e4fd43-9a9c-4400-bfde-f509c809e804" style="width:60%">
</div><br>

 ------------------------------------

- sign_in_state.dart: Classes that allow you to model different states

</details>

------------------------------------

### sign_up:

Registration page where new users can create an account on the application by providing information such as name, email, password, etc.

<details>
 <summary>Click to show details about sign_up </summary>

------------------------------------

- sign_up_controller.dart: Basic framework for managing the state and logic behind the sign-up screen in a Flutter app, addressing the different possible states during the user sign-up process.

 ------------------------------------

- sign_up_page.dart: A functional registration page with input validation, registration processing and handling of loading, success and error states.

<div align="center">
 <h3> Controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/d4daab47-0284-41ac-9919-f0788a843e89" style="width:100%">
</div><br>

Form: Form(key: _formKey) defines a form widget that can be referenced and manipulated in other parts of the application, using the _formKey key to access and control its state. FormState is a class that maintains the state of the Form widget.
It is used to perform actions such as validating, saving or resetting the form state. By using _formKey, you can access methods and properties of the FormState associated with the Form widget by performing form validations, saving data or resetting the form state, among other operations .

<div align="center">
 <h3> Form </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/b2e4fd43-9a9c-4400-bfde-f509c809e804" style="width:60%">
</div><br>

 ------------------------------------

- sign_up_state.dart: Classes that allow you to model different states

</details>

------------------------------------


### splash:

Introduction or loading page displayed briefly when starting the application, usually containing the application logo and/or name.

<details>
 <summary>Click to show splash details </summary>

------------------------------------

- splash_controller.dart: Basic framework for managing the state and logic behind the loading screen in a Flutter app, addressing the different possible states during the app launch process.

 ------------------------------------

- splash_page.dart: Provides a functional launch page for the application, giving a visual introduction and checking the user's login state before redirecting them to the appropriate screen.

<div align="center">
 <h3> Controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/d977a17d-33c2-43e7-b13b-80a06648fca4" style="width:100%">
</div><br>


 ------------------------------------

- splash_state.dart: Classes that allow you to model different states

</details>

------------------------------------

### stats:

Page where statistics, graphs or data relevant to the user are displayed, such as usage statistics, consumption, performance, etc.

<details>
 <summary>Click to show details about stats </summary>

------------------------------------

- stats_controller.dart: Responsible for managing the state and logic behind statistics in a Flutter application, offering methods to calculate and group data based on different time periods.

 ------------------------------------

- stats_page.dart: Basic framework for managing the state and logic behind the statistics screen, addressing the different possible states during the application launch process.

 <div align="center">
 <h3> Controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/36ce6047-2b4d-426e-aa2a-1e60e1e0863a" style="width:100%">
</div><br>


 ------------------------------------

- stats_state.dart: Classes that allow you to model different states

 </details>

 ------------------------------------

### transaction:

Page where users can view and manage their financial transactions such as payments, transfers, deposits, etc.

<details>
 <summary>Click to show transaction details </summary>

------------------------------------

- transaction_page.dart: Provides an interface for users to add or edit financial transactions, with data entry validation and handling of different states and events

<div align="center">
 <h3> Controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/471a6faf-d20d-4122-ae05-62ea001e4234" style="width:100%">
</div><br>


 ------------------------------------

- transaction_state: Classes that allow you to model different states

 </details>

------------------------------------

### wallet:

Page where users can view their digital wallet balance.

<details>
 <summary>Click to show wallet details </summary>

------------------------------------

- wallet_controller.dart: Responsible for managing the state of the wallet and interactions with the transaction repository.

 ------------------------------------

- wallet_page.dart: Responsible for displaying and managing the user's wallet transactions and balances, allowing them to navigate between months and view their financial activities conveniently.

<div align="center">
 <h3> Controller </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/29122770-0b35-4038-a00a-d84f76be3ca7" style="width:100%">
</div><br>

 ------------------------------------

- wallet_state.dart: Classes that allow you to model different states

</details>

</details>


------------------------------------
<br>
<div align="center">

## Repositories

</div>

------------------------------------
Repository is responsible for handling transaction-related operations such as add, update, delete, and get transactions, as well as calculating balances. It follows the repository pattern to manage transaction data abstractly and decoupled from the user interface layer.

<details>
 <summary>Click to show details about repositories </summary>

------------------------------------

- transaction_repository.dart: Defines an interface called TransactionRepository, which describes methods for performing operations related to financial transactions. This interface provides a clear contract for interacting with transaction data in the application, allowing the implementation of transaction repositories that connect to different data sources, such as a local database, a web service, or Firebase, for example.

 ------------------------------------

- transaction_repository_impl.dart: Defines a class called TransactionRepositoryImpl that implements the TransactionRepository interface. Implements a transaction store with methods to add, update, delete, and retrieve transactions from the data store, ensuring that exceptions are handled appropriately during the process.
 By instantiating a controller corresponding to specific functionality, we use the locator to create or retrieve an instance of TransactionRepositoryImpl, thus allowing access and use of its functions for data manipulation.

<div align="center">
 <h3> Logic </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/94b5d6f3-535d-42a6-bff8-94d2042f261c" style="width:100%">
</div><br>



<div align="center">
 <h3> Logic using controllers </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/cdbc5c5f-1e39-4395-a9c3-f304f2f09711" style="width:100%">
</div><br>

 In the locator.registerLazySingleton method, two approaches were used to pass the TransactionRepositoryImpl class. One of them uses the locator to locate the TransactionRepository that has already been registered previously and which will instantiate a TransactionRepositoryImpl. The other approach involves directly passing the TransactionRepositoryImpl class to the registry.




<div align="center">
 <h3> Example </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/c43fb53d-ad0a-4c6d-be69-6d0f3b660628" style="width:100%">
</div><br>


 ------------------------------------

- transaction_repository_list.dart: Defines a class that generates a list of dummy transactions, using the Singleton pattern to ensure that only one instance of the class is created and providing a convenient method to access that instance. This list can be useful for testing or for filling in example data in an application.


 class GenerateTransactionList { ... }: Here we are defining a class called GenerateTransactionList. This class is responsible for generating a list of transactions.
static final GenerateTransactionList _instance = GenerateTransactionList._internal();: This line declares a static variable _instance which is of type GenerateTransactionList. The variable is marked as final, which means it cannot be modified after it is initialized. It is initialized with a new instance of GenerateTransactionList through the private _internal() constructor, which will be explained in the next line.

 factory GenerateTransactionList() { return _instance; }: This is a factory constructor that returns an instance of _instance. When the code calls GenerateTransactionList(), it does not create a new instance of the class, but rather returns the same instance that was previously created and assigned to _instance. This ensures that there is always only a single instance of GenerateTransactionList in the entire program, following the Singleton pattern.

 GenerateTransactionList._internal();: Here we have a private constructor called _internal(). It is used to ensure that the GenerateTransactionList class can only be instantiated internally, that is, only within the class itself. This prevents other parts of the code from creating new instances of the class directly, forcing you to use the factory constructor to get the existing instance.


 </details>


------------------------------------
<br>
<div align="center">

## Services

</div>

------------------------------------
Service is responsible for grouping classes and files related to services, such as accessing APIs, local databases, global state management, and other business logic operations.

<details>
 <summary>Click to show details about services </summary>

------------------------------------

### auth_service
------------------------------------
 Part of the project dedicated to authentication and management of services related to user authentication.

 - auth_service.dart : Defines an abstract class called AuthService that represents a generic authentication service with methods that represent common operations in authentication services, such as registering a new user, authenticating an existing user, and logging out a user. However, the specific implementation of each of these methods will be defined in concrete classes that inherit from this abstract AuthService class. This abstraction allows for flexibility and code reuse in different application contexts.

 - firebase_auth_service.dart: Implements an authentication service using Firebase Authentication and encapsulates user authentication operations in a service (FirebaseAuthService), providing methods for user login, registration and logout, while interacting with Firebase Authentication and Cloud Functions. Additionally, it handles exceptions that may occur during these operations.

 - mock_auth_service.dart: Defines a MockAuthService class that simulates an authentication service with methods for user login, registration and logout. It is designed to be used in test or development environments, allowing developers to test authentication functionality without relying on an actual authentication service.


------------------------------------

### storage
------------------------------------

Defines a class called SecureStorageService that encapsulates functionality for storing and retrieving data securely using the Flutter Secure Storage package.


<div align="center">
 <h3> Example </h3>
 <img src="https://github.com/lucasmargui/Flutter_Projeto_MyStock/assets/157809964/9c60d056-0a91-404a-9436-0133f9188b80" style="width:100%">
</div><br>

------------------------------------



------------------------------------
<br>
<div align="center">

</details>

------------------------------------
<br>
<div align="center">

## Themes

</div>

Themes is responsible for storing classes related to defining application themes and styles. The code defines a class called CustomTheme responsible for creating and returning a personalized theme.


</div>

------------------------------------



















