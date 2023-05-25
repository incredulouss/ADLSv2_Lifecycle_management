
# ADLSv2 Lifecycle management

### Objective 
Setup the Lifecycle management rule for ADLSv2 storage account and automate movement of containers from hot to cool to archieve tier. This will help us reduce ADLSv2 storage and transaction cost

### Data Tiers in Adlsv2
- Premium
- Hot
- Cool
- Cold
- Archive

### Pricing of ADLSv2
Following factors affect the pricing
- Data Storage - The amount of data stored 
- Storage Capacity Reservations
- Transaction
- Other Operations and Metadata Storage meters

The above-mentioned, cost factors vary in all the data tiers. based on our needs we can switch between these tiers and save our operational and storage costs. 
 



### Steps to run the script and deploy lifecycle rule

Update the following varibales in az poweshell

- subscriptionId
- ResourceGroupName
- storageAccount

Note - Az poweshell should be setup in the local computer

After saving and run the script in powershell and deploy. If you are using azure portal az powershell you dont need to use az login.