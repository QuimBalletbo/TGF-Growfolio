import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/app_export.dart';
import 'package:flutter_application_1/View/Screens/dialogs/faqs_dialog.dart';
import 'package:flutter_application_1/View/widgets/custom_space_button.dart';

class FaqsView extends StatelessWidget {
  FaqsView({Key? key}) : super(key: key);

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
                      "Frequently Asked Questions",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.displayMediumLight.copyWith(
                        fontSize: 36.0, // Change the font size as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title: "Can I add my investment holdings to the app?",
                  text:
                      '''No, you cannot add any form of money or assets to this app. It's important to note that our app is designed solely for educational purposes and does not support the actual addition or management of real investment holdings.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "What data sources does the app use for real-time market information?",
                  text:
                      '''The app utilizes public APIs to obtain real-time information needed for calculating the return of stocks. However, it's important to note that the information for bonds and ETFs may not be regularly updated. These asset classes rely on the data available at the time of the app's creation and may not reflect real-time market conditions.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "Can I customize my portfolio based on my investment goals?",
                  text:
                      '''Yes, the app is designed for users to experiment with various investment strategies and timelines. It provides a platform where users can explore different approaches and observe how they perform over the long term. It's an educational tool that allows you to gain insights into the potential outcomes of different investment choices.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "How reliable are the returns calculated of my portfolios over time?",
                  text:
                      '''The returns calculated by the app are based on past performance data, which is historical in nature and not indicative of future returns. Please understand that the results obtained should be taken as examples and educational in nature. Real-world investment outcomes can vary significantly due to various market factors, and past performance may not necessarily predict future performance. It's essential to use the app as a tool for learning and planning rather than relying solely on the calculated returns for making actual investment decisions.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title: "Is my personal financial data secure within the app?",
                  text:
                      '''Your introduced information to create portfolios is private and individual. However, it's important to note that it's not recommended to input sensitive portfolio information into the app. While we prioritize data security, it's essential to exercise caution when entering personal or sensitive data. In the event of a security breach, there's a risk that personal information could be compromised, so we advise against including sensitive portfolio details within the app.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "Can I delete my account or any other information, such as any portfolio, permanently from the app and the servers?",
                  text:
                      '''Yes, you can delete your account and any portfolio permanently from the app and the servers. When you choose to delete your account, both your account and all associated information will be permanently removed. Similarly, when deleting a portfolio, it will be removed from your profile and the servers, ensuring the complete deletion of the selected data.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title: "What types of investments can I add to my portfolio?",
                  text:
                      '''You can add a variety of investments to your portfolio, including default ETFs and ETFs created by you, stocks from the SMP500 index, as well as default bonds and bonds created by you. This flexibility allows you to tailor your portfolio to your specific investment preferences and goals, combining different asset classes to create a diversified investment strategy.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "Can I import data from other financial accounts or platforms?",
                  text:
                      '''No, the app does not support the import or export of information to or from other applications. It operates as a standalone tool for portfolio management and does not have the capability to exchange data with external apps.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "How can I interpret the score attributed to a given portfolio?",
                  text:
                      '''The app assigns a score to your portfolio based on internal parameters, which consider factors such as the risk associated with the asset class, returns, diversification, and the duration of your investment. The purpose of this scoring system is to encourage users to experiment with different strategies and find a balanced approach that aligns with their financial goals. The score provides a relative measure of how well your portfolio aligns with these parameters, helping you fine-tune your investment strategy over time.''',
                ),
                SizedBox(height: 22.v),
                const FAQSDialog(
                  title:
                      "What is the app's privacy policy, and how is my data protected?",
                  text:
                      '''The app prioritizes the protection of your data and privacy. We do not share any user data with third parties. Your information is securely stored using Firebase, which is known for its robust security measures. Firebase employs encryption and authentication protocols to safeguard your data. Additionally, please refer to our privacy policy within the app for more detailed information on how your data is handled and protected.''',
                ),
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
