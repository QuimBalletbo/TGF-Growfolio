import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/faqs_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';
import 'package:flutter_application_1/View/widgets/userGuideText.dart';

class UserGuideView extends StatelessWidget {
  UserGuideView({Key? key}) : super(key: key);

  String portfolioName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray100,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  // Add your appbar actions here
                ),
                Center(
                  child: Container(
                    width: double
                        .infinity, // Ensure the container takes up the full width
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "User guide",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.displayMediumLight.copyWith(
                        fontSize: 36.0, // Change the font size as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title: "",
                  text:
                      '''Welcome to GrowFolio, your portfolio testing tool designed to help you make informed investment decisions. This section provides an overview of what you can expect from our app and how it can empower you on your investment journey.''',
                ),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Introduction to GrowFolio"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "What is GrowFolio?",
                    text:
                        '''Growfolio is a specialized educational tool that offers hands-on experience in portfolio management, providing a safe and risk-free environment to explore key concepts. Learn how to create and manage investment portfolios tailored to your goals and risk tolerance, understand the crucial relationship between risk and return in investments, and experiment with different asset allocations to see how they impact your portfolio's performance. Additionally, discover the significance of time when it comes to growing your investments, as "Growfolio" allows you to simulate long-term investment scenarios to witness the power of compounding over time.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Why Choose GrowFolio?",
                    text:
                        '''Growfolio offers a practical and risk-free learning experience where you can gain knowledge and confidence to make informed investment decisions. Within this safe environment, you can experiment with various strategies and scenarios, observing how they impact your portfolio. Additionally, you'll access valuable data and insights that closely resemble real-world market conditions. Choose Growfolio for hands-on learning that empowers you with practical insights, all without the risk of losing real money.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Start Your Investment Journey",
                    text:
                        '''Whether you're new to investing or looking to refine your skills, Growfolio is the perfect starting point. Dive into the world of portfolio management, learn from your experiences, and build a solid foundation for your financial future.'''),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Getting Started"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Creating an Account",
                    text:
                        '''Embarking on your educational journey with Growfolio is easy and flexible. You have two convenient options for creating an account, both of which are seamlessly integrated with your Google account. At the beginning of the app, you can choose to sign up using your Google account for a quick start. If you prefer to create an account later, simply navigate to the right-top corner of the screen in the menu views and select the "Login" option, which also offers Google account integration.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Logging In",
                    text:
                        '''When you first enter the Growfolio app, you'll have the option to either log in with your existing account or create a new one. If you're creating an account for the first time, simply follow the registration process. Once your account is created, logging in becomes a seamless experience. The app will recognize your login information after you close it, making it effortless to pick up where you left off. In the top-right corner of the screen, within the menu views, you can access the login feature by clicking on the icon and then selecting the "Login" option. This allows you to switch between your accounts or log in whenever you wish.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Navigating the App",
                    text:
                        '''Exploring the Growfolio app is facilitated by its user-friendly design. The home screen serves as your hub for portfolio management, where you can create new portfolios by simply clicking the "+" button located below the last portfolio. Additionally, you can view the portfolio overview of the different portfolios you've created by clicking on the icon with the portfolio name. If you need to edit an existing portfolio, click on the "Edit Portfolio" icon to modify its attributes. In the top right section of the screen, you'll find an icon that allows you to access essential settings for the app, including profile options like logging in or out. To delve into your personal profile, simply click on the profile icon, conveniently located in the bottom right corner of the app. In the profile screen, you can view your name, the number of portfolios you've created, and access your portfolios' data. Additionally, you can see your preferred asset classes and more of your investment preferences. Growfolio's user-friendly layout makes it easy to navigate between portfolio management, settings, and your profile, providing you with a seamless and efficient educational experience.'''),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Creating Portfolios"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "",
                    text:
                        '''Creating portfolios with Growfolio is a user-friendly and highly customizable process designed to cater to your unique investment needs. It all starts with a simple click on the "+" button found on the home screen. This action initiates the portfolio creation process, and you will be guided through a series of steps to craft a portfolio tailored precisely to your financial goals and preferences.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Portfolio Configuration",
                    text:
                        '''First of all, you must give your portfolio a name and specifying the investment timeline, whether it's monthly or annually. You can also set the initial amount you plan to invest and provide additional portfolio attributes. Once this is done, simply click "Next" to proceed.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Fee Configuration",
                    text:
                        '''Managing your portfolio's performance often involves dealing with fees such as broker fees and taxes. Growfolio allows you to fine-tune these settings to match your specific requirements. Adjust the fee parameters to your liking and then click "Next" to continue.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Stock Configuration",
                    text:
                        '''The next step is configuring your stock allocation. You have the flexibility to choose individual stocks from a list of available options or craft a personalized stock allocation. This allows you to specify the percentage allocation for each stock in your portfolio. After completing the configuration, click "Save Stock" to proceed.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "ETF Configuration",
                    text:
                        '''Similar to stocks, you'll also configure your ETF allocation. You can choose from a range of existing ETFs or create a personalized ETF. To create a personalized ETF, click "+ ETF," select an existing ETF from the dropdown menu, or define the attributes of your ETF. Once configured, click "Save ETF."'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Bond Configuration",
                    text:
                        '''The bond configuration process mirrors that of ETFs. You can select from existing bond options or create custom bonds by clicking "+ Bond." Define the bond attributes and click "Save Bond."'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Portfolio Validation",
                    text:
                        '''Growfolio places importance on portfolio accuracy. Before proceeding, the system will prompt you to ensure that the stock, ETF, and bond allocations add up to 100% both individually and in combination. This validation step ensures the precision of your portfolio's configuration, and you can make any necessary adjustments to meet this requirement.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Calculate Return",
                    text:
                        '''Once your portfolio distribution is balanced and validated, you can confidently click "Calculate Return." Growfolio's algorithms will instantly compute the projected return based on your specific configuration.'''),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Managing Portfolios"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "",
                    text:
                        '''Once you've successfully created and configured your portfolios using Growfolio's intuitive tools, you can easily access and manage them from the home screen. In this screen you can see your portfolios listed.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Delete Portfolio",
                    text:
                        '''Should you wish to remove a portfolio, locate the target portfolio within the "Portfolios" section. Within the portfolio details, find the option to delete, usually represented by a trash bin icon. Confirm the deletion to permanently remove the selected portfolio from your Growfolio account.'''),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Tracking Performance"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Viewing Portfolio Returns",
                    text:
                        '''To assess the performance of a specific portfolio, click to the portfolio itself. Here, you'll find a comprehensive overview of each portfolio's returns over specific periods. The graphical representation and detailed statistics offer insights into how your investments are performing.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Understanding the Scoring System",
                    text:
                        '''Growfolio employs a scoring system to simplify the evaluation of portfolio performance. The scoring system considers factors such as overall returns, risk management, and adherence to specified investment strategies. Higher scores indicate better-performing portfolios, with sufficient diversification and returns.'''),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Market Data Information"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "",
                    text:
                        '''Growfolio relies on accurate and up-to-date market data to provide users with monthly adjusted data into their investments.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Primary Data Providers",
                    text:
                        '''Growfolio aggregates market data from Alpha Vantage a reputable and well-established financial data provider. These providers ensure the accuracy and reliability of the stock picking selection provided in the app.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Monthly Updates",
                    text:
                        '''Market data in Growfolio is updated monthly as the intent of the platform is to predict future returns based on the previous performance of the companies.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Information Display",
                    text:
                        '''Market data is presented in a user-friendly format, allowing users to easily interpret and analyze key information. The app strives to make complex financial data accessible to users with a Benninger experience level.'''),
                SizedBox(height: 22.v),
                const UserGuideText(title: "Tips and Best Practices"),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Try different Investments themes",
                    text:
                        '''Spread your portfolios across different asset classes, or sectors to reduce risk or do the exact opposite to enhance potential returns. Trying completely different strategies o asset class selections gives you an overview of the different returns a portfolio is capable of doing, and what advantages and disadvantages a portfolio can have.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title:
                        "Select only those options you understand (when configuring realistic outcomes)",
                    text:
                        '''Even to the tools and parameters the app provides are quite limited it can have parameters you don’t understand what they do, for example “Portfolio rebalancing”, if you don’t understand what it does and want to simulate a distribution that you might use in your personal finances be sure to configure those parameters that you understand and leave blank those that you don’t understand what they do.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Utilize Projection Tools",
                    text:
                        '''Leverage Growfolio's projection tools to simulate different investment scenarios. Explore how various asset class, different configuration and strategies may impact your portfolio over time.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title:
                        "Follow the recommendations in the portfolio performance indicator",
                    text:
                        '''After simulating a portfolio you can view its potential returns and how has it managed in different metrics. If you aim to create a portfolio that has a score of 100, you should review each portfolio and fix the recommendations it makes to get a better one in the next try.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Protect Your Personal Information",
                    text:
                        '''Safeguard your account and personal information. Ensure that you use strong passwords, enable two-factor authentication, and follow best practices for online security. And don’t enter sensitive information in any portfolio.'''),
                SizedBox(height: 22.v),
                const FAQSDialog(
                    title: "Seek Professional Advice if Needed",
                    text:
                        '''If you're unsure about certain investment decisions or strategies, consider consulting with a financial advisor. Professional advice can provide valuable insights and guidance.'''),
                SizedBox(height: 22.v),
                CustomSpaceButton(
                  text: "Return to Home",
                  onTap: () {
                    onTapHome(context);
                  },
                ),

                SizedBox(height: 16.v),

                // Form Content
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  /// Section Widget
}
