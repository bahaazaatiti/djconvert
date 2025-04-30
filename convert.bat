@echo off
mkdir output 2> nul
for %%i in (*.mp3, *.flac, *.aif, *.wav *.aac *.ogg *.wma *.m4a) do (
    if exist "%%i" (
        ffmpeg -i "%%i" ^
        -ar 44100 ^
        -acodec pcm_s16le ^
        -ac 2 ^
        -write_id3v2 1 ^
        "output\%%~ni.wav"
    )
)
pause