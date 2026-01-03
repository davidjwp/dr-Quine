NAME		= Grace

FLAGS		= -f elf64 -g

OBJS		= $(NAME).o

SOBJS		= $(NAME).S

SRCS		= $(NAME).s

$(NAME):
	cpp -P $(SRCS) -o $(SOBJS)
	nasm $(FLAGS) $(SOBJS) -o $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME) > Grace_kid
	diff Grace_kid $(SRCS)

clean:
	rm -f $(OBJS) $(SOBJS) Grace_kid

fclean: clean
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: fclean clean all
