

using {com.satinfotech.cloudapps as ClKitchen} from '../db/schema';
using {API_PRODUCT_SRV as productapi} from './external/API_PRODUCT_SRV';


service CloudKitchen @(requires: 'authenticated-user') {
    entity Kitchen @(restrict: [ 
    { grant: ['READ'], to: 'CloudKitchenRead' },
    { grant: ['WRITE'], to: 'CloudKitchenWrite'},
    { grant: ['DELETE'], to: 'CloudKitchenDelete'},
  ]) as projection on ClKitchen.Kitchen

  entity Products as projection on productapi.A_Product{
    Product,
    ProductType,
    BaseUnit,
    ProductGroup
  }

}

annotate CloudKitchen.Kitchen with @odata.draft.enabled;
