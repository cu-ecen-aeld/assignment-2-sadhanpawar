#include <stdio.h>
#include <errno.h>
#include <syslog.h>
#include <string.h>

int main( int argc, char *argv[] )
{
	FILE *fp = NULL;

	openlog(NULL,0,LOG_USER);

	if (argc != 3 )
	{
		syslog(LOG_ERR,"This application needs two arguments\n");
		return 1;
	}

	syslog(LOG_DEBUG,"writing %s to %s",argv[2], argv[1]);

	fp = fopen(argv[1],"w");
	if(!fp) {
		syslog(LOG_ERR,"fopen: cannot open a file");
		return 1;
	}
	
	if ( !(fwrite(argv[2],(strlen(argv[2]) + 1),1,fp)) )
	{
		syslog(LOG_ERR, "unable to write into file");
	}

	fclose(fp);
	closelog();

	return 0;
}
