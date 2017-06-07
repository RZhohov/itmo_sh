#!/bin/sh
echo "Ethereum Wallet Transfer"
echo "From"  $1
echo "To" $2
echo "Ammount" $3 

pfile="./passwd"
PASSWD=$(cat "$pfile")

#Displays account of the user
disp_account(){
echo "Your Wallet is:"
./geth --testnet --fast -exec "eth.accounts" attach 
}



#Unlock user account and send certain number of 'ether' 
send(){
SENDER=$1
RECEIVER=$2
AMOUNT=$3
./geth --exec "personal.unlockAccount('$1', '$PASSWD')" attach > /dev/null
TRANSACTION=`./geth --testnet --fast -exec "eth.sendTransaction({from: '$SENDER', to: '$RECEIVER', value: web3.toWei('$AMOUNT', 'ether')})" attach`
echo $TRANSACTION
}


cli_main(){

if [ ! -z $1 ] && [ $1 = "-h" ];
    then
        #help
        exit
fi

#printf "$(send $1 $2 $3)\n"

while true
do
	printf "Please enter the account of SENDER:\n"
	read SENDER
	
	printf "Please enter the account of RECEIVER:\n"
        read RECEIVER

	printf "Please enter the AMOUNT of ethers:\n"
        read AMOUNT

	TRANSACTION="$(send $SENDER $RECEIVER $AMOUNT)\n"
	
	exit

done

} 


cli_main $*

