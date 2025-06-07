call ..\venv\Scripts\activate.bat

call environment2.bat

rem オフラインで使うときだけセットする　オンラインならremでコメントアウト
set HF_HUB_OFFLINE=1

rem 元祖FramePack を使うとき
rem python webui\demo_gradio.py --server 127.0.0.1 --inbrowser

rem FramePack Eichi を使うとき
python webui\endframe_ichi.py --server 127.0.0.1 --inbrowser

pause

