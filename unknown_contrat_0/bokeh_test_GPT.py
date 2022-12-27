def calc_pi(digits):
    q, r, t, k, m, x = 1, 0, 1, 1, 3, 3
    for j in range(digits):
        if 4 * q + r - t < m * t:
            yield m
            q, r, t, k, m, x = 10*q, 10*(r-m*t), t, k, (10*(3*q+r))//t - 10*m, x
        else:
            q, r, t, k, m, x = q*k, (2*q+r)*x, t*x, k+1, (q*(7*k+2)+r*x)//(t*x), x+2

def main():
    pi_digits = calc_pi(100)
    pi = "".join(str(i) for i in pi_digits)
    print(pi)

if __name__ == "__main__":
    main()