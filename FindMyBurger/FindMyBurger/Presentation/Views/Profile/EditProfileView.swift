//
//  editProfile.swift
//  FindMyBurger
//
//  Created by Apps2T on 13/2/23.
//

import SwiftUI

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
//                    Image("imgProfile")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 150, height: 150)
//                        .clipShape(Circle())
                    Button {
                        // Action
                        viewModel.shouldShowImagePicker.toggle()
                    } label: {
                        if let image = self.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
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
            .fullScreenCover(isPresented: viewModel.shouldShowImagePicker, onDismiss: nil){
                ImagePicker(image: viewModel.$image)
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

    private let controller = UIImagePickerController()

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

        let parent: ImagePicker

        init(parent: ImagePicker){
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
            picker.dismiss(animated: true)
        }

        func makeUIViewController(context: Context) -> some UIViewController {
            controller.delegate = context.coordinator
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context){

        }


    }
}
