import 'package:bus_app/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _Test();
}

class _Test extends State<Test> {

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: orientation == Orientation.portrait
          ? Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Vector 1.png'),
                      fit: BoxFit.none,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                            top: size.height * 0.2,
                            bottom: size.height * 0.05),
                        child: PageLogin_Left(),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(
                            top: size.height * 0.35,
                            left: size.width * 0,
                            right: size.width * 0.05,
                            bottom: size.height * 0.05),

                        child: eee(size: size),
                      ),
                      Container(

                          padding: EdgeInsets.only(
                              top: size.height * 0.45,
                              left: size.width * 0.05,
                              right: size.width * 0.05,
                              bottom: size.height * 0.15),

                          child: PageLogin_Right()),
                    ],
                  ),
                ),
              ],
            )
          : Container(

              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Vector 2.png'),
                  fit: BoxFit.none,
                ),
              ),
              child: Row(
                children: [
                  const Expanded(child: PageLogin_Left()),
                  Expanded(
                    child: Stack(

                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                           padding: EdgeInsets.only(
                              top: size.height * 0.08,
                              left: size.width * 0.05,
                              bottom: size.height * 0.05),
                            height: size.height * 0.25,
                            child: eee(size: size),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.4, 0.8),
                          child: Container(

                              width: size.width * 0.4,
                              height: size.height * 0.77,
                              child: PageLogin_Right()),
                        ),


                      ],
                    ),
                  ),
                ],
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
    return Row(
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
    );
  }
}

class PageLogin_Right extends StatefulWidget {
  PageLogin_Right({
    super.key,
  });

  @override
  State<PageLogin_Right> createState() => _PageLogin_RightState();
}

class _PageLogin_RightState extends State<PageLogin_Right> {
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
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        children: [

          TextFieldLogin(
            child: TextFormField(

              keyboardType: TextInputType.phone,



              controller: _taikhoan,
              decoration: const InputDecoration(
                labelText: '+ 84 | Điện thoại',
                border: InputBorder.none,
              ),
              validator: (value) {
                // if (value!=user.sdt) {
                //   return 'Số điện thoại không chính xác';
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

                // if (value != user.mk) {
                //   return 'Mật khẩu không chính xác';
                // }
                // return null;
              },
              onSaved: (value) {
                _matkhau.text = value!;
              },
            ),
          ),

          Expanded(
            child: Container(

              padding: EdgeInsets.only(top: size.height * 0.03,
                  bottom: size.height * 0.02),
              width: size.width * 0.85,
              height: size.height * 0.055,
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
          ),



          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),

              alignment: Alignment.bottomCenter,
              height: size.height * 0.15,
              child: const Text(
                "Nếu là Nhân viên thì bỏ qua bước nhập \nthông tin đăng nhập",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class eee extends StatelessWidget {
  const eee({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(

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
      width: size.width * 0.85,

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
