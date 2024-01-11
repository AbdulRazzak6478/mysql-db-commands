import { createMultipleRecords } from '../../../utils/lib/airtable/create/createRecord';
import axios from 'axios';
import MockAdapter from 'axios-mock-adapter';


const mockAxios = new MockAdapter(axios);

describe('createMultipleRecords', () => {
  // Reset the mock before each test
  beforeEach(() => {
    mockAxios.reset();
  });

  // mockdata

  
  //   const fields = {
      //     Name:"Abdul Ahad",
      //     Contact:{
          //       Email:"abdulxhad@gmail.com",
          //       Phone:"9676002671"
          
          //     },
          //    Address:"dummy data",
//    Age:"21",
//    Nationality:"Saudi",
//    isGreenCardHolder:true
//   }

// tableName: string,
// records: Array<{ fields: { [key: string]: string } }>

    const tableName = "PersonalInformation";
    const records = [
        {
            fields : {
                Name:"Abdul Ahad",
                Age:"21",
                Nationality:"Saudi",
            }
        },
        {
            fields : {
                Name:"Abdul razzak",
                Age:"21",
                Nationality:"Indian",
            }
        },
    ]

   test('TypeError if tableName is not a string in createMultipleRecords', async () => {
    const invalidTableNames: any[] = [123]; // Example invalid types
    // const fields = {}; // Example fields object
    const records = [
        {
            fields : {}
        },
        {
            fields :{}
        },
    ]

        for (const tableName of invalidTableNames) {
        await expect(createMultipleRecords(tableName as unknown as string, records)).rejects.toThrow(TypeError);
        await expect(createMultipleRecords(tableName as unknown as string, records)).rejects.toThrow(
            `Expected string for tableName, got ${typeof tableName}`
        );

        }

    });


    // handling type error for records
    test('TypeError if records are not an Array in createMultipleRecords', async () => {
    const tableName = 'test' // Example invalid types
    const records = {} // Example records array

      await expect(createMultipleRecords(tableName, records as unknown as Array<{fields:{}}>)).rejects.toThrow(TypeError);
      await expect(createMultipleRecords(tableName, records as unknown as Array<{fields:{}}>)).rejects.toThrow(
        `Expected Array for records, got ${typeof records}`
      );
  });

   // handling incorrect TableName in createMultipleRecords
   test('Incorrect tablename in createMultipleRecords', async () => {
    const tableName = "test"
    const records = [
        {
            fields:{}
        }
    ]
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      `Tablename does not exist, got ${tableName}`
    );

  });


   // handling correct records structure with tablename in createMultipleRecords
   test('Incorrect structure of records in createMultipleRecords', async () => {

    const tableName = "Contact";
    const records = [
        {
            fields:{
                Name:"Abdul Ahad",
                Address:"dummy data",
               //  Age:"21",
                Nationality:"Saudi",
            }
        //     Name:"Abdul Ahad",
        //     Address:"dummy data",
        //    //  Age:"21",
        //     Nationality:"Saudi",
        }
    ]

    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      `records structure is incorrect for ${tableName}`
    );

  });

    // Network Issue in createMultipleRecords
    test('Network Error in createMultipleRecords',async () => {

        // jest.spyOn(axios, 'post').mockImplementation(() => Promise.reject(new Error('Network Error')));
    
        await expect(createMultipleRecords(tableName,records)).rejects.toThrow(Error);
        await expect(createMultipleRecords(tableName,records)).rejects.toThrow(
          `Error: Error: Network Error`
        )
        
      });


    //handling if records array.length is 0 in createMultipleRecords
   test('empty records in createMultipleRecords', async () => {

    const tableName = "Contact";
    const records : any[] = [];

    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      `creating records length is  ${records.length}`
    );

  });

    // tableName name including special characters in createMultiRecords
    test('incorrect tableName with including special Characters',async()=>{
    const tableName = "$%&Test";
    // const filter = /^[^ !"`'#%&,:;<>=@{}~\$\(\)\*\+\/\\\?\[\]\^\|]+$/
    // const tableName = name.includes(/^[^ !"`'#%&,:;<>=@{}~\$\(\)\*\+\/\\\?\[\]\^\|]+$/);
    const records = [
        {
            fields:{
                Name:"",
                Address:"",
                Age:"23",
                Nationality:"",
            }
        }
    ]
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      ` tableName includes special Characters ${tableName}`
    );
  })
  

   //handling empty records object in createMultipleRecords
   test('empty records field object in createMultipleRecords', async () => {

    const tableName = "Contact";
    const records : any[] = [{},{},{}];

    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      `empty records field object  ${records}`
    );

  });

  // Handling if fields values are empty in createMultiRecords
  test('incorrect records fields values',async()=>{
    const tableName = "Test";
    const records = [
        {
            fields:{
                Name:"",
                Address:"",
                Age:"23",
                Nationality:"",
            }
        }
    ]
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      ` records fields values are not proper ${records.map((item)=>item.fields.Name)}`
    );
  });

  // Handling if fields are not present in records
  test('no fields in object',async()=>{
    const tableName = "Test";
    const records = [
        {
            fields : {
                
            }
        }
    ]
    
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(Error);
    await expect(createMultipleRecords(tableName, records)).rejects.toThrow(
      ` records fields not present ${records}`
    );
  });

});


 