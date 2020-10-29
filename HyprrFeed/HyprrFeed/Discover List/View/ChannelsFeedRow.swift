import SwiftUI

struct ChannelsFeedRow: View {
    
    // MARK: Properties
    
    var data: ChannelsFeedRowData
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    RemoteRowImage(url: data.avatar)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Text(data.name)
                        .font(.title)
                        .foregroundColor(.black)
                        .background(Color(white: 1.0, opacity: 0.5))
                }
                Text(data.title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .background(Color(white: 1.0, opacity: 0.5))
                Spacer()
                Text(data.tags)
                    .font(.caption)
                    .foregroundColor(.black)
                    .background(Color(white: 1.0, opacity: 0.5))
            }
            .padding(.all)
        }
        .background(
            RemoteRowImage(url: data.content))
    }
}

struct ChannelsFeedRow_Previews: PreviewProvider {
    static var previews: some View {
        ChannelsFeedRow(data: ChannelsFeedRowData(name: "Kira-Marie Art", title: "Nyma Tang Portrait SpeedPaint | Procreate", content: nil, avatar: nil, tags: "https://www.instagram.com/kiramarieart/\nhttps://kiramarie.art/\n\n🌟NEW Procreate Brushsets available in my stores!🌟\nhttps://etsy.com/uk/shop/KiraMarieArt\nhttps://gumroad.com/KiraMarieArt\nhttps://kiramarie.art\n\nSOCIAL MEDIA LINKS:\nSubscribe: https://bit.ly/2Tm07Jk\nhttps://www.instagram.com/kiramarieart\nhttps://www.facebook.com/KiraMarieArtist\nhttps://www.deviantart.com/kiramarieart\nhttps://www.kiramarieart.com/tumblr\n\nTikTok: @KiraMarieArt\nByte: @KiraMarieArt\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\nAbout This Video:\n\nHello guys, I am Kira-Marie.\nIn this video, I will be showing you a SpeedPaint of the beautiful Nyma Tang! \n\nI'm starting to become obsessed with her and decided I would love to draw her. Her skin tone is absoluely stunning. Tell me what think about my piece ❤️️\n\nPlease comment below and let me know what other videos you'd like to see of mine. I really do hope you enjoy this video. \nPlease do give it a thumbs up if you enjoyed and see you all in my next video! \n\nQUICK Q&A:\nTools I use - iPadPro 10.5 inch\nWhat software do I use to draw - Procreate 5\nHow I edit videos - Camtasia & iMovie\nHow I make thumbnails - Photoshop 2017 & Procreate\n\nMusic:\nOpening & Ending: Promise by Dr. Duce ft Carmen J\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n#kiramarieart #art #artist #illustration #artwork #digitalart #digitalpainting #digitalartist #portrait #sketch #painting #procreate #digitalillustration #conceptart #digitaldrawing #drawing #graphicdesign #graphicartist #digitaldesign #graphicart #hyprr #ipadtutorial  #tutorial #howto #howtodraw #hyprrfriends #howtopaint #illustrate #drawingtutorial #ipadpro #ipad #speedpaint #procreatetutorial #procreatebrushes #ipadprocreate"))
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
