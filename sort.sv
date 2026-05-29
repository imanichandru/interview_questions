// Code your design here
module test;
  int arr[];
  int temp;
  int num;
  int digit[2:0];
  
  initial begin
    arr=new[6];
    arr='{213,934,913,615,321,543};
    
    for(int k=0;k<arr.size();k++) begin
      num=arr[k];
      
      digit[0]=num%10;
      num=num/10;
//       $display(num);
//       $display(digit[0]);
      
      digit[1]=num%10;
      num=num/10;
//       $display(num);
//       $display(digit[1]);
      
      digit[2]=num%10;  

//       $display(num);
//       $display(digit[2]);
      
      for(int i=0;i<3;i++) begin
        for(int j=i+1;j<3;j++) begin
          if(digit[i]>digit[j]) begin
            temp=digit[i];
            digit[i]=digit[j];
            digit[i]=temp;
          end
        end
      end
     
     end
     $display("%0d%0d%0d",digit[0],digit[1],digit[2]);
    
  end
endmodule
