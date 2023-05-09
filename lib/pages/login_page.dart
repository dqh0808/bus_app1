import 'package:bus_app/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  User user = User(loai: 'admin', sdt: '123', mk: '123');

  List<User> users = [
    User(
      loai: 'admin',
      mk: '123',
      sdt: '123',
    ),

    //add

    User(
      loai: 'driver',
      mk: '123',
      sdt: '456',
    ),
    User(
      loai: 'user',
      mk: '',
      sdt: '',
    ),
  ];

  //checkuser
  void checkUser() {
    for (var i = 0; i < users.length; i++) {
      if (users[i].sdt == user.sdt && users[i].mk == user.mk) {
        user.loai = users[i].loai;
        if (user.loai == 'admin') {
          Navigator.pushNamed(context, '/home_admin');
        } else if (user.loai == 'driver') {
          Navigator.pushNamed(context, '/home_driver');
        } else if (user.loai == 'user') {
          Navigator.pushNamed(context, '/home_user');
        }
      }
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _taikhoan = TextEditingController();
  final TextEditingController _matkhau = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:  Container(

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Vector 1.png'),
              fit: BoxFit.none,
            ),
          ),
          child: Column(
            children: [
              Form(
                // key: _formKey,
                  child: PageLogin_Left()),
              SizedBox(
                height: size.height * 0.05,
                child: const Text(
                  'BẮT ĐẦU NÀO!',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              TextFieldLogin(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _taikhoan,
                  decoration: const InputDecoration(
                    labelText: '+ 84 | Điện thoại',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    // if (value!= user.sdt) {
                    //   return 'Vui lòng nhập số điện thoại';
                    // }
                    // return null;
                  },
                  onSaved: (value) {
                    _taikhoan.text = value!;
                  },
                ),
              ),
              TextFieldLogin(
                child: TextFormField(
                  controller: _matkhau,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  validator: (value) {
                    // if (value!.isEmpty) {
                    //   return 'Vui lòng nhập mật khẩu';
                    // }
                    // return null;
                  },
                  onSaved: (value) {
                    _matkhau.text = value!;
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.05,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent[700],
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        user.sdt = _taikhoan.text;
                        user.mk = _matkhau.text;

                        checkUser();
                      }
                    },
                    child: const Text(
                      'ĐĂNG NHẬP',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  height: size.height * 0.04,
                  child: const Text(
                    "Nếu là Nhân viên thì bỏ qua bước nhập \nthông tin đăng nhập",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageLogin_Left extends StatelessWidget {
  const PageLogin_Left({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/images/logo2.png'),
            fit: BoxFit.fill,
          ),
          Image(
            image: AssetImage('assets/images/text.png'),
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

class TextFieldLogin extends StatelessWidget {
  final Widget child;
  const TextFieldLogin({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
