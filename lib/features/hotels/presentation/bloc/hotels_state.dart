part of 'hotels_bloc.dart';

abstract class HotelsState extends Equatable {
  const HotelsState();  

  @override
  List<Object> get props => [];
}
class HotelsInitial extends HotelsState {}
