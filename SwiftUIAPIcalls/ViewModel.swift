//
//  ViewModel.swift
//  SwiftUIAPIcalls
//
//  Created by Ioannis Andreoulakis on 14/2/24.
//
// -3- I create the file ViewModel and in here the class ViewModel.
// Then i create a func fetch() that safely unwraps the URL with guard let.
//
// -4- Create the URL session to perform the API call. To ensure that the ContentView listens and sees this class here,
// go to the ContentView and create an instance of this class using @StateObject. (Continue to ContentView)
//
// -7- Now i need to convert the data in a do catch block that i get back from the API into to actual objects.
// So courses try to use JSONDecoder to decode an array of 'Course' objects from the data.
// And can also can throw and error
//
// -8- Now, how do i let ContentView know that i have this array of 'courses' and that it should update itself?
// Well, i create a @Published property courses like so. Now every single time this array is updated
// the view going to know that it needs to update itself.
//
// -9- It's important that i update this particular this property or any Published property
// on the main queue as it does trigger a UI update and that should be on the main queue.
//
// -10- I will also add [weak self] here so i dont cause a memory leak since i reference self
// in my callback (line 47).
//
// -11- And to kick off the API call i need to resume the task here
//
// Now that the ViewModel is ready i need to create an instance of it inside my ContentView, continute there.

import Foundation

class ViewModel: ObservableObject {
    
    @Published var courses: [Course] = []                                                                // -8-
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {             // -3-
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in                // -4-  // -10-
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }                                                                                          // -7-
            catch {
                print(error)
            }
        }
        
        task.resume()
        
    }
}
