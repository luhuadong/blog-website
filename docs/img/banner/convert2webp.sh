#!/bin/bash

# 初始化计数器
count=0

# 遍历当前目录下的所有 png 文件
for file in *.png; do
    # 获取文件名（不含扩展名）
    filename=$(basename -- "$file" .png)
    # 检查同名的 webp 文件是否存在
    if [[ -e "${filename}.webp" ]]; then
        # echo "Skipping ${file}: ${filename}.webp already exists."
        continue
    fi
    # 转换为 webp 格式
    cwebp -quiet "$file" -o "${filename}.webp"
    echo "==> ${filename}.webp"
    # 增加计数
    ((count++))
done

echo -e "\n------------------------------------------------"
echo "Conversion complete. Total images converted: $count"
