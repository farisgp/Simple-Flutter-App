import 'package:flutter/material.dart';
import 'package:foody_submission/model/food_data.dart';

class DetailScreen extends StatelessWidget {
  final FoodData foodData;

  const DetailScreen({Key? key, required this.foodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // return DetailMobilePage(foodData: foodData);
      if (constraints.maxWidth > 800) {
          return DetailWebPage(foodData: foodData);
        } else {
          return DetailMobilePage(foodData: foodData);
        }
    });
  }
}

class DetailMobilePage extends StatefulWidget {
  final FoodData foodData;

  DetailMobilePage({
    required this.foodData,
  });

  @override
  State<DetailMobilePage> createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  int quantity = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Hero(
                    tag: widget.foodData.name,
                    child: Image.asset(widget.foodData.imageAsset,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        fit: BoxFit.cover),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black12,
                          Colors.black45
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black38,
                                radius: 20,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "${widget.foodData.price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                              FavoriteButton()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: widget.foodData.imageUrls.map(
                    (url) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                offset: Offset(3, 4),
                                spreadRadius: 0.5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(url,
                                height: 150, fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.foodData.name,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.foodData.category,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 30,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  widget.foodData.ratings.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ])
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                            widget.foodData.description,
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 16),

                          // Counter tambah/kurang
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Quantity",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 0) quantity--;
                                      });
                                    },
                                    icon: const Icon(Icons.remove_circle_outline),
                                  ),
                                  Text(
                                    quantity.toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: quantity == 0
                              ? null 
                              : () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "You Ordered $quantity item, successful! 🎉",
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 252, 117, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                              ),
                              child: const Text(
                                'Order Now',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final FoodData foodData;

  const DetailWebPage({Key? key, required this.foodData}) : super(key: key);

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 64,
            ),
            child: Row(
              children: [
                // Kiri -> Gambar utama + list gambar
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Hero(
                          tag: widget.foodData.name,
                          child: Image.asset(
                            widget.foodData.imageAsset,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 120,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: widget.foodData.imageUrls.map((url) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(url,
                                      height: 120, fit: BoxFit.cover),
                                );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.foodData.price}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  widget.foodData.name,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.foodData.category,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),

                            // FavoriteButton di atas rating
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FavoriteButton(),
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      widget.foodData.ratings.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.foodData.description,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 16),

                        // Counter tambah/kurang
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 0) quantity--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                ),
                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add_circle_outline),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: quantity == 0
                                ? null
                                : () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "You Ordered $quantity item, successful! 🎉",
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 252, 117, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            child: const Text(
                              'Order Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}
