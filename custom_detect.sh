 #!/usr/bin/bash

# get the newest train weights.
newest_folder=""
for folder in runs/train/* 
do 
  newest_folder=$folder; 
done
newest_weight="$newest_folder/weights/best.pt"
echo "newest trained weight is at: ImageRecog/yolov5/$newest_weight"

# train with the newest train weights.
python detect.py --weights $newest_weight --img 640 --conf 0.25 --source ../../DetectImages

# transfer the detected images to outer folder
rsync -a --update runs/detect ../../