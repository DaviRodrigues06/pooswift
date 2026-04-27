import Foundation


enum Categorias: String {
    case yoga = "Yoga"
    case musculacao = "Musculação"
    case spinning = "Spinning"
    case funcional = "Funcional"
    case luta = "Luta"
}

enum ExperienciaAluno: String {
    case iniciante = "Iniciante"
    case intermediario = "Intermediário"
    case avancado = "Avançado"
}


struct Plano {
    let nome: String
    let mensalidade: Double
    let incluiPersonal: Bool
    let limiteAulasColetivas: Int
    let duracaoContratoMeses: Int
}


class CatalogoPlanos {
    static let mensal = Plano(
        nome: "Mensal",
        mensalidade: 99.90,
        incluiPersonal: false,
        limiteAulasColetivas: 5,
        duracaoContratoMeses: 1
    )

    static let trimestral = Plano(
        nome: "Trimestral",
        mensalidade: 79.90,
        incluiPersonal: false,
        limiteAulasColetivas: 12,
        duracaoContratoMeses: 3
    )

    static let anual = Plano(
        nome: "Anual",
        mensalidade: 59.90,
        incluiPersonal: true,
        limiteAulasColetivas: 20,
        duracaoContratoMeses: 12
    )
}



class Pessoa {
    let nome: String
    let email: String

    init(nome: String, email: String) {
        self.nome = nome
        self.email = email
    }
}



class Aluno: Pessoa {
    let matricula: String
    var plano: Plano
    var nivel: ExperienciaAluno

    init(nome: String, email: String, matricula: String, plano: Plano, nivel: ExperienciaAluno) {
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email)
    }

    func atualizarPlano(_ novoPlano: Plano) {
        plano = novoPlano
        print("Plano atualizado para: \(novoPlano.nome)")
    }

    func atualizarNivel(_ novoNivel: ExperienciaAluno) {
        nivel = novoNivel
        print("Nível atualizado para: \(novoNivel.rawValue)")
    }

    // func cancelar plano 
    // calcular data de vencimento do plano

}


class Professor: Pessoa {
    var especialidade: Categorias

    init(nome: String, email: String, especialidade: Categorias) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
    }

}

// classe Aula
// Inscricao do aluno na aula
// Agenda semanal das aulas
// Agenda semanal do aluno e do professor
// Avaliacao fisica do aluno (pedir peso altura e mais algumas informações para atualizacao de nivel)

