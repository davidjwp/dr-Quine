NAME		= Grace

FLAGS		= -f elf64 -g

OBJS		= $(NAME).o

SOBJS		= $(NAME).S

SRCS		= $(NAME).s

$(NAME):
	cpp -P $(SRCS) -o $(SOBJS)
	nasm $(FLAGS) $(SOBJS) -o $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME)
	diff Grace_kid.s $(SRCS)

clean:
	rm -f $(OBJS) $(SOBJS) Grace_kid.s 

fclean: clean
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: fclean clean all
