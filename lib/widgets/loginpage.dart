import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

@RoutePage()
class WebLoginPage extends StatefulWidget {
  WebLoginPage({super.key});

  @override
  State<WebLoginPage> createState() => _WebLoginPageState();
}

class _WebLoginPageState extends State<WebLoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController channelIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GetxPageControler controller = Get.put(GetxPageControler());
    GetxTapController controller2 = Get.put(GetxTapController());
    return Scaffold(
      body: GetBuilder<GetxPageControler>(builder: (_) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: controller.islightmode
              ? BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      opacity: 0.2,
                      fit: BoxFit.cover))
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 450,
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: 500),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: controller.islightmode
                              ? Colors.black
                              : Colors.white)),
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          controller.islightmode
                              ? 'assets/images/splash.svg'
                              : 'assets/images/splashdark.svg',
                          height: 100,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'CLIENT LOGIN',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: channelIdController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.grey),
                            labelText: 'Enter Your Channel ID',
                            border: OutlineInputBorder(),
                          ),
                          validator: controller2.validateChannelId,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.resetpageindex();
                              context.router.replaceNamed('/homepage');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.islightmode
                                ? Colors.black
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: controller.islightmode
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FittedBox(
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('Terms of Use'),
                              ),
                              const Text('|'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Privacy Policy'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
