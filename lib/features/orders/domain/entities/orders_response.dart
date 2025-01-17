class OrdersResponse {
  int? status;
  String? message;
  List<Data>? data;

  OrdersResponse({this.status, this.message, this.data});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic? id;
  dynamic userId;
  dynamic serviceId;
  dynamic serviceName;
  dynamic addressId;
  dynamic address;
  dynamic longitude;
  dynamic latitude;
  dynamic washType;
  dynamic date;
  dynamic time;
  dynamic status;
  dynamic step;
  dynamic packageId;
  dynamic notes;
  dynamic representativeId;
  dynamic total;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic? couponName;
  dynamic? couponId;
  Customer? customer;
  Customer? representative;
  Bill? bill;
  List<Cars>? cars;
  List<Products>? products;
  List<AdditionalServices>? additionalServices;

  Data(
      {this.id,
        this.userId,
        this.serviceId,
        this.serviceName,
        this.addressId,
        this.address,
        this.longitude,
        this.latitude,
        this.washType,
        this.date,
        this.time,
        this.status,
        this.step,
        this.packageId,
        this.notes,
        this.representativeId,
        this.total,
        this.createdAt,
        this.updatedAt,
        this.couponName,
        this.couponId,
        this.customer,
        this.representative,
        this.bill,
        this.cars,
        this.products,
        this.additionalServices});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    addressId = json['address_id'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    washType = json['wash_type'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    step = json['step'];
    packageId = json['package_id'];
    notes = json['notes'];
    representativeId = json['representative_id'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    couponName = json['coupon_name'];
    couponId = json['coupon_id'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    representative = json['representative'] != null
        ? new Customer.fromJson(json['representative'])
        : null;
    bill = json['bill'] != null ? Bill.fromJson(json['bill']) : null;
    if (json['cars'] != null) {
      cars = <Cars>[];
      json['cars'].forEach((v) {
        cars!.add(new Cars.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['additional_services'] != null) {
      additionalServices = <AdditionalServices>[];
      json['additional_services'].forEach((v) {
        additionalServices!.add(AdditionalServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['address_id'] = addressId;
    data['address'] = address;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['wash_type'] = washType;
    data['date'] = date;
    data['time'] = time;
    data['status'] = status;
    data['step'] = step;
    data['package_id'] = packageId;
    data['notes'] = notes;
    data['representative_id'] = representativeId;
    data['total'] = total;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['coupon_name'] = couponName;
    data['coupon_id'] = couponId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (representative != null) {
      data['representative'] = representative!.toJson();
    }
    if (bill != null) {
      data['bill'] = bill!.toJson();
    }
    if (cars != null) {
      data['cars'] = cars!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (additionalServices != null) {
      data['additional_services'] =
          additionalServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  dynamic? name;
  dynamic phone;

  Customer({this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}

class Bill {
  int? servicePricing;
  dynamic productsPrice;
  dynamic additionalServicesPrice;
  dynamic couponDiscount;
  dynamic vat;
  dynamic numberOfCars;
  dynamic total;

  Bill(
      {this.servicePricing,
        this.productsPrice,
        this.additionalServicesPrice,
        this.couponDiscount,
        this.vat,
        this.numberOfCars,
        this.total});

  Bill.fromJson(Map<String, dynamic> json) {
    servicePricing = json['service_pricing'];
    productsPrice = json['products_price'];
    additionalServicesPrice = json['additional_services_price'];
    couponDiscount = json['coupon_discount'];
    vat = json['vat'];
    numberOfCars = json['number_of_cars'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_pricing'] = servicePricing;
    data['products_price'] = productsPrice;
    data['additional_services_price'] = additionalServicesPrice;
    data['coupon_discount'] = couponDiscount;
    data['vat'] = vat;
    data['number_of_cars'] = numberOfCars;
    data['total'] = total;
    return data;
  }
}

class Cars {
  int? id;
  dynamic licensePlate;
  dynamic color;
  dynamic brand;

  Cars({this.id, this.licensePlate, this.color, this.brand});

  Cars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    licensePlate = json['license plate'];
    color = json['color'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['license plate'] = licensePlate;
    data['color'] = color;
    data['brand'] = brand;
    return data;
  }
}

class Products {
  int? id;
  dynamic name;
  dynamic price;

  Products({this.id, this.name, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
class AdditionalServices {
  int? id;
  dynamic name;
  dynamic price;

  AdditionalServices({this.id, this.name, this.price});

  AdditionalServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}