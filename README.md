## What I Did

#### Architecture
      I chose MVC for its simplicity. My previous experience is in VIPER, 
      which seemed a bit overkill for a project of this size. I have very limited exposure to 
      MVVM but not enough to feel comfortable with it.
      
 #### UI
      I chose to use UIKit instead of SwiftUI since I have had more 
      exposure to it and because it seems to be more prevalent, at least 
      for now. The UI is extremely simple with just one view controller 
      consisting of a header, two buttons, and a table view. I chose not
      to focus on UI for this project, as choosing architecture patterns
      and websockets were both new to me. 
      
 #### WebService
      There is a second branch in this project where I started to try to
      pull some of the logic out of the view controller. I started 
      creating a WebService file to handle all of the Pusher connections.
      I ran out of time and did not get this working, but the outline of it
      is there. I believe this would be a better approach. The connection/binding
      functions could be reused and other functionality could easily be added for
      channels requiring authorization, global event subscriptions, etc. As the app
      stands now, all the logic for the Pusher connection is in the one view controller.
      If I were to add more screens to this app, that would be an issue. 
      


## What I Would Have Done

#### Tests, tests, tests
     We all start out with the best of intentions right? My plan was to write so many tests. There
     are exactly zero. The Pusher aspect of this took longer than I anticipated and tests were the
     sacrifice. As an auditor in a former life, that decision hurt.
     
#### Architecture Decisions
    In researching which pattern I wanted to use, I ran across many that I had not heard of before.
    Given more time, I would have liked to look into those patterns to see if one would be more appropriate
    here. My "learn this" bookmarks folder just keeps growing. 
    
#### The View Controller Trap
     I approached this with the idea of "get it all working and then move it where it should go.
     As a result, the view controller is doing things I'd prefer it not do. I should have approached
     this differently and put things where they belonged to begin with. On the bright side, it is all working. 


## Things I Learned

* A designer I am not. 
* Two years of cleaning up tech debt and fixing bugs taught me a lot, but there is so much more to learn (and that's exciting).
* A markdown expert I am not.

#### For Fun

One of the first messages that came through after my hard won fight with Pusher was "cube canine avatar" and now I have a mascot.

<img src="https://github.com/jessharrison83/CraveRetailTakeHome/blob/main/CraveRetailPusherTakeHome/fc3ef9118573909.608ba6c97bd43.gif" width="250" height="250" />
