import time
from tqdm import tqdm

for _ in tqdm(range(10), desc="Waiting", unit="s"):
    time.sleep(1)
