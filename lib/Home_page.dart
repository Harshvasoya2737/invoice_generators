import 'package:flutter/material.dart';
import 'package:invoice_generators/Invoice_detail.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController Quanlist = TextEditingController();
  TextEditingController Pricelist = TextEditingController();
  String? cinvoiceno;
  String? ccustomername;
  String? cdate;
  String? creceiveraddress;
  String? creceiveraddress1;
  List<TextEditingController> productlist = [];
  List<TextEditingController> qunlist = [];
  List<TextEditingController> pricelist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            "Quick Invoice Maker",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w300,
                letterSpacing: 3),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    cinvoiceno = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Invoice Number",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    ccustomername = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Customer Name",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    cdate = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Date", border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    creceiveraddress = value;
                  },
                  decoration: InputDecoration(
                      labelText:
                          "Enter Receiver Address 1 (Block No./House No.)",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    creceiveraddress1 = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Receiver Address 2",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Column(
                                children: productlist
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: e,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    labelText: "Enter Product Name"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                children: qunlist
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: e,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    labelText: "Enter Product Quantity"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Column(
                                children: pricelist
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: e,
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    labelText: "Enter Product Price"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              productlist.add(TextEditingController());
                              qunlist.add(TextEditingController());
                              pricelist.add(TextEditingController());
                              setState(() {});
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  invoicedetail.products.clear();
                  invoicedetail.amount.clear();
                  invoicedetail.Quantity.clear();
                  for (var element in productlist) {
                    invoicedetail.products.add(element.text);
                  }

                  for (var element in qunlist) {
                    invoicedetail.Quantity.add(element.text);
                  }

                  for (var element in pricelist) {
                    invoicedetail.amount.add(element.text);
                  }

                  invoicedetail.invoiceno = cinvoiceno;
                  invoicedetail.name = ccustomername;
                  invoicedetail.date = cdate;
                  invoicedetail.receiveraddress = creceiveraddress;
                  invoicedetail.receiveraddress1 = creceiveraddress1;

                  Navigator.pushNamed(context, "my_pdf");
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
