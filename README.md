### Requirements

This is Ruby application. If you do not already have Ruby, you can dowload the latest here: https://www.ruby-lang.org/en/downloads/
This will also allow you to install gems.

### Set Up

Once you have Ruby installed, you will need install any dependencies. In this case it is only a RSPEC. If you don't have the Bundler gem already installed, first run the following command from the root directory

`gem bundle install`

If you already have Bundler installed, simply run the following command from the root directory

`bundle install`

This will install our gems for us. 


### Run

To run the application run the following command from the root directory:

`rake run`

To run the tests for the application run the following command from the root directory:

`rake test`


### Design

There are three main sections of the application, the input, the output, and scenarios. The inputs and outputs are very similar in structure:

		input_builder <-- main entry point to input-related tasks
			file_reader <-- responsible for reading CSV files
			input_formatter <-- responsible for formatting raw content into the format expected for the scenario class

		output_builder <-- main entry point for output-related tasks
			file_writer <-- responsible for writing CSV files
			output_formatter <-- responsible for formattig the raw output into the format expected per the specs

The third secion is the scenario that has the following structure:

	scenario <-- responsible for running each scenario 
		store <-- responsible for receiving processing order from customer input and promo settings
			order <-- responsible for creating an order based on the store's input
			promo <-- responsible for handling promo rules based on the store's input

These three sections of the application are all managed from the app class. 


### Notes

*Shopper Class*
Although shoppers are mentioned in the project specs, I decided to not create a shopper class. The only thing that was related to the shopper was the cash in each scenario, but that could easily be interpreted as the cash received by the store. If we wanted to add a shopper class, it would have been easy enough and a shopper could call the place_order method on the store class. 

*Order and Promo Classes*
These two classes are more tightly-coupled than I would like. I used dependency injection to pass promo into order. An order knows about three of Promo's methods. I wasn't sure if there was a way to decouple these further. The code for applying the promos has to be store somewhere. I saw this division as reasonable solution:
	Order class - Responsbible for knowing how many chocolates and wrappers it has, incrementing/decrementing chocoloate count and wrapper count
	Promo class - No knowledge of order's structure. Responsible for knowing about the promo rules. Promo tells order: whether wrappers can be redeemed (dependency #1), telling order how many wrappers to remove (dependency #2), and telling order how many chocolates to add after redemption (dependency #3).

*Tests*
Due to the dependency injection mentioned above, I wanted to come up with a better mock of promo without actually using the promo class in the tests. 




