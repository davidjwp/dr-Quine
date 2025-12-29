NAME		= Colleen

SRCS		= Colleen.s

NASM		= nasm

FLAGS		= -f elf64 -g 

OBJS		= $(SRCS:.s=.o)

all:$(NAME)

$(NAME): $(OBJS)
	ld $(OBJS) -o $(NAME)
	./$(NAME) > tmp_Colleen 
# 	; diff tmp_Colleen $(SRCS)

%.o: %.s
	$(NASM) $(FLAGS) $< -o $@

%.s: %.S
	cpp $< -o $@

clean:
	rm -f $(OBJS) tmp_asm_Colleen $(NAME)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
