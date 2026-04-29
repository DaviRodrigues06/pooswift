import Foundation

protocol Manutencao {
    var nomeItem: String { get }
    var historico: [String] { get }

    func realizarManutencao(data: String) -> Bool
}

class Aparelho: Manutencao {
    let nomeItem: String
    let id: String
    var estaFuncionando: Bool
    var historico: [String]

    init(nomeItem: String) {
        self.nomeItem = nomeItem
        self.id = "APR-\(Int.random(in: 1000...9999))"
        self.estaFuncionando = true
        self.historico = []
    }

    func realizarManutencao(data: String) -> Bool {
        if !estaFuncionando {
            print(nomeItem + " está defeituoso!")
            registrarDefeito()
            return false
        }
        historico.append("Manutenção realizada em " + data)
        print(nomeItem + " manutenção registrada em " + data)
        return true
    }

    func registrarDefeito() {
        estaFuncionando = false
        print(nomeItem + " marcado como defeituoso.")
    }
}