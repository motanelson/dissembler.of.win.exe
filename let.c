asm (".global _var16k \n_var16k:\n .space 16384");
extern char *_var16k;
char *allocvar; 
char *allocs(int s){
    char *a=allocvar;
    allocvar=allocvar+s+1;
    return a;

}
int _start(){
    allocvar=_var16k+0;
    char *a=allocs(100);
    char *b=allocs(100);    
    return 0;

}