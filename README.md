# food_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

Clone this repo and you are good to go.

Project Structure 

lib/
├── config/                       
│   ├── routes/
│   └── theme/
├── core/                      
│   ├── common/                
│   ├── usecase/  
│   ├── resources/
│   └── constants/                 
├── features/                  
│   ├── feature_name/          
│   │   ├── data/               
│   │   │   ├── datasources/   
│   │   │   ├── models/        
│   │   │   └── repositories/   
│   │   ├── domain/            
│   │   │   ├── entities/      
│   │   │   ├── repositories/  
│   │   │   └── usecases/       
│   │   ├── presentation/       
│   │   │   ├── bloc/           
│   │   │   ├── pages/           
│   │   │   └── widgets/     
│   │   └── feature_name.dart   
├── injection_container.dart   
└── main.dart  

Packages/Plugins Used -
  -flutter_bloc           #State Management
  -floor                  #Database
  -auto_route             #Routing
  -equatable              #Equality
  -get_it                 #Dependenacy Injection
  -cached_network_image   #Efficient Image loading
  -ionicons               #Icons
  -flutter_svg            #SVG images


Note: 
     * Most of the widgets are populated with static data since there were no api to provide the data 
       and I only focused on main functionalities of app.

     * Floor Database has been used to store the data when user launch app for the first time. For 
       the Home Page, I'm storing only id,name,image and price.
     * For the Cart screen, I'm only storing id,name,image,price & quantity.


Home Page: Carousel and List of foods are populated with the data from Database. Rest are static data.

Add to Cart Page: Product Details and Nutrition is hard coded.

Cart Page: You can increase or decrease item quantity and price will increase or decrease accordingly.




