def phi_1_to_n(n):
    phi = [0] * (n + 1)
    phi[1] = 1
    for i in range(2, n+1):
        phi[i] = i - 1

    for i in range(2, n+1):
        for j in range(2*i, n+1, i):
              phi[j] -= phi[i]

    return phi 

N = 1_000_000

phi_list = phi_1_to_n(N)

for i in range(2, N+1):
     phi_list[i] = i / phi_list[i] 

print(phi_list.index(max(phi_list)))
