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
    + relationship:
      = belongs_to order

###Order:
    + fields:
      = Item name
      = Range
      = Status
    + relationship:
      = belongs_to user
      = has_one item