import 'package:auto_route/auto_route.dart';
import 'package:fitness_dashboard_ui/controller/pagecontroller.dart';
import 'package:fitness_dashboard_ui/controller/tapcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@RoutePage()
class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController channelIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GetxPageControler controller = Get.put(GetxPageControler());
    GetxTapController controller2 = Get.put(GetxTapController());
    return GetBuilder<GetxPageControler>(builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: controller.islightmode
            ? BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    opacity: 0.2,
                    fit: BoxFit.cover))
            : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: Container(
                  height: 450,
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
                        Image.asset(
                          controller.islightmode
                              ? 'assets/images/splash.png'
                              : 'assets/images/splashdark.png',
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
                          keyboardType: TextInputType.number,
                          controller: channelIdController,
                          decoration: const InputDecoration(
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
                              controller.showLoadingDialog(context);
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
        ),
      );
    });
  }
}
