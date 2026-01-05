CC			= gcc

CFLAGS		= -g3 -Werror -Wall -Wextra

NAME		= Grace

SRCS		= Grace.c

OBJS		= $(SRCS:.c=.o)

all:$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME) ;
	./$(NAME); diff Grace_kid.c Grace.c

%.o: %.c $(HEADER)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) Grace_kid.c

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
