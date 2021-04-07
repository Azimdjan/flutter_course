import 'dart:math';

void main(){
  const a = 1.0;
  const b = -4.0;
  const c = 3.0;
  double root1;
  if(sqrt(b*b-4*a*c)>0){
    root1 =(-b+sqrt(b*b-4*a*c))/(2*a);
    double root2;
    root2 = (-b-sqrt(b*b-4*a*c))/(2*a);
    print("Root 1 is $root1.");
    print("Root 2 is $root2.");
  }else{
    print('not quadratic eqation');
  }
}