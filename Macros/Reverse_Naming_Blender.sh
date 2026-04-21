mkdir -p Reverse_Sequence && \
files=(Forward_Sequence/*.tif) && \
count=${#files[@]} && \
i=1 && \
for (( idx=count-1; idx>=0; idx-- )); do
    printf -v newname "%04d.jpg" "$i"
    cp "${files[idx]}" "Reverse_Sequence/$newname"
    ((i++))
done