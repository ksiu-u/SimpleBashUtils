#include <getopt.h>
#include <stdio.h>
#include <string.h>

struct flags {
  int is_n;
  int is_b;
  int is_e;
  int is_s;
  int is_t;
  int is_v;
};

void get_options(int argc, char **argv, struct flags *from_input, int *go);
void read_print_file(struct flags from_input, char *file_name);

int main(int argc, char *argv[]) {
  struct flags from_input = {};
  int go = 1;
  get_options(argc, argv, &from_input, &go);
  if (go) {
    for (int i = optind; i < argc; i++) {
      read_print_file(from_input, argv[i]);
    }
  }
  return 0;
}

void get_options(int argc, char **argv, struct flags *from_input, int *go) {
  struct option long_options[] = {{"--number-nonblank", 0, 0, 'b'},
                                  {"--number", 0, 0, 'n'},
                                  {"--squeeze-blank", 0, 0, 's'},
                                  {0, 0, 0, 0}};
  int getopt_res;
  int option_index = 0;

  while ((getopt_res = getopt_long(argc, argv, "nbsteTE", long_options,
                                   &option_index)) != -1) {
    if (getopt_res == 'n') {
      from_input->is_n = 1;
    } else if (getopt_res == 'b') {
      from_input->is_b = 1;
    } else if (getopt_res == 's') {
      from_input->is_s = 1;
    } else if (getopt_res == 't') {
      from_input->is_t = 1;
      from_input->is_v = 1;
    } else if (getopt_res == 'e') {
      from_input->is_e = 1;
      from_input->is_v = 1;
    } else if (getopt_res == 'T') {
      from_input->is_t = 1;
    } else if (getopt_res == 'E') {
      from_input->is_e = 1;
    } else if (getopt_res == '?') {
      *go = 0;
    }
  }

  if (from_input->is_n && from_input->is_b) {
    from_input->is_n = 0;
  }
}

void read_print_file(struct flags from_input, char *file_name) {
  int ch, str_num = 1, str_start = 1, t_flag = 0, v_flag = 0, s_flag = 0;
  FILE *file = fopen(file_name, "r");

  if (file != NULL) {
    FILE *f = file;

    while ((ch = fgetc(f)) != EOF) {
      t_flag = 0, v_flag = 0;

      if (from_input.is_s && str_start == 1) {
        s_flag = (ch == '\n' ? s_flag + 1 : 0);
      }

      if (from_input.is_n && str_start == 1 && s_flag < 2) {
        printf("%6d\t", str_num++);
      }

      if (from_input.is_b && str_start == 1 && ch != '\n' && s_flag < 2) {
        printf("%6d\t", str_num++);
      }

      if (from_input.is_e && ch == '\n' && s_flag < 2) {
        (from_input.is_b && str_start == 1) ? printf("      \t$") : printf("$");
      }

      if (from_input.is_v && ch > 127) {
        printf("M-%c", ch);
        v_flag = 1;
      } else if (from_input.is_v && ch < 32 && ch != 9 && ch != 10 &&
                 s_flag < 2) {
        printf("^%c", ch + '@');
        v_flag = 1;
      } else if (from_input.is_v && ch == 127) {
        printf("^?");
        v_flag = 1;
      }

      if (from_input.is_t && ch == '\t') {
        printf("^I");
        t_flag = 1;
      }

      if (t_flag == 0 && v_flag == 0 && s_flag < 2) {
        printf("%c", ch);
      }

      if (ch == '\n') {
        str_start = 1;
      } else {
        str_start = 0;
      }
    }
    fclose(file);

  } else {
    perror(file_name);
  }
}