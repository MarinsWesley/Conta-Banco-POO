import Cocoa

class ContaBanco {
	
	private var dono: String
	private var numConta: Int
	private var tipoConta: String
	private var status: Bool
	private var saldo: Double
		init(dono: String, numConta:Int, tipoConta: String, status: Bool, saldo:Double) {
			self.dono = dono
			self.numConta = numConta
			self.tipoConta = tipoConta
			self.status = status
			self.saldo = saldo
	
	}
	public func getNumConta () -> Int {
		return self.numConta
	}
	
	public func setNumConta (numConta: Int) {
		self.numConta = numConta
	}
	
	public func getDono () -> String {
		return self.dono
	}
	
	public func setDono (dono: String) {
		self.dono = dono
	}
	
	public func getSaldo () -> Double {
		return self.saldo
	}
	
	public func setSaldo (saldo: Double) {
		self.saldo = saldo
	}
	
	public func getStatus () -> Bool {
		return self.status
	}
	
	public func setStatus (status: Bool) {
		self.status = status
	}
	
	public func getTipoConta () -> String {
		return self.tipoConta
	}
	
	public func setTipoConta (tipoConta: String) {
		self.tipoConta = tipoConta
	}
	//CC: 50$
	//CP: 150$
	
	func abrirConta (tipoConta: String) {
		setTipoConta(tipoConta: tipoConta)
		setStatus(status: true)
	
		if tipoConta == "CC" {
			setSaldo(saldo: getSaldo() + 50.00)
			print("Deposito em Conta Corrente")
			print("+ R$ 50,00")
		}else if tipoConta == "CP" {
			setSaldo(saldo: getSaldo() + 150.00)
			print("Deposito em Conta Poupanca")
			print("+ R$ 150,00")
		}
		
	}
	
	func fecharConta(status: Bool) { //Para fechar saldo de = 0$
		
		if getStatus() == false {
			print("Voce nao possui conta aberta neste banco.")
		}
		
		if  getStatus() == true && getSaldo() < 0.0 || getSaldo() > 0.0 {
			print("Seu saldo em conta precisa ser de R$ 0.00 pra concluir o fechamento da conta")
			print("Regularize debitos ou pendencias.")
		
		} else {
			setStatus(status: false)
			print("Fechamento de conta concluido com sucesso")
			
		}
		
	}
	
	func depositar(saldo: Double) { // status true e conta aberta
		if getStatus() == true {
			setSaldo(saldo: getSaldo() + saldo)
			print("+ R$", saldo)
			print(getSaldo())
		} else if getStatus() == false {
			print("Impossivel Depositar")
			
		}
		
	}
	
		func sacar (saldo: Double) {
		if getStatus() == true && getSaldo() >= saldo {
			setSaldo(saldo: getSaldo() - saldo)
			print("Saldo: R$",getSaldo())
		}else{
			
			print("Saldo insuficiente")
			print("Saldo R$",getSaldo())
			
		}
		
	}
	
	func pagarMensal() { // CC: 12$ CP: 20$
		if getStatus() == true && getTipoConta() == "CC" {
			print("Tarifa mensal de Servicos")
			setSaldo(saldo: getSaldo() - 12.00)
			print("Saldo: R$", getSaldo())
		} else if getStatus() == true && getTipoConta() == "CP" {
			print("Tarifa mensal de Servicos")
			setSaldo(saldo: getSaldo() - 20.00)
			print("- R$ 20,00")
			print("Saldo: R$", getSaldo())
		}

	}
	
}
	

var user1:ContaBanco = ContaBanco (dono: "Wesley Marins", numConta: 0100321, tipoConta: "CC", status: true, saldo: 0.00)
var user2:ContaBanco = ContaBanco (dono: "Cris Emiko", numConta: 0100123, tipoConta: "CP", status: true, saldo: 0.00)


print ("--------- Extrato ---------")
print ("---------------------------")

user1.abrirConta(tipoConta: "CC")
user1.getSaldo()
user1.sacar(saldo: 25.00)
user1.getSaldo()



user2.abrirConta(tipoConta: "CP")
user2.getSaldo()
user2.depositar(saldo: 50.0)
user1.depositar(saldo: 175.0)
user1.getSaldo()
user2.getSaldo()
user1.pagarMensal()
user2.pagarMensal()
