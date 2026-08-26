import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormpageState();
}

class _FormpageState extends State<FormPage> {
  final TextEditingController namaCotroller=TextEditingController();
  final TextEditingController alamatCotroller=TextEditingController();
  final TextEditingController emailCotroller=TextEditingController();
  final TextEditingController teleponCotroller=TextEditingController();
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  String nama='';
  String alamat='';
  String email='';
  String telepon='';

  void simpanData(){
    if(_formkey.currentState!.validate()){
      setState(() {
        nama=namaCotroller.text;
        alamat=alamatCotroller.text;
        email=emailCotroller.text;
        telepon=teleponCotroller.text;
      });
    }
  }

  void resetData(){
    setState(() {
      nama='';
      alamat='';
      email='';
      telepon='';
    });
    namaCotroller.clear();
    alamatCotroller.clear();
    emailCotroller.clear();
    teleponCotroller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('From Data'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namaCotroller,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukan Nama',
                      prefixIcon: Icon(Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value==null||value.trim().isEmpty){
                        return 'Nama Wajib diisi';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: alamatCotroller,
                    decoration: const InputDecoration(
                      labelText: 'Alamat',
                      hintText: 'Masukan Alamat',
                      prefixIcon: Icon(Icons.location_on,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value==null||value.trim().isEmpty){
                        return 'Alamat Wajib diisi';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: emailCotroller,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'akun@gmail.com',
                      prefixIcon: Icon(Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value==null||value.trim().isEmpty){
                        return 'Email Wajib diisi';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: teleponCotroller,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telepon',
                      hintText: 'Contoh: 08123456789',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nomor telepon wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(onPressed: simpanData, icon: const Icon(Icons.save,
                    ),
                    label: const Text("Tampilkan data"
                    ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(onPressed: resetData, icon: const Icon(Icons.refresh,
                    ),
                    label: const Text("Reset Data"
                    ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            if(nama.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(height: 10,),
                const Text("Hasil Input",
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.person
                    ),
                    title: const Text('Nama'
                    ),
                    subtitle: Text(nama),
                  ),
                ),
                const SizedBox(height: 15,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on
                    ),
                    title: const Text('Alamat'
                    ),
                    subtitle: Text(alamat),
                  ),
                ),
                const SizedBox(height: 15,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.email
                    ),
                    title: const Text('Email'
                    ),
                    subtitle: Text(email),
                  ),
                ),
                const SizedBox(height: 15,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.call
                    ),
                    title: const Text('Telepon'
                    ),
                    subtitle: Text(telepon),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}