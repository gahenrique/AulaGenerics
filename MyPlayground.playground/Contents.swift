import Foundation

var intA = 1
var intB = 2
let maiorInt = maior(intA, intB)

var doubleA = Double.pi
var doubleB = 3.14
let maiorDouble =  maior(doubleA, doubleB)

var tratorA = AgriculturalMachinery(size: 12)
var tratorB = AgriculturalMachinery(size: 783)
let maiorTrator = maior(tratorA, tratorB)

var pilha = Pilha<Int>()

pilha.push(intA)
pilha.push(intB)

//TODO: Fazer um método que recebe um Array e um elemento, retorna um Bool dizendo se o elemento se encontra no Array
//TODO: Extensão de Array contendo uma função que retorna a soma de todos os elementos, independente de qual o valor numérico
//TODO: Fazer um método que recebe 2 Arrays e retorna um Int referente a quantidade de elementos presentes em ambos os Arrays
    //BONUS TODO: Fazer o método acima receber N arrays

func find<T: Comparable>(A: [T], e: T) -> Bool {
    for elem in A {
        if elem == e { return true}
    }
    return false
}

extension Array where Element: Numeric {
    func sum() -> Element {
        var ret: Element = Element.zero
        for e in self {
            ret += e
        }
        return ret
    }
}

func intersectionCount<T: Comparable>(A: [T], B: [T]) -> Int {
    var B = B
    var count = 0
    for a in A {
        if B.contains(a) {
            count += 1
            B.removeAll { (e) -> Bool in
                e == a
            }
        }
    }
    return count
}

func intersectionCount2<T: Comparable>(_ A: [T]...) -> Int {
    var visited: [T] = []
    var mustEnter: Bool
    for i in 0..<A.count {
        for char in A[i] {
            mustEnter = true
            for j in 0..<A.count {
                if !A[j].contains(char) {
                    mustEnter = false
                    break
                }
            }
            if mustEnter && !visited.contains(char){ visited.append(char) }
        }
    }
    print(visited)
    return visited.count
}

let r1: Bool = find(A: [1,2,3,4], e: 2)
let r2: Int = [1,2,3].sum()
let r3: Int = intersectionCount(A: [1,2,3,4,4], B: [1,4,4])
let r4: Int = intersectionCount2([1,2,3,4],[2,3,4],[1,2,3])
