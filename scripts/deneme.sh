

# batuhan=$(git tag -l -n10)
# echo $batuhan

# IFS='\n' read -ra parts <<< "$batuhan"

# # Parçaları ekrana yazdırmak
# echo "Parçalar:"
# for ((i = 0; i < ${#parts[@]}; i++)); do
#     echo "${parts[i]}"
# done


# Son etiketi al
latest_tag=$(git tag -l --sort=-version:refname | head -n1)

# Son etiketin mesajını al
latest_tag_message=$(git for-each-ref --format '%(contents)' refs/tags/$latest_tag)

# Son commitin mesajını al
latest_commit_message=$(git log --format=%B -n 1 $latest_tag)

echo "Son Etiket: $latest_tag"
echo "Son Etiketin Mesajı: $latest_tag_message"
echo "Son Commit Mesajı: $latest_commit_message"