import 'dart:typed_data';
import 'package:invoice_generators/Invoice_detail.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfData {
  PdfPreview getPdfPreview() {
    return PdfPreview(
      build: (format) {
        return getPdf();
      },
    );
  }

  Future<Uint8List> getPdf() async {
    var document = Document();
    int gst=500;
    int totalAmount = 0;
    for (int i = 0; i < invoicedetail.products.length; i++) {
      int price = int.tryParse(invoicedetail.amount[i]) ?? 0;
      totalAmount += (price+gst);
    }
    int totalQuantity = 0;
    for (int i = 0; i < invoicedetail.products.length; i++) {
      int quantity = int.tryParse(invoicedetail.Quantity[i]) ?? 0;
      totalQuantity += (quantity);
    }

    document.addPage(Page(build: (context) {
      return Column(
        children: [
          Row(
            children: [
              Text(
                "From",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Mavdi Fire Bridge\nRajkot, Gujarat, India",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "No: +91062-5487-4921",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 250, top: 20),
            child: Row(
              children: [
                Text(
                  "Receiver Address : ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 250),
            child: Row(
              children: [
                Text(
                  "${invoicedetail.receiveraddress}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: EdgeInsets.only(left: 250),
            child: Row(
              children: [
                Text(
                  "${invoicedetail.receiveraddress1}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 30),
          Text(
            "INVOICE TYPE",
            style: TextStyle(fontSize: 30, letterSpacing: 4),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Retail Invoice",
                style: TextStyle(fontSize: 30, letterSpacing: 1),
              ),
              SizedBox(width: 100),
              Text(
                "Tax Invoice",
                style: TextStyle(fontSize: 30, letterSpacing: 1),
              )
            ],
          ),
          Text(
            "INVOICE",
            style: TextStyle(fontSize: 50, letterSpacing: 4),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text("Invoice No: ", style: TextStyle(fontSize: 15)),
              Text(
                "${invoicedetail.invoiceno}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Text("Date : ", style: TextStyle(fontSize: 15)),
              Text(
                "${invoicedetail.date}",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text("Customer Name : ${invoicedetail.name}",
                  style: TextStyle(fontSize: 15))
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          Row(
            children: [
              Text("Item",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Quantity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Spacer(),
              Text("Amount",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(),
          Row(
            children: [
              Column(
                children: [
                  for (int i = 1; i <= invoicedetail.products.length; i++)
                    Text("${i}", style: TextStyle(fontSize: 18)),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  for (int i = 0; i < invoicedetail.products.length; i++)
                    Text("${invoicedetail.products[i]}",
                        style: TextStyle(fontSize: 18)),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 45),
                child: Column(
                  children: [
                    for (int i = 0; i < invoicedetail.Quantity.length; i++)
                      Text("${int.tryParse(invoicedetail.Quantity[i]) ?? 0}",
                          style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  for (int i = 0; i < invoicedetail.amount.length; i++)
                    Text(
                        "${int.tryParse(invoicedetail.amount[i]) ?? 0 * invoicedetail.Quantity[i]}",
                        style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Quantity:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(width: 20),
              Text(
                "$totalQuantity",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 80),
              Padding(padding: EdgeInsets.only(left: -10),child:  Text(
                "Total:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), ),
              SizedBox(width: 20),
              Text(
                "$totalAmount",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 110, left: 100),
            child: Row(
              children: [
                Spacer(),
                Text("To Contact Us :KitchenBasket@gmail.com ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Spacer(),
              ],
            ),
          )
        ],
      );
    }));

    return document.save();
  }
}
