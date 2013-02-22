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

###Order:
    + fields:
      = Item name
      = Range
      = Status
    + relationship:
      = belongs_to user