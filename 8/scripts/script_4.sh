for diretorio in $(ls /home)
do
	echo 'Usuario: ' $diretorio
	
	echo -n 'Arquivos JPG: '
	find /home/$diretorio -name '*.jpg' | wc -l

	echo -n 'Arquivos MP3: '
	find /home/$diretorio -name '*.mp3' | wc -l

	echo -n 'Arquivos MP4: '
	find /home/$diretorio -name '*.mp4' | wc -l
	echo
done
	
