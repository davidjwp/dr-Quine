NAME		= Sully

FLAGS		= -f elf64 -g

OBJS		= $(NAME).o

SOBJS		= $(NAME).S

SRCS		= $(NAME).s

OUTPUTS		= '$(NAME)_X'

$(NAME):
	cpp -P $(SRCS) -o $(SOBJS)
	nasm $(FLAGS) $(SOBJS) -o $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME)

clean:
	rm -f $(OBJS) $(SOBJS) 

fclean: clean
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: fclean clean all
