from supabase import create_client
from decouple import config

key = config('SUPABASE_API_KEY')
url = config('SUPABASE_URL')
supabase = create_client(url, key)
