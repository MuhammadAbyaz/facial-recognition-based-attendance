# from video import capture_video

# capture_video(1)

from database.db import supabase

res = supabase.auth.get_user()

print(res)
