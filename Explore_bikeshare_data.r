
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
library(ggplot2)

head(ny)

head(wash)

head(chi)

#Loop for the sum of trip duration for the three cities
What.is.the.total.travel.time1='Chicago Total travel time '
What.is.the.total.travel.time2='New York Total travel time '
What.is.the.total.travel.time3='Washington Total travel time '

result1=sum(chi$Trip.Duration,na.rm=TRUE)
result2=sum(ny$Trip.Duration, na.rm=TRUE)
result3=sum(wash$Trip.Duration, na.rm=TRUE)


#Applying the loop on the Chicago data set
What.is.the.total.travel.time='Chicago Total travel time '
       chi_ttt<- if(What.is.the.total.travel.time==What.is.the.total.travel.time1){
            print(result1)                                                  
         } else if(What.is.the.total.travel.time==What.is.the.total.travel.time2){
            print(result2)
        }else{
            print(result3)
        }
        chi_ttt

#Applying the loop on the New York data set
What.is.the.total.travel.time='New York Total travel time '
ny_ttt<-if(What.is.the.total.travel.time==What.is.the.total.travel.time1){
            print(result1)                                                  
         } else if(What.is.the.total.travel.time==What.is.the.total.travel.time2){
            print(result2)
        }else{
            print(result3)
        } 
        ny_ttt

#Applying the loop on the Washington data set
What.is.the.total.travel.time='Washington Total travel time '
       wash_ttt<- if(What.is.the.total.travel.time==What.is.the.total.travel.time1){
            print(result1)                                                  
         } else if(What.is.the.total.travel.time==What.is.the.total.travel.time2){
            print(result2)
        }else{
            print(result3)
        }
           wash_ttt

#Barchart for comparing the total travel time for the three cities
df<-data.frame (city=c("Chicago", "New York", "Washington"), total_travel_time =c(chi_ttt, ny_ttt, wash_ttt))
df
df_base<-ggplot(data=df, aes(x=city, y= total_travel_time))
df_base+ geom_bar(stat="identity")+
xlab('City')+
ylab('Total Travel Time')+
ggtitle('Comparison of the total travel time for the three cities')+
scale_y_continuous(name="Total travel time", labels = scales::comma)

#As we see, Washington is the city where people spend the most time on the bikeshare

#Summary statistics about trip duration according to user type for Chicago
by(chi$Trip.Duration,chi$User.Type, sum)

#Summary statistics about trip duration according to user type for Washington
by(wash$Trip.Duration,wash$User.Type, na.rm=TRUE, sum)

#Summary statistics about trip duration according to user type for New York
by(ny$Trip.Duration,ny$User.Type, na.rm=TRUE, sum)

#We can see that subscribers spend the most time on the bikeshare in Chicago and New York, but not in Washington.

# Your solution code goes here
#Checking  what are the 3 most common start.stations in Washington and indexing them
# Refectoring: checking what are the 4 most common stations in Washington and indexing them
wss<-as.data.frame(table(wash$Start.Station), header=FALSE)
names(wss) <- c("Start.Station","number.of.users")
wss$rank <- rank(-wss$number.of.users,ties.method="min")
wss <- wss[order(wss$rank,decreasing = F),]
wss<-head(wss,4)
wss

#Checking what are the 3 most common start.stations in New York and indexing them
nyss<-as.data.frame(table(ny$Start.Station), header=FALSE)
names(nyss) <- c("Start.Station","number.of.users")
nyss$rank <- rank(-nyss$number.of.users,ties.method="min")
nyss <- nyss[order(nyss$rank,decreasing = F),]
nyss<-head(nyss,3)
nyss

#Checking  what are the 3 most common start.stations in Chicago and indexing them
chiss<-as.data.frame(table(chi$Start.Station),header=FALSE)
names(chiss) <- c("Start.Station","number.of.users")
chiss$rank <- rank(-chiss$number.of.users,ties.method="min")
chiss <- chiss[order(chiss$rank,decreasing = F),]
chiss<-head(chiss,3)
chiss

#Loop for the 3 most common start station in the 3 cities
What.are.the.3.most.common.start.stations1='Washington top start stations '
What.are.the.3.most.common.start.stations2='New York top start stations '
What.are.the.3.most.common.start.stations3='Chicago top start stations '

result1=wss
result2=nyss
result3=chiss

#Applying the loop to Washington
What.are.the.3.most.common.start.stations='Washington top start stations '
wss<- if(What.are.the.3.most.common.start.stations==What.are.the.3.most.common.start.stations1){
            print(result1)                                                  
         } else if(What.are.the.3.most.common.start.stations==What.are.the.3.most.common.start.stations2){
            print(result2)
        }else{
            print(result3)
        }
    wss

#Creating the bar chart for the 3 most common start station in Washington
wss_base<-ggplot(data=wss, aes(x=Start.Station, y= number.of.users))
wss_base+ geom_bar(stat="identity")+
xlab('Start Station')+
ylab('Number of users')+
ggtitle('The 3 most common start Station in Washington')+
scale_y_continuous(name="Number of users", labels = scales::comma)

