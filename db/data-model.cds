namespace my.bookshop;
using { Country, managed, sap } from '@sap/cds/common';

entity Books {
  key ID : Integer;
  title  : localized String;
  author : Association to Authors;
  genre  : Association to Genres;
  stock  : Integer;
}

entity Authors {
  key ID : Integer;
  name   : String;
  books  : Association to many Books on books.author = $self;
}

entity Orders : managed {
  key ID  : UUID;
  book    : Association to Books;
  country : Country;
  amount  : Integer;
}

entity Genres: sap.common.CodeList {
  key ID : UUID;
}