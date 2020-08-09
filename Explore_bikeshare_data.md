
### Explore Bike Share Data

For this project, your goal is to ask and answer three questions about the available bikeshare data from Washington, Chicago, and New York.  This notebook can be submitted directly through the workspace when you are confident in your results.

You will be graded against the project [Rubric](https://review.udacity.com/#!/rubrics/2508/view) by a mentor after you have submitted.  To get you started, you can use the template below, but feel free to be creative in your solutions!


```R
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
library(ggplot2)
```


```R
head(ny)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th><th scope=col>Gender</th><th scope=col>Birth.Year</th></tr></thead>
<tbody>
	<tr><td>5688089                                       </td><td>2017-06-11 14:55:05                           </td><td>2017-06-11 15:08:21                           </td><td> 795                                          </td><td>Suffolk St &amp; Stanton St                   </td><td>W Broadway &amp; Spring St                    </td><td>Subscriber                                    </td><td><span style=white-space:pre-wrap>Male  </span></td><td>1998                                          </td></tr>
	<tr><td>4096714                                                           </td><td>2017-05-11 15:30:11                                               </td><td>2017-05-11 15:41:43                                               </td><td> 692                                                              </td><td>Lexington Ave &amp; E 63 St                                       </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 78 St       </span></td><td>Subscriber                                                        </td><td><span style=white-space:pre-wrap>Male  </span>                    </td><td>1981                                                              </td></tr>
	<tr><td>2173887                                                            </td><td>2017-03-29 13:26:26                                                </td><td>2017-03-29 13:48:31                                                </td><td>1325                                                               </td><td><span style=white-space:pre-wrap>1 Pl &amp; Clinton St      </span></td><td><span style=white-space:pre-wrap>Henry St &amp; Degraw St  </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1987                                                               </td></tr>
	<tr><td>3945638                                                            </td><td>2017-05-08 19:47:18                                                </td><td>2017-05-08 19:59:01                                                </td><td> 703                                                               </td><td><span style=white-space:pre-wrap>Barrow St &amp; Hudson St  </span></td><td><span style=white-space:pre-wrap>W 20 St &amp; 8 Ave       </span> </td><td>Subscriber                                                         </td><td>Female                                                             </td><td>1986                                                               </td></tr>
	<tr><td>6208972                                                            </td><td>2017-06-21 07:49:16                                                </td><td>2017-06-21 07:54:46                                                </td><td> 329                                                               </td><td><span style=white-space:pre-wrap>1 Ave &amp; E 44 St        </span></td><td><span style=white-space:pre-wrap>E 53 St &amp; 3 Ave       </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1992                                                               </td></tr>
	<tr><td>1285652                                                            </td><td>2017-02-22 18:55:24                                                </td><td>2017-02-22 19:12:03                                                </td><td> 998                                                               </td><td><span style=white-space:pre-wrap>State St &amp; Smith St    </span></td><td><span style=white-space:pre-wrap>Bond St &amp; Fulton St   </span> </td><td>Subscriber                                                         </td><td><span style=white-space:pre-wrap>Male  </span>                     </td><td>1986                                                               </td></tr>
</tbody>
</table>




```R
head(wash)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th></tr></thead>
<tbody>
	<tr><td>1621326                                                                                        </td><td>2017-06-21 08:36:34                                                                            </td><td>2017-06-21 08:44:43                                                                            </td><td> 489.066                                                                                       </td><td><span style=white-space:pre-wrap>14th &amp; Belmont St NW                       </span>        </td><td><span style=white-space:pre-wrap>15th &amp; K St NW                                     </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td> 482740                                                                                        </td><td>2017-03-11 10:40:00                                                                            </td><td>2017-03-11 10:46:00                                                                            </td><td> 402.549                                                                                       </td><td><span style=white-space:pre-wrap>Yuma St &amp; Tenley Circle NW                 </span>        </td><td><span style=white-space:pre-wrap>Connecticut Ave &amp; Yuma St NW                       </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td>1330037                                                                                        </td><td>2017-05-30 01:02:59                                                                            </td><td>2017-05-30 01:13:37                                                                            </td><td> 637.251                                                                                       </td><td><span style=white-space:pre-wrap>17th St &amp; Massachusetts Ave NW             </span>        </td><td><span style=white-space:pre-wrap>5th &amp; K St NW                                      </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td> 665458                                                                                        </td><td>2017-04-02 07:48:35                                                                            </td><td>2017-04-02 08:19:03                                                                            </td><td>1827.341                                                                                       </td><td><span style=white-space:pre-wrap>Constitution Ave &amp; 2nd St NW/DOL           </span>        </td><td><span style=white-space:pre-wrap>M St &amp; Pennsylvania Ave NW                         </span></td><td><span style=white-space:pre-wrap>Customer  </span>                                             </td></tr>
	<tr><td>1481135                                                                                        </td><td>2017-06-10 08:36:28                                                                            </td><td>2017-06-10 09:02:17                                                                            </td><td>1549.427                                                                                       </td><td>Henry Bacon Dr &amp; Lincoln Memorial Circle NW                                                </td><td><span style=white-space:pre-wrap>Maine Ave &amp; 7th St SW                              </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td>1148202                                                                                </td><td>2017-05-14 07:18:18                                                                    </td><td>2017-05-14 07:24:56                                                                    </td><td> 398.000                                                                               </td><td><span style=white-space:pre-wrap>1st &amp; K St SE                              </span></td><td>Eastern Market Metro / Pennsylvania Ave &amp; 7th St SE                                </td><td>Subscriber                                                                             </td></tr>
</tbody>
</table>




```R
head(chi)
```

### Question 1


**Your question 1 goes here.**
What is the total travel time for the 3 cities?


```R
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
```

    [1] 8087801



8087801



```R
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
```

    [1] 49490073



49490073



```R
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
```

    [1] 109883545



109883544.668



```R
#Barchart for comparing the total travel time for the three cities
df<-data.frame (city=c("Chicago", "New York", "Washington"), total_travel_time =c(chi_ttt, ny_ttt, wash_ttt))
df
df_base<-ggplot(data=df, aes(x=city, y= total_travel_time))
df_base+ geom_bar(stat="identity")+
xlab('City')+
ylab('Total Travel Time')+
ggtitle('Comparison of the total travel time for the three cities')+
scale_y_continuous(name="Total travel time", labels = scales::comma)
```


<table>
<thead><tr><th scope=col>city</th><th scope=col>total_travel_time</th></tr></thead>
<tbody>
	<tr><td>Chicago   </td><td>  8087801 </td></tr>
	<tr><td>New York  </td><td> 49490073 </td></tr>
	<tr><td>Washington</td><td>109883545 </td></tr>
</tbody>
</table>




![png](output_9_1.png)



```R
#As we see, Washington is the city where people spend the most time on the bikeshare
```


```R
#Summary statistics about trip duration according to user type for Chicago
by(chi$Trip.Duration,chi$User.Type, sum)
```


    chi$User.Type: 
    [1] 3020
    ------------------------------------------------------------ 
    chi$User.Type: Customer
    [1] 3369740
    ------------------------------------------------------------ 
    chi$User.Type: Subscriber
    [1] 4715041



```R
#Summary statistics about trip duration according to user type for Washington
by(wash$Trip.Duration,wash$User.Type, na.rm=TRUE, sum)
```


    wash$User.Type: 
    [1] 0
    ------------------------------------------------------------ 
    wash$User.Type: Customer
    [1] 61777358
    ------------------------------------------------------------ 
    wash$User.Type: Subscriber
    [1] 48106186



```R
#Summary statistics about trip duration according to user type for New York
by(ny$Trip.Duration,ny$User.Type, na.rm=TRUE, sum)
```


    ny$User.Type: 
    [1] 216942
    ------------------------------------------------------------ 
    ny$User.Type: Customer
    [1] 12189116
    ------------------------------------------------------------ 
    ny$User.Type: Subscriber
    [1] 37084015



```R
#We can see that subscribers spend the most time on the bikeshare in Chicago and New York, but not in Washington.
```

**Summary of your question 1 results goes here.**
We wanted to investigate in which city, people spend the most time on the bikeshare. It is in washington. And the summary statistics about trip duration accoding to gender is saying the same as our chart, and additionnaly shows that it is only in Washington that customers spend more time on the bikeshare than subscribers.

### Question 2

**Your question 2 goes here.**
What are the 3 most common start stations for each city?


```R
# Your solution code goes here
#Checking  what are the 3 most common start.stations in Washington and indexing them
wss<-as.data.frame(table(wash$Start.Station), header=FALSE)
names(wss) <- c("Start.Station","number.of.users")
wss$rank <- rank(-wss$number.of.users,ties.method="min")
wss <- wss[order(wss$rank,decreasing = F),]
wss<-head(wss,3)
wss
```


<table>
<thead><tr><th></th><th scope=col>Start.Station</th><th scope=col>number.of.users</th><th scope=col>rank</th></tr></thead>
<tbody>
	<tr><th scope=row>210</th><td>Columbus Circle / Union Station</td><td>1700                           </td><td>1                              </td></tr>
	<tr><th scope=row>306</th><td>Lincoln Memorial               </td><td>1546                           </td><td>2                              </td></tr>
	<tr><th scope=row>282</th><td><span style=white-space:pre-wrap>Jefferson Dr &amp; 14th St SW      </span></td><td>1488                                                                       </td><td>3                                                                          </td></tr>
</tbody>
</table>




```R
#Checking what are the 3 most common start.stations in New York and indexing them
nyss<-as.data.frame(table(ny$Start.Station), header=FALSE)
names(nyss) <- c("Start.Station","number.of.users")
nyss$rank <- rank(-nyss$number.of.users,ties.method="min")
nyss <- nyss[order(nyss$rank,decreasing = F),]
nyss<-head(nyss,3)
nyss
```


<table>
<thead><tr><th></th><th scope=col>Start.Station</th><th scope=col>number.of.users</th><th scope=col>rank</th></tr></thead>
<tbody>
	<tr><th scope=row>467</th><td>Pershing Square North</td><td>592                  </td><td>1                    </td></tr>
	<tr><th scope=row>557</th><td><span style=white-space:pre-wrap>W 21 St &amp; 6 Ave      </span></td><td>385                                                              </td><td>2                                                                </td></tr>
	<tr><th scope=row>113</th><td><span style=white-space:pre-wrap>Broadway &amp; E 22 St   </span></td><td>383                                                              </td><td>3                                                                </td></tr>
</tbody>
</table>




```R
#Checking  what are the 3 most common start.stations in Chicago and indexing them
chiss<-as.data.frame(table(chi$Start.Station),header=FALSE)
names(chiss) <- c("Start.Station","number.of.users")
chiss$rank <- rank(-chiss$number.of.users,ties.method="min")
chiss <- chiss[order(chiss$rank,decreasing = F),]
chiss<-head(chiss,3)
chiss
```


<table>
<thead><tr><th></th><th scope=col>Start.Station</th><th scope=col>number.of.users</th><th scope=col>rank</th></tr></thead>
<tbody>
	<tr><th scope=row>422</th><td><span style=white-space:pre-wrap>Streeter Dr &amp; Grand Ave     </span></td><td>210                                                                     </td><td>1                                                                       </td></tr>
	<tr><th scope=row>246</th><td><span style=white-space:pre-wrap>Lake Shore Dr &amp; Monroe St   </span></td><td>140                                                                     </td><td>2                                                                       </td></tr>
	<tr><th scope=row>119</th><td>Clinton St &amp; Washington Blvd</td><td>120                             </td><td>3                               </td></tr>
</tbody>
</table>




```R
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
```

                          Start.Station number.of.users rank
    210 Columbus Circle / Union Station            1700    1
    306                Lincoln Memorial            1546    2
    282       Jefferson Dr & 14th St SW            1488    3



<table>
<thead><tr><th></th><th scope=col>Start.Station</th><th scope=col>number.of.users</th><th scope=col>rank</th></tr></thead>
<tbody>
	<tr><th scope=row>210</th><td>Columbus Circle / Union Station</td><td>1700                           </td><td>1                              </td></tr>
	<tr><th scope=row>306</th><td>Lincoln Memorial               </td><td>1546                           </td><td>2                              </td></tr>
	<tr><th scope=row>282</th><td><span style=white-space:pre-wrap>Jefferson Dr &amp; 14th St SW      </span></td><td>1488                                                                       </td><td>3                                                                          </td></tr>
</tbody>
</table>




```R
#Creating the bar chart for the 3 most common start station in Washington
wss_base<-ggplot(data=wss, aes(x=Start.Station, y= number.of.users))
wss_base+ geom_bar(stat="identity")+
xlab('Start Station')+
ylab('Number of users')+
ggtitle('The 3 most common start Station in Washington')+
scale_y_continuous(name="Number of users", labels = scales::comma)
```


![png](output_21_0.png)



```R
#The most common start station is Columbus Circle/Union Station
```


```R
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

```

                          Start.Station number.of.users rank
    210 Columbus Circle / Union Station            1700    1
    306                Lincoln Memorial            1546    2
    282       Jefferson Dr & 14th St SW            1488    3



<table>
<thead><tr><th></th><th scope=col>Start.Station</th><th scope=col>number.of.users</th><th scope=col>rank</th></tr></thead>
<tbody>
	<tr><th scope=row>467</th><td>Pershing Square North</td><td>592                  </td><td>1                    </td></tr>
	<tr><th scope=row>557</th><td><span style=white-space:pre-wrap>W 21 St &amp; 6 Ave      </span></td><td>385                                                              </td><td>2                                                                </td></tr>
	<tr><th scope=row>113</th><td><span style=white-space:pre-wrap>Broadway &amp; E 22 St   </span></td><td>383                                                              </td><td>3                                                                </td></tr>
</tbody>
</table>




```R
#Creating the bar chart for the 3 most common start station in New York
ny_base<-ggplot(data=nyss, aes(x=Start.Station, y= number.of.users))
ny_base+ geom_bar(stat="identity")+
xlab('Start Station')+
ylab('Number of users')+
ggtitle('The 3 most common start Station in New York City')+
scale_y_continuous(name="Number of users", labels = scales::comma)
```


![png](output_24_0.png)



```R
#The most common start station is Pershing Square North
```


```R
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
```

                Start.Station number.of.users rank
    467 Pershing Square North             592    1
    557       W 21 St & 6 Ave             385    2
    113    Broadway & E 22 St             383    3



<table>
<thead><tr><th></th><th scope=col>Start.Station</th><th scope=col>number.of.users</th><th scope=col>rank</th></tr></thead>
<tbody>
	<tr><th scope=row>467</th><td>Pershing Square North</td><td>592                  </td><td>1                    </td></tr>
	<tr><th scope=row>557</th><td><span style=white-space:pre-wrap>W 21 St &amp; 6 Ave      </span></td><td>385                                                              </td><td>2                                                                </td></tr>
	<tr><th scope=row>113</th><td><span style=white-space:pre-wrap>Broadway &amp; E 22 St   </span></td><td>383                                                              </td><td>3                                                                </td></tr>
</tbody>
</table>




```R
#Creating the bar chart for the 3 most common start station in Chicago
chi_base<-ggplot(data=chiss, aes(x=Start.Station, y= number.of.users))
chi_base+ geom_bar(stat="identity")+
xlab('Start Station')+
ylab('Number of users')+
ggtitle('The 3 most common start Station in Chicago')+
scale_y_continuous(name="Number of users", labels = scales::comma)
```


![png](output_27_0.png)



```R
# The most common start station is Streeter Dr & and Grand Ave
```


```R
# Summary Statistics about total travel time according to start station in Chicago
by(chi$Trip.Duration,chi$Start.Station, sum)
```


    chi$Start.Station: 2112 W Peterson Ave
    [1] 4060
    ------------------------------------------------------------ 
    chi$Start.Station: 63rd St Beach
    [1] 968
    ------------------------------------------------------------ 
    chi$Start.Station: 900 W Harrison St
    [1] 2363
    ------------------------------------------------------------ 
    chi$Start.Station: Aberdeen St & Jackson Blvd
    [1] 11957
    ------------------------------------------------------------ 
    chi$Start.Station: Aberdeen St & Monroe St
    [1] 17063
    ------------------------------------------------------------ 
    chi$Start.Station: Ada St & Washington Blvd
    [1] 16668
    ------------------------------------------------------------ 
    chi$Start.Station: Adler Planetarium
    [1] 82593
    ------------------------------------------------------------ 
    chi$Start.Station: Albany (Kedzie) Ave & Montrose Ave
    [1] 789
    ------------------------------------------------------------ 
    chi$Start.Station: Albany Ave & Bloomingdale Ave
    [1] 10005
    ------------------------------------------------------------ 
    chi$Start.Station: Artesian Ave & Hubbard St
    [1] 12363
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & 13th St
    [1] 5549
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & 21st St
    [1] 5073
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Archer Ave
    [1] 576
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Augusta Blvd
    [1] 11734
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Belle Plaine Ave
    [1] 2834
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Blackhawk St
    [1] 5878
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Chicago Ave
    [1] 12385
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Division St
    [1] 22691
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Grace St
    [1] 15072
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Grand Ave
    [1] 12057
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Harrison St
    [1] 9362
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Lake St
    [1] 9170
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Wellington Ave
    [1] 2207
    ------------------------------------------------------------ 
    chi$Start.Station: Ashland Ave & Wrightwood Ave
    [1] 5554
    ------------------------------------------------------------ 
    chi$Start.Station: Austin Blvd & Chicago Ave
    [1] 235
    ------------------------------------------------------------ 
    chi$Start.Station: Avers Ave & Belmont Ave
    [1] 11030
    ------------------------------------------------------------ 
    chi$Start.Station: Avondale Ave & Irving Park Rd
    [1] 906
    ------------------------------------------------------------ 
    chi$Start.Station: Benson Ave & Church St
    [1] 11870
    ------------------------------------------------------------ 
    chi$Start.Station: Bissell St & Armitage Ave
    [1] 18595
    ------------------------------------------------------------ 
    chi$Start.Station: Blackstone Ave & Hyde Park Blvd
    [1] 3725
    ------------------------------------------------------------ 
    chi$Start.Station: Blue Island Ave & 18th St
    [1] 6951
    ------------------------------------------------------------ 
    chi$Start.Station: Bosworth Ave & Howard St
    [1] 395
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Argyle St
    [1] 4456
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Barry Ave
    [1] 42413
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Belmont Ave
    [1] 8936
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Berwyn Ave
    [1] 7734
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Cornelia Ave
    [1] 36990
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Granville Ave
    [1] 6108
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Ridge Ave
    [1] 5200
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Sheridan Rd
    [1] 9355
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Thorndale Ave
    [1] 19741
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Waveland Ave
    [1] 5043
    ------------------------------------------------------------ 
    chi$Start.Station: Broadway & Wilson Ave
    [1] 10182
    ------------------------------------------------------------ 
    chi$Start.Station: Buckingham Fountain
    [1] 65158
    ------------------------------------------------------------ 
    chi$Start.Station: Budlong Woods Library
    [1] 2118
    ------------------------------------------------------------ 
    chi$Start.Station: Burnham Harbor
    [1] 70007
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & 21st St
    [1] 1639
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & 23rd Pl
    [1] 3179
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & 26th St
    [1] 1448
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Altgeld St
    [1] 4896
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Cortez St
    [1] 3575
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Division St
    [1] 4776
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Fletcher St
    [1] 4614
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Francis Pl
    [1] 4810
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Lake St
    [1] 1294
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Milwaukee Ave
    [1] 25008
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & Montrose Ave
    [1] 3908
    ------------------------------------------------------------ 
    chi$Start.Station: California Ave & North Ave
    [1] 861
    ------------------------------------------------------------ 
    chi$Start.Station: Calumet Ave & 18th St
    [1] 19522
    ------------------------------------------------------------ 
    chi$Start.Station: Calumet Ave & 21st St
    [1] 15346
    ------------------------------------------------------------ 
    chi$Start.Station: Calumet Ave & 33rd St
    [1] 9733
    ------------------------------------------------------------ 
    chi$Start.Station: Calumet Ave & 35th St
    [1] 8560
    ------------------------------------------------------------ 
    chi$Start.Station: Campbell Ave & Fullerton Ave
    [1] 1474
    ------------------------------------------------------------ 
    chi$Start.Station: Campbell Ave & Montrose Ave
    [1] 1739
    ------------------------------------------------------------ 
    chi$Start.Station: Campbell Ave & North Ave
    [1] 6331
    ------------------------------------------------------------ 
    chi$Start.Station: Canal St & Adams St
    [1] 71038
    ------------------------------------------------------------ 
    chi$Start.Station: Canal St & Harrison St
    [1] 5197
    ------------------------------------------------------------ 
    chi$Start.Station: Canal St & Madison St
    [1] 52076
    ------------------------------------------------------------ 
    chi$Start.Station: Canal St & Monroe St (*)
    [1] 53401
    ------------------------------------------------------------ 
    chi$Start.Station: Canal St & Taylor St
    [1] 6374
    ------------------------------------------------------------ 
    chi$Start.Station: Cannon Dr & Fullerton Ave
    [1] 32031
    ------------------------------------------------------------ 
    chi$Start.Station: Carpenter St & Huron St
    [1] 11540
    ------------------------------------------------------------ 
    chi$Start.Station: Central Park Ave & Elbridge Ave
    [1] 8135
    ------------------------------------------------------------ 
    chi$Start.Station: Central Park Ave & North Ave
    [1] 3266
    ------------------------------------------------------------ 
    chi$Start.Station: Central Park Ave & Ogden Ave
    [1] 288
    ------------------------------------------------------------ 
    chi$Start.Station: Central St & Girard Ave
    [1] 1136
    ------------------------------------------------------------ 
    chi$Start.Station: Central St Metra
    [1] 1421
    ------------------------------------------------------------ 
    chi$Start.Station: Chicago Ave & Sheridan Rd
    [1] 1788
    ------------------------------------------------------------ 
    chi$Start.Station: Chicago Ave & Washington St
    [1] 7225
    ------------------------------------------------------------ 
    chi$Start.Station: Christiana Ave & Lawrence Ave
    [1] 4711
    ------------------------------------------------------------ 
    chi$Start.Station: Cityfront Plaza Dr & Pioneer Ct
    [1] 19445
    ------------------------------------------------------------ 
    chi$Start.Station: Claremont Ave & Hirsch St
    [1] 6768
    ------------------------------------------------------------ 
    chi$Start.Station: Clarendon Ave & Gordon Ter
    [1] 13511
    ------------------------------------------------------------ 
    chi$Start.Station: Clarendon Ave & Junior Ter
    [1] 26130
    ------------------------------------------------------------ 
    chi$Start.Station: Clarendon Ave & Leland Ave
    [1] 11425
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & 9th St (AMLI)
    [1] 5676
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Armitage Ave
    [1] 69092
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Berwyn Ave
    [1] 16697
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Bryn Mawr Ave
    [1] 8672
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Chicago Ave
    [1] 21095
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Columbia Ave
    [1] 2892
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Congress Pkwy
    [1] 16685
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Elm St
    [1] 38728
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Elmdale Ave
    [1] 1621
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Grace St
    [1] 10290
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Jarvis Ave
    [1] 1501
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Lake St
    [1] 27261
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Leland Ave
    [1] 7126
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Lincoln Ave
    [1] 36267
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Lunt Ave
    [1] 2064
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Montrose Ave
    [1] 12956
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & North Ave
    [1] 20713
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Randolph St
    [1] 29589
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Schiller St
    [1] 27240
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Schreiber Ave
    [1] 86676
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Touhy Ave
    [1] 1965
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Wellington Ave
    [1] 17045
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Winnemac Ave
    [1] 19763
    ------------------------------------------------------------ 
    chi$Start.Station: Clark St & Wrightwood Ave
    [1] 25367
    ------------------------------------------------------------ 
    chi$Start.Station: Clifton Ave & Armitage Ave
    [1] 12777
    ------------------------------------------------------------ 
    chi$Start.Station: Clifton Ave & Lawrence Ave
    [1] 6802
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & 18th St
    [1] 6317
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Jackson Blvd
    [1] 43872
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Lake St
    [1] 27316
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Madison St
    [1] 71157
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Polk St (*)
    [1] 1553
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Roosevelt Rd
    [1] 12732
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Tilden St
    [1] 10046
    ------------------------------------------------------------ 
    chi$Start.Station: Clinton St & Washington Blvd
    [1] 75753
    ------------------------------------------------------------ 
    chi$Start.Station: Clybourn Ave & Division St
    [1] 9399
    ------------------------------------------------------------ 
    chi$Start.Station: Columbus Dr & Randolph St
    [1] 81983
    ------------------------------------------------------------ 
    chi$Start.Station: Conservatory Dr & Lake St
    [1] 2973
    ------------------------------------------------------------ 
    chi$Start.Station: Cornell Ave & Hyde Park Blvd
    [1] 10069
    ------------------------------------------------------------ 
    chi$Start.Station: Cottage Grove Ave & 43rd St
    [1] 3241
    ------------------------------------------------------------ 
    chi$Start.Station: Cottage Grove Ave & 47th St
    [1] 1877
    ------------------------------------------------------------ 
    chi$Start.Station: Cottage Grove Ave & 63rd St
    [1] 302
    ------------------------------------------------------------ 
    chi$Start.Station: Cottage Grove Ave & Oakwood Blvd
    [1] 4119
    ------------------------------------------------------------ 
    chi$Start.Station: Cuyler Ave & Augusta St
    [1] 4646
    ------------------------------------------------------------ 
    chi$Start.Station: Daley Center Plaza
    [1] 54423
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Augusta Blvd
    [1] 15280
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Charleston St
    [1] 5889
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Chicago Ave
    [1] 11399
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Clybourn Ave
    [1] 5069
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Cortland St
    [1] 25060
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Coulter St
    [1] 548
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Cullerton St
    [1] 2350
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Division St
    [1] 11727
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Foster Ave
    [1] 5184
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Grand Ave
    [1] 12930
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Leland Ave
    [1] 5546
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Madison St
    [1] 5346
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Melrose Ave
    [1] 2889
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Pierce Ave
    [1] 21439
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Sunnyside Ave
    [1] 2920
    ------------------------------------------------------------ 
    chi$Start.Station: Damen Ave & Wellington Ave
    [1] 9207
    ------------------------------------------------------------ 
    chi$Start.Station: Dayton St & North Ave
    [1] 34098
    ------------------------------------------------------------ 
    chi$Start.Station: Dearborn Pkwy & Delaware Pl
    [1] 30807
    ------------------------------------------------------------ 
    chi$Start.Station: Dearborn St & Adams St
    [1] 25314
    ------------------------------------------------------------ 
    chi$Start.Station: Dearborn St & Erie St
    [1] 43118
    ------------------------------------------------------------ 
    chi$Start.Station: Dearborn St & Monroe St
    [1] 30163
    ------------------------------------------------------------ 
    chi$Start.Station: Desplaines St & Jackson Blvd
    [1] 15508
    ------------------------------------------------------------ 
    chi$Start.Station: Desplaines St & Kinzie St
    [1] 26919
    ------------------------------------------------------------ 
    chi$Start.Station: Desplaines St & Randolph St
    [1] 12847
    ------------------------------------------------------------ 
    chi$Start.Station: Dodge Ave & Church St
    [1] 291
    ------------------------------------------------------------ 
    chi$Start.Station: Dorchester Ave & 63rd St
    [1] 2680
    ------------------------------------------------------------ 
    chi$Start.Station: Drake Ave & Addison St
    [1] 4834
    ------------------------------------------------------------ 
    chi$Start.Station: Drake Ave & Fullerton Ave
    [1] 5063
    ------------------------------------------------------------ 
    chi$Start.Station: Drake Ave & Montrose Ave
    [1] 328
    ------------------------------------------------------------ 
    chi$Start.Station: Dusable Harbor
    [1] 82255
    ------------------------------------------------------------ 
    chi$Start.Station: DuSable Museum
    [1] 721
    ------------------------------------------------------------ 
    chi$Start.Station: East Ave & Garfield St
    [1] 296
    ------------------------------------------------------------ 
    chi$Start.Station: East Ave & Madison St
    [1] 2283
    ------------------------------------------------------------ 
    chi$Start.Station: Eastlake Ter & Rogers Ave
    [1] 17240
    ------------------------------------------------------------ 
    chi$Start.Station: Eberhart Ave & 61st St
    [1] 236
    ------------------------------------------------------------ 
    chi$Start.Station: Eckhart Park
    [1] 10254
    ------------------------------------------------------------ 
    chi$Start.Station: Ellis Ave & 53rd St
    [1] 24360
    ------------------------------------------------------------ 
    chi$Start.Station: Ellis Ave & 55th St
    [1] 12603
    ------------------------------------------------------------ 
    chi$Start.Station: Ellis Ave & 58th St
    [1] 5769
    ------------------------------------------------------------ 
    chi$Start.Station: Ellis Ave & 60th St
    [1] 2810
    ------------------------------------------------------------ 
    chi$Start.Station: Elmwood Ave & Austin St
    [1] 909
    ------------------------------------------------------------ 
    chi$Start.Station: Elston Ave & Wabansia Ave
    [1] 7272
    ------------------------------------------------------------ 
    chi$Start.Station: Emerald Ave & 28th St
    [1] 1791
    ------------------------------------------------------------ 
    chi$Start.Station: Emerald Ave & 31st St
    [1] 2797
    ------------------------------------------------------------ 
    chi$Start.Station: Fairbanks Ct & Grand Ave
    [1] 35710
    ------------------------------------------------------------ 
    chi$Start.Station: Fairfield Ave & Roosevelt Rd
    [1] 3823
    ------------------------------------------------------------ 
    chi$Start.Station: Federal St & Polk St
    [1] 19141
    ------------------------------------------------------------ 
    chi$Start.Station: Field Blvd & South Water St
    [1] 14451
    ------------------------------------------------------------ 
    chi$Start.Station: Field Museum
    [1] 33168
    ------------------------------------------------------------ 
    chi$Start.Station: Financial Pl & Congress Pkwy
    [1] 30067
    ------------------------------------------------------------ 
    chi$Start.Station: Forest Ave & Chicago Ave
    [1] 338
    ------------------------------------------------------------ 
    chi$Start.Station: Forest Ave & Lake St
    [1] 196
    ------------------------------------------------------------ 
    chi$Start.Station: Fort Dearborn Dr & 31st St
    [1] 28531
    ------------------------------------------------------------ 
    chi$Start.Station: Francisco Ave & Foster Ave
    [1] 679
    ------------------------------------------------------------ 
    chi$Start.Station: Franklin St & Chicago Ave
    [1] 16653
    ------------------------------------------------------------ 
    chi$Start.Station: Franklin St & Jackson Blvd
    [1] 38347
    ------------------------------------------------------------ 
    chi$Start.Station: Franklin St & Lake St
    [1] 19362
    ------------------------------------------------------------ 
    chi$Start.Station: Franklin St & Monroe St
    [1] 62196
    ------------------------------------------------------------ 
    chi$Start.Station: Franklin St & Quincy St
    [1] 26647
    ------------------------------------------------------------ 
    chi$Start.Station: Glenwood Ave & Morse Ave
    [1] 2944
    ------------------------------------------------------------ 
    chi$Start.Station: Green St & Madison St
    [1] 15727
    ------------------------------------------------------------ 
    chi$Start.Station: Green St & Randolph St
    [1] 27466
    ------------------------------------------------------------ 
    chi$Start.Station: Greenview Ave & Diversey Pkwy
    [1] 10935
    ------------------------------------------------------------ 
    chi$Start.Station: Greenview Ave & Fullerton Ave
    [1] 5529
    ------------------------------------------------------------ 
    chi$Start.Station: Greenview Ave & Jarvis Ave
    [1] 3159
    ------------------------------------------------------------ 
    chi$Start.Station: Greenwood Ave & 47th St
    [1] 643
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & 18th St
    [1] 5960
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & 21st St
    [1] 4939
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & 35th St (*)
    [1] 3668
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & 47th Pl
    [1] 983
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Archer Ave
    [1] 2974
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Blackhawk St (*)
    [1] 17197
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Dickens Ave
    [1] 44852
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Diversey Pkwy
    [1] 15234
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Maxwell St
    [1] 10875
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & North Branch St
    [1] 1501
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Polk St
    [1] 15965
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Roosevelt Rd
    [1] 1646
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Roscoe St
    [1] 29163
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Willow St
    [1] 10211
    ------------------------------------------------------------ 
    chi$Start.Station: Halsted St & Wrightwood Ave
    [1] 12689
    ------------------------------------------------------------ 
    chi$Start.Station: Hampden Ct & Diversey Pkwy
    [1] 15692
    ------------------------------------------------------------ 
    chi$Start.Station: Harper Ave & 59th St
    [1] 1761
    ------------------------------------------------------------ 
    chi$Start.Station: Hermitage Ave & Polk St
    [1] 13820
    ------------------------------------------------------------ 
    chi$Start.Station: Humboldt Blvd & Armitage Ave
    [1] 7060
    ------------------------------------------------------------ 
    chi$Start.Station: Humphrey Ave & Ontario St
    [1] 259
    ------------------------------------------------------------ 
    chi$Start.Station: Indiana Ave & 26th St
    [1] 10090
    ------------------------------------------------------------ 
    chi$Start.Station: Indiana Ave & 31st St
    [1] 5152
    ------------------------------------------------------------ 
    chi$Start.Station: Indiana Ave & 40th St
    [1] 1086
    ------------------------------------------------------------ 
    chi$Start.Station: Indiana Ave & Roosevelt Rd
    [1] 79710
    ------------------------------------------------------------ 
    chi$Start.Station: Jefferson St & Monroe St
    [1] 29376
    ------------------------------------------------------------ 
    chi$Start.Station: Jeffery Blvd & 71st St
    [1] 1064
    ------------------------------------------------------------ 
    chi$Start.Station: Jeffery Blvd & 76th St
    [1] 9957
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & 21st St
    [1] 782
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Bryn Mawr Ave
    [1] 3226
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Chicago Ave
    [1] 538
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Foster Ave
    [1] 2738
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Harrison St
    [1] 1132
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Lake St
    [1] 1404
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Milwaukee Ave
    [1] 18105
    ------------------------------------------------------------ 
    chi$Start.Station: Kedzie Ave & Palmer Ct
    [1] 12953
    ------------------------------------------------------------ 
    chi$Start.Station: Keystone Ave & Fullerton Ave
    [1] 5634
    ------------------------------------------------------------ 
    chi$Start.Station: Keystone Ave & Montrose Ave
    [1] 2009
    ------------------------------------------------------------ 
    chi$Start.Station: Kilbourn Ave & Irving Park Rd
    [1] 1308
    ------------------------------------------------------------ 
    chi$Start.Station: Kimball Ave & Belmont Ave
    [1] 1703
    ------------------------------------------------------------ 
    chi$Start.Station: Kimbark Ave & 53rd St
    [1] 7020
    ------------------------------------------------------------ 
    chi$Start.Station: Kingsbury St & Erie St
    [1] 28343
    ------------------------------------------------------------ 
    chi$Start.Station: Kingsbury St & Kinzie St
    [1] 44090
    ------------------------------------------------------------ 
    chi$Start.Station: Knox Ave & Montrose Ave
    [1] 1811
    ------------------------------------------------------------ 
    chi$Start.Station: Kosciuszko Park
    [1] 2729
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Park Ave & 35th St
    [1] 9566
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Park Ave & 47th St
    [1] 8125
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Park Ave & 53rd St
    [1] 13477
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Park Ave & 56th St
    [1] 8065
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Shore Dr & Belmont Ave
    [1] 67633
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Shore Dr & Diversey Pkwy
    [1] 26493
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Shore Dr & Monroe St
    [1] 255623
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Shore Dr & North Blvd
    [1] 109466
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Shore Dr & Ohio St
    [1] 60281
    ------------------------------------------------------------ 
    chi$Start.Station: Lake Shore Dr & Wellington Ave
    [1] 46929
    ------------------------------------------------------------ 
    chi$Start.Station: Lakefront Trail & Bryn Mawr Ave
    [1] 39119
    ------------------------------------------------------------ 
    chi$Start.Station: Lakeview Ave & Fullerton Pkwy
    [1] 36028
    ------------------------------------------------------------ 
    chi$Start.Station: Laramie Ave & Gladys Ave
    [1] 457
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & Armitage Ave
    [1] 15345
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & Division St
    [1] 11386
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & Kingsbury St
    [1] 27606
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & Menomonee St
    [1] 16101
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & North Ave
    [1] 7369
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & Oak St
    [1] 14586
    ------------------------------------------------------------ 
    chi$Start.Station: Larrabee St & Webster Ave
    [1] 21889
    ------------------------------------------------------------ 
    chi$Start.Station: LaSalle St & Adams St
    [1] 19712
    ------------------------------------------------------------ 
    chi$Start.Station: LaSalle St & Illinois St
    [1] 36713
    ------------------------------------------------------------ 
    chi$Start.Station: LaSalle St & Jackson Blvd
    [1] 45308
    ------------------------------------------------------------ 
    chi$Start.Station: LaSalle St & Washington St
    [1] 38280
    ------------------------------------------------------------ 
    chi$Start.Station: Leavitt St & Addison St
    [1] 3699
    ------------------------------------------------------------ 
    chi$Start.Station: Leavitt St & Armitage Ave
    [1] 11491
    ------------------------------------------------------------ 
    chi$Start.Station: Leavitt St & Lawrence Ave
    [1] 7350
    ------------------------------------------------------------ 
    chi$Start.Station: Leavitt St & North Ave
    [1] 10666
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Addison St
    [1] 2868
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Belle Plaine Ave
    [1] 5794
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Belmont Ave
    [1] 14353
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Diversey Pkwy
    [1] 27139
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Fullerton Ave
    [1] 17062
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Leavitt St
    [1] 8550
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Roscoe St
    [1] 12136
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Waveland Ave
    [1] 4090
    ------------------------------------------------------------ 
    chi$Start.Station: Lincoln Ave & Winona St
    [1] 1968
    ------------------------------------------------------------ 
    chi$Start.Station: Logan Blvd & Elston Ave
    [1] 3159
    ------------------------------------------------------------ 
    chi$Start.Station: Lombard Ave & Garfield St
    [1] 2528
    ------------------------------------------------------------ 
    chi$Start.Station: Lombard Ave & Madison St
    [1] 231
    ------------------------------------------------------------ 
    chi$Start.Station: Loomis St & Archer Ave
    [1] 1787
    ------------------------------------------------------------ 
    chi$Start.Station: Loomis St & Jackson Blvd
    [1] 11966
    ------------------------------------------------------------ 
    chi$Start.Station: Loomis St & Lexington St
    [1] 14742
    ------------------------------------------------------------ 
    chi$Start.Station: Loomis St & Taylor St (*)
    [1] 7307
    ------------------------------------------------------------ 
    chi$Start.Station: Manor Ave & Leland Ave
    [1] 3356
    ------------------------------------------------------------ 
    chi$Start.Station: Maplewood Ave & Peterson Ave
    [1] 1226
    ------------------------------------------------------------ 
    chi$Start.Station: Marine Dr & Ainslie St
    [1] 11848
    ------------------------------------------------------------ 
    chi$Start.Station: Marion St & South Blvd
    [1] 3547
    ------------------------------------------------------------ 
    chi$Start.Station: Marshfield Ave & 44th St
    [1] 1074
    ------------------------------------------------------------ 
    chi$Start.Station: Marshfield Ave & Cortland St
    [1] 36942
    ------------------------------------------------------------ 
    chi$Start.Station: May St & Cullerton St
    [1] 6243
    ------------------------------------------------------------ 
    chi$Start.Station: May St & Taylor St
    [1] 9096
    ------------------------------------------------------------ 
    chi$Start.Station: McClurg Ct & Erie St
    [1] 35234
    ------------------------------------------------------------ 
    chi$Start.Station: McClurg Ct & Illinois St
    [1] 69679
    ------------------------------------------------------------ 
    chi$Start.Station: McCormick Place
    [1] 34443
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & 14th St
    [1] 16452
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & 18th St
    [1] 18053
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & 8th St
    [1] 3270
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Congress Pkwy
    [1] 33613
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Jackson Blvd
    [1] 39812
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Lake St
    [1] 48645
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Madison St
    [1] 18030
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Oak St
    [1] 169181
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Pearson St
    [1] 45082
    ------------------------------------------------------------ 
    chi$Start.Station: Michigan Ave & Washington St
    [1] 85906
    ------------------------------------------------------------ 
    chi$Start.Station: Mies van der Rohe Way & Chestnut St
    [1] 31967
    ------------------------------------------------------------ 
    chi$Start.Station: Mies van der Rohe Way & Chicago Ave
    [1] 21477
    ------------------------------------------------------------ 
    chi$Start.Station: Millennium Park
    [1] 116475
    ------------------------------------------------------------ 
    chi$Start.Station: Milwaukee Ave & Grand Ave
    [1] 13135
    ------------------------------------------------------------ 
    chi$Start.Station: Milwaukee Ave & Rockwell St
    [1] 5041
    ------------------------------------------------------------ 
    chi$Start.Station: Milwaukee Ave & Wabansia Ave
    [1] 17331
    ------------------------------------------------------------ 
    chi$Start.Station: MLK Jr Dr & 29th St
    [1] 29610
    ------------------------------------------------------------ 
    chi$Start.Station: MLK Jr Dr & 56th St (*)
    [1] 413
    ------------------------------------------------------------ 
    chi$Start.Station: MLK Jr Dr & Oakwood Blvd
    [1] 6538
    ------------------------------------------------------------ 
    chi$Start.Station: Monticello Ave & Irving Park Rd
    [1] 489
    ------------------------------------------------------------ 
    chi$Start.Station: Montrose Harbor
    [1] 80676
    ------------------------------------------------------------ 
    chi$Start.Station: Morgan Ave & 14th Pl
    [1] 14185
    ------------------------------------------------------------ 
    chi$Start.Station: Morgan St & 18th St
    [1] 12481
    ------------------------------------------------------------ 
    chi$Start.Station: Morgan St & 31st St
    [1] 2291
    ------------------------------------------------------------ 
    chi$Start.Station: Morgan St & Lake St
    [1] 22091
    ------------------------------------------------------------ 
    chi$Start.Station: Morgan St & Polk St
    [1] 23165
    ------------------------------------------------------------ 
    chi$Start.Station: Museum of Science and Industry
    [1] 20561
    ------------------------------------------------------------ 
    chi$Start.Station: Noble St & Milwaukee Ave
    [1] 21347
    ------------------------------------------------------------ 
    chi$Start.Station: Normal Ave & Archer Ave
    [1] 1932
    ------------------------------------------------------------ 
    chi$Start.Station: Oak Park Ave & South Blvd
    [1] 2714
    ------------------------------------------------------------ 
    chi$Start.Station: Oakley Ave & Irving Park Rd
    [1] 849
    ------------------------------------------------------------ 
    chi$Start.Station: Oakley Ave & Roscoe St
    [1] 5286
    ------------------------------------------------------------ 
    chi$Start.Station: Oakley Ave & Touhy Ave
    [1] 3479
    ------------------------------------------------------------ 
    chi$Start.Station: Ogden Ave & Chicago Ave
    [1] 13572
    ------------------------------------------------------------ 
    chi$Start.Station: Ogden Ave & Congress Pkwy
    [1] 3901
    ------------------------------------------------------------ 
    chi$Start.Station: Ogden Ave & Race Ave
    [1] 7620
    ------------------------------------------------------------ 
    chi$Start.Station: Ogden Ave & Roosevelt Rd
    [1] 4473
    ------------------------------------------------------------ 
    chi$Start.Station: Orleans St & Chestnut St (NEXT Apts)
    [1] 3470
    ------------------------------------------------------------ 
    chi$Start.Station: Orleans St & Elm St (*)
    [1] 8330
    ------------------------------------------------------------ 
    chi$Start.Station: Orleans St & Merchandise Mart Plaza
    [1] 50496
    ------------------------------------------------------------ 
    chi$Start.Station: Orleans St & Ohio St
    [1] 28510
    ------------------------------------------------------------ 
    chi$Start.Station: Paulina Ave & North Ave
    [1] 12169
    ------------------------------------------------------------ 
    chi$Start.Station: Paulina St & 18th St
    [1] 7036
    ------------------------------------------------------------ 
    chi$Start.Station: Paulina St & Howard St
    [1] 2600
    ------------------------------------------------------------ 
    chi$Start.Station: Paulina St & Montrose Ave
    [1] 2946
    ------------------------------------------------------------ 
    chi$Start.Station: Peoria St & Jackson Blvd
    [1] 23193
    ------------------------------------------------------------ 
    chi$Start.Station: Pine Grove Ave & Irving Park Rd
    [1] 20965
    ------------------------------------------------------------ 
    chi$Start.Station: Pine Grove Ave & Waveland Ave
    [1] 21632
    ------------------------------------------------------------ 
    chi$Start.Station: Prairie Ave & 43rd St
    [1] 724
    ------------------------------------------------------------ 
    chi$Start.Station: Prairie Ave & Garfield Blvd
    [1] 1758
    ------------------------------------------------------------ 
    chi$Start.Station: Pulaski Rd & Eddy St
    [1] 398
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave (May St) & Fulton St
    [1] 12338
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & 13th St
    [1] 2283
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & 15th St
    [1] 5970
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & 18th St
    [1] 14072
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & 35th St
    [1] 1925
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & Belmont Ave
    [1] 19260
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & Congress Pkwy
    [1] 2677
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & Fullerton Ave
    [1] 15620
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & Randolph St
    [1] 10198
    ------------------------------------------------------------ 
    chi$Start.Station: Racine Ave & Wrightwood Ave
    [1] 9138
    ------------------------------------------------------------ 
    chi$Start.Station: Ravenswood Ave & Balmoral Ave
    [1] 3957
    ------------------------------------------------------------ 
    chi$Start.Station: Ravenswood Ave & Berteau Ave
    [1] 7550
    ------------------------------------------------------------ 
    chi$Start.Station: Ravenswood Ave & Irving Park Rd
    [1] 12450
    ------------------------------------------------------------ 
    chi$Start.Station: Ravenswood Ave & Lawrence Ave
    [1] 22021
    ------------------------------------------------------------ 
    chi$Start.Station: Ravenswood Ave & Montrose Ave (*)
    [1] 9367
    ------------------------------------------------------------ 
    chi$Start.Station: Rhodes Ave & 32nd St
    [1] 2360
    ------------------------------------------------------------ 
    chi$Start.Station: Richmond St & Diversey Ave
    [1] 5439
    ------------------------------------------------------------ 
    chi$Start.Station: Ridge Blvd & Howard St
    [1] 371
    ------------------------------------------------------------ 
    chi$Start.Station: Ridge Blvd & Touhy Ave
    [1] 1087
    ------------------------------------------------------------ 
    chi$Start.Station: Ridgeland Ave & Lake St
    [1] 1096
    ------------------------------------------------------------ 
    chi$Start.Station: Ritchie Ct & Banks St
    [1] 8593
    ------------------------------------------------------------ 
    chi$Start.Station: Rockwell St & Eastwood Ave
    [1] 4599
    ------------------------------------------------------------ 
    chi$Start.Station: Rush St & Cedar St
    [1] 31822
    ------------------------------------------------------------ 
    chi$Start.Station: Rush St & Hubbard St
    [1] 20259
    ------------------------------------------------------------ 
    chi$Start.Station: Rush St & Superior St
    [1] 19872
    ------------------------------------------------------------ 
    chi$Start.Station: Saginaw Ave & Exchange Ave
    [1] 168
    ------------------------------------------------------------ 
    chi$Start.Station: Sangamon St & Washington Blvd (*)
    [1] 9443
    ------------------------------------------------------------ 
    chi$Start.Station: Sawyer Ave & Irving Park Rd
    [1] 1848
    ------------------------------------------------------------ 
    chi$Start.Station: Sedgwick St & Huron St
    [1] 17005
    ------------------------------------------------------------ 
    chi$Start.Station: Sedgwick St & North Ave
    [1] 25250
    ------------------------------------------------------------ 
    chi$Start.Station: Sedgwick St & Schiller St
    [1] 223
    ------------------------------------------------------------ 
    chi$Start.Station: Sedgwick St & Webster Ave
    [1] 31685
    ------------------------------------------------------------ 
    chi$Start.Station: Seeley Ave & Garfield Blvd
    [1] 116
    ------------------------------------------------------------ 
    chi$Start.Station: Seeley Ave & Roscoe St
    [1] 10002
    ------------------------------------------------------------ 
    chi$Start.Station: Shedd Aquarium
    [1] 95098
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Fullerton Ave
    [1] 13882
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Kingsbury St
    [1] 12895
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Waveland Ave
    [1] 34340
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Webster Ave
    [1] 24637
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Wellington Ave
    [1] 16726
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Willow St
    [1] 14749
    ------------------------------------------------------------ 
    chi$Start.Station: Sheffield Ave & Wrightwood Ave
    [1] 8175
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Buena Ave
    [1] 5724
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Greenleaf Ave
    [1] 2919
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Irving Park Rd
    [1] 19358
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Lawrence Ave
    [1] 8623
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Loyola Ave
    [1] 5300
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Montrose Ave
    [1] 8864
    ------------------------------------------------------------ 
    chi$Start.Station: Sheridan Rd & Noyes St (NU)
    [1] 4559
    ------------------------------------------------------------ 
    chi$Start.Station: Shields Ave & 28th Pl
    [1] 1145
    ------------------------------------------------------------ 
    chi$Start.Station: Shields Ave & 31st St
    [1] 956
    ------------------------------------------------------------ 
    chi$Start.Station: Shields Ave & 43rd St
    [1] 776
    ------------------------------------------------------------ 
    chi$Start.Station: Shore Dr & 55th St
    [1] 31736
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Belmont Ave
    [1] 23976
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Clark St
    [1] 7057
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Clybourn Ave
    [1] 6256
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Irving Park Rd
    [1] 8519
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Roscoe St
    [1] 13793
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Waveland Ave
    [1] 34815
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Wellington Ave
    [1] 23123
    ------------------------------------------------------------ 
    chi$Start.Station: Southport Ave & Wrightwood Ave
    [1] 11082
    ------------------------------------------------------------ 
    chi$Start.Station: Spaulding Ave & Armitage Ave
    [1] 10014
    ------------------------------------------------------------ 
    chi$Start.Station: Spaulding Ave & Division St
    [1] 3244
    ------------------------------------------------------------ 
    chi$Start.Station: St. Clair St & Erie St
    [1] 44695
    ------------------------------------------------------------ 
    chi$Start.Station: St. Louis Ave & Balmoral Ave
    [1] 3551
    ------------------------------------------------------------ 
    chi$Start.Station: State St & 19th St
    [1] 1845
    ------------------------------------------------------------ 
    chi$Start.Station: State St & 33rd St
    [1] 4501
    ------------------------------------------------------------ 
    chi$Start.Station: State St & 35th St
    [1] 2880
    ------------------------------------------------------------ 
    chi$Start.Station: State St & Harrison St
    [1] 14311
    ------------------------------------------------------------ 
    chi$Start.Station: State St & Kinzie St
    [1] 29586
    ------------------------------------------------------------ 
    chi$Start.Station: State St & Pearson St
    [1] 39026
    ------------------------------------------------------------ 
    chi$Start.Station: State St & Randolph St
    [1] 46351
    ------------------------------------------------------------ 
    chi$Start.Station: State St & Van Buren St
    [1] 32533
    ------------------------------------------------------------ 
    chi$Start.Station: Stave St & Armitage Ave
    [1] 5713
    ------------------------------------------------------------ 
    chi$Start.Station: Stetson Ave & South Water St
    [1] 29543
    ------------------------------------------------------------ 
    chi$Start.Station: Stockton Dr & Wrightwood Ave
    [1] 53200
    ------------------------------------------------------------ 
    chi$Start.Station: Streeter Dr & Grand Ave
    [1] 337129
    ------------------------------------------------------------ 
    chi$Start.Station: Talman Ave & Addison St
    [1] 3192
    ------------------------------------------------------------ 
    chi$Start.Station: Theater on the Lake
    [1] 119704
    ------------------------------------------------------------ 
    chi$Start.Station: Troy St & Elston Ave
    [1] 5466
    ------------------------------------------------------------ 
    chi$Start.Station: Troy St & North Ave
    [1] 17396
    ------------------------------------------------------------ 
    chi$Start.Station: University Ave & 57th St
    [1] 8233
    ------------------------------------------------------------ 
    chi$Start.Station: University Library (NU)
    [1] 8824
    ------------------------------------------------------------ 
    chi$Start.Station: Waba
    [1] 3020
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & 16th St
    [1] 11938
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & 8th St
    [1] 20859
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & Adams St
    [1] 41911
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & Cermak Rd
    [1] 5482
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & Grand Ave
    [1] 25651
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & Roosevelt Rd
    [1] 46559
    ------------------------------------------------------------ 
    chi$Start.Station: Wabash Ave & Wacker Pl
    [1] 31167
    ------------------------------------------------------------ 
    chi$Start.Station: Wacker Dr & Washington St
    [1] 21797
    ------------------------------------------------------------ 
    chi$Start.Station: Wallace St & 35th St
    [1] 2215
    ------------------------------------------------------------ 
    chi$Start.Station: Washtenaw Ave & 15th St (*)
    [1] 3521
    ------------------------------------------------------------ 
    chi$Start.Station: Washtenaw Ave & Lawrence Ave
    [1] 2920
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & 19th St
    [1] 1484
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & Concord Ln
    [1] 48855
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & Elm St
    [1] 18755
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & Evergreen Ave
    [1] 26392
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & Huron St
    [1] 14854
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & Polk St
    [1] 17907
    ------------------------------------------------------------ 
    chi$Start.Station: Wells St & Walton St
    [1] 5849
    ------------------------------------------------------------ 
    chi$Start.Station: Wentworth Ave & 24th St
    [1] 4573
    ------------------------------------------------------------ 
    chi$Start.Station: Wentworth Ave & 33rd St
    [1] 1903
    ------------------------------------------------------------ 
    chi$Start.Station: Wentworth Ave & 35th St
    [1] 1445
    ------------------------------------------------------------ 
    chi$Start.Station: Wentworth Ave & Archer Ave
    [1] 12098
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & 21st St
    [1] 1580
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & 28th St
    [1] 693
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Congress Pkwy
    [1] 1349
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Division St
    [1] 11101
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Granville Ave
    [1] 3412
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Howard St
    [1] 336
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Leland Ave
    [1] 7855
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Lunt Ave
    [1] 2091
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Walton St
    [1] 14219
    ------------------------------------------------------------ 
    chi$Start.Station: Western Ave & Winnebago Ave
    [1] 11252
    ------------------------------------------------------------ 
    chi$Start.Station: Wilton Ave & Belmont Ave
    [1] 26592
    ------------------------------------------------------------ 
    chi$Start.Station: Wilton Ave & Diversey Pkwy
    [1] 16137
    ------------------------------------------------------------ 
    chi$Start.Station: Winchester Ave & Elston Ave
    [1] 4794
    ------------------------------------------------------------ 
    chi$Start.Station: Wisconsin Ave & Madison St
    [1] 256
    ------------------------------------------------------------ 
    chi$Start.Station: Wolcott Ave & Polk St
    [1] 21393
    ------------------------------------------------------------ 
    chi$Start.Station: Wood St & Division St
    [1] 9206
    ------------------------------------------------------------ 
    chi$Start.Station: Wood St & Hubbard St
    [1] 2802
    ------------------------------------------------------------ 
    chi$Start.Station: Wood St & Milwaukee Ave
    [1] 29073
    ------------------------------------------------------------ 
    chi$Start.Station: Wood St & Taylor St
    [1] 16760
    ------------------------------------------------------------ 
    chi$Start.Station: Woodlawn Ave & 55th St
    [1] 6801
    ------------------------------------------------------------ 
    chi$Start.Station: Woodlawn Ave & Lake Park Ave
    [1] 1813



```R
# Statistics show that users spent 337,129 seconds when starting at the most common sation which is Streeter Dr& Grand Ave
```


```R
by(ny$Trip.Duration,ny$Start.Station, sum)
```


    ny$Start.Station: 
    [1] NA
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 16 St
    [1] 126899
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 18 St
    [1] 122724
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 30 St
    [1] 115768
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 44 St
    [1] 95111
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 62 St
    [1] 112467
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 68 St
    [1] 159491
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 78 St
    [1] 126924
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Ave & E 94 St
    [1] 42667
    ------------------------------------------------------------ 
    ny$Start.Station: 1 Pl & Clinton St
    [1] 14766
    ------------------------------------------------------------ 
    ny$Start.Station: 10 Hudson Yards
    [1] 9309
    ------------------------------------------------------------ 
    ny$Start.Station: 10 St & 5 Ave
    [1] 14263
    ------------------------------------------------------------ 
    ny$Start.Station: 10 St & 7 Ave
    [1] 26639
    ------------------------------------------------------------ 
    ny$Start.Station: 11 Ave & W 27 St
    [1] 177410
    ------------------------------------------------------------ 
    ny$Start.Station: 11 Ave & W 41 St
    [1] 118967
    ------------------------------------------------------------ 
    ny$Start.Station: 11 Ave & W 59 St
    [1] 138802
    ------------------------------------------------------------ 
    ny$Start.Station: 12 Ave & W 40 St
    [1] 325723
    ------------------------------------------------------------ 
    ny$Start.Station: 12 St & 4 Ave
    [1] 17984
    ------------------------------------------------------------ 
    ny$Start.Station: 14 St & 5 Ave
    [1] 22899
    ------------------------------------------------------------ 
    ny$Start.Station: 14 St & 7 Ave
    [1] 21012
    ------------------------------------------------------------ 
    ny$Start.Station: 2 Ave  & E 104 St
    [1] 10854
    ------------------------------------------------------------ 
    ny$Start.Station: 2 Ave & 9 St
    [1] 12444
    ------------------------------------------------------------ 
    ny$Start.Station: 2 Ave & E 31 St
    [1] 114805
    ------------------------------------------------------------ 
    ny$Start.Station: 2 Ave & E 96 St
    [1] 29512
    ------------------------------------------------------------ 
    ny$Start.Station: 2 Ave & E 99 St
    [1] 18047
    ------------------------------------------------------------ 
    ny$Start.Station: 21 St & 41 Ave
    [1] 1203
    ------------------------------------------------------------ 
    ny$Start.Station: 21 St & 43 Ave
    [1] 7722
    ------------------------------------------------------------ 
    ny$Start.Station: 21 St & Queens Plaza North
    [1] 14932
    ------------------------------------------------------------ 
    ny$Start.Station: 3 Ave & 14 St
    [1] 24248
    ------------------------------------------------------------ 
    ny$Start.Station: 3 Ave & E 100 St
    [1] 11533
    ------------------------------------------------------------ 
    ny$Start.Station: 3 Ave & E 62 St
    [1] 58843
    ------------------------------------------------------------ 
    ny$Start.Station: 3 Ave & E 71 St
    [1] 36240
    ------------------------------------------------------------ 
    ny$Start.Station: 3 Ave & E 72 St
    [1] 30443
    ------------------------------------------------------------ 
    ny$Start.Station: 3 St & 3 Ave
    [1] 19508
    ------------------------------------------------------------ 
    ny$Start.Station: 3 St & 7 Ave
    [1] 32211
    ------------------------------------------------------------ 
    ny$Start.Station: 3 St & Hoyt St
    [1] 12843
    ------------------------------------------------------------ 
    ny$Start.Station: 3 St & Prospect Park West
    [1] 53265
    ------------------------------------------------------------ 
    ny$Start.Station: 31 St & Thomson Ave
    [1] 16424
    ------------------------------------------------------------ 
    ny$Start.Station: 4 Ave & 2 St
    [1] 4203
    ------------------------------------------------------------ 
    ny$Start.Station: 4 Ave & 9 St
    [1] 36526
    ------------------------------------------------------------ 
    ny$Start.Station: 44 Dr & Jackson Ave
    [1] 46997
    ------------------------------------------------------------ 
    ny$Start.Station: 45 Rd & 11 St
    [1] 21379
    ------------------------------------------------------------ 
    ny$Start.Station: 46 Ave & 5 St
    [1] 28690
    ------------------------------------------------------------ 
    ny$Start.Station: 47 Ave & 31 St
    [1] 11524
    ------------------------------------------------------------ 
    ny$Start.Station: 48 Ave & 5 St
    [1] 22031
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & 3 St
    [1] 29612
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 103 St
    [1] 76515
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 29 St
    [1] 108341
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 63 St
    [1] 147794
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 73 St
    [1] 181258
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 78 St
    [1] 141969
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 88 St
    [1] 196460
    ------------------------------------------------------------ 
    ny$Start.Station: 5 Ave & E 93 St
    [1] 137982
    ------------------------------------------------------------ 
    ny$Start.Station: 5 St & 6 Ave
    [1] 14617
    ------------------------------------------------------------ 
    ny$Start.Station: 6 Ave & 12 St
    [1] 15739
    ------------------------------------------------------------ 
    ny$Start.Station: 6 Ave & 9 St
    [1] 12992
    ------------------------------------------------------------ 
    ny$Start.Station: 6 Ave & Broome St
    [1] 10517
    ------------------------------------------------------------ 
    ny$Start.Station: 6 Ave & Canal St
    [1] 103488
    ------------------------------------------------------------ 
    ny$Start.Station: 6 Ave & W 33 St
    [1] 204541
    ------------------------------------------------------------ 
    ny$Start.Station: 6 St & 7 Ave
    [1] 9952
    ------------------------------------------------------------ 
    ny$Start.Station: 7 Ave & Park Pl
    [1] 27840
    ------------------------------------------------------------ 
    ny$Start.Station: 7 St & 3 Ave
    [1] 6687
    ------------------------------------------------------------ 
    ny$Start.Station: 7 St & 5 Ave
    [1] 12181
    ------------------------------------------------------------ 
    ny$Start.Station: 8 Ave & W 16 St
    [1] 178015
    ------------------------------------------------------------ 
    ny$Start.Station: 8 Ave & W 31 St
    [1] 255044
    ------------------------------------------------------------ 
    ny$Start.Station: 8 Ave & W 33 St
    [1] 314485
    ------------------------------------------------------------ 
    ny$Start.Station: 8 Ave & W 52 St
    [1] 120693
    ------------------------------------------------------------ 
    ny$Start.Station: 9 Ave & W 18 St
    [1] 101634
    ------------------------------------------------------------ 
    ny$Start.Station: 9 Ave & W 22 St
    [1] 177168
    ------------------------------------------------------------ 
    ny$Start.Station: 9 Ave & W 28 St
    [1] 116007
    ------------------------------------------------------------ 
    ny$Start.Station: 9 Ave & W 45 St
    [1] 137702
    ------------------------------------------------------------ 
    ny$Start.Station: 9 St & 44 Rd
    [1] 2219
    ------------------------------------------------------------ 
    ny$Start.Station: Adelphi St & Myrtle Ave
    [1] 27220
    ------------------------------------------------------------ 
    ny$Start.Station: Adventures NYC
    [1] 8448
    ------------------------------------------------------------ 
    ny$Start.Station: Albany Ave & Fulton St
    [1] 6088
    ------------------------------------------------------------ 
    ny$Start.Station: Allen St & Hester St
    [1] 114560
    ------------------------------------------------------------ 
    ny$Start.Station: Allen St & Rivington St
    [1] 126222
    ------------------------------------------------------------ 
    ny$Start.Station: Allen St & Stanton St
    [1] 133515
    ------------------------------------------------------------ 
    ny$Start.Station: Amsterdam Ave & W 66 St
    [1] 31010
    ------------------------------------------------------------ 
    ny$Start.Station: Amsterdam Ave & W 73 St
    [1] 140140
    ------------------------------------------------------------ 
    ny$Start.Station: Amsterdam Ave & W 79 St
    [1] 82437
    ------------------------------------------------------------ 
    ny$Start.Station: Amsterdam Ave & W 82 St
    [1] 66272
    ------------------------------------------------------------ 
    ny$Start.Station: Atlantic Ave & Fort Greene Pl
    [1] 34434
    ------------------------------------------------------------ 
    ny$Start.Station: Atlantic Ave & Furman St
    [1] 69704
    ------------------------------------------------------------ 
    ny$Start.Station: Avenue D & E 12 St
    [1] 18958
    ------------------------------------------------------------ 
    ny$Start.Station: Avenue D & E 3 St
    [1] 58052
    ------------------------------------------------------------ 
    ny$Start.Station: Avenue D & E 8 St
    [1] 44950
    ------------------------------------------------------------ 
    ny$Start.Station: Baltic St & 5 Ave
    [1] 21556
    ------------------------------------------------------------ 
    ny$Start.Station: Bank St & Hudson St
    [1] 81763
    ------------------------------------------------------------ 
    ny$Start.Station: Bank St & Washington St
    [1] 112674
    ------------------------------------------------------------ 
    ny$Start.Station: Banker St & Meserole Ave
    [1] 28523
    ------------------------------------------------------------ 
    ny$Start.Station: Barclay St & Church St
    [1] 151055
    ------------------------------------------------------------ 
    ny$Start.Station: Barrow St & Hudson St
    [1] 165254
    ------------------------------------------------------------ 
    ny$Start.Station: Bayard St & Baxter St
    [1] 86546
    ------------------------------------------------------------ 
    ny$Start.Station: Bayard St & Leonard St
    [1] 12189
    ------------------------------------------------------------ 
    ny$Start.Station: Bedford Ave & Nassau Ave
    [1] 136096
    ------------------------------------------------------------ 
    ny$Start.Station: Bedford Ave & S 9 St
    [1] 14357
    ------------------------------------------------------------ 
    ny$Start.Station: Bergen St & Flatbush Ave
    [1] 31966
    ------------------------------------------------------------ 
    ny$Start.Station: Bergen St & Smith St
    [1] 79544
    ------------------------------------------------------------ 
    ny$Start.Station: Berkeley Pl & 6 Ave
    [1] 21804
    ------------------------------------------------------------ 
    ny$Start.Station: Berkeley Pl & 7 Ave
    [1] 38052
    ------------------------------------------------------------ 
    ny$Start.Station: Berry St & N 8 St
    [1] 59708
    ------------------------------------------------------------ 
    ny$Start.Station: Bialystoker Pl & Delancey St
    [1] 51835
    ------------------------------------------------------------ 
    ny$Start.Station: Bike The Branches - Central Branch
    [1] 2285
    ------------------------------------------------------------ 
    ny$Start.Station: Boerum St & Broadway
    [1] 18996
    ------------------------------------------------------------ 
    ny$Start.Station: Bond St & Bergen St
    [1] 18543
    ------------------------------------------------------------ 
    ny$Start.Station: Bond St & Fulton St
    [1] 42616
    ------------------------------------------------------------ 
    ny$Start.Station: Bond St & Schermerhorn St
    [1] 29362
    ------------------------------------------------------------ 
    ny$Start.Station: Broad St & Bridge St
    [1] 59485
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & Battery Pl
    [1] 166763
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & Berry St
    [1] 60175
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & E 14 St
    [1] 157613
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & E 22 St
    [1] 271431
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & Roebling St
    [1] 36762
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 24 St
    [1] 167447
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 29 St
    [1] 155642
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 32 St
    [1] 120023
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 36 St
    [1] 93133
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 37 St
    [1] 26727
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 39 St
    [1] 83416
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 41 St
    [1] 123359
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 49 St
    [1] 168381
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 51 St
    [1] 138910
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 53 St
    [1] 97640
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 55 St
    [1] 40265
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 56 St
    [1] 100501
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 58 St
    [1] 187920
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & W 60 St
    [1] 167365
    ------------------------------------------------------------ 
    ny$Start.Station: Broadway & Whipple St
    [1] 16834
    ------------------------------------------------------------ 
    ny$Start.Station: Brooklyn Bridge Park - Pier 2
    [1] 68991
    ------------------------------------------------------------ 
    ny$Start.Station: Bus Slip & State St
    [1] 112408
    ------------------------------------------------------------ 
    ny$Start.Station: Bushwick Ave & Powers St
    [1] 25235
    ------------------------------------------------------------ 
    ny$Start.Station: Butler St & Court St
    [1] 15566
    ------------------------------------------------------------ 
    ny$Start.Station: Cadman Plaza E & Red Cross Pl
    [1] 55155
    ------------------------------------------------------------ 
    ny$Start.Station: Cadman Plaza E & Tillary St
    [1] 81771
    ------------------------------------------------------------ 
    ny$Start.Station: Cadman Plaza West & Montague St
    [1] 26121
    ------------------------------------------------------------ 
    ny$Start.Station: Cambridge Pl & Gates Ave
    [1] 23650
    ------------------------------------------------------------ 
    ny$Start.Station: Canal St & Rutgers St
    [1] 111715
    ------------------------------------------------------------ 
    ny$Start.Station: Carlton Ave & Flushing Ave
    [1] 43604
    ------------------------------------------------------------ 
    ny$Start.Station: Carlton Ave & Park Ave
    [1] 20079
    ------------------------------------------------------------ 
    ny$Start.Station: Carmine St & 6 Ave
    [1] 198724
    ------------------------------------------------------------ 
    ny$Start.Station: Carroll St & 5 Ave
    [1] 19179
    ------------------------------------------------------------ 
    ny$Start.Station: Carroll St & 6 Ave
    [1] 19489
    ------------------------------------------------------------ 
    ny$Start.Station: Carroll St & Bond St
    [1] 21296
    ------------------------------------------------------------ 
    ny$Start.Station: Carroll St & Columbia St
    [1] 20914
    ------------------------------------------------------------ 
    ny$Start.Station: Carroll St & Smith St
    [1] 55434
    ------------------------------------------------------------ 
    ny$Start.Station: Cathedral Pkwy & Broadway
    [1] 175258
    ------------------------------------------------------------ 
    ny$Start.Station: Catherine St & Monroe St
    [1] 54131
    ------------------------------------------------------------ 
    ny$Start.Station: Center Blvd & Borden Ave
    [1] 28746
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park North & Adam Clayton Powell Blvd
    [1] 228182
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park S & 6 Ave
    [1] 384251
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park W & W 96 St
    [1] 213007
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park West & W 100 St
    [1] 131006
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park West & W 102 St
    [1] 34830
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park West & W 68 St
    [1] 145155
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park West & W 72 St
    [1] 223333
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park West & W 76 St
    [1] 136210
    ------------------------------------------------------------ 
    ny$Start.Station: Central Park West & W 85 St
    [1] 149165
    ------------------------------------------------------------ 
    ny$Start.Station: Centre St & Chambers St
    [1] 354565
    ------------------------------------------------------------ 
    ny$Start.Station: Centre St & Worth St
    [1] 80347
    ------------------------------------------------------------ 
    ny$Start.Station: Cherry St
    [1] 66203
    ------------------------------------------------------------ 
    ny$Start.Station: Christopher St & Greenwich St
    [1] 241004
    ------------------------------------------------------------ 
    ny$Start.Station: Clark St & Henry St
    [1] 51329
    ------------------------------------------------------------ 
    ny$Start.Station: Clermont Ave & Lafayette Ave
    [1] 21984
    ------------------------------------------------------------ 
    ny$Start.Station: Clermont Ave & Park Ave
    [1] 25396
    ------------------------------------------------------------ 
    ny$Start.Station: Cleveland Pl & Spring St
    [1] 228557
    ------------------------------------------------------------ 
    ny$Start.Station: Cliff St & Fulton St
    [1] 72910
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton Ave & Flushing Ave
    [1] 36066
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton Ave & Myrtle Ave
    [1] 143874
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton St & 4 Place
    [1] 23060
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton St & Centre St
    [1] 5673
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton St & Grand St
    [1] 70197
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton St & Joralemon St
    [1] 62241
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton St & Tillary St
    [1] 29320
    ------------------------------------------------------------ 
    ny$Start.Station: Clinton St & Union St
    [1] 23720
    ------------------------------------------------------------ 
    ny$Start.Station: Coffey St & Conover St
    [1] 9212
    ------------------------------------------------------------ 
    ny$Start.Station: Columbia Heights & Cranberry St
    [1] 40697
    ------------------------------------------------------------ 
    ny$Start.Station: Columbia St & Degraw St
    [1] 21310
    ------------------------------------------------------------ 
    ny$Start.Station: Columbia St & Kane St
    [1] 32083
    ------------------------------------------------------------ 
    ny$Start.Station: Columbia St & Lorraine St
    [1] 2186
    ------------------------------------------------------------ 
    ny$Start.Station: Columbia St & Rivington St
    [1] 59103
    ------------------------------------------------------------ 
    ny$Start.Station: Columbia St & W 9 St
    [1] 7804
    ------------------------------------------------------------ 
    ny$Start.Station: Columbus Ave & W 103 St
    [1] 15386
    ------------------------------------------------------------ 
    ny$Start.Station: Columbus Ave & W 72 St
    [1] 153993
    ------------------------------------------------------------ 
    ny$Start.Station: Columbus Ave & W 95 St
    [1] 43164
    ------------------------------------------------------------ 
    ny$Start.Station: Commerce St & Van Brunt St
    [1] 14259
    ------------------------------------------------------------ 
    ny$Start.Station: Concord St & Bridge St
    [1] 23857
    ------------------------------------------------------------ 
    ny$Start.Station: Congress St & Clinton St
    [1] 22795
    ------------------------------------------------------------ 
    ny$Start.Station: Cooper Square & E 7 St
    [1] 148067
    ------------------------------------------------------------ 
    ny$Start.Station: Court St & Nelson St
    [1] 16925
    ------------------------------------------------------------ 
    ny$Start.Station: Court St & State St
    [1] 48957
    ------------------------------------------------------------ 
    ny$Start.Station: Cumberland St & Lafayette Ave
    [1] 28173
    ------------------------------------------------------------ 
    ny$Start.Station: Dean St & 4 Ave
    [1] 28657
    ------------------------------------------------------------ 
    ny$Start.Station: Dean St & Hoyt St
    [1] 19848
    ------------------------------------------------------------ 
    ny$Start.Station: Degraw St & Hoyt St
    [1] 10972
    ------------------------------------------------------------ 
    ny$Start.Station: Degraw St & Smith St
    [1] 22636
    ------------------------------------------------------------ 
    ny$Start.Station: DeKalb Ave & Hudson Ave
    [1] 42849
    ------------------------------------------------------------ 
    ny$Start.Station: DeKalb Ave & S Portland Ave
    [1] 18975
    ------------------------------------------------------------ 
    ny$Start.Station: DeKalb Ave & Skillman St
    [1] 17250
    ------------------------------------------------------------ 
    ny$Start.Station: DeKalb Ave & Vanderbilt Ave
    [1] 26100
    ------------------------------------------------------------ 
    ny$Start.Station: Devoe St & Lorimer St
    [1] 28809
    ------------------------------------------------------------ 
    ny$Start.Station: Division Ave & Hooper St
    [1] 12514
    ------------------------------------------------------------ 
    ny$Start.Station: Division Ave & Marcy Ave
    [1] 12770
    ------------------------------------------------------------ 
    ny$Start.Station: Division St & Bowery
    [1] 71388
    ------------------------------------------------------------ 
    ny$Start.Station: Douglass St & 3 Ave
    [1] 20084
    ------------------------------------------------------------ 
    ny$Start.Station: Douglass St & 4 Ave
    [1] 13855
    ------------------------------------------------------------ 
    ny$Start.Station: Driggs Ave & Lorimer St
    [1] 30951
    ------------------------------------------------------------ 
    ny$Start.Station: Driggs Ave & N Henry St
    [1] 27489
    ------------------------------------------------------------ 
    ny$Start.Station: Duane St & Greenwich St
    [1] 80958
    ------------------------------------------------------------ 
    ny$Start.Station: Duffield St & Willoughby St
    [1] 55632
    ------------------------------------------------------------ 
    ny$Start.Station: Dwight St & Van Dyke St
    [1] 4380
    ------------------------------------------------------------ 
    ny$Start.Station: E 10 St & 5 Ave
    [1] 121338
    ------------------------------------------------------------ 
    ny$Start.Station: E 10 St & Avenue A
    [1] 154309
    ------------------------------------------------------------ 
    ny$Start.Station: E 102 St & 1 Ave
    [1] 35890
    ------------------------------------------------------------ 
    ny$Start.Station: E 102 St & Park Ave
    [1] 11842
    ------------------------------------------------------------ 
    ny$Start.Station: E 103 St & Lexington Ave
    [1] 18016
    ------------------------------------------------------------ 
    ny$Start.Station: E 106 St & 1 Ave
    [1] 9632
    ------------------------------------------------------------ 
    ny$Start.Station: E 106 St & Lexington Ave
    [1] 13294
    ------------------------------------------------------------ 
    ny$Start.Station: E 106 St & Madison Ave
    [1] 15219
    ------------------------------------------------------------ 
    ny$Start.Station: E 109 St & 3 Ave
    [1] 39207
    ------------------------------------------------------------ 
    ny$Start.Station: E 11 St & 1 Ave
    [1] 96993
    ------------------------------------------------------------ 
    ny$Start.Station: E 11 St & 2 Ave
    [1] 135614
    ------------------------------------------------------------ 
    ny$Start.Station: E 11 St & Broadway
    [1] 74678
    ------------------------------------------------------------ 
    ny$Start.Station: E 110 St & Madison Ave
    [1] 66675
    ------------------------------------------------------------ 
    ny$Start.Station: E 12 St & 3 Ave
    [1] 150453
    ------------------------------------------------------------ 
    ny$Start.Station: E 13 St & Avenue A
    [1] 117406
    ------------------------------------------------------------ 
    ny$Start.Station: E 14 St & Avenue B
    [1] 145239
    ------------------------------------------------------------ 
    ny$Start.Station: E 15 St & 3 Ave
    [1] 146105
    ------------------------------------------------------------ 
    ny$Start.Station: E 16 St & 5 Ave
    [1] 159246
    ------------------------------------------------------------ 
    ny$Start.Station: E 16 St & Irving Pl
    [1] 62732
    ------------------------------------------------------------ 
    ny$Start.Station: E 17 St & Broadway
    [1] 247461
    ------------------------------------------------------------ 
    ny$Start.Station: E 19 St & 3 Ave
    [1] 81206
    ------------------------------------------------------------ 
    ny$Start.Station: E 2 St & 2 Ave
    [1] 96157
    ------------------------------------------------------------ 
    ny$Start.Station: E 2 St & 2 Ave E
    [1] 17949
    ------------------------------------------------------------ 
    ny$Start.Station: E 2 St & Avenue B
    [1] 123005
    ------------------------------------------------------------ 
    ny$Start.Station: E 2 St & Avenue C
    [1] 69608
    ------------------------------------------------------------ 
    ny$Start.Station: E 20 St & 2 Ave
    [1] 131469
    ------------------------------------------------------------ 
    ny$Start.Station: E 20 St & FDR Drive
    [1] 113474
    ------------------------------------------------------------ 
    ny$Start.Station: E 20 St & Park Ave
    [1] 112051
    ------------------------------------------------------------ 
    ny$Start.Station: E 23 St & 1 Ave
    [1] 135596
    ------------------------------------------------------------ 
    ny$Start.Station: E 24 St & Park Ave S
    [1] 130119
    ------------------------------------------------------------ 
    ny$Start.Station: E 25 St & 1 Ave
    [1] 101592
    ------------------------------------------------------------ 
    ny$Start.Station: E 25 St & 2 Ave
    [1] 124764
    ------------------------------------------------------------ 
    ny$Start.Station: E 27 St & 1 Ave
    [1] 120334
    ------------------------------------------------------------ 
    ny$Start.Station: E 3 St & 1 Ave
    [1] 93886
    ------------------------------------------------------------ 
    ny$Start.Station: E 30 St & Park Ave S
    [1] 113469
    ------------------------------------------------------------ 
    ny$Start.Station: E 31 St & 3 Ave
    [1] 101461
    ------------------------------------------------------------ 
    ny$Start.Station: E 32 St & Park Ave
    [1] 138011
    ------------------------------------------------------------ 
    ny$Start.Station: E 33 St & 2 Ave
    [1] 153875
    ------------------------------------------------------------ 
    ny$Start.Station: E 33 St & 5 Ave
    [1] 149432
    ------------------------------------------------------------ 
    ny$Start.Station: E 35 St & 3 Ave
    [1] 59024
    ------------------------------------------------------------ 
    ny$Start.Station: E 39 St & 2 Ave
    [1] 157838
    ------------------------------------------------------------ 
    ny$Start.Station: E 39 St & 3 Ave
    [1] 124872
    ------------------------------------------------------------ 
    ny$Start.Station: E 4 St & 2 Ave
    [1] 108621
    ------------------------------------------------------------ 
    ny$Start.Station: E 40 St & 5 Ave
    [1] 134552
    ------------------------------------------------------------ 
    ny$Start.Station: E 41 St & Madison Ave
    [1] 42985
    ------------------------------------------------------------ 
    ny$Start.Station: E 43 St & 2 Ave
    [1] 14504
    ------------------------------------------------------------ 
    ny$Start.Station: E 44 St & 2 Ave
    [1] 49630
    ------------------------------------------------------------ 
    ny$Start.Station: E 45 St & 3 Ave
    [1] 86699
    ------------------------------------------------------------ 
    ny$Start.Station: E 47 St & 1 Ave
    [1] 90311
    ------------------------------------------------------------ 
    ny$Start.Station: E 47 St & 2 Ave
    [1] 92456
    ------------------------------------------------------------ 
    ny$Start.Station: E 47 St & Park Ave
    [1] 189361
    ------------------------------------------------------------ 
    ny$Start.Station: E 48 St & 3 Ave
    [1] 76615
    ------------------------------------------------------------ 
    ny$Start.Station: E 48 St & 5 Ave
    [1] 116843
    ------------------------------------------------------------ 
    ny$Start.Station: E 5 St & Avenue C
    [1] 46234
    ------------------------------------------------------------ 
    ny$Start.Station: E 51 St & 1 Ave
    [1] 54755
    ------------------------------------------------------------ 
    ny$Start.Station: E 51 St & Lexington Ave
    [1] 95878
    ------------------------------------------------------------ 
    ny$Start.Station: E 52 St & 2 Ave
    [1] 82575
    ------------------------------------------------------------ 
    ny$Start.Station: E 53 St & 3 Ave
    [1] 29645
    ------------------------------------------------------------ 
    ny$Start.Station: E 53 St & Lexington Ave
    [1] 3441
    ------------------------------------------------------------ 
    ny$Start.Station: E 53 St & Madison Ave
    [1] 63761
    ------------------------------------------------------------ 
    ny$Start.Station: E 55 St & 2 Ave
    [1] 132021
    ------------------------------------------------------------ 
    ny$Start.Station: E 55 St & 3 Ave
    [1] 129443
    ------------------------------------------------------------ 
    ny$Start.Station: E 55 St & Lexington Ave
    [1] 72440
    ------------------------------------------------------------ 
    ny$Start.Station: E 58 St & 1 Ave
    [1] 41270
    ------------------------------------------------------------ 
    ny$Start.Station: E 58 St & 3 Ave
    [1] 194226
    ------------------------------------------------------------ 
    ny$Start.Station: E 58 St & Madison Ave
    [1] 32546
    ------------------------------------------------------------ 
    ny$Start.Station: E 59 St & Madison Ave
    [1] 54858
    ------------------------------------------------------------ 
    ny$Start.Station: E 6 St & Avenue B
    [1] 91983
    ------------------------------------------------------------ 
    ny$Start.Station: E 6 St & Avenue D
    [1] 51202
    ------------------------------------------------------------ 
    ny$Start.Station: E 60 St & York Ave
    [1] 60805
    ------------------------------------------------------------ 
    ny$Start.Station: E 61 St & Park Ave
    [1] 4520
    ------------------------------------------------------------ 
    ny$Start.Station: E 65 St & 2 Ave
    [1] 37127
    ------------------------------------------------------------ 
    ny$Start.Station: E 66 St & Madison Ave
    [1] 37381
    ------------------------------------------------------------ 
    ny$Start.Station: E 67 St & Park Ave
    [1] 36335
    ------------------------------------------------------------ 
    ny$Start.Station: E 68 St & 3 Ave
    [1] 29902
    ------------------------------------------------------------ 
    ny$Start.Station: E 68 St & Madison Ave
    [1] 28606
    ------------------------------------------------------------ 
    ny$Start.Station: E 7 St & Avenue A
    [1] 165497
    ------------------------------------------------------------ 
    ny$Start.Station: E 71 St & 1 Ave
    [1] 50049
    ------------------------------------------------------------ 
    ny$Start.Station: E 72 St & Park Ave
    [1] 52390
    ------------------------------------------------------------ 
    ny$Start.Station: E 72 St & York Ave
    [1] 76219
    ------------------------------------------------------------ 
    ny$Start.Station: E 74 St & 1 Ave
    [1] 29212
    ------------------------------------------------------------ 
    ny$Start.Station: E 75 St & 3 Ave
    [1] 44089
    ------------------------------------------------------------ 
    ny$Start.Station: E 76 St & 3 Ave
    [1] 34532
    ------------------------------------------------------------ 
    ny$Start.Station: E 76 St & Park Ave
    [1] 61183
    ------------------------------------------------------------ 
    ny$Start.Station: E 78 St & 2 Ave
    [1] 66299
    ------------------------------------------------------------ 
    ny$Start.Station: E 80 St & 2 Ave
    [1] 35549
    ------------------------------------------------------------ 
    ny$Start.Station: E 81 St & 3 Ave
    [1] 46799
    ------------------------------------------------------------ 
    ny$Start.Station: E 81 St & Park Ave
    [1] 22869
    ------------------------------------------------------------ 
    ny$Start.Station: E 81 St & York Ave
    [1] 62586
    ------------------------------------------------------------ 
    ny$Start.Station: E 82 St & East End Ave
    [1] 4745
    ------------------------------------------------------------ 
    ny$Start.Station: E 84 St & 1 Ave
    [1] 37885
    ------------------------------------------------------------ 
    ny$Start.Station: E 84 St & Park Ave
    [1] 44725
    ------------------------------------------------------------ 
    ny$Start.Station: E 85 St & 3 Ave
    [1] 91581
    ------------------------------------------------------------ 
    ny$Start.Station: E 85 St & York Ave
    [1] 52173
    ------------------------------------------------------------ 
    ny$Start.Station: E 88 St & 1 Ave
    [1] 48886
    ------------------------------------------------------------ 
    ny$Start.Station: E 88 St & Park Ave
    [1] 42201
    ------------------------------------------------------------ 
    ny$Start.Station: E 89 St & 3 Ave
    [1] 43694
    ------------------------------------------------------------ 
    ny$Start.Station: E 89 St & York Ave
    [1] 57634
    ------------------------------------------------------------ 
    ny$Start.Station: E 9 St & Avenue C
    [1] 96699
    ------------------------------------------------------------ 
    ny$Start.Station: E 91 St & 2 Ave
    [1] 65795
    ------------------------------------------------------------ 
    ny$Start.Station: E 91 St & Park Ave
    [1] 40289
    ------------------------------------------------------------ 
    ny$Start.Station: E 95 St & 3 Ave
    [1] 20874
    ------------------------------------------------------------ 
    ny$Start.Station: E 97 St & 3 Ave
    [1] 9535
    ------------------------------------------------------------ 
    ny$Start.Station: E 97 St & Madison Ave
    [1] 54854
    ------------------------------------------------------------ 
    ny$Start.Station: East End Ave & E 86 St
    [1] 33364
    ------------------------------------------------------------ 
    ny$Start.Station: Eckford St & Engert Ave
    [1] 7841
    ------------------------------------------------------------ 
    ny$Start.Station: Emerson Pl & Myrtle Ave
    [1] 40996
    ------------------------------------------------------------ 
    ny$Start.Station: FDR Drive & E 35 St
    [1] 189407
    ------------------------------------------------------------ 
    ny$Start.Station: Forsyth St & Broome St
    [1] 118683
    ------------------------------------------------------------ 
    ny$Start.Station: Forsyth St & Canal St
    [1] 114236
    ------------------------------------------------------------ 
    ny$Start.Station: Franklin Ave & Myrtle Ave
    [1] 16503
    ------------------------------------------------------------ 
    ny$Start.Station: Franklin St & Dupont St
    [1] 20865
    ------------------------------------------------------------ 
    ny$Start.Station: Franklin St & W Broadway
    [1] 72462
    ------------------------------------------------------------ 
    ny$Start.Station: Front St & Gold St
    [1] 19696
    ------------------------------------------------------------ 
    ny$Start.Station: Front St & Maiden Ln
    [1] 101233
    ------------------------------------------------------------ 
    ny$Start.Station: Front St & Washington St
    [1] 70283
    ------------------------------------------------------------ 
    ny$Start.Station: Frost St & Meeker St
    [1] 8667
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Adams St
    [1] 74444
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Broadway
    [1] 92406
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Clermont Ave
    [1] 24183
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Grand Ave
    [1] 16117
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Rockwell Pl
    [1] 23194
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Utica Ave
    [1] 25581
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & Washington Ave
    [1] 89479
    ------------------------------------------------------------ 
    ny$Start.Station: Fulton St & William St
    [1] 80863
    ------------------------------------------------------------ 
    ny$Start.Station: Garfield Pl & 8 Ave
    [1] 19679
    ------------------------------------------------------------ 
    ny$Start.Station: Graham Ave & Conselyea St
    [1] 47102
    ------------------------------------------------------------ 
    ny$Start.Station: Graham Ave & Grand St
    [1] 19398
    ------------------------------------------------------------ 
    ny$Start.Station: Graham Ave & Herbert St
    [1] 11996
    ------------------------------------------------------------ 
    ny$Start.Station: Graham Ave & Withers St
    [1] 19300
    ------------------------------------------------------------ 
    ny$Start.Station: Grand Army Plaza & Central Park S
    [1] 507024
    ------------------------------------------------------------ 
    ny$Start.Station: Grand Army Plaza & Plaza St West
    [1] 113376
    ------------------------------------------------------------ 
    ny$Start.Station: Grand St & Elizabeth St
    [1] 265466
    ------------------------------------------------------------ 
    ny$Start.Station: Grand St & Greene St
    [1] 93222
    ------------------------------------------------------------ 
    ny$Start.Station: Grand St & Havemeyer St
    [1] 20235
    ------------------------------------------------------------ 
    ny$Start.Station: Great Jones St
    [1] 182141
    ------------------------------------------------------------ 
    ny$Start.Station: Greene Ave & Nostrand Ave
    [1] 13041
    ------------------------------------------------------------ 
    ny$Start.Station: Greene Ave & Throop Ave
    [1] 16453
    ------------------------------------------------------------ 
    ny$Start.Station: Greenpoint Ave & Manhattan Ave
    [1] 34013
    ------------------------------------------------------------ 
    ny$Start.Station: Greenwich Ave & 8 Ave
    [1] 217619
    ------------------------------------------------------------ 
    ny$Start.Station: Greenwich Ave & Charles St
    [1] 102395
    ------------------------------------------------------------ 
    ny$Start.Station: Greenwich St & Hubert St
    [1] 79853
    ------------------------------------------------------------ 
    ny$Start.Station: Greenwich St & W Houston St
    [1] 136062
    ------------------------------------------------------------ 
    ny$Start.Station: Greenwich St & Warren St
    [1] 22525
    ------------------------------------------------------------ 
    ny$Start.Station: Halsey St & Tompkins Ave
    [1] 16305
    ------------------------------------------------------------ 
    ny$Start.Station: Hancock St & Bedford Ave
    [1] 12900
    ------------------------------------------------------------ 
    ny$Start.Station: Hanson Pl & Ashland Pl
    [1] 82466
    ------------------------------------------------------------ 
    ny$Start.Station: Harrison St & Hudson St
    [1] 51540
    ------------------------------------------------------------ 
    ny$Start.Station: Henry St & Atlantic Ave
    [1] 47222
    ------------------------------------------------------------ 
    ny$Start.Station: Henry St & Bay St
    [1] 4070
    ------------------------------------------------------------ 
    ny$Start.Station: Henry St & Degraw St
    [1] 14324
    ------------------------------------------------------------ 
    ny$Start.Station: Henry St & Grand St
    [1] 91474
    ------------------------------------------------------------ 
    ny$Start.Station: Henry St & Poplar St
    [1] 29327
    ------------------------------------------------------------ 
    ny$Start.Station: Henry St & W 9 St
    [1] 4530
    ------------------------------------------------------------ 
    ny$Start.Station: Hicks St & Montague St
    [1] 57956
    ------------------------------------------------------------ 
    ny$Start.Station: Hope St & Union Ave
    [1] 1109052
    ------------------------------------------------------------ 
    ny$Start.Station: Howard St & Centre St
    [1] 100834
    ------------------------------------------------------------ 
    ny$Start.Station: Hoyt St & Warren St
    [1] 6137
    ------------------------------------------------------------ 
    ny$Start.Station: Hudson St & Reade St
    [1] 69015
    ------------------------------------------------------------ 
    ny$Start.Station: Humboldt St & Varet St
    [1] 21621
    ------------------------------------------------------------ 
    ny$Start.Station: Huron St & Franklin St
    [1] 26503
    ------------------------------------------------------------ 
    ny$Start.Station: India St & East River
    [1] 2503
    ------------------------------------------------------------ 
    ny$Start.Station: India St & Manhattan Ave
    [1] 34319
    ------------------------------------------------------------ 
    ny$Start.Station: India St & West St
    [1] 12762
    ------------------------------------------------------------ 
    ny$Start.Station: Industry City, Building 1 Basement
    [1] 5570
    ------------------------------------------------------------ 
    ny$Start.Station: Jackson Ave & 46 Rd
    [1] 21529
    ------------------------------------------------------------ 
    ny$Start.Station: Jackson St & Leonard St
    [1] 4473
    ------------------------------------------------------------ 
    ny$Start.Station: Jay St & Tech Pl
    [1] 69182
    ------------------------------------------------------------ 
    ny$Start.Station: John St & William St
    [1] 48211
    ------------------------------------------------------------ 
    ny$Start.Station: Johnson St & Gold St
    [1] 44872
    ------------------------------------------------------------ 
    ny$Start.Station: Kane St & Clinton St
    [1] 17495
    ------------------------------------------------------------ 
    ny$Start.Station: Kent Ave & N 7 St
    [1] 98953
    ------------------------------------------------------------ 
    ny$Start.Station: Kent Ave & S 11 St
    [1] 517022
    ------------------------------------------------------------ 
    ny$Start.Station: Kingston Ave & Herkimer St
    [1] 69640
    ------------------------------------------------------------ 
    ny$Start.Station: Kosciuszko St & Nostrand Ave
    [1] 8984
    ------------------------------------------------------------ 
    ny$Start.Station: Kosciuszko St & Tompkins Ave
    [1] 19549
    ------------------------------------------------------------ 
    ny$Start.Station: Lafayette Ave & Classon Ave
    [1] 30579
    ------------------------------------------------------------ 
    ny$Start.Station: Lafayette Ave & Fort Greene Pl
    [1] 43144
    ------------------------------------------------------------ 
    ny$Start.Station: Lafayette Ave & St James Pl
    [1] 77677
    ------------------------------------------------------------ 
    ny$Start.Station: Lafayette St & E 8 St
    [1] 158182
    ------------------------------------------------------------ 
    ny$Start.Station: Lafayette St & Jersey St
    [1] 167095
    ------------------------------------------------------------ 
    ny$Start.Station: LaGuardia Pl & W 3 St
    [1] 156455
    ------------------------------------------------------------ 
    ny$Start.Station: Laight St & Hudson St
    [1] 21487
    ------------------------------------------------------------ 
    ny$Start.Station: Lawrence St & Willoughby St
    [1] 74144
    ------------------------------------------------------------ 
    ny$Start.Station: Lefferts Pl & Franklin Ave
    [1] 42482
    ------------------------------------------------------------ 
    ny$Start.Station: Leonard St & Boerum St
    [1] 21590
    ------------------------------------------------------------ 
    ny$Start.Station: Leonard St & Church St
    [1] 74155
    ------------------------------------------------------------ 
    ny$Start.Station: Leonard St & Maujer St
    [1] 16673
    ------------------------------------------------------------ 
    ny$Start.Station: Lewis Ave & Decatur St
    [1] 10347
    ------------------------------------------------------------ 
    ny$Start.Station: Lewis Ave & Kosciuszko St
    [1] 23567
    ------------------------------------------------------------ 
    ny$Start.Station: Lewis Ave & Madison St
    [1] 19523
    ------------------------------------------------------------ 
    ny$Start.Station: Lexington Ave & Classon Ave
    [1] 26644
    ------------------------------------------------------------ 
    ny$Start.Station: Lexington Ave & E 24 St
    [1] 261274
    ------------------------------------------------------------ 
    ny$Start.Station: Lexington Ave & E 29 St
    [1] 105462
    ------------------------------------------------------------ 
    ny$Start.Station: Lexington Ave & E 63 St
    [1] 80130
    ------------------------------------------------------------ 
    ny$Start.Station: Liberty St & Broadway
    [1] 119518
    ------------------------------------------------------------ 
    ny$Start.Station: Lispenard St & Broadway
    [1] 90341
    ------------------------------------------------------------ 
    ny$Start.Station: Little West St & 1 Pl
    [1] 208664
    ------------------------------------------------------------ 
    ny$Start.Station: Lorimer St & Broadway
    [1] 6043
    ------------------------------------------------------------ 
    ny$Start.Station: MacDougal St & Prince St
    [1] 212531
    ------------------------------------------------------------ 
    ny$Start.Station: MacDougal St & Washington Sq
    [1] 94702
    ------------------------------------------------------------ 
    ny$Start.Station: Macon St & Nostrand Ave
    [1] 31316
    ------------------------------------------------------------ 
    ny$Start.Station: Madison Ave & E 82 St
    [1] 62012
    ------------------------------------------------------------ 
    ny$Start.Station: Madison Ave & E 99 St
    [1] 25470
    ------------------------------------------------------------ 
    ny$Start.Station: Madison St & Clinton St
    [1] 42325
    ------------------------------------------------------------ 
    ny$Start.Station: Madison St & Montgomery St
    [1] 42254
    ------------------------------------------------------------ 
    ny$Start.Station: Maiden Ln & Pearl St
    [1] 85347
    ------------------------------------------------------------ 
    ny$Start.Station: Marcus Garvey Blvd & Macon St
    [1] 17467
    ------------------------------------------------------------ 
    ny$Start.Station: Marcy Ave & Lafayette Ave
    [1] 3520
    ------------------------------------------------------------ 
    ny$Start.Station: Market St & Cherry St
    [1] 33165
    ------------------------------------------------------------ 
    ny$Start.Station: McGuinness Blvd & Eagle St
    [1] 26647
    ------------------------------------------------------------ 
    ny$Start.Station: McKibbin St & Manhattan Ave
    [1] 7091
    ------------------------------------------------------------ 
    ny$Start.Station: Mercer St & Bleecker St
    [1] 128333
    ------------------------------------------------------------ 
    ny$Start.Station: Mercer St & Spring St
    [1] 122772
    ------------------------------------------------------------ 
    ny$Start.Station: Meserole Ave & Manhattan Ave
    [1] 26988
    ------------------------------------------------------------ 
    ny$Start.Station: Metropolitan Ave & Bedford Ave
    [1] 75317
    ------------------------------------------------------------ 
    ny$Start.Station: Metropolitan Ave & Meeker Ave
    [1] 225481
    ------------------------------------------------------------ 
    ny$Start.Station: Milton St & Franklin St
    [1] 62928
    ------------------------------------------------------------ 
    ny$Start.Station: Monroe St & Bedford Ave
    [1] 13958
    ------------------------------------------------------------ 
    ny$Start.Station: Monroe St & Classon Ave
    [1] 18002
    ------------------------------------------------------------ 
    ny$Start.Station: Monroe St & Tompkins Ave
    [1] 20017
    ------------------------------------------------------------ 
    ny$Start.Station: Montague St & Clinton St
    [1] 8210
    ------------------------------------------------------------ 
    ny$Start.Station: Montrose Ave & Bushwick Ave
    [1] 55956
    ------------------------------------------------------------ 
    ny$Start.Station: Mott St & Prince St
    [1] 131710
    ------------------------------------------------------------ 
    ny$Start.Station: Murray St & Greenwich St
    [1] 39000
    ------------------------------------------------------------ 
    ny$Start.Station: Murray St & West St
    [1] 134002
    ------------------------------------------------------------ 
    ny$Start.Station: Myrtle Ave & Lewis Ave
    [1] 70162
    ------------------------------------------------------------ 
    ny$Start.Station: Myrtle Ave & Marcy Ave
    [1] 8497
    ------------------------------------------------------------ 
    ny$Start.Station: Myrtle Ave & St Edwards St
    [1] 10247
    ------------------------------------------------------------ 
    ny$Start.Station: N 11 St & Wythe Ave
    [1] 23334
    ------------------------------------------------------------ 
    ny$Start.Station: N 12 St & Bedford Ave
    [1] 42967
    ------------------------------------------------------------ 
    ny$Start.Station: N 15 St & Wythe Ave
    [1] 19072
    ------------------------------------------------------------ 
    ny$Start.Station: N 6 St & Bedford Ave
    [1] 73026
    ------------------------------------------------------------ 
    ny$Start.Station: N 8 St & Driggs Ave
    [1] 48051
    ------------------------------------------------------------ 
    ny$Start.Station: Nassau Ave & Newell St
    [1] 29377
    ------------------------------------------------------------ 
    ny$Start.Station: Nassau Ave & Russell St
    [1] 49356
    ------------------------------------------------------------ 
    ny$Start.Station: Nassau St & Navy St
    [1] 35049
    ------------------------------------------------------------ 
    ny$Start.Station: Norfolk St & Broome St
    [1] 87713
    ------------------------------------------------------------ 
    ny$Start.Station: Norman Ave & Leonard St
    [1] 4240
    ------------------------------------------------------------ 
    ny$Start.Station: Norman Ave & Leonard St - 2
    [1] 23668
    ------------------------------------------------------------ 
    ny$Start.Station: Nostrand Ave & Myrtle Ave
    [1] 14376
    ------------------------------------------------------------ 
    ny$Start.Station: NYCBS Depot - SSP
    [1] 7005
    ------------------------------------------------------------ 
    ny$Start.Station: NYCBS Depot - STY
    [1] 392
    ------------------------------------------------------------ 
    ny$Start.Station: NYCBS Depot - STY - Garage 4
    [1] 330
    ------------------------------------------------------------ 
    ny$Start.Station: Old Fulton St
    [1] 151822
    ------------------------------------------------------------ 
    ny$Start.Station: Old Slip & Front St
    [1] 51073
    ------------------------------------------------------------ 
    ny$Start.Station: Pacific St & Nevins St
    [1] 19517
    ------------------------------------------------------------ 
    ny$Start.Station: Park Ave & Marcus Garvey Blvd
    [1] 5387
    ------------------------------------------------------------ 
    ny$Start.Station: Park Ave & St Edwards St
    [1] 10189
    ------------------------------------------------------------ 
    ny$Start.Station: Pearl St & Anchorage Pl
    [1] 60570
    ------------------------------------------------------------ 
    ny$Start.Station: Pearl St & Hanover Square
    [1] 84933
    ------------------------------------------------------------ 
    ny$Start.Station: Peck Slip & Front St
    [1] 156685
    ------------------------------------------------------------ 
    ny$Start.Station: Penn Station Valet
    [1] 19016
    ------------------------------------------------------------ 
    ny$Start.Station: Penn Station Valet - Valet Scan
    [1] 4637
    ------------------------------------------------------------ 
    ny$Start.Station: Perry St & Bleecker St
    [1] 66569
    ------------------------------------------------------------ 
    ny$Start.Station: Pershing Square North
    [1] 445087
    ------------------------------------------------------------ 
    ny$Start.Station: Pershing Square South
    [1] 135494
    ------------------------------------------------------------ 
    ny$Start.Station: Pier 40 - Hudson River Park
    [1] 142874
    ------------------------------------------------------------ 
    ny$Start.Station: Pike St & E Broadway
    [1] 55829
    ------------------------------------------------------------ 
    ny$Start.Station: Pike St & Monroe St
    [1] 36637
    ------------------------------------------------------------ 
    ny$Start.Station: Pioneer St & Richards St
    [1] 6863
    ------------------------------------------------------------ 
    ny$Start.Station: Pioneer St & Van Brunt St
    [1] 10203
    ------------------------------------------------------------ 
    ny$Start.Station: Pitt St & Stanton St
    [1] 19279
    ------------------------------------------------------------ 
    ny$Start.Station: Plaza St West & Flatbush Ave
    [1] 63298
    ------------------------------------------------------------ 
    ny$Start.Station: President St & Henry St
    [1] 26270
    ------------------------------------------------------------ 
    ny$Start.Station: Prospect Park West & 8 St
    [1] 44227
    ------------------------------------------------------------ 
    ny$Start.Station: Prospect Pl & 6 Ave
    [1] 18262
    ------------------------------------------------------------ 
    ny$Start.Station: Pulaski St & Marcus Garvey Blvd
    [1] 7850
    ------------------------------------------------------------ 
    ny$Start.Station: Putnam Ave & Nostrand Ave
    [1] 11446
    ------------------------------------------------------------ 
    ny$Start.Station: Putnam Ave & Throop Ave
    [1] 16248
    ------------------------------------------------------------ 
    ny$Start.Station: Queens Plaza North & Crescent St
    [1] 83360
    ------------------------------------------------------------ 
    ny$Start.Station: Railroad Ave & Kay Ave
    [1] 1405
    ------------------------------------------------------------ 
    ny$Start.Station: Reade St & Broadway
    [1] 49840
    ------------------------------------------------------------ 
    ny$Start.Station: Reed St & Van Brunt St
    [1] 28062
    ------------------------------------------------------------ 
    ny$Start.Station: Richards St & Delavan St
    [1] 1322
    ------------------------------------------------------------ 
    ny$Start.Station: Richardson St & N Henry St
    [1] 10153
    ------------------------------------------------------------ 
    ny$Start.Station: Riverside Blvd & W 67 St
    [1] 144834
    ------------------------------------------------------------ 
    ny$Start.Station: Riverside Dr & W 104 St
    [1] 57373
    ------------------------------------------------------------ 
    ny$Start.Station: Riverside Dr & W 72 St
    [1] 103032
    ------------------------------------------------------------ 
    ny$Start.Station: Riverside Dr & W 78 St
    [1] 96795
    ------------------------------------------------------------ 
    ny$Start.Station: Riverside Dr & W 82 St
    [1] 78859
    ------------------------------------------------------------ 
    ny$Start.Station: Riverside Dr & W 89 St
    [1] 32941
    ------------------------------------------------------------ 
    ny$Start.Station: Rivington St & Chrystie St
    [1] 78707
    ------------------------------------------------------------ 
    ny$Start.Station: Rivington St & Ridge St
    [1] 64425
    ------------------------------------------------------------ 
    ny$Start.Station: Roebling St & N 4 St
    [1] 42065
    ------------------------------------------------------------ 
    ny$Start.Station: S 3 St & Bedford Ave
    [1] 73337
    ------------------------------------------------------------ 
    ny$Start.Station: S 4 St & Rodney St
    [1] 18259
    ------------------------------------------------------------ 
    ny$Start.Station: S 4 St & Wythe Ave
    [1] 74500
    ------------------------------------------------------------ 
    ny$Start.Station: S 5 Pl & S 4 St
    [1] 158460
    ------------------------------------------------------------ 
    ny$Start.Station: S Portland Ave & Hanson Pl
    [1] 19483
    ------------------------------------------------------------ 
    ny$Start.Station: Sands St & Navy St
    [1] 10625
    ------------------------------------------------------------ 
    ny$Start.Station: Schermerhorn St & 3 Ave
    [1] 12319
    ------------------------------------------------------------ 
    ny$Start.Station: Schermerhorn St & Court St
    [1] 29531
    ------------------------------------------------------------ 
    ny$Start.Station: Scholes St & Manhattan Ave
    [1] 15240
    ------------------------------------------------------------ 
    ny$Start.Station: Sigourney St & Columbia St
    [1] 17842
    ------------------------------------------------------------ 
    ny$Start.Station: Smith St & 3 St
    [1] 15770
    ------------------------------------------------------------ 
    ny$Start.Station: Smith St & 9 St
    [1] 19630
    ------------------------------------------------------------ 
    ny$Start.Station: Soissons Landing
    [1] 21401
    ------------------------------------------------------------ 
    ny$Start.Station: South End Ave & Liberty St
    [1] 262580
    ------------------------------------------------------------ 
    ny$Start.Station: South St & Gouverneur Ln
    [1] 148049
    ------------------------------------------------------------ 
    ny$Start.Station: South St & Whitehall St
    [1] 128539
    ------------------------------------------------------------ 
    ny$Start.Station: Spruce St & Nassau St
    [1] 56663
    ------------------------------------------------------------ 
    ny$Start.Station: St James Pl & Oliver St
    [1] 197808
    ------------------------------------------------------------ 
    ny$Start.Station: St James Pl & Pearl St
    [1] 19340
    ------------------------------------------------------------ 
    ny$Start.Station: St Marks Pl & 1 Ave
    [1] 95394
    ------------------------------------------------------------ 
    ny$Start.Station: St Marks Pl & 2 Ave
    [1] 118355
    ------------------------------------------------------------ 
    ny$Start.Station: Stagg St & Union Ave
    [1] 29565
    ------------------------------------------------------------ 
    ny$Start.Station: Stanton St & Chrystie St
    [1] 129207
    ------------------------------------------------------------ 
    ny$Start.Station: Stanton St & Mangin St
    [1] 40205
    ------------------------------------------------------------ 
    ny$Start.Station: State St & Smith St
    [1] 37760
    ------------------------------------------------------------ 
    ny$Start.Station: Suffolk St & Stanton St
    [1] 130013
    ------------------------------------------------------------ 
    ny$Start.Station: Sullivan St & Washington Sq
    [1] 122033
    ------------------------------------------------------------ 
    ny$Start.Station: Throop Ave & Myrtle Ave
    [1] 7471
    ------------------------------------------------------------ 
    ny$Start.Station: Tompkins Ave & Hopkins St
    [1] 11504
    ------------------------------------------------------------ 
    ny$Start.Station: Union Ave & Jackson St
    [1] 13503
    ------------------------------------------------------------ 
    ny$Start.Station: Union Ave & N 12 St
    [1] 47353
    ------------------------------------------------------------ 
    ny$Start.Station: Union Ave & Wallabout St
    [1] 13666
    ------------------------------------------------------------ 
    ny$Start.Station: Union St & 4 Ave
    [1] 31282
    ------------------------------------------------------------ 
    ny$Start.Station: Union St & Nevins St
    [1] 24137
    ------------------------------------------------------------ 
    ny$Start.Station: University Pl & E 14 St
    [1] 255115
    ------------------------------------------------------------ 
    ny$Start.Station: University Pl & E 8 St
    [1] 89473
    ------------------------------------------------------------ 
    ny$Start.Station: Van Brunt St & Wolcott St
    [1] 19006
    ------------------------------------------------------------ 
    ny$Start.Station: Vernon Blvd & 50 Ave
    [1] 58395
    ------------------------------------------------------------ 
    ny$Start.Station: Verona Pl & Fulton St
    [1] 15756
    ------------------------------------------------------------ 
    ny$Start.Station: Vesey Pl & River Terrace
    [1] 214828
    ------------------------------------------------------------ 
    ny$Start.Station: W 100 St & Broadway
    [1] 62355
    ------------------------------------------------------------ 
    ny$Start.Station: W 100 St & Manhattan Ave
    [1] 54788
    ------------------------------------------------------------ 
    ny$Start.Station: W 104 St & Amsterdam Ave
    [1] 36908
    ------------------------------------------------------------ 
    ny$Start.Station: W 106 St & Amsterdam Ave
    [1] 55134
    ------------------------------------------------------------ 
    ny$Start.Station: W 106 St & Central Park West
    [1] 68976
    ------------------------------------------------------------ 
    ny$Start.Station: W 107 St & Columbus Ave
    [1] 22965
    ------------------------------------------------------------ 
    ny$Start.Station: W 11 St & 6 Ave
    [1] 99445
    ------------------------------------------------------------ 
    ny$Start.Station: W 13 St & 5 Ave
    [1] 93149
    ------------------------------------------------------------ 
    ny$Start.Station: W 13 St & 6 Ave
    [1] 106273
    ------------------------------------------------------------ 
    ny$Start.Station: W 13 St & 7 Ave
    [1] 52389
    ------------------------------------------------------------ 
    ny$Start.Station: W 13 St & Hudson St
    [1] 191077
    ------------------------------------------------------------ 
    ny$Start.Station: W 14 St & The High Line
    [1] 113865
    ------------------------------------------------------------ 
    ny$Start.Station: W 15 St & 10 Ave
    [1] 1217
    ------------------------------------------------------------ 
    ny$Start.Station: W 15 St & 7 Ave
    [1] 130213
    ------------------------------------------------------------ 
    ny$Start.Station: W 16 St & The High Line
    [1] 336913
    ------------------------------------------------------------ 
    ny$Start.Station: W 17 St & 8 Ave
    [1] 116392
    ------------------------------------------------------------ 
    ny$Start.Station: W 18 St & 6 Ave
    [1] 178967
    ------------------------------------------------------------ 
    ny$Start.Station: W 20 St & 11 Ave
    [1] 282342
    ------------------------------------------------------------ 
    ny$Start.Station: W 20 St & 7 Ave
    [1] 104372
    ------------------------------------------------------------ 
    ny$Start.Station: W 20 St & 8 Ave
    [1] 91952
    ------------------------------------------------------------ 
    ny$Start.Station: W 21 St & 6 Ave
    [1] 233318
    ------------------------------------------------------------ 
    ny$Start.Station: W 22 St & 10 Ave
    [1] 145145
    ------------------------------------------------------------ 
    ny$Start.Station: W 22 St & 8 Ave
    [1] 121392
    ------------------------------------------------------------ 
    ny$Start.Station: W 24 St & 7 Ave
    [1] 156446
    ------------------------------------------------------------ 
    ny$Start.Station: W 25 St & 6 Ave
    [1] 134452
    ------------------------------------------------------------ 
    ny$Start.Station: W 26 St & 10 Ave
    [1] 138544
    ------------------------------------------------------------ 
    ny$Start.Station: W 26 St & 8 Ave
    [1] 114918
    ------------------------------------------------------------ 
    ny$Start.Station: W 27 St & 10 Ave
    [1] 114772
    ------------------------------------------------------------ 
    ny$Start.Station: W 27 St & 7 Ave
    [1] 156074
    ------------------------------------------------------------ 
    ny$Start.Station: W 31 St & 7 Ave
    [1] 179800
    ------------------------------------------------------------ 
    ny$Start.Station: W 33 St & 7 Ave
    [1] 166948
    ------------------------------------------------------------ 
    ny$Start.Station: W 34 St & 11 Ave
    [1] 139572
    ------------------------------------------------------------ 
    ny$Start.Station: W 37 St & 10 Ave
    [1] 104875
    ------------------------------------------------------------ 
    ny$Start.Station: W 37 St & 5 Ave
    [1] 92603
    ------------------------------------------------------------ 
    ny$Start.Station: W 37 St & Broadway
    [1] 39502
    ------------------------------------------------------------ 
    ny$Start.Station: W 38 St & 8 Ave
    [1] 187112
    ------------------------------------------------------------ 
    ny$Start.Station: W 39 St & 9 Ave
    [1] 112591
    ------------------------------------------------------------ 
    ny$Start.Station: W 4 St & 7 Ave S
    [1] 135418
    ------------------------------------------------------------ 
    ny$Start.Station: W 41 St & 8 Ave
    [1] 203504
    ------------------------------------------------------------ 
    ny$Start.Station: W 42 St & 8 Ave
    [1] 126266
    ------------------------------------------------------------ 
    ny$Start.Station: W 42 St & Dyer Ave
    [1] 127668
    ------------------------------------------------------------ 
    ny$Start.Station: W 43 St & 10 Ave
    [1] 116337
    ------------------------------------------------------------ 
    ny$Start.Station: W 43 St & 6 Ave
    [1] 160640
    ------------------------------------------------------------ 
    ny$Start.Station: W 44 St & 5 Ave
    [1] 149258
    ------------------------------------------------------------ 
    ny$Start.Station: W 45 St & 6 Ave
    [1] 37500
    ------------------------------------------------------------ 
    ny$Start.Station: W 45 St & 8 Ave
    [1] 166088
    ------------------------------------------------------------ 
    ny$Start.Station: W 46 St & 11 Ave
    [1] 125354
    ------------------------------------------------------------ 
    ny$Start.Station: W 47 St & 10 Ave
    [1] 113707
    ------------------------------------------------------------ 
    ny$Start.Station: W 49 St & 8 Ave
    [1] 116254
    ------------------------------------------------------------ 
    ny$Start.Station: W 52 St & 11 Ave
    [1] 126377
    ------------------------------------------------------------ 
    ny$Start.Station: W 52 St & 5 Ave
    [1] 170490
    ------------------------------------------------------------ 
    ny$Start.Station: W 52 St & 6 Ave
    [1] 176611
    ------------------------------------------------------------ 
    ny$Start.Station: W 52 St & 9 Ave
    [1] 63224
    ------------------------------------------------------------ 
    ny$Start.Station: W 53 St & 10 Ave
    [1] 111782
    ------------------------------------------------------------ 
    ny$Start.Station: W 54 St & 9 Ave
    [1] 65221
    ------------------------------------------------------------ 
    ny$Start.Station: W 55 St & 6 Ave
    [1] 57313
    ------------------------------------------------------------ 
    ny$Start.Station: W 56 St & 10 Ave
    [1] 96274
    ------------------------------------------------------------ 
    ny$Start.Station: W 59 St & 10 Ave
    [1] 72900
    ------------------------------------------------------------ 
    ny$Start.Station: W 63 St & Broadway
    [1] 110720
    ------------------------------------------------------------ 
    ny$Start.Station: W 64 St & West End Ave
    [1] 67398
    ------------------------------------------------------------ 
    ny$Start.Station: W 67 St & Broadway
    [1] 106554
    ------------------------------------------------------------ 
    ny$Start.Station: W 70 St & Amsterdam Ave
    [1] 72348
    ------------------------------------------------------------ 
    ny$Start.Station: W 74 St & Columbus Ave
    [1] 46777
    ------------------------------------------------------------ 
    ny$Start.Station: W 76 St & Columbus Ave
    [1] 80543
    ------------------------------------------------------------ 
    ny$Start.Station: W 78 St & Broadway
    [1] 63290
    ------------------------------------------------------------ 
    ny$Start.Station: W 82 St & Central Park West
    [1] 79074
    ------------------------------------------------------------ 
    ny$Start.Station: W 84 St & Broadway
    [1] 51672
    ------------------------------------------------------------ 
    ny$Start.Station: W 84 St & Columbus Ave
    [1] 53153
    ------------------------------------------------------------ 
    ny$Start.Station: W 87 St  & Amsterdam Ave
    [1] 51947
    ------------------------------------------------------------ 
    ny$Start.Station: W 88 St & West End Ave
    [1] 27594
    ------------------------------------------------------------ 
    ny$Start.Station: W 89 St & Columbus Ave
    [1] 52087
    ------------------------------------------------------------ 
    ny$Start.Station: W 90 St & Amsterdam Ave
    [1] 32376
    ------------------------------------------------------------ 
    ny$Start.Station: W 92 St & Broadway
    [1] 72634
    ------------------------------------------------------------ 
    ny$Start.Station: W 95 St & Broadway
    [1] 92424
    ------------------------------------------------------------ 
    ny$Start.Station: W Broadway & Spring St
    [1] 141513
    ------------------------------------------------------------ 
    ny$Start.Station: Warren St & Church St
    [1] 92417
    ------------------------------------------------------------ 
    ny$Start.Station: Warren St & Court St
    [1] 26769
    ------------------------------------------------------------ 
    ny$Start.Station: Washington Ave & Greene Ave
    [1] 10854
    ------------------------------------------------------------ 
    ny$Start.Station: Washington Ave & Park Ave
    [1] 44753
    ------------------------------------------------------------ 
    ny$Start.Station: Washington Park
    [1] 20807
    ------------------------------------------------------------ 
    ny$Start.Station: Washington Pl & 6 Ave
    [1] 62071
    ------------------------------------------------------------ 
    ny$Start.Station: Washington Pl & Broadway
    [1] 106976
    ------------------------------------------------------------ 
    ny$Start.Station: Washington St & Gansevoort St
    [1] 98678
    ------------------------------------------------------------ 
    ny$Start.Station: Water - Whitehall Plaza
    [1] 73486
    ------------------------------------------------------------ 
    ny$Start.Station: Watts St & Greenwich St
    [1] 94093
    ------------------------------------------------------------ 
    ny$Start.Station: West Drive & Prospect Park West
    [1] 142454
    ------------------------------------------------------------ 
    ny$Start.Station: West End Ave & W 107 St
    [1] 26840
    ------------------------------------------------------------ 
    ny$Start.Station: West End Ave & W 94 St
    [1] 52231
    ------------------------------------------------------------ 
    ny$Start.Station: West St & Chambers St
    [1] 364351
    ------------------------------------------------------------ 
    ny$Start.Station: West Thames St
    [1] 135210
    ------------------------------------------------------------ 
    ny$Start.Station: William St & Pine St
    [1] 55003
    ------------------------------------------------------------ 
    ny$Start.Station: Willoughby Ave & Hall St
    [1] 45894
    ------------------------------------------------------------ 
    ny$Start.Station: Willoughby Ave & Tompkins Ave
    [1] 12990
    ------------------------------------------------------------ 
    ny$Start.Station: Willoughby Ave & Walworth St
    [1] 11500
    ------------------------------------------------------------ 
    ny$Start.Station: Willoughby St & Fleet St
    [1] 38888
    ------------------------------------------------------------ 
    ny$Start.Station: Wolcott St & Dwight St
    [1] 7274
    ------------------------------------------------------------ 
    ny$Start.Station: Wyckoff St & 3 Ave
    [1] 19689
    ------------------------------------------------------------ 
    ny$Start.Station: Wythe Ave & Metropolitan Ave
    [1] 64433
    ------------------------------------------------------------ 
    ny$Start.Station: Yankee Ferry Terminal
    [1] 515337
    ------------------------------------------------------------ 
    ny$Start.Station: York St & Jay St
    [1] 101608



```R
# Statistics show that users spent 445,087 seconds when starting at the most common sation which is Pershing Square North
```


```R
by(wash$Trip.Duration,wash$Start.Station, sum)
```


    wash$Start.Station: 
    [1] NA
    ------------------------------------------------------------ 
    wash$Start.Station: 10th & E St NW
    [1] 582121.6
    ------------------------------------------------------------ 
    wash$Start.Station: 10th & Florida Ave NW
    [1] 213689.6
    ------------------------------------------------------------ 
    wash$Start.Station: 10th & G St NW
    [1] 369568.3
    ------------------------------------------------------------ 
    wash$Start.Station: 10th & K St NW
    [1] 472949.5
    ------------------------------------------------------------ 
    wash$Start.Station: 10th & Monroe St NE
    [1] 90764.38
    ------------------------------------------------------------ 
    wash$Start.Station: 10th & U St NW
    [1] 323796.5
    ------------------------------------------------------------ 
    wash$Start.Station: 10th St & Constitution Ave NW
    [1] 1016999
    ------------------------------------------------------------ 
    wash$Start.Station: 10th St & L'Enfant Plaza SW
    [1] 231703.9
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & F St NW
    [1] 424282.4
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & Girard St NW
    [1] 41506.79
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & H St NE
    [1] 198502.4
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & Kenyon St NW
    [1] 355974.1
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & M St NW
    [1] 388629.8
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & O St NW
    [1] 262200.5
    ------------------------------------------------------------ 
    wash$Start.Station: 11th & S St NW
    [1] 259191
    ------------------------------------------------------------ 
    wash$Start.Station: 12th & Army Navy Dr
    [1] 156464.9
    ------------------------------------------------------------ 
    wash$Start.Station: 12th & Irving St NE
    [1] 68207.79
    ------------------------------------------------------------ 
    wash$Start.Station: 12th & L St NW
    [1] 275125.9
    ------------------------------------------------------------ 
    wash$Start.Station: 12th & Newton St NE
    [1] 63675.07
    ------------------------------------------------------------ 
    wash$Start.Station: 12th & U St NW
    [1] 406379.1
    ------------------------------------------------------------ 
    wash$Start.Station: 12th St & Pennsylvania Ave SE
    [1] 108261.3
    ------------------------------------------------------------ 
    wash$Start.Station: 13th & D St NE
    [1] 259905.7
    ------------------------------------------------------------ 
    wash$Start.Station: 13th & H St NE
    [1] 294233.7
    ------------------------------------------------------------ 
    wash$Start.Station: 13th St & Eastern Ave
    [1] 20279.81
    ------------------------------------------------------------ 
    wash$Start.Station: 13th St & New York Ave NW
    [1] 444027
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & Belmont St NW
    [1] 249353.9
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & D St NW / Ronald Reagan Building
    [1] 847522.2
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & D St SE
    [1] 135557.1
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & G St NW
    [1] 821383.1
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & Girard St NW
    [1] 181076.5
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & Harvard St NW
    [1] 158384.5
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & Irving St NW
    [1] 1288752
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & L St NW
    [1] 269777
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & R St NW
    [1] 490949.8
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & Rhode Island Ave NW
    [1] 582710.8
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & Upshur St NW
    [1] 134786.6
    ------------------------------------------------------------ 
    wash$Start.Station: 14th & V St NW
    [1] 584930.7
    ------------------------------------------------------------ 
    wash$Start.Station: 14th St & Colorado Ave NW
    [1] 117155.5
    ------------------------------------------------------------ 
    wash$Start.Station: 14th St & New York Ave NW
    [1] 422587.7
    ------------------------------------------------------------ 
    wash$Start.Station: 14th St & Spring Rd NW
    [1] 198000.3
    ------------------------------------------------------------ 
    wash$Start.Station: 14th St Heights / 14th & Crittenden St NW
    [1] 56809.5
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & Crystal Dr
    [1] 158068.4
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & East Capitol St NE
    [1] 156649.3
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & Euclid St  NW
    [1] 216977.6
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & F St NE
    [1] 190339.4
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & K St NW
    [1] 398626.4
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & L St NW
    [1] 353672.4
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & M St NW
    [1] 63384.39
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & N Scott St
    [1] 119818.7
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & P St NW
    [1] 717801.2
    ------------------------------------------------------------ 
    wash$Start.Station: 15th & W St NW
    [1] 324891.7
    ------------------------------------------------------------ 
    wash$Start.Station: 15th St & Constitution Ave NW
    [1] 81810.42
    ------------------------------------------------------------ 
    wash$Start.Station: 15th St & Massachusetts Ave SE
    [1] 135659.6
    ------------------------------------------------------------ 
    wash$Start.Station: 16th & Harvard St NW
    [1] 306576.8
    ------------------------------------------------------------ 
    wash$Start.Station: 16th & Irving St NW
    [1] 186240.5
    ------------------------------------------------------------ 
    wash$Start.Station: 16th & K St NW
    [1] 316915.7
    ------------------------------------------------------------ 
    wash$Start.Station: 16th & Q St SE / Anacostia HS
    [1] 13882.64
    ------------------------------------------------------------ 
    wash$Start.Station: 16th & R St NW
    [1] 261365.7
    ------------------------------------------------------------ 
    wash$Start.Station: 17th & Corcoran St NW
    [1] 413915.4
    ------------------------------------------------------------ 
    wash$Start.Station: 17th & G St NW
    [1] 847533.3
    ------------------------------------------------------------ 
    wash$Start.Station: 17th & K St NW
    [1] 473885.3
    ------------------------------------------------------------ 
    wash$Start.Station: 17th & K St NW / Farragut Square
    [1] 566867.6
    ------------------------------------------------------------ 
    wash$Start.Station: 17th & Rhode Island Ave NW
    [1] 137465.4
    ------------------------------------------------------------ 
    wash$Start.Station: 17th St & Independence Ave SW
    [1] 1742656
    ------------------------------------------------------------ 
    wash$Start.Station: 17th St & Massachusetts Ave NW
    [1] 386314
    ------------------------------------------------------------ 
    wash$Start.Station: 18th & C St NW
    [1] 338972.4
    ------------------------------------------------------------ 
    wash$Start.Station: 18th & Eads St.
    [1] 100433.4
    ------------------------------------------------------------ 
    wash$Start.Station: 18th & M St NW
    [1] 346863.4
    ------------------------------------------------------------ 
    wash$Start.Station: 18th & Monroe St NE
    [1] 11877.53
    ------------------------------------------------------------ 
    wash$Start.Station: 18th & R St NW
    [1] 488241.7
    ------------------------------------------------------------ 
    wash$Start.Station: 18th St & Pennsylvania Ave NW
    [1] 478583
    ------------------------------------------------------------ 
    wash$Start.Station: 18th St & Rhode Island Ave NE
    [1] 55411.65
    ------------------------------------------------------------ 
    wash$Start.Station: 18th St & Wyoming Ave NW
    [1] 355476.5
    ------------------------------------------------------------ 
    wash$Start.Station: 19th & E Street NW
    [1] 168241.7
    ------------------------------------------------------------ 
    wash$Start.Station: 19th & East Capitol St SE
    [1] 125401
    ------------------------------------------------------------ 
    wash$Start.Station: 19th & G St NW
    [1] 261981.4
    ------------------------------------------------------------ 
    wash$Start.Station: 19th & K St NW
    [1] 207337.9
    ------------------------------------------------------------ 
    wash$Start.Station: 19th & L St NW
    [1] 234986.8
    ------------------------------------------------------------ 
    wash$Start.Station: 19th St & Constitution Ave NW
    [1] 773945.8
    ------------------------------------------------------------ 
    wash$Start.Station: 19th St & Pennsylvania Ave NW
    [1] 280877.2
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & D St SE
    [1] 309078.3
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & H St NW
    [1] 213212.7
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & K St SE
    [1] 432314.3
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & M St NE
    [1] 618333.6
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & N St  SE
    [1] 288675.4
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & O St NW
    [1] 190307
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & Rhode Island Ave NW
    [1] 353328.7
    ------------------------------------------------------------ 
    wash$Start.Station: 1st & Washington Hospital Center NW
    [1] 78302.39
    ------------------------------------------------------------ 
    wash$Start.Station: 20th & Crystal Dr
    [1] 236212.7
    ------------------------------------------------------------ 
    wash$Start.Station: 20th & E St NW
    [1] 405230.9
    ------------------------------------------------------------ 
    wash$Start.Station: 20th & L St NW
    [1] 236096.4
    ------------------------------------------------------------ 
    wash$Start.Station: 20th & O St NW / Dupont South
    [1] 352325.4
    ------------------------------------------------------------ 
    wash$Start.Station: 20th St & Florida Ave NW
    [1] 432718.2
    ------------------------------------------------------------ 
    wash$Start.Station: 20th St & Virginia Ave NW
    [1] 194838
    ------------------------------------------------------------ 
    wash$Start.Station: 21st & I St NW
    [1] 457808.1
    ------------------------------------------------------------ 
    wash$Start.Station: 21st & M St NW
    [1] 671738.7
    ------------------------------------------------------------ 
    wash$Start.Station: 21st St & Constitution Ave NW
    [1] 442639.5
    ------------------------------------------------------------ 
    wash$Start.Station: 21st St & Pennsylvania Ave NW
    [1] 203667.9
    ------------------------------------------------------------ 
    wash$Start.Station: 21st St N & N Pierce St
    [1] 52987.87
    ------------------------------------------------------------ 
    wash$Start.Station: 22nd & I St NW / Foggy Bottom
    [1] 569705.6
    ------------------------------------------------------------ 
    wash$Start.Station: 22nd & P ST NW
    [1] 367742.6
    ------------------------------------------------------------ 
    wash$Start.Station: 22nd St & Constitution Ave NW
    [1] 455679.9
    ------------------------------------------------------------ 
    wash$Start.Station: 23rd & Crystal Dr
    [1] 134655.8
    ------------------------------------------------------------ 
    wash$Start.Station: 23rd & E St NW 
    [1] 362879.7
    ------------------------------------------------------------ 
    wash$Start.Station: 23rd & Eads St
    [1] 18950.97
    ------------------------------------------------------------ 
    wash$Start.Station: 24th & N St NW
    [1] 333521.4
    ------------------------------------------------------------ 
    wash$Start.Station: 24th & R St NE / National Arboretum
    [1] 223622.8
    ------------------------------------------------------------ 
    wash$Start.Station: 25th St & Pennsylvania Ave NW
    [1] 484016.6
    ------------------------------------------------------------ 
    wash$Start.Station: 26th & S Clark St
    [1] 54962.82
    ------------------------------------------------------------ 
    wash$Start.Station: 27th & Crystal Dr
    [1] 91045.98
    ------------------------------------------------------------ 
    wash$Start.Station: 28th St S & S Meade St
    [1] 26795.93
    ------------------------------------------------------------ 
    wash$Start.Station: 2nd & G St NE
    [1] 269554.3
    ------------------------------------------------------------ 
    wash$Start.Station: 2nd St & Massachusetts Ave NE
    [1] 586276.5
    ------------------------------------------------------------ 
    wash$Start.Station: 2nd St & Seaton Pl NE
    [1] 23939.63
    ------------------------------------------------------------ 
    wash$Start.Station: 3000 Connecticut Ave NW / National Zoo
    [1] 172387.3
    ------------------------------------------------------------ 
    wash$Start.Station: 31st & Water St NW
    [1] 330792.2
    ------------------------------------------------------------ 
    wash$Start.Station: 31st & Woodrow St S
    [1] 10682.22
    ------------------------------------------------------------ 
    wash$Start.Station: 34th & Water St NW
    [1] 609546
    ------------------------------------------------------------ 
    wash$Start.Station: 34th St & Wisconsin Ave NW
    [1] 196681.8
    ------------------------------------------------------------ 
    wash$Start.Station: 36th & Calvert St NW / Glover Park
    [1] 246038.3
    ------------------------------------------------------------ 
    wash$Start.Station: 37th & O St NW / Georgetown University
    [1] 444313.3
    ------------------------------------------------------------ 
    wash$Start.Station: 39th & Calvert St NW / Stoddert
    [1] 172857
    ------------------------------------------------------------ 
    wash$Start.Station: 39th & Veazey St NW
    [1] 79799.97
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & D St SE
    [1] 209209.2
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & Elm St NW
    [1] 238911
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & G St SE
    [1] 174264.4
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & H St NE
    [1] 417544.3
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & H St NW
    [1] 163326.2
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & Tingey St SE
    [1] 440575.1
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd & Underwood St NW
    [1] 161940.8
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd St & Pennsylvania Ave SE
    [1] 561326.8
    ------------------------------------------------------------ 
    wash$Start.Station: 3rd St & Riggs Rd NE
    [1] 10337.2
    ------------------------------------------------------------ 
    wash$Start.Station: 47th & Elm St
    [1] 35982.16
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & C St SW
    [1] 880449.9
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & D St NW / Judiciary Square
    [1] 229764.7
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & E St SW
    [1] 630205.3
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & East Capitol St NE
    [1] 388096.3
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & Kennedy St NW
    [1] 18557.91
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & M St SW
    [1] 548932.4
    ------------------------------------------------------------ 
    wash$Start.Station: 4th & W St NE
    [1] 131183
    ------------------------------------------------------------ 
    wash$Start.Station: 4th St & Madison Dr NW
    [1] 2082998
    ------------------------------------------------------------ 
    wash$Start.Station: 5th & F St NW
    [1] 456199.3
    ------------------------------------------------------------ 
    wash$Start.Station: 5th & K St NW
    [1] 528768.6
    ------------------------------------------------------------ 
    wash$Start.Station: 5th & Kennedy St NW
    [1] 40937.67
    ------------------------------------------------------------ 
    wash$Start.Station: 5th St & Massachusetts Ave NW
    [1] 628755.1
    ------------------------------------------------------------ 
    wash$Start.Station: 61st St & Banks Pl NE
    [1] 5980.002
    ------------------------------------------------------------ 
    wash$Start.Station: 6th & H St NE
    [1] 374088.5
    ------------------------------------------------------------ 
    wash$Start.Station: 6th & K St NE
    [1] 130201.9
    ------------------------------------------------------------ 
    wash$Start.Station: 6th & S Ball St
    [1] 28291.92
    ------------------------------------------------------------ 
    wash$Start.Station: 6th & Water St SW / SW Waterfront
    [1] 53005.98
    ------------------------------------------------------------ 
    wash$Start.Station: 6th St & Indiana Ave NW
    [1] 558208.8
    ------------------------------------------------------------ 
    wash$Start.Station: 7th & E St SW
    [1] 233834.5
    ------------------------------------------------------------ 
    wash$Start.Station: 7th & F St NW/Portrait Gallery
    [1] 201163.3
    ------------------------------------------------------------ 
    wash$Start.Station: 7th & R St NW / Shaw Library
    [1] 282634.4
    ------------------------------------------------------------ 
    wash$Start.Station: 7th & T St NW
    [1] 469597.2
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & D St NW
    [1] 682465.9
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & East Capitol St NE
    [1] 199051
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & Eye St SE / Barracks Row
    [1] 152702.8
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & F St NE
    [1] 193506.9
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & F St NW
    [1] 829682.9
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & H St NW
    [1] 1102743
    ------------------------------------------------------------ 
    wash$Start.Station: 8th & O St NW
    [1] 430862.8
    ------------------------------------------------------------ 
    wash$Start.Station: 9th & Upshur St NW
    [1] 198666
    ------------------------------------------------------------ 
    wash$Start.Station: Adams Mill & Columbia Rd NW
    [1] 452021.8
    ------------------------------------------------------------ 
    wash$Start.Station: Alabama & MLK Ave SE
    [1] 12798.31
    ------------------------------------------------------------ 
    wash$Start.Station: Amherst Ave & Elkins St
    [1] 25823.61
    ------------------------------------------------------------ 
    wash$Start.Station: Amherst Ave & Prichard Rd
    [1] 4587.038
    ------------------------------------------------------------ 
    wash$Start.Station: Anacostia Ave & Benning Rd NE / River Terrace 
    [1] 107296
    ------------------------------------------------------------ 
    wash$Start.Station: Anacostia Library
    [1] 14462.76
    ------------------------------------------------------------ 
    wash$Start.Station: Anacostia Metro
    [1] 31658.05
    ------------------------------------------------------------ 
    wash$Start.Station: Arlington Blvd & Fillmore St
    [1] 42235.38
    ------------------------------------------------------------ 
    wash$Start.Station: Arlington Blvd & N Queen St
    [1] 74622.32
    ------------------------------------------------------------ 
    wash$Start.Station: Arlington Blvd & S George Mason Dr/NFATC
    [1] 30663.37
    ------------------------------------------------------------ 
    wash$Start.Station: Army Navy Dr & S Nash St
    [1] 16017.75
    ------------------------------------------------------------ 
    wash$Start.Station: Aurora Hills Community Ctr/18th & Hayes St
    [1] 32543.34
    ------------------------------------------------------------ 
    wash$Start.Station: Ballenger Ave & Dulaney St
    [1] 51172
    ------------------------------------------------------------ 
    wash$Start.Station: Ballston Metro / N Stuart & 9th St N
    [1] 216494.9
    ------------------------------------------------------------ 
    wash$Start.Station: Barcroft Community Center
    [1] 163344.8
    ------------------------------------------------------------ 
    wash$Start.Station: Barton St & 10th St N
    [1] 58382.19
    ------------------------------------------------------------ 
    wash$Start.Station: Battery Ln & Trolley Trail
    [1] 44463.69
    ------------------------------------------------------------ 
    wash$Start.Station: Benning Branch Library
    [1] 3518.019
    ------------------------------------------------------------ 
    wash$Start.Station: Benning Rd & East Capitol St NE / Benning Rd Metro
    [1] 20706.4
    ------------------------------------------------------------ 
    wash$Start.Station: Bethesda Ave & Arlington Rd
    [1] 178143.5
    ------------------------------------------------------------ 
    wash$Start.Station: Bethesda Metro
    [1] 138849.4
    ------------------------------------------------------------ 
    wash$Start.Station: Bladensburg Rd & Benning Rd NE
    [1] 549665.6
    ------------------------------------------------------------ 
    wash$Start.Station: Braddock Rd Metro
    [1] 145353.5
    ------------------------------------------------------------ 
    wash$Start.Station: Branch & Pennsylvania Ave SE
    [1] 6783.355
    ------------------------------------------------------------ 
    wash$Start.Station: C & O Canal & Wisconsin Ave NW
    [1] 676003
    ------------------------------------------------------------ 
    wash$Start.Station: California St & Florida Ave NW
    [1] 331440.3
    ------------------------------------------------------------ 
    wash$Start.Station: Calvert & Biltmore St NW
    [1] 154822.8
    ------------------------------------------------------------ 
    wash$Start.Station: Calvert St & Woodley Pl NW
    [1] 500372.5
    ------------------------------------------------------------ 
    wash$Start.Station: Carlin Springs Rd & N Thomas St
    [1] 23762.02
    ------------------------------------------------------------ 
    wash$Start.Station: Carroll & Ethan Allen Ave
    [1] 36411.38
    ------------------------------------------------------------ 
    wash$Start.Station: Carroll & Westmoreland Ave
    [1] 21095.55
    ------------------------------------------------------------ 
    wash$Start.Station: Central Library / N Quincy St & 10th St N
    [1] 69777.65
    ------------------------------------------------------------ 
    wash$Start.Station: Clarendon Blvd & N Fillmore St
    [1] 111601.4
    ------------------------------------------------------------ 
    wash$Start.Station: Clarendon Blvd & Pierce St
    [1] 139807.5
    ------------------------------------------------------------ 
    wash$Start.Station: Clarendon Metro / Wilson Blvd & N Highland St
    [1] 109063.7
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia & Ontario Rd NW
    [1] 89129.56
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Pike & S Courthouse Rd
    [1] 69511.88
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Pike & S Dinwiddie St / Arlington Mill Community Center
    [1] 110924.8
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Pike & S Orme St
    [1] 78495.07
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Pike & S Taylor St
    [1] 402.248
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Pike & S Walter Reed Dr
    [1] 36317.01
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Rd & Belmont St NW
    [1] 266993.1
    ------------------------------------------------------------ 
    wash$Start.Station: Columbia Rd & Georgia Ave NW
    [1] 246751.8
    ------------------------------------------------------------ 
    wash$Start.Station: Columbus Ave & Gramercy Blvd
    [1] 88.761
    ------------------------------------------------------------ 
    wash$Start.Station: Columbus Ave & Tribeca St
    [1] 2028.818
    ------------------------------------------------------------ 
    wash$Start.Station: Columbus Circle / Union Station
    [1] 1417432
    ------------------------------------------------------------ 
    wash$Start.Station: Commerce St & Fayette St
    [1] 139749.3
    ------------------------------------------------------------ 
    wash$Start.Station: Commonwealth & E Monroe Ave
    [1] 20894.35
    ------------------------------------------------------------ 
    wash$Start.Station: Commonwealth Ave & Oak St
    [1] 106965.2
    ------------------------------------------------------------ 
    wash$Start.Station: Congress Heights Metro
    [1] 6296.758
    ------------------------------------------------------------ 
    wash$Start.Station: Connecticut & Nebraska Ave NW
    [1] 123134.8
    ------------------------------------------------------------ 
    wash$Start.Station: Connecticut Ave & Chevy Chase Lake Dr
    [1] 30714.65
    ------------------------------------------------------------ 
    wash$Start.Station: Connecticut Ave & Newark St NW / Cleveland Park
    [1] 169697.4
    ------------------------------------------------------------ 
    wash$Start.Station: Connecticut Ave & R St NW
    [1] 40919.34
    ------------------------------------------------------------ 
    wash$Start.Station: Connecticut Ave & Tilden St NW
    [1] 81035.17
    ------------------------------------------------------------ 
    wash$Start.Station: Connecticut Ave & Yuma St NW
    [1] 91277.09
    ------------------------------------------------------------ 
    wash$Start.Station: Constitution Ave & 2nd St NW/DOL
    [1] 1162250
    ------------------------------------------------------------ 
    wash$Start.Station: Convention Center / 7th & M St NW
    [1] 337739.2
    ------------------------------------------------------------ 
    wash$Start.Station: Cordell & Norfolk Ave
    [1] 48292.81
    ------------------------------------------------------------ 
    wash$Start.Station: Court House Metro / 15th & N Uhle St 
    [1] 197984
    ------------------------------------------------------------ 
    wash$Start.Station: Crabbs Branch Way & Calhoun Pl
    [1] 5974.415
    ------------------------------------------------------------ 
    wash$Start.Station: Crabbs Branch Way & Redland Rd
    [1] 6040.553
    ------------------------------------------------------------ 
    wash$Start.Station: Crystal City Metro / 18th & Bell St
    [1] 193186.8
    ------------------------------------------------------------ 
    wash$Start.Station: D St & Maryland Ave NE
    [1] 250220.3
    ------------------------------------------------------------ 
    wash$Start.Station: Deanwood Rec Center
    [1] 4068.494
    ------------------------------------------------------------ 
    wash$Start.Station: Dennis & Amherst Ave
    [1] 13583.83
    ------------------------------------------------------------ 
    wash$Start.Station: Division Ave & Foote St NE
    [1] 64329.81
    ------------------------------------------------------------ 
    wash$Start.Station: Duke St & John Carlyle St
    [1] 53226.18
    ------------------------------------------------------------ 
    wash$Start.Station: E Montgomery Ave & Maryland Ave
    [1] 17055.4
    ------------------------------------------------------------ 
    wash$Start.Station: Eads & 22nd St S
    [1] 119134.6
    ------------------------------------------------------------ 
    wash$Start.Station: Eads St & 15th St S
    [1] 101733.5
    ------------------------------------------------------------ 
    wash$Start.Station: East Falls Church Metro/Sycamore St & 19th St N
    [1] 93001.39
    ------------------------------------------------------------ 
    wash$Start.Station: East West Hwy & 16th St
    [1] 20792.1
    ------------------------------------------------------------ 
    wash$Start.Station: East West Hwy & Blair Mill Rd
    [1] 29717.24
    ------------------------------------------------------------ 
    wash$Start.Station: Eastern Market / 7th & North Carolina Ave SE
    [1] 329501.9
    ------------------------------------------------------------ 
    wash$Start.Station: Eastern Market Metro / Pennsylvania Ave & 7th St SE
    [1] 790915.7
    ------------------------------------------------------------ 
    wash$Start.Station: Eckington Pl & Q St NE
    [1] 243084.5
    ------------------------------------------------------------ 
    wash$Start.Station: Eisenhower Ave & Mill Race Ln
    [1] 84744.74
    ------------------------------------------------------------ 
    wash$Start.Station: Fairfax Dr & Kenmore St
    [1] 41445.62
    ------------------------------------------------------------ 
    wash$Start.Station: Fairfax Dr & Wilson Blvd
    [1] 60277.79
    ------------------------------------------------------------ 
    wash$Start.Station: Fairfax Village
    [1] 16567.62
    ------------------------------------------------------------ 
    wash$Start.Station: Fallsgrove Blvd & Fallsgrove Dr
    [1] 20392.88
    ------------------------------------------------------------ 
    wash$Start.Station: Fallsgrove Dr & W Montgomery Ave
    [1] 1943.421
    ------------------------------------------------------------ 
    wash$Start.Station: Fenton St & Ellsworth Dr 
    [1] 49165.6
    ------------------------------------------------------------ 
    wash$Start.Station: Fenton St & Gist Ave
    [1] 26193.5
    ------------------------------------------------------------ 
    wash$Start.Station: Fenton St & New York Ave 
    [1] 86057.21
    ------------------------------------------------------------ 
    wash$Start.Station: Fessenden St & Wisconsin Ave NW
    [1] 26684.84
    ------------------------------------------------------------ 
    wash$Start.Station: Fleet St & Ritchie Pkwy
    [1] 28963.17
    ------------------------------------------------------------ 
    wash$Start.Station: Florida Ave & R St NW
    [1] 274470.1
    ------------------------------------------------------------ 
    wash$Start.Station: Fort Totten Metro
    [1] 58460.65
    ------------------------------------------------------------ 
    wash$Start.Station: Franklin & S Washington St
    [1] 856837.3
    ------------------------------------------------------------ 
    wash$Start.Station: Frederick Ave & Horners Ln
    [1] 3215.157
    ------------------------------------------------------------ 
    wash$Start.Station: Friendship Blvd & Willard Ave
    [1] 64304.09
    ------------------------------------------------------------ 
    wash$Start.Station: Friendship Hts Metro/Wisconsin Ave & Wisconsin Cir
    [1] 84105.34
    ------------------------------------------------------------ 
    wash$Start.Station: Gallaudet / 8th St & Florida Ave NE
    [1] 117254.6
    ------------------------------------------------------------ 
    wash$Start.Station: Garland Ave & Walden Rd
    [1] 6430.599
    ------------------------------------------------------------ 
    wash$Start.Station: George Mason Dr & Wilson Blvd
    [1] 60713.51
    ------------------------------------------------------------ 
    wash$Start.Station: Georgetown Harbor / 30th St NW
    [1] 788842.1
    ------------------------------------------------------------ 
    wash$Start.Station: Georgia & Missouri Ave NW
    [1] 41922.53
    ------------------------------------------------------------ 
    wash$Start.Station: Georgia & New Hampshire Ave NW
    [1] 219742.4
    ------------------------------------------------------------ 
    wash$Start.Station: Georgia Ave & Emerson St NW
    [1] 78843.67
    ------------------------------------------------------------ 
    wash$Start.Station: Georgia Ave & Piney Branch Rd NW
    [1] 38756.31
    ------------------------------------------------------------ 
    wash$Start.Station: Georgia Ave & Spring St
    [1] 5992.176
    ------------------------------------------------------------ 
    wash$Start.Station: Georgia Ave and Fairmont St NW
    [1] 124178.3
    ------------------------------------------------------------ 
    wash$Start.Station: Glebe Rd & 11th St N
    [1] 56560.6
    ------------------------------------------------------------ 
    wash$Start.Station: Good Hope & Naylor Rd SE
    [1] 3855.567
    ------------------------------------------------------------ 
    wash$Start.Station: Good Hope Rd & 14th St SE
    [1] 39819.84
    ------------------------------------------------------------ 
    wash$Start.Station: Good Hope Rd & MLK Ave SE
    [1] 56005.79
    ------------------------------------------------------------ 
    wash$Start.Station: Grandview & Blueridge Ave
    [1] 2239.835
    ------------------------------------------------------------ 
    wash$Start.Station: Greensboro & International Dr
    [1] 760.136
    ------------------------------------------------------------ 
    wash$Start.Station: Hains Point/Buckeye & Ohio Dr SW
    [1] 270441.2
    ------------------------------------------------------------ 
    wash$Start.Station: Hamlin & 7th St NE
    [1] 68761.32
    ------------------------------------------------------------ 
    wash$Start.Station: Harvard St & Adams Mill Rd NW
    [1] 120840.8
    ------------------------------------------------------------ 
    wash$Start.Station: Henry Bacon Dr & Lincoln Memorial Circle NW
    [1] 2307294
    ------------------------------------------------------------ 
    wash$Start.Station: Henry St & Pendleton St
    [1] 25672.84
    ------------------------------------------------------------ 
    wash$Start.Station: Independence Ave & L'Enfant Plaza SW/DOE
    [1] 430320.6
    ------------------------------------------------------------ 
    wash$Start.Station: Iwo Jima Memorial/N Meade & 14th St N
    [1] 433155.5
    ------------------------------------------------------------ 
    wash$Start.Station: Jefferson Dr & 14th St SW
    [1] 3664900
    ------------------------------------------------------------ 
    wash$Start.Station: Jefferson Memorial
    [1] 2579292
    ------------------------------------------------------------ 
    wash$Start.Station: John McCormack Dr & Michigan Ave NE
    [1] 165488.3
    ------------------------------------------------------------ 
    wash$Start.Station: Jones Branch & Westbranch Dr
    [1] 4762.542
    ------------------------------------------------------------ 
    wash$Start.Station: Kennebec St & 11th St N
    [1] 122077.7
    ------------------------------------------------------------ 
    wash$Start.Station: Kennedy Center
    [1] 310884
    ------------------------------------------------------------ 
    wash$Start.Station: Key Blvd & N Quinn St
    [1] 71689.64
    ------------------------------------------------------------ 
    wash$Start.Station: Key West Ave & Great Seneca Hwy
    [1] 3418.302
    ------------------------------------------------------------ 
    wash$Start.Station: Key West Ave & Siesta Key Way
    [1] 24570.84
    ------------------------------------------------------------ 
    wash$Start.Station: King Farm Blvd & Piccard Dr
    [1] 19716.03
    ------------------------------------------------------------ 
    wash$Start.Station: King Farm Blvd & Pleasant Dr
    [1] 15304.95
    ------------------------------------------------------------ 
    wash$Start.Station: King St & Patrick St
    [1] 104289.9
    ------------------------------------------------------------ 
    wash$Start.Station: King St Metro North / Cameron St
    [1] 62902
    ------------------------------------------------------------ 
    wash$Start.Station: King St Metro South
    [1] 105223.1
    ------------------------------------------------------------ 
    wash$Start.Station: L'Enfant Plaza / 7th & C St SW
    [1] 716052.8
    ------------------------------------------------------------ 
    wash$Start.Station: Lamont & Mt Pleasant NW
    [1] 306582.4
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Center
    [1] 6152.773
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Hwy & N Adams St
    [1] 56585.07
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Hwy & N Cleveland St
    [1] 39897.57
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Hwy & N Kirkwood Rd
    [1] 23105.21
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Hwy & N Monroe St
    [1] 31896.85
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Hwy & N Scott St
    [1] 105415.6
    ------------------------------------------------------------ 
    wash$Start.Station: Lee Hwy & N Woodstock St
    [1] 88088.17
    ------------------------------------------------------------ 
    wash$Start.Station: Library St & Freedom Dr
    [1] 10608.24
    ------------------------------------------------------------ 
    wash$Start.Station: Lincoln Memorial
    [1] 3315505
    ------------------------------------------------------------ 
    wash$Start.Station: Lincoln Park / 13th & East Capitol St NE 
    [1] 378497.1
    ------------------------------------------------------------ 
    wash$Start.Station: Long Bridge Park/Long Bridge Dr & 6th St S
    [1] 53649.65
    ------------------------------------------------------------ 
    wash$Start.Station: Lynn & 19th St North
    [1] 486476.1
    ------------------------------------------------------------ 
    wash$Start.Station: Lyttonsville Rd & Lyttonsville Pl
    [1] 26270.9
    ------------------------------------------------------------ 
    wash$Start.Station: M St & Delaware Ave NE
    [1] 430290.1
    ------------------------------------------------------------ 
    wash$Start.Station: M St & New Jersey Ave SE
    [1] 439772.9
    ------------------------------------------------------------ 
    wash$Start.Station: M St & Pennsylvania Ave NW
    [1] 718175.7
    ------------------------------------------------------------ 
    wash$Start.Station: Madison & Fairfax St
    [1] 118606.2
    ------------------------------------------------------------ 
    wash$Start.Station: Madison & N Henry St
    [1] 25159
    ------------------------------------------------------------ 
    wash$Start.Station: Maine Ave & 7th St SW
    [1] 175892.5
    ------------------------------------------------------------ 
    wash$Start.Station: Maple & Ritchie Ave
    [1] 17293.65
    ------------------------------------------------------------ 
    wash$Start.Station: Market Square / King St & Royal St
    [1] 229537.9
    ------------------------------------------------------------ 
    wash$Start.Station: Maryland & Independence Ave SW
    [1] 428234.4
    ------------------------------------------------------------ 
    wash$Start.Station: Maryland Ave & E St NE
    [1] 209745.8
    ------------------------------------------------------------ 
    wash$Start.Station: Massachusetts Ave & Dupont Circle NW
    [1] 1236889
    ------------------------------------------------------------ 
    wash$Start.Station: McKinley St & Connecticut Ave NW
    [1] 57821.13
    ------------------------------------------------------------ 
    wash$Start.Station: Medical Center Dr & Key West Ave
    [1] 5867.23
    ------------------------------------------------------------ 
    wash$Start.Station: Medical Center Metro 
    [1] 52682.38
    ------------------------------------------------------------ 
    wash$Start.Station: Metro Center / 12th & G St NW
    [1] 572027.2
    ------------------------------------------------------------ 
    wash$Start.Station: Minnesota Ave Metro/DOES
    [1] 74813.8
    ------------------------------------------------------------ 
    wash$Start.Station: Monroe Ave & Leslie Ave
    [1] 44614.7
    ------------------------------------------------------------ 
    wash$Start.Station: Monroe St & Monroe Pl
    [1] 3547.701
    ------------------------------------------------------------ 
    wash$Start.Station: Montgomery & East Ln
    [1] 88600.86
    ------------------------------------------------------------ 
    wash$Start.Station: Montgomery Ave & Waverly St 
    [1] 75966.32
    ------------------------------------------------------------ 
    wash$Start.Station: Montgomery College/W Campus Dr & Mannakee St
    [1] 21331.42
    ------------------------------------------------------------ 
    wash$Start.Station: Mount Vernon Ave & Bruce St
    [1] 18939.83
    ------------------------------------------------------------ 
    wash$Start.Station: Mount Vernon Ave & E Del Ray Ave
    [1] 112830.8
    ------------------------------------------------------------ 
    wash$Start.Station: Mount Vernon Ave & E Nelson Ave
    [1] 34597.61
    ------------------------------------------------------------ 
    wash$Start.Station: Mount Vernon Ave & Four Mile Run Park
    [1] 72448.6
    ------------------------------------------------------------ 
    wash$Start.Station: Mount Vernon Ave & Kennedy St
    [1] 200598.6
    ------------------------------------------------------------ 
    wash$Start.Station: N Lynn St & Fairfax Dr
    [1] 194008.8
    ------------------------------------------------------------ 
    wash$Start.Station: N Pershing Dr & Wayne St
    [1] 63780.94
    ------------------------------------------------------------ 
    wash$Start.Station: N Quincy St & Glebe Rd
    [1] 40024.92
    ------------------------------------------------------------ 
    wash$Start.Station: N Randolph St & Fairfax Dr
    [1] 99083.63
    ------------------------------------------------------------ 
    wash$Start.Station: N Rhodes & 16th St N
    [1] 61184.82
    ------------------------------------------------------------ 
    wash$Start.Station: N Veitch  & 20th St N
    [1] 90804.89
    ------------------------------------------------------------ 
    wash$Start.Station: N Veitch & Key Blvd
    [1] 53836.57
    ------------------------------------------------------------ 
    wash$Start.Station: Nannie Helen Burroughs & Minnesota Ave NE
    [1] 7960.415
    ------------------------------------------------------------ 
    wash$Start.Station: Nannie Helen Burroughs Ave & 49th St NE
    [1] 3657.537
    ------------------------------------------------------------ 
    wash$Start.Station: Neal St & Trinidad Ave NE
    [1] 129937.9
    ------------------------------------------------------------ 
    wash$Start.Station: Nebraska Ave/AU East Campus
    [1] 4799.188
    ------------------------------------------------------------ 
    wash$Start.Station: Needwood Rd & Eagles Head Ct
    [1] 4236.974
    ------------------------------------------------------------ 
    wash$Start.Station: New Dominion Pkwy & Fountain Dr
    [1] 12612.39
    ------------------------------------------------------------ 
    wash$Start.Station: New Hampshire & Kirklynn Ave
    [1] 12937.51
    ------------------------------------------------------------ 
    wash$Start.Station: New Hampshire Ave & 24th St NW
    [1] 529094.4
    ------------------------------------------------------------ 
    wash$Start.Station: New Hampshire Ave & T St NW
    [1] 517470.6
    ------------------------------------------------------------ 
    wash$Start.Station: New Jersey Ave & L St NW
    [1] 67359.77
    ------------------------------------------------------------ 
    wash$Start.Station: New Jersey Ave & N St NW/Dunbar HS
    [1] 230035.8
    ------------------------------------------------------------ 
    wash$Start.Station: New Jersey Ave & R St NW
    [1] 207660.9
    ------------------------------------------------------------ 
    wash$Start.Station: New York Ave & 15th St NW
    [1] 1096229
    ------------------------------------------------------------ 
    wash$Start.Station: New York Ave & Hecht Ave NE
    [1] 81606.45
    ------------------------------------------------------------ 
    wash$Start.Station: Norfolk & Rugby Ave
    [1] 11879.76
    ------------------------------------------------------------ 
    wash$Start.Station: Norfolk Ave & Fairmont St
    [1] 61176.17
    ------------------------------------------------------------ 
    wash$Start.Station: North Capitol St & F St NW
    [1] 706625.5
    ------------------------------------------------------------ 
    wash$Start.Station: North Capitol St & G Pl NE
    [1] 264556.2
    ------------------------------------------------------------ 
    wash$Start.Station: North Shore & Cameron Crescent Dr/Crescent Apartments
    [1] 827.688
    ------------------------------------------------------------ 
    wash$Start.Station: North Shore Dr & Village Rd
    [1] 9000.284
    ------------------------------------------------------------ 
    wash$Start.Station: Offutt Ln & Chevy Chase Dr
    [1] 41912.11
    ------------------------------------------------------------ 
    wash$Start.Station: Ohio Dr & West Basin Dr SW / MLK & FDR Memorials
    [1] 1139801
    ------------------------------------------------------------ 
    wash$Start.Station: Oklahoma Ave & D St NE
    [1] 101649.3
    ------------------------------------------------------------ 
    wash$Start.Station: Old Georgetown Rd & Southwick St
    [1] 35604.34
    ------------------------------------------------------------ 
    wash$Start.Station: Park Rd & Holmead Pl NW
    [1] 297546.1
    ------------------------------------------------------------ 
    wash$Start.Station: Pennsylvania & Minnesota Ave SE
    [1] 14879.29
    ------------------------------------------------------------ 
    wash$Start.Station: Pentagon City Metro / 12th & S Hayes St
    [1] 150043.9
    ------------------------------------------------------------ 
    wash$Start.Station: Pershing & N George Mason Dr
    [1] 57053.29
    ------------------------------------------------------------ 
    wash$Start.Station: Philadelphia & Maple Ave
    [1] 10850.25
    ------------------------------------------------------------ 
    wash$Start.Station: Piccard & W Gude Dr
    [1] 7137.168
    ------------------------------------------------------------ 
    wash$Start.Station: Pleasant St & MLK Ave SE
    [1] 16596.8
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac & M St NW
    [1] 351425.9
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac & Pennsylvania Ave SE
    [1] 233263.9
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac & Swann Ave
    [1] 146085.1
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac Ave & 35th St S
    [1] 51893.39
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac Ave & 8th St SE
    [1] 64974.8
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac Ave & Main Line Blvd
    [1] 16897.44
    ------------------------------------------------------------ 
    wash$Start.Station: Potomac Greens Dr & Slaters Ln
    [1] 54292.24
    ------------------------------------------------------------ 
    wash$Start.Station: Powhatan St & Bashford Ln
    [1] 31454.32
    ------------------------------------------------------------ 
    wash$Start.Station: Prince St & Union St
    [1] 230561.4
    ------------------------------------------------------------ 
    wash$Start.Station: Radford & Osage St
    [1] 35867.07
    ------------------------------------------------------------ 
    wash$Start.Station: Randle Circle & Minnesota Ave SE
    [1] 13317.38
    ------------------------------------------------------------ 
    wash$Start.Station: Reston Pkwy & Spectrum Dr
    [1] 4412.162
    ------------------------------------------------------------ 
    wash$Start.Station: Reston Regional Library
    [1] 3745.356
    ------------------------------------------------------------ 
    wash$Start.Station: Reston Station
    [1] 38197.75
    ------------------------------------------------------------ 
    wash$Start.Station: Reston Town Center Transit Station
    [1] 53469.78
    ------------------------------------------------------------ 
    wash$Start.Station: Reston YMCA
    [1] 158434.4
    ------------------------------------------------------------ 
    wash$Start.Station: Rhode Island & Connecticut Ave NW
    [1] 186690.5
    ------------------------------------------------------------ 
    wash$Start.Station: Rhode Island Ave & V St NE
    [1] 118661.6
    ------------------------------------------------------------ 
    wash$Start.Station: Rhode Island Ave Metro
    [1] 102979.5
    ------------------------------------------------------------ 
    wash$Start.Station: Ripley & Bonifant St
    [1] 39961.2
    ------------------------------------------------------------ 
    wash$Start.Station: River Rd & Landy Ln
    [1] 129723.9
    ------------------------------------------------------------ 
    wash$Start.Station: Rockville Metro East
    [1] 13670.43
    ------------------------------------------------------------ 
    wash$Start.Station: Rockville Metro West
    [1] 16959.63
    ------------------------------------------------------------ 
    wash$Start.Station: Rolfe St & 9th St S
    [1] 14968.34
    ------------------------------------------------------------ 
    wash$Start.Station: Rosslyn Metro / Wilson Blvd & Ft Myer Dr
    [1] 325723.5
    ------------------------------------------------------------ 
    wash$Start.Station: Royal & Wilkes St
    [1] 60415.75
    ------------------------------------------------------------ 
    wash$Start.Station: S Arlington Mill Dr & Campbell Ave
    [1] 112438.8
    ------------------------------------------------------------ 
    wash$Start.Station: S Four Mile Run & Walter Reed Dr
    [1] 52552.1
    ------------------------------------------------------------ 
    wash$Start.Station: S Four Mile Run Dr & S Shirlington Rd
    [1] 58010.69
    ------------------------------------------------------------ 
    wash$Start.Station: S George Mason Dr & 13th St S
    [1] 7461.63
    ------------------------------------------------------------ 
    wash$Start.Station: S George Mason Dr & Four Mile Run
    [1] 72186.22
    ------------------------------------------------------------ 
    wash$Start.Station: S Glebe & Potomac Ave
    [1] 135956.8
    ------------------------------------------------------------ 
    wash$Start.Station: S Joyce & 16th St S
    [1] 42395
    ------------------------------------------------------------ 
    wash$Start.Station: S Joyce & Army Navy Dr
    [1] 112776.7
    ------------------------------------------------------------ 
    wash$Start.Station: S Kenmore & 24th St S
    [1] 15386.17
    ------------------------------------------------------------ 
    wash$Start.Station: S Oakland St & Columbia Pike
    [1] 49252.57
    ------------------------------------------------------------ 
    wash$Start.Station: S Stafford & 34th St S
    [1] 18892.15
    ------------------------------------------------------------ 
    wash$Start.Station: S Troy St & 26th St S
    [1] 49923.36
    ------------------------------------------------------------ 
    wash$Start.Station: S Walter Reed Dr & 8th St S
    [1] 98197.66
    ------------------------------------------------------------ 
    wash$Start.Station: Saint Asaph & Madison St
    [1] 89488.82
    ------------------------------------------------------------ 
    wash$Start.Station: Saint Asaph St & Pendleton  St
    [1] 45307.46
    ------------------------------------------------------------ 
    wash$Start.Station: Shady Grove Hospital
    [1] 4176.103
    ------------------------------------------------------------ 
    wash$Start.Station: Shady Grove Metro East
    [1] 16891.08
    ------------------------------------------------------------ 
    wash$Start.Station: Shady Grove Metro West
    [1] 20449.61
    ------------------------------------------------------------ 
    wash$Start.Station: Shirlington Transit Center / S Quincy & Randolph St
    [1] 17828.53
    ------------------------------------------------------------ 
    wash$Start.Station: Silver Spring Metro/Colesville Rd & Wayne Ave
    [1] 63573.69
    ------------------------------------------------------------ 
    wash$Start.Station: Sligo Ave & Carroll Ln
    [1] 181849.7
    ------------------------------------------------------------ 
    wash$Start.Station: Smithsonian-National Mall / Jefferson Dr & 12th St SW
    [1] 2863230
    ------------------------------------------------------------ 
    wash$Start.Station: Solutions & Greensboro Dr
    [1] 179.69
    ------------------------------------------------------------ 
    wash$Start.Station: South Capitol & Atlantic St SW
    [1] 13008.82
    ------------------------------------------------------------ 
    wash$Start.Station: Spring Hill Metro
    [1] 3452.656
    ------------------------------------------------------------ 
    wash$Start.Station: Spring St & Second Ave
    [1] 24223.96
    ------------------------------------------------------------ 
    wash$Start.Station: Sunset Hills & Old Reston Ave
    [1] 22421.3
    ------------------------------------------------------------ 
    wash$Start.Station: Sunset Hills Rd & Discovery Square
    [1] 7377.97
    ------------------------------------------------------------ 
    wash$Start.Station: Sunset Hills Rd & Isaac Newton Square
    [1] 26926.74
    ------------------------------------------------------------ 
    wash$Start.Station: Taft St & E Gude Dr
    [1] 8017.383
    ------------------------------------------------------------ 
    wash$Start.Station: Takoma Metro
    [1] 110379.6
    ------------------------------------------------------------ 
    wash$Start.Station: Takoma Park Rec Center
    [1] 2339.692
    ------------------------------------------------------------ 
    wash$Start.Station: Temporary Rd & Old Reston Ave
    [1] 35255.31
    ------------------------------------------------------------ 
    wash$Start.Station: Tenleytown / Wisconsin Ave & Albemarle St NW
    [1] 157321.7
    ------------------------------------------------------------ 
    wash$Start.Station: Thomas Circle
    [1] 735048.2
    ------------------------------------------------------------ 
    wash$Start.Station: TJ Cmty Ctr / 2nd St & S Old Glebe Rd
    [1] 32700.21
    ------------------------------------------------------------ 
    wash$Start.Station: Towers Crescent Dr & Tysons One Pl
    [1] 1554.134
    ------------------------------------------------------------ 
    wash$Start.Station: Town Center Pkwy & Bowman Towne Dr
    [1] 1611.759
    ------------------------------------------------------------ 
    wash$Start.Station: Town Center Pkwy & Sunset Hills Rd
    [1] 1677.493
    ------------------------------------------------------------ 
    wash$Start.Station: Traville Gateway Dr & Gudelsky Dr
    [1] 3093.034
    ------------------------------------------------------------ 
    wash$Start.Station: Tysons Corner Station
    [1] 10902.05
    ------------------------------------------------------------ 
    wash$Start.Station: Tysons One Pl & Chain Bridge Rd
    [1] 5669.499
    ------------------------------------------------------------ 
    wash$Start.Station: Tysons West Transit Center
    [1] 23042.46
    ------------------------------------------------------------ 
    wash$Start.Station: Union Market/6th St & Neal Pl NE
    [1] 210305.4
    ------------------------------------------------------------ 
    wash$Start.Station: US Dept of State / Virginia Ave & 21st St NW
    [1] 173589.6
    ------------------------------------------------------------ 
    wash$Start.Station: USDA / 12th & Independence Ave SW
    [1] 862597
    ------------------------------------------------------------ 
    wash$Start.Station: Utah St & 11th St N 
    [1] 54088.21
    ------------------------------------------------------------ 
    wash$Start.Station: Van Ness Metro / UDC
    [1] 70376.45
    ------------------------------------------------------------ 
    wash$Start.Station: Veterans Pl & Pershing Dr 
    [1] 12916.14
    ------------------------------------------------------------ 
    wash$Start.Station: Virginia Ave & 25th St NW
    [1] 52474.88
    ------------------------------------------------------------ 
    wash$Start.Station: Virginia Square Metro / N Monroe St & 9th St N
    [1] 178243.3
    ------------------------------------------------------------ 
    wash$Start.Station: Walter Reed Community Center / Walter Reed Dr & 16th St S
    [1] 22893.03
    ------------------------------------------------------------ 
    wash$Start.Station: Ward Circle / American University
    [1] 110053.3
    ------------------------------------------------------------ 
    wash$Start.Station: Washington & Independence Ave SW/HHS
    [1] 815032.3
    ------------------------------------------------------------ 
    wash$Start.Station: Washington Adventist U / Flower Ave & Division St
    [1] 23180.79
    ------------------------------------------------------------ 
    wash$Start.Station: Washington Blvd & 10th St N
    [1] 73005.02
    ------------------------------------------------------------ 
    wash$Start.Station: Washington Blvd & 7th St N
    [1] 23529.01
    ------------------------------------------------------------ 
    wash$Start.Station: Washington Blvd & N Frederick St
    [1] 29360.7
    ------------------------------------------------------------ 
    wash$Start.Station: Washington Blvd & Walter Reed Dr 
    [1] 61585.53
    ------------------------------------------------------------ 
    wash$Start.Station: Washington-Lee High School / N Stafford St & Generals Way
    [1] 23657.02
    ------------------------------------------------------------ 
    wash$Start.Station: Westover Library / Washington Blvd & N McKinley Rd
    [1] 5868.243
    ------------------------------------------------------------ 
    wash$Start.Station: Westpark & Jones Branch Dr
    [1] 11336.58
    ------------------------------------------------------------ 
    wash$Start.Station: Westpark & Park Run Dr
    [1] 361.905
    ------------------------------------------------------------ 
    wash$Start.Station: Westpark Dr & Leesburg Pike
    [1] 1403.172
    ------------------------------------------------------------ 
    wash$Start.Station: Wheaton Metro/Georgia Ave & Reedie Dr
    [1] 18123.36
    ------------------------------------------------------------ 
    wash$Start.Station: Wilson Blvd & Franklin Rd
    [1] 76902.51
    ------------------------------------------------------------ 
    wash$Start.Station: Wilson Blvd & N Edgewood St
    [1] 72986.22
    ------------------------------------------------------------ 
    wash$Start.Station: Wilson Blvd & N Illinois St 
    [1] 29886.63
    ------------------------------------------------------------ 
    wash$Start.Station: Wilson Blvd & N Quincy St
    [1] 105377.4
    ------------------------------------------------------------ 
    wash$Start.Station: Wilson Blvd & N Troy St
    [1] 4684.979
    ------------------------------------------------------------ 
    wash$Start.Station: Wilson Blvd & N Uhle St
    [1] 90815.13
    ------------------------------------------------------------ 
    wash$Start.Station: Windham Ln & Amherst Ave
    [1] 49627.35
    ------------------------------------------------------------ 
    wash$Start.Station: Wisconsin Ave & Brandywine St NW
    [1] 49283.6
    ------------------------------------------------------------ 
    wash$Start.Station: Wisconsin Ave & Ingomar St NW
    [1] 55826.13
    ------------------------------------------------------------ 
    wash$Start.Station: Wisconsin Ave & Newark St NW
    [1] 180333.1
    ------------------------------------------------------------ 
    wash$Start.Station: Wisconsin Ave & O St NW
    [1] 419597.3
    ------------------------------------------------------------ 
    wash$Start.Station: Woodmont Ave & Strathmore St
    [1] 109328.2
    ------------------------------------------------------------ 
    wash$Start.Station: Yuma St & Tenley Circle NW
    [1] 53454.96



```R
# Statistics show that users spent 14,174,432 seconds when starting at the most common sation which is Columbus Circle/Union Station
```

**Summary of your question 2 results goes here.**
We wanted to investigate what are the 3 most common stations in each city. For Washington, it is Columbus Circle/Union square. For New York, it is Pershing square North, and for Chicago, it is Streeter Dr& Grand Ave. 
We also know now, according to our statistics that people spent the most time on the Washington most common start station, which is confirmed by our 1st question. we discovered then that people spend the most time on the bike share in Washington. 

### Question 3

**Your question 3 goes here.**
What are the counts for each user type in each city?


```R


```


    Error in parse(text = x, srcfile = src): <text>:2:6: unexpected symbol
    1: # Your solution code goes here
    2: What are
            ^
    Traceback:




```R
#Loading plyr library in order to use the count function
library(plyr)
#Looking for the count of user types in Washington
wuc<-count(wash, c("User.Type")) 
wuc
```


<table>
<thead><tr><th scope=col>User.Type</th><th scope=col>freq</th></tr></thead>
<tbody>
	<tr><td>          </td><td>    1     </td></tr>
	<tr><td>Customer  </td><td>23450     </td></tr>
	<tr><td>Subscriber</td><td>65600     </td></tr>
</tbody>
</table>




```R
#creating the barchart for Washington
wuc_base<-ggplot(data=wuc, aes(x=User.Type, y= freq))
wuc_base+ geom_bar(stat="identity")+
xlab('User Type')+
ylab('Number of users')+
ggtitle('Number of users in Washington according to type')+
scale_y_continuous(name="Number of users", labels = scales::comma)
```


![png](output_39_0.png)



```R
# There are more subscribers than customers in Washington.
```


```R
#Looking for the count of user types in Chicago
chiuc<-count(chi, c("User.Type")) 
chiuc
```


<table>
<thead><tr><th scope=col>User.Type</th><th scope=col>freq</th></tr></thead>
<tbody>
	<tr><td>          </td><td>   1      </td></tr>
	<tr><td>Customer  </td><td>1746      </td></tr>
	<tr><td>Subscriber</td><td>6883      </td></tr>
</tbody>
</table>




```R
#creating the barchart for Chicago
chiuc_base<-ggplot(data=chiuc, aes(x=User.Type, y= freq))
chiuc_base+ geom_bar(stat="identity")+
xlab('User Type')+
ylab('Number of users')+
ggtitle('Number of users in Chicago according to type')+
scale_y_continuous(name="Number of users", labels = scales::comma)
```


![png](output_42_0.png)



```R
# As in Washington, there are more subscribers than customers in Chicago
```


```R
#Looking for the count of user types in Chicago
nyuc<-count(ny, c("User.Type")) 
nyuc
```


<table>
<thead><tr><th scope=col>User.Type</th><th scope=col>freq</th></tr></thead>
<tbody>
	<tr><td>          </td><td>  119     </td></tr>
	<tr><td>Customer  </td><td> 5558     </td></tr>
	<tr><td>Subscriber</td><td>49093     </td></tr>
</tbody>
</table>




```R
#creating the barchart for New York
nyuc_base<-ggplot(data=chiuc, aes(x=User.Type, y= freq))
nyuc_base+ geom_bar(stat="identity")+
xlab('User Type')+
ylab('Number of users')+
ggtitle('Number of users in Chicago according to type')+
scale_y_continuous(name="Number of users", labels = scales::comma)
```


![png](output_45_0.png)



```R
#As in the two orther cities, there are more subscribers than customers in New York
```


```R
#Summary statistics about trip duration according to user type for Chicago
by(chi$Gender,chi$User.Type, count)
```


    chi$User.Type: 
      x freq
    1      1
    ------------------------------------------------------------ 
    chi$User.Type: Customer
      x freq
    1   1746
    ------------------------------------------------------------ 
    chi$User.Type: Subscriber
           x freq
    1           1
    2 Female 1723
    3   Male 5159



```R
# According to summary statistics, there are more male than female subscribers in Chicago
```


```R
#Summary statistics about trip duration according to user type for Chicago
by(ny$Gender,ny$User.Type, count)
```


    ny$User.Type: 
           x freq
    1           3
    2 Female   31
    3   Male   85
    ------------------------------------------------------------ 
    ny$User.Type: Customer
           x freq
    1        4743
    2 Female  324
    3   Male  491
    ------------------------------------------------------------ 
    ny$User.Type: Subscriber
           x  freq
    1          664
    2 Female 11804
    3   Male 36625



```R
# According to summary statistics, there are also more male than female subscribers and customers in New York
```


```R
# There are no data about Gender for users in Washington
#Let's check
head(wash)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>Start.Time</th><th scope=col>End.Time</th><th scope=col>Trip.Duration</th><th scope=col>Start.Station</th><th scope=col>End.Station</th><th scope=col>User.Type</th></tr></thead>
<tbody>
	<tr><td>1621326                                                                                        </td><td>2017-06-21 08:36:34                                                                            </td><td>2017-06-21 08:44:43                                                                            </td><td> 489.066                                                                                       </td><td><span style=white-space:pre-wrap>14th &amp; Belmont St NW                       </span>        </td><td><span style=white-space:pre-wrap>15th &amp; K St NW                                     </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td> 482740                                                                                        </td><td>2017-03-11 10:40:00                                                                            </td><td>2017-03-11 10:46:00                                                                            </td><td> 402.549                                                                                       </td><td><span style=white-space:pre-wrap>Yuma St &amp; Tenley Circle NW                 </span>        </td><td><span style=white-space:pre-wrap>Connecticut Ave &amp; Yuma St NW                       </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td>1330037                                                                                        </td><td>2017-05-30 01:02:59                                                                            </td><td>2017-05-30 01:13:37                                                                            </td><td> 637.251                                                                                       </td><td><span style=white-space:pre-wrap>17th St &amp; Massachusetts Ave NW             </span>        </td><td><span style=white-space:pre-wrap>5th &amp; K St NW                                      </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td> 665458                                                                                        </td><td>2017-04-02 07:48:35                                                                            </td><td>2017-04-02 08:19:03                                                                            </td><td>1827.341                                                                                       </td><td><span style=white-space:pre-wrap>Constitution Ave &amp; 2nd St NW/DOL           </span>        </td><td><span style=white-space:pre-wrap>M St &amp; Pennsylvania Ave NW                         </span></td><td><span style=white-space:pre-wrap>Customer  </span>                                             </td></tr>
	<tr><td>1481135                                                                                        </td><td>2017-06-10 08:36:28                                                                            </td><td>2017-06-10 09:02:17                                                                            </td><td>1549.427                                                                                       </td><td>Henry Bacon Dr &amp; Lincoln Memorial Circle NW                                                </td><td><span style=white-space:pre-wrap>Maine Ave &amp; 7th St SW                              </span></td><td>Subscriber                                                                                     </td></tr>
	<tr><td>1148202                                                                                </td><td>2017-05-14 07:18:18                                                                    </td><td>2017-05-14 07:24:56                                                                    </td><td> 398.000                                                                               </td><td><span style=white-space:pre-wrap>1st &amp; K St SE                              </span></td><td>Eastern Market Metro / Pennsylvania Ave &amp; 7th St SE                                </td><td>Subscriber                                                                             </td></tr>
</tbody>
</table>



**Summary of your question 3 results goes here.**
We wanted to investigate the counts for user types in the 3 cities.
As confirmed by our 1st and 2nd questions, the bike share is mostly used in Washington, with a lot more of subscribers than customers in all the cities. And for the cities, we have data about the gender of users, we discovered that men use the bikeshare more than women.


## Finishing Up

> Congratulations!  You have reached the end of the Explore Bikeshare Data Project. You should be very proud of all you have accomplished!

> **Tip**: Once you are satisfied with your work here, check over your report to make sure that it is satisfies all the areas of the [rubric](https://review.udacity.com/#!/rubrics/2508/view). 


## Directions to Submit

> Before you submit your project, you need to create a .html or .pdf version of this notebook in the workspace here. To do that, run the code cell below. If it worked correctly, you should get a return code of 0, and you should see the generated .html file in the workspace directory (click on the orange Jupyter icon in the upper left).

> Alternatively, you can download this report as .html via the **File** > **Download as** submenu, and then manually upload it into the workspace directory by clicking on the orange Jupyter icon in the upper left, then using the Upload button.

> Once you've done this, you can submit your project by clicking on the "Submit Project" button in the lower right here. This will create and submit a zip file with this .ipynb doc and the .html or .pdf version you created. Congratulations!


```R
system('python -m nbconvert Explore_bikeshare_data.ipynb')

```
