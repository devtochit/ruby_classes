require_relative './app'

def run_option(option, app)
   case option when 1
     then app.list_books when
      2 then app.list_people when
       3 then app.create_person when
       4 then app.create_book when
        5 then app.create_rental when
         6 then app.list_rentals when
         7 then app.quit_app else p
         'Please enter a valid option, number from 1 to 7' end end