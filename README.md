<b>Framepack-eichi-alpha の説明</b>　　　20250608

一言でいうと
FramePack-eichi v1.7.1をベースにした(若干の)改造版です

<b>※開発経緯</b><br>
I2VツールのFramePackの派生系、eichiは性能が素晴らしいツールですが、最新のv1.9.4ではUIが整理されておらず、個人的には使いにくいと感じました。
v1.7.1がすっきりしていると思うのでそれを使っていましたがUIに若干不満があり、自分で整えることにしました。

<b>※開発コンセプト</b><br>
なるべくシンプルに、すっきりまとめたいです。極力UI上の情報を減らします。また低VRAM/RAMのWindows 11環境に特化したいのでLoRAは使用しないことにします。


<b>導入方法(windows向け)</b><br>
1)まずは導入したいフォルダを作りましょう。例えばe:\FramePack<br>
2)pythonは導入済だとして、仮想環境を python -m venv venv で作ります。「venv」というフォルダが出来ましたね。<br>
3)本家FramePackと、こちらのeichi alphaを githubからクローンします。<br>
git clone https://github.com/lllyasviel/FramePack <br>
git clone https://github.com/Aspena2022/FramePack-eichi-alpha <br>
4)eichi alphaの中身を、本家のほうに上書きコピーしてください。webuiなども丸ごとコピーでいいです。<br>
5)FramePackフォルダの、start.bat ファイルを右クリックしてメモ調で開きます。<br>
　set HF_HUB_OFFLINE=1 の先頭に rem をつけてコメントアウトします。<br>
6)ネットに接続していることを確認してから、start.bat をダブルクリックで実行します。<br>
　必要なファイルが自動的にダウンロードされます。HunyuanVideoのモデルが合計15GB程度、FramePackが34GB程度あります。<br>
7)エラーがなければ、FramePack-eichi-aplhaが自動的に起動します。<br>
8)もうモデルのダウンロードは不要ですので、先ほどの start.batを編集し、remを削除して元通りにします。
9)ネットに接続しないオフライン環境でも起動できれば環境構築完了です。


<b>トラブルシューティング</b><br>

ツールが起動できないときは、Windowsのページファイルが原因かもしれません。自動設定では小さく設定されているのでメモリ不足になるのです。<br>
詳しくは https://github.com/lllyasviel/FramePack/issues/75 ですが、<br>
WindowsのStartメニュー、ファイル名を指定して実行で「SystemPropertiesAdvanced」を立ち上げ、ページ設定を最小8000、最大51200にしてみてください。<br>

オフラインではエラーが出て起動できないときは、https://github.com/lllyasviel/FramePack/issues/298 を参考に、venvフォルダのファイルを書き換えれば解決します。

また、モデルのダウンロードがうまくいかないときは、手動で用意することもできます。<br>
HunyuanVideoのモデルは [https://huggingface.co/hunyuanvideo-community/HunyuanVideo] にあります。<br>
それぞれを インストールフォルダの webui\hf_download\hub\models--hunyuanvideo-community--HunyuanVideo に置きます。<br>
FramepackのI2Vモデルは [https://huggingface.co/lllyasviel/FramePackI2V_HY] にあります。<br>
それぞれを インストールフォルダの webui\hf_download\hub\models--lllyasviel--FramePackI2V_HY に置きます。<br>



<b>※開発秘話-困り事</b><br>
最初は単純にeichiをforkして作ろうとしたのですが、どうしてもv1.7.1をそのままコピーできなくて参りました。たぶんReleaseがv1.9.4のみになっているからだと思うんですが。最新版をforkして、v1.7.1に下げる作業が大変すぎるので、forkせずに新たにリポジトリを作ることにしました。
