from decouple import config
from supabase import create_client

key = config('SUPABASE_API_KEY')
url = config('SUPABASE_URL')
supabase = create_client(url, key)
bucket_name = "training"
