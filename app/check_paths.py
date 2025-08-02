import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))  # pakt /home/johan/mypaperhive.com/app

maintenance_path = os.path.join(BASE_DIR, 'maintenance/static/maintenance')
mypaperhive_path = os.path.join(BASE_DIR, 'mypaperhive/static/mypaperhive')

print("BASE_DIR is:", BASE_DIR)
print("Maintenance static path:", maintenance_path)
print("Mypaperhive static path:", mypaperhive_path)
print("Bestaat maintenance_path?", os.path.exists(maintenance_path))
print("Bestaat mypaperhive_path?", os.path.exists(mypaperhive_path))
