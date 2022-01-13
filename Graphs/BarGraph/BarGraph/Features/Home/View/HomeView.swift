//
//  HomeView.swift
//  BarGraph
//
//  Created by Rogério Toledo on 13/01/22.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Layout
    var headerView: some View {
        HStack(spacing: 15) {
            Button {
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
            }

            Text("My Stats")
                .font(.title2)
            
            Spacer()
            
            Button {
            } label: {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
        }
        .foregroundColor(.white)
    }
    
    var paymentView: some View {
        HStack {
            Text("$95.00")
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Text("/collab")
                .font(.callout)
                .foregroundColor(.gray)
            
            Spacer()
            
            Button {
            } label: {
                Text("Accept")
                    .font(.callout)
                    .foregroundColor(Color("Backgroud"))
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("Purple"))
                    )
            }
        }
        .padding()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                headerView
                DownloadStats()
                FollowersStats()
                paymentView
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background").ignoresSafeArea())
        .preferredColorScheme(.dark)
    }
}

// MARK: - ViewBuilders
extension HomeView {
    @ViewBuilder
    func FollowersStats() -> some View {
        VStack {
            HStack {
                Button {
                } label: {
                    Text("Show All")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Background"))
                        )
                }
                .padding(.trailing,10)
                
                Image(systemName: "checkmark")
                    .font(.caption.bold())
                    .foregroundColor(Color("Background"))
                    .padding(6)
                    .background(Color("Green"))
                    .cornerRadius(8)
                
                Text("Followers")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
                
                Image(systemName: "play.fill")
                    .font(.caption.bold())
                    .foregroundColor(Color("Background"))
                    .padding(6)
                    .background(Color("Purple"))
                    .cornerRadius(8)
                
                Text("Following")
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding(.trailing, 10)
            }
            
            VStack(spacing: 15) {
                Text("$93.5K")
                    .font(.largeTitle.bold())
                    .scaleEffect(1.3)
                
                Text("Earning This Month")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .padding(.top, 25)

            HStack(spacing: 10) {
                StatView(title: "Followers", count: "87.57K", image: "checkmark", color: "Green")
                StatView(title: "Following", count: "27.57K", image: "play.fill", color: "Purple")
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
        )
    }
    
    @ViewBuilder
    func StatView(
        title: String,
        count: String,
        image: String,
        color: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 25) {
            HStack {
                Image(systemName: image)
                    .font(.caption.bold())
                    .foregroundColor(Color(color))
                    .padding(6)
                    .background(Color("Background"))
                    .cornerRadius(8)
                
                Text("Followers")
            }
            
            Text(count)
                .font(.title.bold())
        }
        .foregroundColor(Color("Background"))
        .padding(.vertical, 22)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(color))
        .cornerRadius(15)
    }
    
    @ViewBuilder
    func DownloadStats() -> some View {
        VStack(spacing: 15) {
            HStack {
                VStack(alignment: .leading, spacing: 13) {
                    Text("Ads Expense")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Menu {
                    } label: {
                        Label {
                            Image(systemName: "chevron.down")
                        } icon: {
                            Text("Last 7 Days")
                        }
                        .font(.callout)
                        .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "arrow.up.forward")
                        .font(.title2.bold())
                }
                .foregroundColor(.white)
                .offset(y: -10)
            }
            
            HStack {
                Text("$12.85")
                    .font(.largeTitle.bold())
                
                Spacer()
                
                Button {
                } label: {
                    Text("Download")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Background"))
                        )
                }
            }
            .padding(.vertical,20)
            
            BarGraphView(downloads: weekDownloads)
                .padding(.top,25)
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black)
        )
        .padding(.vertical,20)
    }
}

// MARK: - PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
