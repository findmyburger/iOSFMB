//
//  editProfile.swift
//  FindMyBurger
//
//  Created by Apps2T on 13/2/23.
//

import SwiftUI
import UIKit

enum EditState {
    case name
    case passwords
}

struct EditProfileView: View {
    
    @ObservedObject private var viewModel = EditProfileViewModel()
    
    @State var image: UIImage?
    
    var editSelectedState: EditState = .passwords
    
    var body: some View {
        ZStack {
            BackgroundColorView()
            VStack(spacing: 0) {
                
                CustomTitle(title: "Editar perfil")
                    .padding(.top, 20)
                    .padding(.bottom, 15)
                
                ZStack(alignment: .bottomTrailing) {

                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 143, height: 143)
                            .cornerRadius(80)
                    }else{
                        Image(systemName: "person.fill")
                            .font(.system(size: 80))
                            .padding()
                            .foregroundColor(Color(.label))
                    }
                    Image(systemName: "camera.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 30))
                        .background(Color.white)
                        .clipShape(Circle())
                        .onTapGesture {
                            viewModel.shouldShowImagePicker = true
                        }
                    
                }
                
                VStack(spacing: 30) {
                    switch editSelectedState {
                    case .name:
                        TextFields(title: "Nombre", binding: $viewModel.name, text: viewModel.name)
                    case .passwords:
                        SecureFields(title: "Contraseña", binding: $viewModel.pass, text: viewModel.pass)
                        
                        SecureFields(title: "Nueva Contraseña", binding: $viewModel.newPass, text: viewModel.newPass)
                        
                        SecureFields(title: "Repetir contraseña", binding: $viewModel.newPass_confirmation, text: viewModel.newPass_confirmation)
                        
                        
                    }
                }
                .padding(.top, 50)
                .padding(.horizontal, 25)
                
                Spacer()
                
                editProfileButton
                    .padding(.horizontal, 25)
                    .padding(.bottom, 20)
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .sheet(isPresented: $viewModel.shouldShowImagePicker, onDismiss: nil){
                ImagePicker(image: $image)
                    .ignoresSafeArea()
            }
        }
        //.navigationBarHidden(true)
    }
    
    var editProfileButton: some View {
        Button(
            action: {
                viewModel.editProfile()
            }){
                
                Text("Actualizar")
                    .font(.custom("Inter-Regular", size: 20))
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                
            }
            .padding(.horizontal, 25)
            .background(Color("Amarillo"))
            .cornerRadius(25)
            .background(
                NavigationLink(destination: ProfileView(), isActive: $viewModel.shouldShowProfile) {
                    EmptyView()
                }
            )
            .alert("Error al actualizar", isPresented: $viewModel.shouldShowError, actions: {
                
                Button{
                    
                } label: {
                    Text("Ok")
                }
            }){
                Text(viewModel.alertText)
            }
    }
}



struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Environment(\.presentationMode) private var presentationMode
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        
        return imagePicker
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
     
        var parent: ImagePicker
     
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
     
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.image = image
            }
     
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
