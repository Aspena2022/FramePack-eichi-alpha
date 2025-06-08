<b>Framepack-eichi-alpha の説明</b>　　　20250608

一言でいうと<br>
FramePack-eichi v1.7.1をベースにした(若干の)改造版です<br>
大元はこれです<br>
https://github.com/git-ai-code/FramePack-eichi/tree/d790b799986552ebf159d6a2a25fde52bb837472

<b>※開発経緯</b><br>
I2VツールのFramePackの派生系、eichiは性能が素晴らしいツールですが、最新のv1.9.4ではUIが整理されておらず、個人的には使いにくいと感じました。
v1.7.1がすっきりしていると思うのでそれを使っていましたがUIに若干不満があり、自分で整えることにしました。

<b>※開発コンセプト</b><br>
なるべくシンプルに、すっきりまとめたいです。極力UI上の情報を減らします。また低VRAM/RAMのWindows 11環境に特化したいのでLoRAは使用しないことにします。デフォルトのStepsを下げてTeaCacheを強く適用することで高速化しています。

<b>※画面の様子</b><br>
![Image](https://github.com/user-attachments/assets/ff93be10-737a-4270-b5c9-681b3c367b1f)

![Image](https://github.com/user-attachments/assets/af5c8a0b-928f-4fa1-8d04-65da818c5ad3)


<b>導入方法(windows向け)</b><br>
1)まずは導入したいフォルダを作りましょう。例えばe:\FramePack<br>
2)ターミナル画面を開きます。エクスプローラで1のフォルダを右クリック、「その他のオプションを表示」、「ターミナルで開く」<br>
3)pythonは導入済だとして、仮想環境を python -m venv venv で作ります。「venv」というフォルダが出来ましたね。<br>
4)本家FramePackと、こちらのeichi alphaを githubからクローンします。<br>
  git clone https://github.com/lllyasviel/FramePack <br>
  git clone https://github.com/Aspena2022/FramePack-eichi-alpha <br>
5)eichi alphaの中身を、本家のほうに上書きコピーしてください。webuiなども丸ごとコピーでいいです。<br>
6)FramePackフォルダの、start.bat ファイルを右クリックしてメモ調で開きます。<br>
　set HF_HUB_OFFLINE=1 の先頭に rem をつけてコメントアウトします。<br>
7)ネットに接続している状態で FramePackフォルダのターミナルで<br>
  pip install -r requirements.txt を実行して、python実行環境を整えます。<br>
8)アプリを開始するための start.bat をダブルクリックで実行します。ターミナル上で操作するなら ./start.bat です。<br>
　必要なファイルが自動的にダウンロードされます。HunyuanVideoのモデルが合計15GB程度、FramePackが34GB程度あります。<br>
9)エラーがなければ、FramePack-eichi-aplhaが自動的に起動します。<br>
10)もうモデルのダウンロードは不要ですので、先ほどの start.batを編集し、remを削除して元通りにします。<br>
11)ネットに接続していないオフライン環境でも起動できれば環境構築完了です。<br>


<b>トラブルシューティング</b><br>

ツールが起動できないときは、Windowsのページファイルが原因かもしれません。自動設定では小さく設定されているのでメモリ不足になるのです。<br>
詳しくは https://github.com/lllyasviel/FramePack/issues/75 ですが、WindowsのStartメニュー、ファイル名を指定して実行で「SystemPropertiesAdvanced」を立ち上げ、ページ設定を最小8000、最大51200にしてみてください。<br>

オフラインではエラーが出て起動できないときは、https://github.com/lllyasviel/FramePack/issues/298 を参考に、venvフォルダのファイルを書き換えれば解決します。

また、モデルの自動ダウンロードがうまくいかないときは、手動で用意することもできます。<br>
HunyuanVideoのモデルは https://huggingface.co/hunyuanvideo-community/HunyuanVideo にあります。<br>
それぞれを インストールフォルダの webui\hf_download\hub\models--hunyuanvideo-community--HunyuanVideo に置きます。<br>
FramepackのI2Vモデルは https://huggingface.co/lllyasviel/FramePackI2V_HY にあります。<br>
それぞれを インストールフォルダの webui\hf_download\hub\models--lllyasviel--FramePackI2V_HY に置きます。<br>

<b>※ちょっとしたコツ</b><br>
eichiのバージョンの下げ方ですが、cloneするとv1.9.4になるので、そのあとで<br>
git checkout d790b799986552ebf159d6a2a25fde52bb837472 とします。<br>
これで v1.7.1 になります。この git checkout というコマンドはとても便利ですので活用しましょう。
また本家FramePackのそれぞれのbatファイルは使わなくていいので、例えばNoUSE_update.bat、NoUSE_run.bat、NoUSE_environment.batなどとリネームするとか削除すればすっきりします。必要なのは start.bat とenvironment2.bat だけです。

<b>※開発秘話</b><br>
最初は単純にeichiをforkして作ろうとしたのですが、どうしてもv1.7.1をそのままコピーできなくて参りました。たぶんReleaseがv1.9.4のみになっているからだと思うんですが。最新版をforkして、v1.7.1に下げる作業が大変すぎるので、forkせずに新たにリポジトリを作ることにしました。<br>
Stepsの話ですが、デフォルトの25は不要で16まで下げていいと思うので、そのように変更しました。動画の情報量が多い場合はなにかしら劣化が起きるかもしれませんが。<br>
さらにTeaCacheの値を0.15から0.40まで引き上げています。16 stepsが0.40の比率で間引かれるので、25 stepsの0.15よりもかなり高速です。<br>
クオリティを多少犠牲にしつつも高速性重視というわけです。ここが気になる人はソースの該当箇所を変えればできます。endframe_ichi.py です。<br>
FP8最適化はよくわからなかったので、テストしたままで放置状態です。v1.7.1以降で実装された部分をどうにか移植したかったのですが複雑すぎて無理かも。保存したlatent空間？に対してFP8で処理をかけると速くなるらしいですが、どうなんでしょうか。必要な物理メモリは増えてしまう気がします。低スペック環境でなるべくサクサク動かしたいので、VRAMのオフロード処理はかなり高負荷になりそうな予感。