#The most common start station is Columbus Circle/Union Station

# Loop reported here
What.are.the.3.most.common.start.stations1='Washington top start stations '
What.are.the.3.most.common.start.stations2='New York top start stations '
What.are.the.3.most.common.start.stations3='Chicago top start stations '

result1=wss
result2=nyss
result3=chiss

#Applying the loop to New York
What.are.the.3.most.common.start.stations='New York top start stations '
wss<- if(What.are.the.3.most.common.start.stations==What.are.the.3.most.common.start.stations1){
            print(result1)                                                  
         } else if(What.are.the.3.most.common.start.stations==What.are.the.3.most.common.start.stations2){
            print(result2)
        }else{
            print(result3)
        }
    nyss


#Creating the bar chart for the 3 most common start station in New York
ny_base<-ggplot(data=nyss, aes(x=Start.Station, y= number.of.users))
ny_base+ geom_bar(stat="identity")+
xlab('Start Station')+
ylab('Number of users')+
ggtitle('The 3 most common start Station in New York City')+
scale_y_continuous(name="Number of users", labels = scales::comma)

#The most common start station is Pershing Square North

# Loop reported here
What.are.the.3.most.common.start.stations1='Washington top start stations '
What.are.the.3.most.common.start.stations2='New York top start stations '
What.are.the.3.most.common.start.stations3='Chicago top start stations '

result1=wss
result2=nyss
result3=chiss
wss<- if(What.are.the.3.most.common.start.stations==What.are.the.3.most.common.start.stations1){
            print(result1)                                                  
         } else if(What.are.the.3.most.common.start.stations==What.are.the.3.most.common.start.stations2){
            print(result2)
        }else{
            print(result3)
        }
    nyss

#Applying the loop to Chicago
What.are.the.3.most.common.start.stations='Chicago top start stations '

#Creating the bar chart for the 3 most common start station in Chicago
chi_base<-ggplot(data=chiss, aes(x=Start.Station, y= number.of.users))
chi_base+ geom_bar(stat="identity")+
xlab('Start Station')+
ylab('Number of users')+
ggtitle('The 3 most common start Station in Chicago')+
scale_y_continuous(name="Number of users", labels = scales::comma)

# The most common start station is Streeter Dr & and Grand Ave

# Summary Statistics about total travel time according to start station in Chicago
by(chi$Trip.Duration,chi$Start.Station, sum)

# Statistics show that users spent 337,129 seconds when starting at the most common sation which is Streeter Dr& Grand Ave

by(ny$Trip.Duration,ny$Start.Station, sum)

# Statistics show that users spent 445,087 seconds when starting at the most common sation which is Pershing Square North

by(wash$Trip.Duration,wash$Start.Station, sum)

# Statistics show that users spent 14,174,432 seconds when starting at the most common sation which is Columbus Circle/Union Station




#Loading plyr library in order to use the count function
library(plyr)
#Looking for the count of user types in Washington
wuc<-count(wash, c("User.Type")) 
wuc

#creating the barchart for Washington
wuc_base<-ggplot(data=wuc, aes(x=User.Type, y= freq))
wuc_base+ geom_bar(stat="identity")+
xlab('User Type')+
ylab('Number of users')+
ggtitle('Number of users in Washington according to type')+
scale_y_continuous(name="Number of users", labels = scales::comma)

# There are more subscribers than customers in Washington.

#Looking for the count of user types in Chicago
chiuc<-count(chi, c("User.Type")) 
chiuc

#creating the barchart for Chicago
chiuc_base<-ggplot(data=chiuc, aes(x=User.Type, y= freq))
chiuc_base+ geom_bar(stat="identity")+
xlab('User Type')+
ylab('Number of users')+
ggtitle('Number of users in Chicago according to type')+
scale_y_continuous(name="Number of users", labels = scales::comma)

# As in Washington, there are more subscribers than customers in Chicago

#Looking for the count of user types in Chicago
nyuc<-count(ny, c("User.Type")) 
nyuc

#creating the barchart for New York
nyuc_base<-ggplot(data=chiuc, aes(x=User.Type, y= freq))
nyuc_base+ geom_bar(stat="identity")+
xlab('User Type')+
ylab('Number of users')+
ggtitle('Number of users in Chicago according to type')+
scale_y_continuous(name="Number of users", labels = scales::comma)

#As in the two orther cities, there are more subscribers than customers in New York

#Summary statistics about trip duration according to user type for Chicago
by(chi$Gender,chi$User.Type, count)

# According to summary statistics, there are more male than female subscribers in Chicago

#Summary statistics about trip duration according to user type for Chicago
by(ny$Gender,ny$User.Type, count)

# According to summary statistics, there are also more male than female subscribers and customers in New York

# There are no data about Gender for users in Washington
#Let's check
head(wash)

system('python -m nbconvert Explore_bikeshare_data.ipynb')

