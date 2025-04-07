#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>

struct flags {
  int opt;
  int is_e;
  int is_i;
  int is_v;
  int is_c;
  int is_l;
  int is_n;
};

void get_options_and_pattern(int argc, char **argv, struct flags *from_input,
                             char **pattern, int *files_amount);
void read_print_file(struct flags from_input, char *file_name, char *pattern,
                     int files_amount);
void read_string(FILE **f, char **result_string, int *end_of_file);
int do_regex(char **pattern, char **result_string, int flag);

int main(int argc, char **argv) {
  struct flags from_input = {};
  int is_one_file = 0;
  char *pattern;

  get_options_and_pattern(argc, argv, &from_input, &pattern, &is_one_file);

  for (int i = optind + 1; i < argc; i++) {
    read_print_file(from_input, argv[i], pattern, is_one_file);
  }
}

void get_options_and_pattern(int argc, char **argv, struct flags *from_input,
                             char **pattern, int *is_one_file) {
  int getopt_res;
  while ((getopt_res = getopt(argc, argv, "eivcln")) != -1) {
    from_input->opt = 1;
    if (getopt_res == 'e') {
      from_input->is_e = 1;
    } else if (getopt_res == 'i') {
      from_input->is_i = 1;
    } else if (getopt_res == 'v') {
      from_input->is_v = 1;
    } else if (getopt_res == 'c') {
      from_input->is_c = 1;
    } else if (getopt_res == 'l') {
      from_input->is_l = 1;
    } else if (getopt_res == 'n') {
      from_input->is_n = 1;
    }
  }
  if (from_input->opt == 0) {
    from_input->is_e = 1;
  }
  *pattern = argv[optind];
  if (argc - (optind + 1) == 1) {
    *is_one_file = 1;
  }
}

void read_print_file(struct flags from_input, char *file_name, char *pattern,
                     int is_one_file) {
  int end_of_file = 0, str_num = 0, str_match = 0, stop_l = 0;
  char *result_string = NULL;

  FILE *file = fopen(file_name, "r");
  if (file != NULL) {
    FILE *f = file;

    while (end_of_file != 1 && stop_l != 1) {
      free(result_string);
      read_string(&f, &result_string, &end_of_file);
      str_num++;

      if ((from_input.is_e == 1 &&
           do_regex(&pattern, &result_string, REG_EXTENDED) == 0) ||
          (from_input.is_i == 1 &&
           do_regex(&pattern, &result_string, REG_ICASE) == 0) ||
          (from_input.is_v == 1 &&
           do_regex(&pattern, &result_string, REG_EXTENDED) == REG_NOMATCH)) {
        if (is_one_file != 1) {
          printf("%s:%s\n", file_name, result_string);
        } else {
          printf("%s\n", result_string);
        }
      }

      if (from_input.is_n == 1 &&
          do_regex(&pattern, &result_string, REG_EXTENDED) == 0) {
        if (is_one_file != 1) {
          printf("%s:%d:%s\n", file_name, str_num, result_string);
        } else {
          printf("%d:%s\n", str_num, result_string);
        }
      }

      if (from_input.is_l == 1 &&
          do_regex(&pattern, &result_string, REG_EXTENDED) == 0) {
        printf("%s\n", file_name);
        stop_l = 1;
      }

      if (from_input.is_c == 1 &&
          do_regex(&pattern, &result_string, REG_EXTENDED) == 0) {
        str_match++;
      }
    }
    if (from_input.is_c == 1) {
      if (is_one_file != 1) {
        printf("%s:%d\n", file_name, str_match);
      } else {
        printf("%d\n", str_match);
      }
    }
    free(result_string);
    fclose(file);

  } else {
    perror(file_name);
  }
}

void read_string(FILE **f, char **result_string, int *end_of_file) {
  char ch;
  int start_size = 20, count = 0, flag = 1;
  *result_string = (char *)malloc(start_size * sizeof(char));

  while ((ch = fgetc(*f)) != '\n') {
    if (flag == (ch == EOF)) {
      *end_of_file = 1;
      break;
    }
    if (count == start_size) {
      start_size *= 2;
      *result_string =
          (char *)realloc(*result_string, start_size * sizeof(char));
      (*result_string)[count++] = ch;
    } else {
      (*result_string)[count++] = ch;
    }
  }
  if (count == start_size) {
    *result_string =
        (char *)realloc(*result_string, (start_size + 1) * sizeof(char));
    (*result_string)[count++] = '\0';
  } else {
    (*result_string)[count++] = '\0';
  }
}

int do_regex(char **pattern, char **result_string, int flag) {
  regex_t regex;
  regmatch_t matches[1];
  regcomp(&regex, *pattern, flag);
  int ok = regexec(&regex, *result_string, 1, matches, 0);
  regfree(&regex);
  return ok;
}