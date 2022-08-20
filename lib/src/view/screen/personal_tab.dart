import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/router/router_path.dart';
import 'package:fashion_app/src/view/screen/choice_address_screen.dart';
import 'package:fashion_app/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalTab extends StatefulWidget {
  @override
  _PersonalTabState createState() => _PersonalTabState();
}

class _PersonalTabState extends State<PersonalTab> {
  Map<String, String> listInfomation = {
    'Minhas ordens': 'Already have 12 orders',
    'Endereços de Envio': '3 address',
    'Métodos de Pagamento': 'Visa ',
    'Minhas avaliações': 'Reviews for 4 items',
    'Visualização recente': 'Reviews for 4 items',
  };

  @override
  Widget build(BuildContext context) {
    var productVM = Provider.of<ProductViewModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.discordapp.com/attachments/958362266540060756/1010620283675230349/DINO.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dino Queiroz",
                      style: AppFont.semiBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "mrdynoqueiroz@gmail.com",
                      style: AppFont.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: listInfomation.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                var title = listInfomation.keys.elementAt(index);
                var subtitle = listInfomation.values.elementAt(index);
                return InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, MyOrderScreens);
                        break;
                      case 1:
                        Navigator.pushNamed(context, ChoiceAddressScreens);
                        break;
                      case 4:
                        Navigator.pushNamed(context, RecentViewScreens,
                            arguments: productVM.listRecent);
                        break;
                    }
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0.0),
                    title: Text(
                      title,
                      style: AppFont.semiBold
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: AppFont.regular.copyWith(
                          fontWeight: FontWeight.w100,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
