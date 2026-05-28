#!/bin/bash

echo "パスワードマネージャーへようこそ！"

while true
do
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
  read choice

  if [ "$choice" = "Add Password" ]; then
    echo "サービス名を入力してください："
    read service

    echo "ユーザー名を入力してください："
    read username

    echo "パスワードを入力してください："
    read password

    echo "$service:$username:$password" >> passwords.txt

    echo "パスワードの追加は成功しました。"

  elif [ "$choice" = "Get Password" ]; then
    echo "サービス名を入力してください："
    read search_service

    result=$(grep "^$search_service:" passwords.txt)

    if [ -z "$result" ]; then
      echo "そのサービスは登録されていません。"
    else
      service=$(echo "$result" | cut -d ':' -f 1)
      username=$(echo "$result" | cut -d ':' -f 2)
      password=$(echo "$result" | cut -d ':' -f 3)

      echo "サービス名：$service"
      echo "ユーザー名：$username"
      echo "パスワード：$password"
    fi

  elif [ "$choice" = "Exit" ]; then
    echo "Thank you!"
    break

  else
    echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
  fi
done
