// PROMPT: Create a BLoC to manage a list of chats inside a social media app. The list
// can be refreshed with a pull-to-refresh action from the app user. 

// Output from: https://junior.atomsbox.com/#/bloc-generator

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_list_event.dart';
part 'chat_list_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final ChatRepository _chatRepository;
  final StreamSubscription<List<Chat>> _chatSubscription;

  ChatListBloc({required ChatRepository chatRepository})
      : _chatRepository = chatRepository,
        super(const ChatListState()) {
    on<RefreshChatListEvent>(_onRefreshChatList);
    on<LoadMoreChatsEvent>(_onLoadMoreChats);
    on<SearchChatsEvent>(_onSearchChats);
    on<DeleteChatEvent>(_onDeleteChat);
    on<MarkChatAsReadEvent>(_onMarkChatAsRead);

    _chatSubscription = _chatRepository.chatListStream().listen(_chatListChanged);
  }

  void _chatListChanged(List<Chat> chatList) => add(RefreshChatListEvent(chatList));

  Future<void> _onRefreshChatList(
    RefreshChatListEvent event,
    Emitter<ChatListState> emit,
  ) async {
    emit(state.copyWith(status: ChatListStatus.loading));

    try {
      final chatList = await _chatRepository.refreshChatList();
      emit(
        state.copyWith(
          status: ChatListStatus.loaded,
          chatList: chatList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: ChatListStatus.error));
    }
  }

  Future<void> _onLoadMoreChats(
    LoadMoreChatsEvent event,
    Emitter<ChatListState> emit,
  ) async {
    emit(state.copyWith(status: ChatListStatus.loading));

    try {
      final chatList = await _chatRepository.loadMoreChats();
      emit(
        state.copyWith(
          status: ChatListStatus.loaded,
          chatList: state.chatList + chatList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: ChatListStatus.error));
    }
  }

  Future<void> _onSearchChats(
    SearchChatsEvent event,
    Emitter<ChatListState> emit,
  ) async {
    emit(state.copyWith(status: ChatListStatus.loading));

    try {
      final chatList = await _chatRepository.searchChats(event.query);
      emit(
        state.copyWith(
          status: ChatListStatus.loaded,
          chatList: chatList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: ChatListStatus.error));
    }
  }

  Future<void> _onDeleteChat(
    DeleteChatEvent event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _chatRepository.deleteChat(event.chatId);
      final updatedChatList = state.chatList.where((chat) => chat.id != event.chatId).toList();
      emit(
        state.copyWith(
          status: ChatListStatus.loaded,
          chatList: updatedChatList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: ChatListStatus.error));
    }
  }

  Future<void> _onMarkChatAsRead(
    MarkChatAsReadEvent event,
    Emitter<ChatListState> emit,
  ) async {
    try {
      await _chatRepository.markChatAsRead(event.chatId);
      final updatedChatList = state.chatList.map((chat) {
        if (chat.id == event.chatId) {
          return chat.copyWith(isRead: true);
        }
        return chat;
      }).toList();
      emit(
        state.copyWith(
          status: ChatListStatus.loaded,
          chatList: updatedChatList,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: ChatListStatus.error));
    }
  }

  @override
  Future<void> close() {
    _chatSubscription.cancel();
    return super.close();
  }
}
