NAME		= Grace

SRCS		= Grace.s

NASM		= nasm

FLAGS		= -f elf64

OBJS		= $(SRCS:.s=.o)

all:$(NAME)

$(NAME): $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME); diff Grace_kid.s $(SRCS)

%.o: %.s
	$(NASM) $(FLAGS) $< -o $@

clean:
	rm -f $(OBJS) Grace_kid $(NAME)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
