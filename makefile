
CC = g++ -std=c++11
CFLAGS = -c -Wall -g
LDFLAGS=
RM = rm
DIR = ./
PRINTF	= printf 

SOURCES = utilfuncs.cpp server.cpp worker.cpp user.cpp
TARGETS = server worker user
OBJECTS = $(SOURCES:.cpp=.o)
SERVER=server
CLIENT=user
WORKER=worker

.PHONY: all clean target

all: target

target: $(SERVER) $(WORKER) $(CLIENT)

$(SERVER): server.o utilfuncs.o
	@$(CC) server.o utilfuncs.o -o $@

$(CLIENT): user.o utilfuncs.o
	@$(CC) user.o utilfuncs.o -o $@

$(WORKER): worker.o utilfuncs.o
	@$(CC) worker.o utilfuncs.o -lpthread -lcrypt -o $@ 

.cpp.o:
	@$(CC) $(CFLAGS) $< -o $@


clean:
	@$(PRINTF) "Cleaning up..."
	@$(RM) -rf $(DIR)*.o
	@$(RM) -rf $(DIR)$(TARGETS)
	@$(PRINTF) "Done\n"
