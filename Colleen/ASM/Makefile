NAME		= Colleen

SRCS		= Colleen.S

NASM		= nasm

FLAGS		= -f elf64 -g 

OBJS		= $(SRCS:.s=.o)

ASM_SRC		= $(SRCS:.S=.s)

all:$(NAME)

$(NAME): $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME) > tmp_Colleen 
	diff tmp_Colleen $(ASM_SRC)

%.o: %.s
	$(NASM) $(FLAGS) $< -o $@

%.s: %.S
	cpp -p $< -o $@

clean:
	rm -f $(OBJS) tmp_Colleen

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
