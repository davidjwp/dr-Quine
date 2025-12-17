CC			= gcc

CFLAGS		= -g3 -Werror -Wall -Wextra

NAME		= Colleen

SRCS		= Colleen.c

OBJS		= $(SRCS:.c=.o)

all:$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)
	./$(NAME) > tmp_Colleen ; diff tmp_Colleen Colleen.c

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS) tmp_Colleen $(NAME)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
