//
//  CustomURLImageView.swift
//  SwiftUIAPIcalls
//
//  Created by Ioannis Andreoulakis on 15/2/24.
//
// -16- I add an image. So this URL image needs to take in a url String when it's created
// so i create it here inside the Struct
//
// -17- Also i want to have a @State here to be data optional and the idea is
// when i have the data im going to go ahead and show an image from the data
// and if i dont have the data im going to show a placeholder image
//
// -18- Now i'm going to cut the .frame and .background modifiers from ContentView Image
// and paste them here. I'm also going to fetch the image.
//
// -19- To do so i create a new func below. The first thing i want to do is to
// create a url.
// Then i create a task below to actually fetch the data. In this completion block
// im gonna be a tad lazy and ignore the response and error using '_' and that's cause
// if i dont have data my image is not gonna show up properly.
// then i say self.data = data and ofcouse, task.resume() to start the process.
//
// -20- now from this data in line 34 i want to create a UI image so after data i add a comma and type let uiimage.....
// The if let is because UIImage with data is optional
//
// -21- Once i've done that, i can say go ahead and return an image with the UIImage
// that i've just created up above and also add some modifiers below both images.
// Also change the place holder name of the Image from "" to ' systemName: "video" '
//
// COOL ! Now that my URLImage is created, im going to use it inside my HStack
// in the ContentView. Continue to ContentView

import SwiftUI

struct URLImage: View {
    let urlString: String                                           // -16-
    
    @State var data: Data?                                          // -17-
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {     // -20-
            Image(uiImage: uiimage)                                 // -21-
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .shadow(radius: 2)

            
        } else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 70)                      // -18-
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 3))
                .shadow(radius: 2)
                .onAppear {
                    fetchData()
                }
        }
    }
    
    private func fetchData() {                                     // -19-
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
    
}

#Preview {
    URLImage(urlString: "")
}
