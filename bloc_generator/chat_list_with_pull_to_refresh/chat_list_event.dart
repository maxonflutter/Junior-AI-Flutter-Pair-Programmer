// PROMPT: Create a BLoC to manage a list of chats inside a social media app. The list
// can be refreshed with a pull-to-refresh action from the app user. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'chat_list_bloc.dart';

abstract class ChatListEvent extends Equatable {
  const ChatListEvent();

  @override
  List<Object> get props => [];
}

class RefreshChatListEvent extends ChatListEvent {}

class LoadMoreChatsEvent extends ChatListEvent {}

class SearchChatsEvent extends ChatListEvent {
  final String query;

  const SearchChatsEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class DeleteChatEvent extends ChatListEvent {
  final int chatId;

  const DeleteChatEvent({required this.chatId});

  @override
  List<Object> get props => [chatId];
}

class MarkChatAsReadEvent extends ChatListEvent {
  final int chatId;

  const MarkChatAsReadEvent({required this.chatId});

  @override
  List<Object> get props => [chatId];
}