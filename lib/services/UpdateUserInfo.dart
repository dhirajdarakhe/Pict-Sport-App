import 'package:psa/models/userDetails.dart';

void CheckMySportList()
{
  UserDetails.mySportsList!.clear();
  UserDetails.mySportEmoji!.clear();
  for (var entire in UserDetails.sportList!.entries){
    if (entire.value){
      UserDetails.mySportsList?.add(entire.key);
    }
  }

  for (int i=0;i<UserDetails.mySportsList!.length;i++){
    if (UserDetails.mySportsList![i]=='BasketBall'){
      UserDetails.mySportEmoji!.add('🏀');
    }
    if (UserDetails.mySportsList![i]=='VolleyBall'){
      UserDetails.mySportEmoji!.add('🏐');
    }
    if (UserDetails.mySportsList![i]=='TableTennis'){
      UserDetails.mySportEmoji!.add('🎾');
    }
    if (UserDetails.mySportsList![i]=='Badminton'){
      UserDetails.mySportEmoji!.add('🏸');
    }
    if (UserDetails.mySportsList![i]=='Cricket'){
      UserDetails.mySportEmoji!.add('🏏');
    }
    if (UserDetails.mySportsList![i]=='FootBall'){
      UserDetails.mySportEmoji!.add('⚽');
    }
    if (UserDetails.mySportsList![i]=='Gym'){
      UserDetails.mySportEmoji!.add('💪');
    }
    if (UserDetails.mySportsList![i]=='Chess'){
      UserDetails.mySportEmoji!.add('♟');
    }
  }
}
