import Pkg
Pkg.add("Images")

using Images

const lines = 1200

const ether = "11111000100110"
const d1_c_f3_1 = "1111100010011011111100110"
const c1_a_f1_1 = "111110000"
const em_b_f1_1 = "111110111111011111010"
const em_d_f3_1 = "11111000100110011000111111000100110"
const em_c_f1_1 = "111110001011000111010"
const em_h_f2_1 = "111110001001111111000"
const em_e_f1_1 = "111110111010111000110"
const a4_f3_1 = "11111000100110100110011001100110"
const a3_f2_1 = "1111100011101110111000100110"
const a2_f1_1 = "1111101110"

const t1 = "0"

const g_gun_collitions = d1_c_f3_1 * ether * c1_a_f1_1 * ether * em_b_f1_1

# e*-A^4(f3_1)-13e-A^4(f2_1)-13e-
# -A^4(f1_1)-e-[E-](B,f1_1)-e-[E-](D,f3_1)-2e-
# -[E-](C,f1_1)-2e-[E-](H,f2_1)-2e-
# -[E-](E,f1_1)-2e-[E-](C,f1_1)-e*.
const tag = a4_f3_1 * repeat(ether, 13) * a3_f2_1 * repeat(ether, 13) *
            a2_f1_1 * ether * em_b_f1_1 * ether * em_d_f3_1 * repeat(ether, 2) *
            em_c_f1_1 * repeat(ether, 2) * em_h_f2_1 * repeat(ether, 2) *
            em_e_f1_1 * repeat(ether, 2) * em_c_f1_1

const start = repeat(ether, 1) * tag * repeat(ether, 1)
const lengthSImg = length(start)

const rules = [110]
const gray = RGB{N0f8}(0.350, 0.350, 0.350)
const white = RGB{N0f8}(0.999, 0.999, 0.999)
const black = RGB{N0f8}(0.000, 0.000, 0.000)

rule2poss(rule) = [rule & (1 << (i - 1)) != 0 for i in 1:8]

cells2bools(cells) = [cells[i] == '1' for i in eachindex(cells)]

bools2cells(bset) = prod([bset[i] ? "⬜" : "⬛" for i in eachindex(bset)])

bools2colors(line) = [line[i] ? black : white for i in eachindex(line)]

function transform(bset, ruleposs)
    newbset = map(x -> ruleposs[x],
        [bset[i-1] * 4 + bset[i] * 2 + bset[i+1] + 1
         for i in 2:length(bset)-1])
    vcat(newbset[end], newbset, newbset[1])
end

const startset = cells2bools(start)

function printRule(rul)
    img = zeros(RGB{N0f8}, lines, lengthSImg)
    println("\nUsing Rule $rul:")
    bset = vcat(startset[end], startset, startset[1]) # wrap ends
    rp = rule2poss(rul)
    for x in 1:lines
        #line = bools2cells(bset[2:end-1])  # unwrap ends
        img[x, :] = bools2colors(bset[2:end-1])
        bset = transform(bset, rp)
    end
    return img
end

function teselationColor(image)
    booleanMatrix = zeros(Int8, lines, lengthSImg)
    for x in 1:lines, y in 1:lengthSImg

    end
end

img = printRule(rules[1])