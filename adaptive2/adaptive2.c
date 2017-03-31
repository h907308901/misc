#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

int best;

char min(char a, char b) {
	if(a < b)
		return a;
	else
		return b;
}

void recursive(char n, char* x, char i, char avl, char max) {
	int j, value;
	if(i < n-1) {
		for(j = (avl+n-i-1)/(n-i); j <= min(max, avl-n+i+1); j++) {
			x[i] = j;
			recursive(n, x, i+1, avl-j, min(j, avl-j));
		}
	}
	else {
		if(n > 1)
			x[n-1] = avl;
		printf("%d: ", n);
		// sum(xi^2/2+i*xi)+N/2-n-xn
		value = 0;
		for(j = 0; j < n; j++) {
			value += x[j]*(x[j]+j*2+3);
			printf("%d ", x[j]);
		}
		value -= 2*n;
		value /= 2;
		value -= x[n-1];
		if(value < best) best = value;
		printf("%d\n", value);
	}
}

void begin(char N, char n) {
	int i;
	char* x;
	x = malloc(n);
	if(!x) exit(1);
	for(i = (N+n-1)/n; i <= N-n+1; i++) {
		x[0] = i;
		recursive(n, x, 1, N - i, i);
	}
	free(x);
}

int main(int argc, char** argv, char** envp) {
	int i;
	best = 1000;
	for(i = 1; i <= 32; i++)
		begin(32, i);
	printf("best: %d", best);
	return 0;
}