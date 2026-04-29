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
    var estaAtivo: Bool
}

class CatalogoPlanos {
    static let mensal = Plano(
        nome: "Mensal",
        mensalidade: 99.90,
        incluiPersonal: false,
        limiteAulasColetivas: 5,
        duracaoContratoMeses: 1,
        estaAtivo: true
    )
    static let trimestral = Plano(
        nome: "Trimestral",
        mensalidade: 79.90,
        incluiPersonal: false,
        limiteAulasColetivas: 12,
        duracaoContratoMeses: 3,
        estaAtivo: true
    )
    static let anual = Plano(
        nome: "Anual",
        mensalidade: 59.90,
        incluiPersonal: true,
        limiteAulasColetivas: 20,
        duracaoContratoMeses: 12,
        estaAtivo: true
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

    func cancelarPlano() {
        plano.estaAtivo = false
        print("Plano de \(nome) cancelado.")
    }
}

class Professor: Pessoa {
    var especialidade: Categorias

    init(nome: String, email: String, especialidade: Categorias) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email)
    }
}


class Aula {
    let nome: String
    var professor: Professor
    var listaDeAlunos: [Aluno] = []
    var data: String
    let capacidadeMaxima: Int

    init(nome: String, professor: Professor, data: String, capacidadeMaxima: Int) {
        self.nome = nome
        self.professor = professor
        self.data = data
        self.capacidadeMaxima = capacidadeMaxima
    }

    func inscreverAluno(_ aluno: Aluno) {
        if listaDeAlunos.count >= capacidadeMaxima {
            print("Sem vagas na aula \(nome).")
            return
        }

        var jaInscrito = false
        for a in listaDeAlunos {
            if a.matricula == aluno.matricula {
                jaInscrito = true
            }
        }

        if jaInscrito {
            print("\(aluno.nome) já está inscrito em \(nome).")
            return
        }

        listaDeAlunos.append(aluno)
        print("\(aluno.nome) inscrito em \(nome).")
    }

    func removerAluno(_ aluno: Aluno) {
        var novaLista: [Aluno] = []
        for a in listaDeAlunos {
            if a.matricula != aluno.matricula {
                novaLista.append(a)
            }
        }
        listaDeAlunos = novaLista
        print("\(aluno.nome) removido de \(nome).")
    }

    func verAlunos() {
        print("Alunos na aula de \(nome):")
        for aluno in listaDeAlunos {
            print("- \(aluno.nome)")
        }
    }
}
// Agenda semanal das aulas
// Agenda semanal do aluno e do professor
// Avaliacao fisica do aluno (pedir peso altura e mais algumas informações para atualizacao de nivel)


let prof1 = Professor(nome: "Davi", email: "davi@email.com", especialidade: .musculacao)
let aluno1 = Aluno(nome: "Bruno", email: "bruno@email.com", matricula: "MAT-001", plano: CatalogoPlanos.mensal, nivel: .iniciante)
let aluno2 = Aluno(nome: "Fernanda", email: "fe@email.com", matricula: "MAT-002", plano: CatalogoPlanos.anual, nivel: .avancado)
let aluno3 = Aluno(nome: "Diego", email: "diego@email.com", matricula: "MAT-003", plano: CatalogoPlanos.trimestral, nivel: .intermediario)

let aula1 = Aula(nome: "Yoga Manhã", professor: prof1, data: "Segunda 07:00", capacidadeMaxima: 2)

aula1.inscreverAluno(aluno1)
aula1.inscreverAluno(aluno2)
aula1.inscreverAluno(aluno1)
aula1.inscreverAluno(aluno3)

aula1.verAlunos()

aula1.removerAluno(aluno1)
aula1.verAlunos()

aluno1.cancelarPlano()