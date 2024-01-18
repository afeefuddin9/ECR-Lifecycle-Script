repositories=($(aws ecr describe-repositories --profile=$profile --output text --query "repositories[*].repositoryName"))
for repository in "${repositories[@]}"; do
    aws ecr put-lifecycle-policy --profile=$profile --repository-name $repository --lifecycle-policy-text "file://policy.json"
done
