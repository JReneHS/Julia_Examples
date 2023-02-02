#import Pkg
#Pkg.add("Images")

using Images

function voronoi(w, h, n_centroids)
    dist = (point, vector) -> sqrt.((point[1] .- vector[:, 1]) .^ 2 .+ (point[2] .- vector[:, 2]) .^ 2)
    dots = [rand(3:h-3, n_centroids) rand(3:w-3, n_centroids) rand(RGB{N0f8}, n_centroids)]
    img = zeros(RGB{N0f8}, h, w)
    for x in 1:h, y in 1:w
        distances = dist([x, y], dots) # distance
        nn = findmin(distances)[2]
        img[x, y] = dots[nn, :][3]
    end

    for i ∈ eachrow(dots)
        x, y, _ = i
        # Centro
        img[x, y] = RGB{N0f8}(0.001, 0.001, 0.001)
        # Primera Cruz
        img[x, y+1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x, y-1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x+1, y] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-1, y] = RGB{N0f8}(0.001, 0.001, 0.001)
        # Esquinas Primera Cruz
        img[x+1, y+1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-1, y+1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x+1, y-1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-1, y-1] = RGB{N0f8}(0.001, 0.001, 0.001)
        # Segunda Cruz
        img[x, y+2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x, y-2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x+2, y] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-2, y] = RGB{N0f8}(0.001, 0.001, 0.001)
        # Laterales Segunda Cruz
        img[x+2, y+1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-2, y+1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x+2, y-1] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-2, y-1] = RGB{N0f8}(0.001, 0.001, 0.001)
        # Superiores Segunda Cruz
        img[x+1, y+2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-1, y+2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x+1, y-2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-1, y-2] = RGB{N0f8}(0.001, 0.001, 0.001)
        # Esquinas Segunda Cruz
        img[x+2, y+2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-2, y+2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x+2, y-2] = RGB{N0f8}(0.001, 0.001, 0.001)
        img[x-2, y-2] = RGB{N0f8}(0.001, 0.001, 0.001)

    end
    return img
end

img = voronoi(1000, 1000, 5)