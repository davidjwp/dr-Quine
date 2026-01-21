NAME		= Sully

FLAGS		= -f elf64 -g

OBJS		= $(NAME).o

SRCS		= $(NAME).s

OUTPUTS		= '$(NAME)_X'

$(NAME):
	nasm $(FLAGS) $(SRCS) -o $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME)

clean:
	rm -f $(OBJS) $(NAME)_*.s $(NAME)_*

fclean: clean
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: fclean clean all
