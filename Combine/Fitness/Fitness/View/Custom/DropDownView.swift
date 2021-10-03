//
//  DropDownView.swift
//  Fitness
//
//  Created by Rogério Toledo on 01/02/21.
//

import SwiftUI

struct DropDownView<T: DropdownItemProtocol>: View {
    @Binding var viewModel: T
    
    var dropDownActionSheet: ActionSheet {
        ActionSheet(title: Text("Select"), buttons: viewModel.options.map{ option in
                return ActionSheet.Button.default(Text(option.formatted)) {
                    viewModel.selectedOption = option
                }
        })
    }
    
    var body: some View {
        VStack {
            HStack{
                Text(viewModel.headerTitle)
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
            }
            .padding(.vertical, 10)
            
            Button(action: { viewModel.isSelected = true }, label: {
                HStack{
                    Text(viewModel.dropdownTitle)
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                        .font(.system(size: 24, weight: .medium))
                }
            })
            .buttonStyle(PrimaryButtonStyle(fillColor: .primaryButton))
        }
        .actionSheet(isPresented: $viewModel.isSelected) {
            dropDownActionSheet
        }
        .padding(15)
    }
}
