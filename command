rails g scaffold user first_name:string last_name:string email:string password_hash:string password_salt:string active:boolean

rails g scaffold role name:string description:string active:boolean 

rails g model assignment user:references role:references

rails g controller sessions new 
