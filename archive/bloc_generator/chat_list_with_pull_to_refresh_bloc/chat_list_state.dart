// PROMPT: Create a BLoC to manage a list of chats inside a social media app. The list
// can be refreshed with a pull-to-refresh action from the app user. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'chat_list_bloc.dart';

enum ChatListStatus { loading, loaded, error }

class ChatListState extends Equatable {
  final List<Chat> chatList;
  final ChatListStatus status;

  const ChatListState({
    required this.chatList,
    this.status = ChatListStatus.loading,
  });

  ChatListState copyWith({
    List<Chat>? chatList,
    ChatListStatus? status,
  }) {
    return ChatListState(
      chatList: chatList ?? this.chatList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [chatList, status];
}