CC			= gcc

CFLAGS		= -g3 -Werror -Wall -Wextra

NAME		= Sully

SRCS		= $(NAME).c

OBJS		= $(SRCS:.c=.o)

all:$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME) ;
	./$(NAME);

%.o: %.c $(HEADER)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) Grace_kid.c

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
