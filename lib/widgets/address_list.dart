import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:savekartweb/web/AppStorage.dart';

import '../design/ResponsiveInfo.dart';
import '../domain/user_address_entity.dart';
import '../web/apimethodes.dart';
import '../web/ecommerce_api_helper.dart';

class AddressList extends StatefulWidget {
   AddressList() ;

  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAddress();

  }
  final List<UserAddressData> _addresses = [];
  String? _selectedAddress,selected_addressid="0";

  getAllAddress()async
  {

    WidgetsBinding.instance.addPostFrameCallback((_) {

      ResponsiveInfo.showLoaderDialog(context);


    });

    ApiHelper apihelper = new ApiHelper();

    var t=ApiHelper.getTimeStamp();
    String? userid=await AppStorage.getString(AppStorage.id);

    var response= await  apihelper.get(Apimethodes.getAddressList+"?q="+t.toString()+"&userid="+userid.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) {

     Navigator.pop(context);


    });


    var js= jsonDecode( response) ;

    UserAddressEntity entity=UserAddressEntity.fromJson(js);

    if(entity.status==1)
    {

      setState(() {

        _addresses.clear();
        if(entity.data!.length>0) {
          _addresses.addAll(entity.data!);

          selected_addressid = _addresses[0].id.toString();
          _selectedAddress = _addresses[0].name.toString() + "\n" +
              _addresses[0].housename.toString()+","+_addresses[0].place.toString() + "\n" +
              _addresses[0].landmark.toString()+"\n"+
              _addresses[0].phone.toString()+"\n"+
              _addresses[0].state.toString();
        }
      });
    }



  }

  Future<bool> _onWillPop() async {

    Navigator.of(context).pop({
      'added': "1",
      'id':selected_addressid
    });

    return false;

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop, // Intercept back button press
        child:

      Scaffold(
      appBar: AppBar(title: Text('Address List'),
      leading: GestureDetector(

        child:Icon(Icons.arrow_back,color: Colors.black54,size: ResponsiveInfo.isMobile(context)?20:35,) ,
        onTap: (){
          Navigator.of(context).pop({
            'added': "1",
            'id':selected_addressid
          });

        },
      )

      ,

      actions: [
        Padding(padding: EdgeInsets.all(10),

          child: GestureDetector(

            child: Text("Add New",style: TextStyle(fontSize: ResponsiveInfo.isMobile(context)?15:17),),

            onTap: () async {

              String? userid=await AppStorage.getString(AppStorage.id);

              final result = await showDialog<Map<String, String>>(
                context: context,
                builder: (context) => InputDialog(new UserAddressData()),
              );

              // Check if the result is not null
              if (result != null) {

               String   name = result['name'] ?? '';

                String  phone = result['phone'] ?? '';
               String  house = result['house'] ?? '';
               String  flatno = result['flatno'] ?? '';
               String  landmark = result['landmark'] ?? '';
               String  district = result['district'] ?? '';
               String place=result['place'] ?? '';
               String pincode=result['pincode'] ??'';
               String state=result['state']??'';



               Map<String,String> mp=new HashMap();

               mp['name'] = name;
               mp['house'] = house;
               mp['flatno']=flatno;
               mp['landmark']=landmark;
               mp['district']=district;
               mp['place']=place;
               mp['phone'] = phone;
               mp['pincode']=pincode;
               mp['state']=state;
               mp['userid']=userid.toString();


               ApiHelper apihelper = new ApiHelper();

               var t=ApiHelper.getTimeStamp();

               var response= await  apihelper.post(Apimethodes.addAddress+"?q="+t.toString(),formDataPayload: mp);

               var js= jsonDecode( response) ;

               getAllAddress();

              }
            },
          ),

        )


      ],

      ),

      body: Stack(

        children: [

          Align(
            alignment: FractionalOffset.topCenter,

            child: ListView.builder(
                itemCount: _addresses.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    
                    child:ListTile(
                        leading: (_addresses[index].id.toString().compareTo(selected_addressid.toString())==0)?
                        GestureDetector(
                          child:Icon(Icons.radio_button_checked,color: Colors.green,) ,

                          onTap: (){
                            setState(() {
                              selected_addressid=_addresses[index].id.toString();
                            });
                          },
                        )
                         :
                            GestureDetector(
                              child:Icon(Icons.radio_button_off,color: Colors.black54,) ,
                              onTap: (){
                                setState(() {
                                  selected_addressid=_addresses[index].id.toString();
                                });
                              },
                            )


                        ,
                        trailing: GestureDetector(
                          child: Text(
                            "Edit/Delete",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          onTap: () async {
                            final result = await showDialog<Map<String, String>>(
                              context: context,
                              builder: (context) => InputDialog(_addresses[index]),
                            );

                            // Check if the result is not null
                            if (result != null) {





                              if(result.containsKey("delete"))
                                {
                                  String  delt = result['delete'] ?? '';

                                  if (delt.compareTo("1")==0) {
                                    Map<String, String> mp = new HashMap();
                                    String? userid=await AppStorage.getString(AppStorage.id);

                                    mp['id'] = _addresses[index].id.toString();
                                    mp['userid']=userid.toString();

                                    ApiHelper apihelper = new ApiHelper();

                                    var t = ApiHelper.getTimeStamp();

                                    var response = await apihelper.post(
                                        Apimethodes.deleteAddress + "?q=" +
                                            t.toString(), formDataPayload: mp);

                                    var js = jsonDecode(response);

                                    getAllAddress();
                                  }


                                }
                              else {
                                String? userid=await AppStorage.getString(AppStorage.id);

                                String   name = result['name'] ?? '';
                                String  house = result['house'] ?? '';
                                String  flatno = result['flatno'] ?? '';
                                String  landmark = result['landmark'] ?? '';
                                String  district = result['district'] ?? '';
                                String place=result['place'] ?? '';
                                String  phone = result['phone'] ?? '';
                                String pincode=result['pincode'] ??'';
                                String state=result['state']??'';
                                Map<String, String> mp = new HashMap();
                                mp['name'] = name;
                                mp['house'] = house;
                                mp['flatno']=flatno;
                                mp['landmark']=landmark;
                                mp['district']=district;
                                mp['place']=place;
                                mp['phone'] = phone;
                                mp['pincode']=pincode;
                                mp['state']=state;
                                mp['userid']=userid.toString();


                                mp['id'] = _addresses[index].id.toString();

                                ApiHelper apihelper = new ApiHelper();

                                var t = ApiHelper.getTimeStamp();

                                var response = await apihelper.post(
                                    Apimethodes.updateAddress + "?q=" +
                                        t.toString(), formDataPayload: mp);

                                var js = jsonDecode(response);

                                getAllAddress();
                              }

                            }


                          },
                        ),

                        title: Text(""+_addresses[index].name.toString()+"\n"+_addresses[index].housename.toString()+"\n"+_addresses[index].flatno.toString()+"\n"+_addresses[index].landmark.toString()+"\n"+_addresses[index].district.toString()+"\n"+_addresses[index].phone.toString()+"\n"+_addresses[index].state.toString(),maxLines: MediaQuery.of(context).size.width>700 ? 10:3,)) ,
                    elevation: 10,
                  )
                    
                    
                    ;
                }),
          )
        ],
      ),


    ));
  }
}


