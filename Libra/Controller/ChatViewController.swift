import Foundation
import UIKit
import MessageKit
import InputBarAccessoryView

//sender type
struct sender: SenderType{
    var senderId: String
    
    var displayName: String
    
}

//message
struct message: MessageType{
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
    
}

struct media: MediaItem{
    var url: URL?
    
    var image: UIImage?
    
    var placeholderImage: UIImage
    
    var size: CGSize
    
}


class ChatViewController: MessagesViewController{
    
    
    private let current_user = sender(senderId: "123", displayName: "Vivaan")
    private let other_user = sender(senderId: "876", displayName: "World")
    private var messages = [message]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        
        setupInputButton()
        
        navigationItem.title = "Vivaan"
        
        //sample data
        messages.append(message(sender: other_user, messageId: "123", sentDate: Date().addingTimeInterval(-86400) , kind: .text("Hey Vivaan, how are you?")))
        messages.append(message(sender: current_user, messageId: "143", sentDate: Date().addingTimeInterval(-86405) , kind: .text("I feel anxious")))
        messages.append(message(sender: other_user, messageId: "153", sentDate: Date().addingTimeInterval(-86404) , kind: .text("Could you tell me what you're feeling exactly?")))
        messages.append(message(sender: current_user, messageId: "163", sentDate: Date().addingTimeInterval(-86403) , kind: .text("I feel like everything is changing around me")))
        
    }
     fileprivate func AddMessage(_ input: String){
        let new_message = message(sender: currentSender(), messageId: "504", sentDate: Date().addingTimeInterval(-8733), kind: .text(input))
        messages.append(new_message)
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToLastItem()
    }
    
     func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        if isFromCurrentSender(message: message){
            avatarView.image = UIImage(named: "Vivaan")
        }
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        if isFromCurrentSender(message: message) == true{
            return UIColor(named: "Mygreen")!
        }else{
            return UIColor(named: "myYellow")!
        }
    }
    
    private func setupInputButton() {
            let button = InputBarButtonItem()
            button.setSize(CGSize(width: 35, height: 35), animated: false)
            button.setImage(UIImage(systemName: "paperclip"), for: .normal)
            button.onTouchUpInside { [weak self] _ in
                self?.presentactionsheet()
            }
            messageInputBar.setLeftStackViewWidthConstant(to: 36, animated: false)
            messageInputBar.setStackViewItems([button], forStack: .left, animated: false)
        }
    
    
    
   
}

extension ChatViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func presentactionsheet(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //once image is selected
        let my_image = info[.originalImage] as? UIImage
        let my_message = message(sender: current_user, messageId: "234", sentDate: Date(), kind: .photo(media(url: nil, image: my_image, placeholderImage: my_image!, size: CGSize(width: 200, height: 200))))
        messages.append(my_message)
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToLastItem()
        picker.dismiss(animated: true, completion: nil)
    }
}

//MARK:- Data Source
extension ChatViewController: MessagesDataSource{
    func currentSender() -> SenderType {
        return current_user
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    
    //the function below wants the number of messages
    //this framework groups every message in different sections
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}

//MARK:- LayoutDelegate

//need to specify cell size to add attributed text above and below cell
extension ChatViewController: MessagesLayoutDelegate{
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
            return 5
        }

        func cellBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
            return 5
        }

        func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
            return 5
        }

        func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
            return 15
        }
    
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:MM:SS"

        
        
        return NSAttributedString(string: dateFormatter.string(from: message.sentDate), attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)])
    }
    
//    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
//        let style = NSMutableParagraphStyle()
//        if isFromCurrentSender(message: message) {
//            style.alignment = .left
//        }else{
//            style.alignment = .right
//
//        }
//
//        return NSAttributedString(string: "Read", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10), NSAttributedString.Key.paragraphStyle: style])
//    }
     
    
}

//MARK:- DisplayDelegate
extension ChatViewController:MessagesDisplayDelegate{
    
}

extension ChatViewController: InputBarAccessoryViewDelegate{
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print("Selected")
        AddMessage(text)
        //clears the text inputted
        inputBar.inputTextView.text = ""
        
    }
    
}
