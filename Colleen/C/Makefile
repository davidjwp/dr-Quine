CC			= gcc

CFLAGS		= -g3 -Werror -Wall -Wextra

NAME		= Colleen

SRCS		= $(NAME).c

OBJS		= $(SRCS:.c=.o)

TMP			= $(NAME)_tmp

all:$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME) 
	./$(NAME) > $(TMP)
	diff $(SRCS) $(TMP)

%.o: %.c $(HEADER)
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) $(TMP)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