class InputDialog extends StatefulWidget {

  UserAddressData userAddressDataData;
  InputDialog(this.userAddressDataData);


  @override
  _InputDialogState createState() => _InputDialogState(this.userAddressDataData);
}

class _InputDialogState extends State<InputDialog> {
  final _nameController = TextEditingController();
  final _houseflatnameController = TextEditingController();
  final _houseflatnoController = TextEditingController();
  final _placenameController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _districtController = TextEditingController();

  final _phoneController = TextEditingController();
  final _pincodecontroller=TextEditingController();

  final List<String> countries = [
    'India'

  ];

  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi (National Capital Territory)',
    'Jammu and Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry'


  ];

  String selectedCountry="India";
  String selectedState="Kerala";

  UserAddressData userAddressDataData;
  _InputDialogState(this.userAddressDataData);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _nameController.text=userAddressDataData.name.toString();

      _phoneController.text=userAddressDataData.phone.toString();
       _houseflatnameController.text=userAddressDataData.housename.toString();
       _houseflatnoController.text=userAddressDataData.flatno.toString();
       _placenameController.text=userAddressDataData.place.toString();
       _landmarkController.text=userAddressDataData.landmark.toString();
       _districtController.text=userAddressDataData.district.toString();
       _pincodecontroller.text=userAddressDataData.pincode.toString();
       if(userAddressDataData.state.toString().isEmpty)
         {
           selectedState = "Kerala";
         }
       else {
         selectedState = userAddressDataData.state.toString();
       }


    });
  }

  @override
  void dispose() {
    _nameController.dispose();
     _houseflatnameController.dispose();
     _houseflatnoController.dispose();
     _placenameController.dispose();
     _landmarkController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  void _deleteAddress(){
    Navigator.of(context).pop({
      'delete': "1"
    });
  }

  void _submitData() {
    final name = _nameController.text;
    // final address = _addressController.text;
    final phone = _phoneController.text;

    if(name.isNotEmpty)
      {
        if(_houseflatnameController.text.isNotEmpty)
        {
          if(_landmarkController.text.isNotEmpty)
          {
            if(_placenameController.text.isNotEmpty)
            {
              if(_districtController.text.isNotEmpty)
              {
                if(_phoneController.text.isNotEmpty)
                {

                  if(_pincodecontroller.text.isNotEmpty)
                    {

                  Navigator.of(context).pop({
                    'name': name,
                    'house': _houseflatnameController.text,
                    'flatno':_houseflatnoController.text,
                    'landmark': _landmarkController.text,
                    'place':_placenameController.text,
                    'district':_districtController.text,
                    'state':selectedState,
                    'phone':_phoneController.text,
                    'pincode':_pincodecontroller.text
                  });
                    }
                  else{
                    ResponsiveInfo.showAlertDialog(context, "", "Enter Pincode");
                  }

                }
                else{
                  ResponsiveInfo.showAlertDialog(context, "", "Enter Phone number");
                }


              }
              else{
                ResponsiveInfo.showAlertDialog(context, "", "Enter District");
              }


            }
            else{
              ResponsiveInfo.showAlertDialog(context, "", "Enter Place name");
            }


          }
          else{
            ResponsiveInfo.showAlertDialog(context, "", "Enter Landmark");
          }

        }
        else{
          ResponsiveInfo.showAlertDialog(context, "", "Enter House or Flat name");
        }

      }
    else{
      ResponsiveInfo.showAlertDialog(context, "", "Enter name");
    }

    // Close the dialog and pass the data back

  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter Address"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _houseflatnameController,
              decoration: InputDecoration(labelText: "House / Flat name"),
            ),
            TextField(
              controller: _houseflatnoController,
              decoration: InputDecoration(labelText: "Flat no. (optional)"),
            ),
            TextField(
              controller: _landmarkController,
              decoration: InputDecoration(labelText: "Landmark"),
            ),

            TextField(
              controller: _placenameController,
              decoration: InputDecoration(labelText: "Place"),
            ),

            TextField(
              controller: _districtController,
              decoration: InputDecoration(labelText: "District"),
            ),

            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Phone Number"),
              keyboardType: TextInputType.phone,
            ),

            TextField(
              controller: _pincodecontroller,
              decoration: InputDecoration(labelText: "Pin Code"),
              keyboardType: TextInputType.number,
            ),

        Container(
          width: double.infinity,
          height: ResponsiveInfo.isMobile(context)?50:70,
          child:    DropdownButton<String>(
              hint: Text('Choose a state'),
              value: selectedState,
              onChanged: (String? newValue) {
                setState(() {
                  selectedState = newValue!;
                });
              },
              items: states.map<DropdownMenuItem<String>>((String state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child:Container(width: 180,

                  child:
                  Text(state,style: TextStyle(fontSize: 14,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,) ,
                  )


                );
              }).toList(),
            ) ),

            Container(
              width: double.infinity,
              height: ResponsiveInfo.isMobile(context)?50:70,
              child:   DropdownButton<String>(
                hint: Text('Select a country'),
                value: selectedCountry,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue.toString();
                  });
                },
                items: countries.map<DropdownMenuItem<String>>((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
              ),
            )


          ],
        ),
      ),
      actions: [

        (userAddressDataData.id.toString().isNotEmpty)?  ElevatedButton(
          onPressed: _deleteAddress,
          child: Text("Delete"),
        ) : Container(),
        ElevatedButton(
          onPressed: _submitData,
          child: Text("Submit"),
        ),
      ],
    );
  }



}

