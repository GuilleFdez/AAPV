void time_img(float avg[1024][1024], int cnt[1024][1024], float res[1024][1024]){

	for(int i = 0; i < 1024; i++){
		for(int j = 0; j < 1024; j++){
			res[i][j] = avg[i][j] / cnt[i][j];
		}
	}

}



