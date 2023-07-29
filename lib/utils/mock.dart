const mockData = {
  "original_size": <int>[480, 480],
  "predicts": [
    {
      "name": "Clear plastic bottle",
      "pos": <int>[117, 239]
    },
    {
      "name": "Plastic bottle cap",
      "pos": <int>[99, 185]
    },
    {
      "name": "Plastic bottle cap",
      "pos": <int>[105, 178]
    },
    {
      "name": "Styrofoam piece",
      "pos": <int>[245, 143]
    },
    {
      "name": "Meal carton",
      "pos": <int>[246, 143]
    }
  ]
};

const mockRecommend = {
  "recommends": [
    {
      "content":
          "Cat Scratching Pad: Cats love to scratch! Cover a carton box with rope or cardboard pieces to create a homemade cat scratching pad. It will keep your feline friend entertained and save your furniture from scratches.",
      "path": [
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/toyforcat.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=uitNpaIiR3w3i%2BTvD2K02W%2FctoBPfLV2MwCp9bg%2B%2BhQuMdBD7TDu96H2ExzKzGOdPS8yhbdEf%2Bt%2FvC7GVnlEu9n1HLY3neXmDVL79pqFOAl5os395fMZbiOITM8O2lvZ3examr17CGPlbl6Y7Pq99eFdLSjpIn%2FXOT5ky8COvAKxRsOj2s4jJ2mOOj%2ByVJZUtlxA%2FFE64hdaAQIbGoq%2BM%2F4LsVjTx79Zo4Vg3x3eI5TbLbbhTkqVnkRLIRWLGowRhN69VKGpo2%2BY%2FWAWsBJOVTqQ6SNfN0yJ0MHld0M0PbToop3N2v8cKU77zCNC1ou00X1JQHVintvyrzubl5ftWg%3D%3D",
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/fatcat2.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=FZ4ocsnyOl27N86DoDpE%2Be3PiHqIr8WESvxXctilJ2SSYGrIbkf8Uls79HCBVTbWr2gYFV1PagOlornKry6TPvgGKtVtGjgJnYCFRFmlTh1JupTbvox1lBBG53WieF6YhoETTB5HcXW9tONP3OtsWXqjvkPVl2DE19aSf%2F28XDd8lGi3Gx5p4NfmRt%2BAWzQ0AsBMjJUlOA7RdssT%2F3Y1vff3yxU2jp%2FpnUUQ%2F9LwNPAHX1jb8BzdIoRLTLaLeHuesdi2gyV9CLp4us1jdDvuFRUz5jGxBxv%2FU9zy1r%2F6XvOlZBvSdRzCF5hlzZBGeq%2B4fqvgAaccFSAECwcj2ed7Ow%3D%3D",
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/fatcat.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=GajqIG5G4GglKz%2FROuXYgeNU48J1QGrdUpi%2B7OcdAdi9cTjcJEKrvNn1UntIh5FhU54HjcJuS56vxgQg%2FrPaEItdpZ3yW%2FJubvtrmMszR6dBz79Xg%2BRM33hoHZcPqe8qz99AB3ajC6eE7e2GDqZ5yaCgwLjYDG2QSmaALd6NI31ybUJL%2FcZTJz0KzcHNxb6b5XdlmQKnr3d%2BXmvqXVexFgElbZaFnTkcIr%2FiwWj92On7Ftbk9LHbWXMR9ygmQuLorQRCLnDpOSGfuWb5y7DdT%2FaE4gUUJdpNyTeX85Bh8dkZLJweETbpIaMPh2qTRkfb0gf76GSQfQSdZJX3hpkb%2Fw%3D%3D"
      ],
      "title": "Cat Scratching Pad"
    },
    {
      "content":
          "Shoe Storage: Cut carton boxes to create custom-sized shoe storage containers. Label each box with the type of shoes stored inside for easy access.",
      "path": [
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/shoestorage.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=Y91YJXd%2BA5ClY8dGPJRtNpzPeVKMlRQPPCdSzsdNlbSNZkOPRJF5mw2GHVZ6JkYpgL9siOI7SXHsatBsYoXztq7a6NnhzsHHlvnypCJvSQUlg6kSXfUO3rnfYoyv2qnB6XM4ajrtVyGTdccED8Wp20pP6nRfGN0rssUXts6dKUTjoVisG7oLF8ObVzSM7Z3158Uy%2Bdeso6uFOitiMR3dwumaRr%2BaxWE9noCxkngXDViZX%2Bui3JX3tTSfS%2FzkSb7pYjj2r1fRooMGoIlZaCywnSdqGl%2FaQIi5nkwOa4xSvHDR3MdBhhetqsQkd8z47yJus1Jt%2BXMiDq8D8MT1ze4ptg%3D%3D",
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/cartonboxes.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=PgGAeoMMn2LJ9Ci7%2Bs5vJH7yocSwWflcEBoQaKoefpqvFOGqhG1PKkMB2itqtg5b0sHZ5A%2FgxjqkiwSXV66LkYGsqsb4ibSWL2pOhPB9bKp9AVqnQzkF8wT7W0Cl%2BCwVhRIRJc0t3cQUbyOcOlr5NW6NJzlfAszcq6pIGksn0KP1Ugfp7UBmv6%2BUs7x83kIPHB5BvxCujgD0LDhVENDq9QLWk%2Fn7lASuJXJOEN6zkg2AfZviFQSIfvIVFv%2FPTJ93XaQPSqwzDorJIKCjvxyTH8a3Iwc5hwNHSFsFicsjP4p0MS8ZzuP0w0Sg65yjBaCz6blw34J3BRGTSgQl8N7O9A%3D%3D"
      ],
      "title": "Shoe Storage"
    },
    {
      "content":
          "DIY Gift Boxes: Decorate and personalize carton boxes to turn them into unique gift boxes for special occasions. Add ribbons, bows, and other embellishments to make them look festive.",
      "path": [
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/giftbox.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=HIoR0buubunrRJ4QaPSsBrqc%2FnPI6aur1wjdHYPCEX0qJY1lRJj7G6l1ITYRq9rIiEkIAymMaNaz7f8zFCCiV8UtNFFxDJxuMNK5eMG4eVbS8JGdqQ0X0eqH7AZc%2BE4bzvPeiwH8FC0kvoQTmDr8vh2YdxujQpyWkhrCSKqVkC1fcJLUsxQJpZTAxmgu9Hx9wiF6eOm8RgOQTXnykMjAl9DY9L%2BGGudhfeW%2B18q%2FA8DjbAdfYi4y9aJBWPg%2FOYRSVmV0e%2F%2BoctUV6lDFzLhbolZhwebi4elLFRuFn4kUAHXM%2Fa%2FwBjey5gGwir1hVwdAucBH37iMsvUEI%2Bpgrs%2Fx7A%3D%3D"
      ],
      "title": "DIY Gift Boxes"
    },
    {
      "content":
          "DIY Bookshelf: Stack and secure carton boxes on top of each other to create a simple and temporary bookshelf for lightweight books or items.",
      "path": [
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/cartonboxes.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=PgGAeoMMn2LJ9Ci7%2Bs5vJH7yocSwWflcEBoQaKoefpqvFOGqhG1PKkMB2itqtg5b0sHZ5A%2FgxjqkiwSXV66LkYGsqsb4ibSWL2pOhPB9bKp9AVqnQzkF8wT7W0Cl%2BCwVhRIRJc0t3cQUbyOcOlr5NW6NJzlfAszcq6pIGksn0KP1Ugfp7UBmv6%2BUs7x83kIPHB5BvxCujgD0LDhVENDq9QLWk%2Fn7lASuJXJOEN6zkg2AfZviFQSIfvIVFv%2FPTJ93XaQPSqwzDorJIKCjvxyTH8a3Iwc5hwNHSFsFicsjP4p0MS8ZzuP0w0Sg65yjBaCz6blw34J3BRGTSgQl8N7O9A%3D%3D"
      ],
      "title": "DIY Bookshelf"
    },
    {
      "content":
          "Desk Caddy: Turn a carton box into a desk caddy to keep your pens, pencils, scissors, and other stationery items organized on your workspace.",
      "path": [
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/deskcaddy.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=ThYYg2vuCCyH2tS%2Fm2vwLJGHDxqBMg2jnPR9xKPgtJTLCd4nD4oM8oXDUFyL851tklh3l8N7EvD6WHa3ZN1BSLkQBQ7xc2DWQmrIU4v2RGhTdjJpmKLLdupIhBL7w2enS227mO%2FTis%2F4CitQICf%2B4Stcs7lOn8%2FlljnPaxKYUJXiqjhrW9pXWDFbxB3868vgPgMAG%2FPrEjar2%2FRQAGM7EC0cyAXZHbavhhg4Z9uQ2is2PmTRr6gVRI%2BcFziISMSqIWyuMVghTT2%2BahLZC283VTgAd2qji95i7xW7UVNw%2FRJ4KCm6UnG3SxlCkY9uAAQPht8HkKmzk%2BNgPjfR0Y7Duw%3D%3D",
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/deskcaddy2.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=nkAkQ%2FgVQhm78dTqElAw%2FUc%2BFa6SqB%2Fz%2BsqRF1XYOyTzPMCLjxChPFGDDAq6B3JsGgprR8XXqj2m0r4bQC1t4O8%2B1UYDzHduHu%2BhNn2PxMD0Pu1r3JIw2XYkAZodcVyfjRRsK22OFdFBvEE3cxCKUsVyEssaLADuKvVV7km91%2F8VRvWVFDNHMT72wEfTncvq5AHJjC8AIUXVI%2BootsGioeHq5FR7fnXGWAVnkp8htu611%2BvzMUQGIf2dYYjG4T792WRSnV9KXTxHSq5uSP8EZP8t98ndrBjgq6sdn90aI3lQIHUq2fPIgKbthE3fEolvE25G%2FoKFqVrL3JicCjXb4Q%3D%3D",
        "https://storage.googleapis.com/green-vision-42477.appspot.com/images/deskcaddy3.jpg?Expires=3000000000&GoogleAccessId=firebase-adminsdk-flci8%40green-vision-42477.iam.gserviceaccount.com&Signature=NRAHmCCUKbcYRaVNpqPkWSkRiW3LJOwRJeyMm4OYlCf0YqBVwKRLPbD8FZVF9UimZ6zR%2FvscPHBeENo0g2Zp5U2e1KXmRBXt350AUbiDHx%2FCF%2BnKpa54KHoWiWS83CB2uB%2Fp8KndevyIBL2MbgHa5N5T8YTFTMZhakeSNjCX5yEjPEmgcipCOZ9DxYV1KsLXBYGGkvyTdbbyTgNVMshjR0Nc2Hoxd%2Bk3ruMZkWTdNun3ASGkS6sCWqNhl7Flz2rcKJjmlu465qVW0yBiTLXLZck2p%2FEnbubtVCxKb%2Bc8bNpRK2NUzvetKgiOXxtd4qYolNBNnqa%2BtT3r5g22ndhNQA%3D%3D"
      ],
      "title": "Desk Caddy"
    }
  ]
};
