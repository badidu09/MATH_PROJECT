##
## EPITECH PROJECT, 2023
## 201YAMS
## File description:
## Makefile
##

CYAN	=	'\033[0;36m'
MAGENTA	=	'\033[0;35m'
YELLOW	=	'\033[0;33m'
RESET	=	'\033[0m'
BOLD_BLUE	=	'\033[1;34m'
BOLD_YELLOW	=	'\033[1;33m'

BINARY	=	201yams

AS	=	nasm

ASFLAGS	=	-f elf64 -g

LINKER	=	ld

LDFLAGS	=	-no-pie -z noexecstack

SRC	= 	$(wildcard src/*.asm)

OBJ	=	$(SRC:.asm=.o)

%.o:	%.asm
	@$(AS) $(ASFLAGS) $< -o $@
	@echo -e $(YELLOW)'[OK]'$(MAGENTA) $< $(RESET)

all:	$(BINARY)

tests:
	@sh ./tests/tests.sh

$(BINARY):	$(OBJ)
	@gcc -o $(BINARY) $(OBJ) $(LDFLAGS) -lm
	@echo -e $(YELLOW)'[DONE] -->'$(CYAN) $(BINARY) $(RESET)

clean:
	@rm -f $(OBJ)
	@echo -e $(BOLD_BLUE)'[OBJ CLEANED]'$(RESET)

fclean:	clean
	@rm -f $(BINARY)
	@echo -e $(BOLD_YELLOW)'[BINARY CLEANED]'$(RESET)

exec:	$(BINARY)
	@./$(BINARY)

re:	fclean
	$(MAKE)

.PHONY:	all clean fclean re tests exec
