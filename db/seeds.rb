# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
  {fullname: "Marcel Benítez", email:"marcelbm94@gmail.com", phone: "8115019160", password: "1234"},
  {fullname: "Marcelo Garza", email:"amarcel@gmail.com", phone: "811511160", password: "1234"},
  {fullname: "Admin", email:"admin", phone: "811511160", password: "1234", admin:true}
  ])

books_purchase = Book.create([
  {user_id: '1', name: "Book 1", for_what: 'purchase', image_url: 'http://craigmod.com/images/journal/coccyx/aba-06.png', price: '500'},
  {user_id: '1', name: "Book 2", for_what: 'purchase', image_url: 'http://www.greenfoot.org/book/images/book-covers/greenfoot-book-cover-500.jpg', price: '700'},
  {user_id: '2', name: "Book 3", for_what: 'purchase', image_url: 'http://www.creativeclass.com/_wp/wp-content/uploads/2011/10/350x525xthe_great_reset_book_cover.gif.pagespeed.ic.h2MJZlq7Cd.png', price: '700'},
  {user_id: '2', name: "Book 4", for_what: 'purchase', image_url: 'http://www.rasmusen.org/GI/images/ed4cover.jpg', price: '700'},
  {user_id: '1', name: "Book 5", for_what: 'purchase', image_url: 'http://www.mychrisalexander.com/LAMS%20book%20cover%202011-02.jpg', price: '700'},
  {user_id: '2', name: "Book 6", for_what: 'purchase', image_url: 'http://kc-test.cg-creator.com/_uploads/the_international_journal_of_design_management_and_professional_practice_Front_Cover.jpeg', price: '700'},
  {user_id: '2', name: "Book 7", for_what: 'purchase', image_url: 'https://upload.wikimedia.org/wikipedia/en/b/b3/Book_Cover_V2.jpeg', price: '700'},
  {user_id: '1', name: "Book 8", for_what: 'purchase', image_url: 'http://www.bennadel.com/resources/uploads/bulletproof_web_design_book_cover.gif', price: '700'},
  {user_id: '2', name: "Book 9", for_what: 'purchase', image_url: 'https://s-media-cache-ak0.pinimg.com/236x/0f/d4/d8/0fd4d81167bba2f7b6bf4020f1202281.jpg', price: '700'},
  {user_id: '1', name: "Book 10", for_what: 'purchase', image_url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQz_BYSrKIm0GZHnYGIOcz_I-XFlIfSU56C89YFw_nS73S-0aVF', price: '700'},
  {user_id: '2', name: "Book 11", for_what: 'purchase', image_url: 'https://www.sfu.ca/~egan/Indeks%20cover.jpg', price: '700'}
  ])

books_sale = Book.create([
  {user_id: '2', name: "Book a", for_what: 'sale', image_url: 'https://tumblehomelearning.com/wp-content/uploads/2013/04/SS-COVER-FINAL-5-angella-fish-4-ALL-CAPS-AND-EXCLAIM-new-fish-open-eye-j-font-2-ISBN-795-no-dc-under-new-font-new-design-no-underlay-fixed-price-d-CMYK-darker-blue-1-1cm-spine-centered-LATEST-front.jpg', price: '500'},
  {user_id: '2', name: "Book b", for_what: 'sale', image_url: 'http://beta.walsworthyearbooks.com/showcase/theme-gallery/september-2009/images/lefleuve/lefleuve-title.jpg', price: '700'},
  {user_id: '1', name: "Book c", for_what: 'sale', image_url: 'http://www.brochure-designing.net/sample/books/book-cover-design-example-1.jpg', price: '700'},
  {user_id: '1', name: "Book d", for_what: 'sale', image_url: 'http://www.antoniosiber.org/cover_pages/cover_kuk_pp.jpg', price: '700'},
  {user_id: '2', name: "Book e", for_what: 'sale', image_url: 'http://orig15.deviantart.net/b2f2/f/2011/063/1/4/turning_point_book_cover_page_by_kishorekumar-d3aw8ir.jpg', price: '700'},
  {user_id: '2', name: "Book f", for_what: 'sale', image_url: 'http://storage.designcrowd.com/design_img/107260/107631/107631_1578912_107260_thumbnail.jpg', price: '700'},
  {user_id: '1', name: "Book g", for_what: 'sale', image_url: 'http://40.media.tumblr.com/tumblr_m6e7a7d5pD1rzar02o1_1280.jpg', price: '700'},
  {user_id: '2', name: "Book h", for_what: 'sale', image_url: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTnVow8r_fXxzCO61VbEP1jw4bb6V3Ugdz_rHVK4DQEFfWyJYrqzQ', price: '700'},
  {user_id: '1', name: "Book i", for_what: 'sale', image_url: 'http://www.ia.urjc.es/cms/sites/default/files/userfiles/image/Cover-978-94-007-5582-6.jpg', price: '700'},
  {user_id: '2', name: "Book j", for_what: 'sale', image_url: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSAsaF5tLv13gqIC_cMBGmP8t3AJjwy8gHIoFTIhIN6Cl00vFDa', price: '700'},
  {user_id: '1', name: "Book k", for_what: 'sale', image_url: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT8xuZLUOCZdtTukOb2TIe3X5Kpxu9KnOBHY2bBoA_Rznq6WCA7sw', price: '700'}
  ])
