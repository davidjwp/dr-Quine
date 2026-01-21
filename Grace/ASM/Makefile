NAME		= Grace

FLAGS		= -f elf64 -g

OBJS		= $(NAME).o

SOBJS		= $(NAME).S

SRCS		= $(NAME).s

KID			= $(NAME)_kid.s

all: $(NAME)

$(NAME):
	cpp -P $(SRCS) -o $(SOBJS)
	nasm $(FLAGS) $(SOBJS) -o $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME)
	diff $(SRCS) $(KID)

clean:
	rm -f $(OBJS) $(SOBJS) $(KID)

fclean: clean
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: fclean clean all
