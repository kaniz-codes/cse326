unsigned const int A = 13;
unsigned const int B = 12;
unsigned const int C = 11;
unsigned const int D = 10;
unsigned const int E = 9;
unsigned const int F = 8;
unsigned const int G = 7;
unsigned const int DP = 6;

void setup(void){
    pinMode(A,OUTPUT);
    pinMode(B,OUTPUT);
    pinMode(C,OUTPUT);
    pinMode(D,OUTPUT);
    pinMode(E,OUTPUT);
    pinMode(F,OUTPUT);
    pinMode(G,OUTPUT);
    pinMode(DP,OUTPUT);
}

//Functions
void zero(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, HIGH);
    digitalWrite(C, HIGH);
    digitalWrite(D, HIGH);
    digitalWrite(E, HIGH);
    digitalWrite(F, HIGH);
    digitalWrite(G, LOW);
    digitalWrite(DP, HIGH);
}
void one(void){
    digitalWrite(A, LOW);
    digitalWrite(B, LOW);
    digitalWrite(C, LOW);
    digitalWrite(D, LOW);
    digitalWrite(E, HIGH);
    digitalWrite(F, HIGH);
    digitalWrite(G, LOW);
    digitalWrite(DP, HIGH);
}
void two(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, HIGH);
    digitalWrite(C, Low);
    digitalWrite(D, HIGH);
    digitalWrite(E, HIGH);
    digitalWrite(F, Low);
    digitalWrite(G, LOW);
    digitalWrite(DP, Low);
}
void three(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, HIGH);
    digitalWrite(C, HIGH);
    digitalWrite(D, HIGH);
    digitalWrite(E, LOW);
    digitalWrite(F, Low);
    digitalWrite(G, HIGH);
    digitalWrite(DP, HIGH);
}
void four(void){
    digitalWrite(A, LOW);
    digitalWrite(B, HIGH);
    digitalWrite(C, HIGH);
    digitalWrite(D, LOW);
    digitalWrite(E, LOW);
    digitalWrite(F, Low);
    digitalWrite(G, HIGH);
    digitalWrite(DP, LOW);
}
void five(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, LOW);
    digitalWrite(C, HIGH);
    digitalWrite(D, HIGH);
    digitalWrite(E, LOW);
    digitalWrite(F, HIGH);
    digitalWrite(G, HIGH);
    digitalWrite(DP, HIGH);
}
void six(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, LOW);
    digitalWrite(C, HIGH);
    digitalWrite(D, HIGH);
    digitalWrite(E, HIGH);
    digitalWrite(F, HIGH);
    digitalWrite(G, HIGH);
    digitalWrite(DP, HIGH);
}
void seven(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, HIGH);
    digitalWrite(C, HIGH);
    digitalWrite(D, LOW);
    digitalWrite(E, LOW);
    digitalWrite(F, LOW);
    digitalWrite(G, LOW);
    digitalWrite(DP, HIGH);
}
void eight(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, HIGH);
    digitalWrite(C, HIGH);
    digitalWrite(D, HIGH);
    digitalWrite(E, HIGH);
    digitalWrite(F, HIGH);
    digitalWrite(G, HIGH);
    digitalWrite(DP, HIGH);
}
void nine(void){
    digitalWrite(A, HIGH);
    digitalWrite(B, HIGH);
    digitalWrite(C, HIGH);
    digitalWrite(D, HIGH);
    digitalWrite(E, low);
    digitalWrite(F, HIGH);
    digitalWrite(G, HIGH);
    digitalWrite(DP, HIGH);
}

void loop(void){
    zero();
    delay(500);
    one();
    delay(500);
    two();
    delay(500);
    three();
    delay(500);
    four();
    delay(500);
    five();
    delay(500);
    six();
    delay(500);
    seven();
    delay(500);
    eight();
    delay(500);
    nine();
    delay(500);
}