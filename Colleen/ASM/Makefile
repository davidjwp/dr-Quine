NAME		= Colleen

FLAGS		= -f elf64 -g

OBJS		= $(NAME).o

SOBJS		= $(NAME).S

SRCS		= $(NAME).s

$(NAME):
	cpp -P $(SRCS) -o $(SOBJS)
	nasm $(FLAGS) $(SOBJS) -o $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME) > tmp_Colleen
	diff tmp_Colleen $(SRCS)

clean:
	rm -f $(OBJS) $(SOBJS) tmp_Colleen

fclean: clean
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: fclean clean all
