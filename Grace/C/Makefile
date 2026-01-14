CC			= gcc

CFLAGS		= -g3 -Werror -Wall -Wextra

NAME		= Grace

SRCS		= $(NAME).c

OBJS		= $(SRCS:.c=.o)

KID			= $(NAME)_kid.c

all:$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME) 
	./$(NAME)
	diff $(SRCS) $(KID)

%.o: %.c $(HEADER)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(KID)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
