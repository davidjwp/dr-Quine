SNAME		= asm_Colleen

SRCS		= Colleen.c

SSRCS		= Colleen_asm.s

NASM		= nasm

SFLAGS		= -f elf64

SOBJS		= $(SSRCS:.s=.o)

all:$(NAME)

$(NAME): $(SOBJS)
	ld $(SOBJS) -o $(SNAME)
	./$(SNAME) > tmp_asm_Colleen ; diff tmp_asm_Colleen Colleen_asm.s

%.o: %.s
	$(NASM) $(SFLAGS) $< -o $@

clean:
	rm -f $(SOBJS) tmp_asm_Colleen $(SNAME)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: fclean clean all
