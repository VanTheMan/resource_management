##Models:

###User:
    + fields:
      = Email
      = Password
      = Name
    + relationship:
      = has_many orders

###Item:
    + fields:
      = Name
      = Status
      = Borrower
      = Image (maybe)
      = Item_Type
      = Description
      = Quantity
    + relationship:
      = belongs_to order

###Order:
    + fields:
      = Item name
      = Start date
      = End date
      = Status
    + relationship:
      = belongs_to user
      = has_one item