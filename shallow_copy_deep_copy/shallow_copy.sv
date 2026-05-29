// -------------------------------------------------------
// -- Shallow Copy in SystemVerilog
// --
// -- Shallow copy (obj2 = new obj1;) copies primitive members
// -- by value, but copies sub-object HANDLES by reference.
// -- Both objects end up sharing the same sub-object.
// -------------------------------------------------------

class Address;
  string city;

  function new(string city = "Chennai");
    this.city = city;
  endfunction
endclass


class Person;
  string   name;     // primitive (string) - copied by value
  int      age;      // primitive (int)    - copied by value
  Address  addr;     // class handle       - copied by reference (shared!)

  function new(string name, int age, string city);
    this.name = name;
    this.age  = age;
    this.addr = new(city);
  endfunction

  function void display(string tag);
    $display("[%s] name=%s  age=%0d  city=%s  addr_handle=%0d",
              tag, name, age, addr.city, addr);
  endfunction
endclass


module tb;
  Person p1, p2;

  initial begin
    // 1. Create original object
    p1 = new("Mani", 25, "Chennai");

    // 2. Shallow copy: p2 gets its own name/age, but SHARES addr
    p2 = new p1;

    $display("---- After shallow copy ----");
    p1.display("p1");
    p2.display("p2");

    // 3. Modify primitive in p2 -> p1 NOT affected (copied by value)
    p2.name = "Kumar";
    p2.age  = 30;

    // 4. Modify sub-object via p2 -> p1 IS affected (shared handle)
    p2.addr.city = "Bangalore";

    $display("\n---- After modifying p2 ----");
    p1.display("p1");   // city changes too!
    p2.display("p2");
  end
endmodule