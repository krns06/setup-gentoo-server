# setup-gentoo-server
Gentooサーバを設定するプレイブック。
# Requirement
* ターゲットノードのファームウェアはUEFI
* ansible
# Usage
1. playbook.ymlを編集<br>
必要に応じてvarsの部分を書き換える。デフォルトだとstage3にhardenedでselinuxのものを採用している。またデバイスには/dev/sdaを選んでいる。
2. chroot.shを編集<br>
初期設定(パーティション等)が終わったあとchrootに移行したときに実行されるスクリプト。必要に応じてホスト名、タイムゾーンやデバイスを書き換える。将来的にはもっと簡単に変更できるように改造する予定。またネットワーク、ユーザ、パスワードの設定も追加予定。
3. hosts-example.ymlを編集<br>
設定を実行するサーバを指定。そしてhosts.ymlに名前を変更。
4. 実行<br>
```
$ cd このリポジトリのディレクトリ
$ ansible-playbook -i hosts.yml playbook.yml
```
5. 実行後の設定
設定後はユーザとパスワード、IPを設定する。これは将来自動化予定。
