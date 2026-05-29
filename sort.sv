// Code your design here
module test;
  int arr[];
  int temp;
  int num;
  int digit[2:0];
  int sorted_num;
  
  initial begin
    arr=new[6];
    arr='{213,934,913,615,321,543};
    
    for(int k=0;k<arr.size();k++) begin
      num=arr[k];
      
      digit[0]=num%10;
      num=num/10;
    
      digit[1]=num%10;
      num=num/10;
      
      digit[2]=num%10;  
      
      for(int i=0;i<3;i++) begin
        for(int j=i+1;j<3;j++) begin
          if(digit[i]>digit[j]) begin
            temp=digit[i];
            digit[i]=digit[j];
            digit[j]=temp;
          end
        end
      end

      sorted_num = digit[0]*100 + digit[1]*10 + digit[2];
      arr[k] = sorted_num;
    end

    for (int i=0; i<arr.size(); i++) begin
      for (int j=i+1; j<arr.size(); j++) begin
        if (arr[i] > arr[j]) begin
          temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
        end
      end
    end

    for (int i=0; i<arr.size(); i++) begin
      $display("arr[%0d] = %0d", i, arr[i]);
    end
  end
endmodule
