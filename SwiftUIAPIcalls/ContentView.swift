//
//  ContentView.swift
//  SwiftUIAPIcalls
//
//  Created by Ioannis Andreoulakis on 14/2/24.
//
// -1- Create a NavigationStack with a List inside and navigation modifier for the title.
//
// -2- Create a new file for the ViewModel (Go there to continue the sequence)
//
// -5- Now i create a @StateObject instance of the ViewModel class. Now in order to Continue i need
// to define how the Course is, what does it include based on the JSON information. So i create a new Swift file
// 'CourseModel' inside which i create the course struct. (Continue to CourseModel file)
//
// -12- I create an instance of the ViewModel inside the ContentView
//
// -13- When the view appear i will tell it to fetch. This will give me back
// my array of courses and i wanna do a loop over those courses in my List here,
// to actually show the contents of the model.
// -14- That's why i create a ForEach loop here
//
// -15- Now i create an HStack to add a text and image
//
// Create a new SwiftUI view file for my custom URLImage, continute to CustomURLImageView file
//
// -22- So i inject the CustomURLImage that i created, inside the HStack below.
// Im gonna go ahead and replace ' Image("") ' with URLImage and pass in my course
// with .image and for the data i set to nil, since by defaylt im not going to have data


import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()                            // -5- // -12-
    
    var body: some View {
        NavigationStack {                                                // -1-
            List {
                ForEach(viewModel.courses, id: \.self) { course in       // -14-
                    HStack {
                        URLImage(urlString: course.image, data: nil)
                            
                        
                        Text(course.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear {                                                  // -13-
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
