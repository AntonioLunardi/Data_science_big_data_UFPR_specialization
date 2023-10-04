class Conta:
    
    def __init__(self, numero, titular, saldo, limite):
        print('Construindo objeto... {}'.format(self))
        self.__numero = numero
        self.__titular = titular
        self.__saldo = saldo
        self.__limite = limite
        pass

    def __pode_sacar(self, valor_a_sacar):
        valor_disponivel_a_sacar = self.__saldo + self.__limite
        return valor_a_sacar <= valor_disponivel_a_sacar

    def saca(self, valor):
        if self.__pode_sacar(valor):
            self.__saldo -= valor
        else:
            print('O valor {} passou o limite!'.format(valor))

    def deposita(self, valor):
        self.__saldo += valor

    def extrato(self):
        print('A conta de {} tem {} reais de saldo!'.format(self.__titular, self.__saldo))

    def transfere(self, valor, destino):
        self.saca(valor)
        destino.deposita(valor)
        print('Foram transferidos R$ {} da conta de {} para a de {}'.format(valor, self.__titular, destino.__titular))

    def get_titular(self):
        return self.__titular
    
    def get_numero(self):
        return self.__numero
    
    @property
    def limite(self):
        return self.__limite
    
    @limite.setter
    def limite(self, limite):
        self.__limite = limite

    @staticmethod
    def codigos_bancos():
        return {'BB': '001', 'Caixa': '104', 'Bradesco': '237'}
    