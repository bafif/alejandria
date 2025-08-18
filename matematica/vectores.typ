#import "../lib.typ" : *
#show: init.with(debug: true)

#let proyection(u, v) = $op("proy")_#u #v$
#let angle(u, v) = context($hat(#u\,#v,size: #(1.2*_font_size.get()))$)

#let uv = math.arrow($u$)
#let vv = math.arrow($v$)
#let wv = math.arrow($w$)
#let xv = math.arrow($x$)
#let nv = math.arrow($0$)
#let iv = math.arrow($i$)
#let jv = math.arrow($j$)
#let kv = math.arrow($k$)
// Dependiendo el autor la notación es diferente, por eso lo generalizo con variables.
// Producto escalar
#let escalar = math.dot.op
//#let escalar = math.times
// Producto vectorial
#let vectorial = math.times
//#let vectorial = math.and

#title[Vectores]

= Definiciones
== Magnitudes escalares
Todas las cantidades que puedan caracterizarse mediante un único número real son magnitudes escalares. Por ejemplo la masa de un objeto, o la edad de una persona.

== Magnitudes vectoriales
Todas las cantidades que para su medición requieran ademas de magnitud, dirección y sentido son magnitudes vectoriales. Ejemplos son la velocidad y la fuerza de un objeto.

== Vector
Un vector es un par ordenado de puntos. Sean $A$ y $B$ dos puntos tal que el vector $uv = arrow(A B) = (A, B)$ es el vector que va de $A$ hacia $B$ entonces $A$ es el origen de $uv$ y $B$ es el extremo de $uv$.

== Representación gráfica de un vector
#todo[Y si]

== Vector nulo
Un vector $arrow(A B)$ es nulo si el origen y el extremo coinciden ($A = B$) y se simboliza $nv$.

== Dirección, sentido y módulo
Todo vector no nulo tiene:
- Una *dirección* dada por la recta que contiene el origen y el extremo o una paralela a la misma.
- Un *sentido*, todas las direcciones tienen dos sentidos donde el sentido de $arrow(A B)$ es opuesto al sentido de $arrow(B A)$.
- Un *módulo* igual a la longitud del segmento $overline(A B)$. Se simboliza $abs(uv)$ o $abs(arrow(A B))$

El vector nulo no tiene dirección ni sentido pero sí tiene módulo igual a 0 y el módulo de cualquier vector no nulo es mayor a 0.

== Igualdad entre vectores
Dos vectores no nulos se dicen iguales si y solo si tienen igual magnitud dirección y módulo. La igualdad caracteriza a los vectores libres, osea que dos vectores con igual origen y extremo son iguales pero también pueden serlo vectores con diferente origen y extremo. El vector nulo es igual solo a si mismo.

== Paralelismo entre vectores
Dos vectores $uv$ y $vv$ no nulos se dicen paralelos si tienen igual dirección y se nota $uv parallel vv$.

== Vector opuesto
Sea $uv$ un vector no nulo, entonces $-uv$ es el vector opuesto a $uv$ que tiene igual módulo, dirección y sentido opuesto. Nótese que $-nv = nv$

= Algunas operaciones de vectores
== Suma de vectores
Sean $uv$ y $vv$ dos vectores, entonces su suma es $uv + vv = wv$ donde $wv$ tiene el mismo origen que $uv$ y el mismo extremo que $vv$.
=== Propiedades
Dados $uv$, $vv$ y $wv$.
+ Propiedad conmutativa: $uv + vv = vv + uv$
+ Propiedad asociativa: $(uv + vv) + wv = uv + (vv + wv)$
+ Existencia del elemento neutro: $exists nv [uv + nv = uv]$
+ Existencia del elemento opuesto: $forall uv != nv space exists (-uv) [uv + (-uv) = nv]$

== Diferencia de vectores
Sean $uv$ y $vv$ dos vectores, entonces su diferencia es $uv - vv = uv + (-vv)$.

== Producto por un escalar
Sea $uv$ un vector y $alpha in RR$, entonces el producto de $uv$ por $alpha$ es $alpha uv$ donde:
+ $abs(alpha vv) = abs(alpha) abs(vv)$

+ $alpha != 0 and uv != nv => alpha uv parallel uv$

+ $display(alpha != 0 and uv != nv => casesAlign(alpha uv "tiene igual sentido a" uv, alpha > 0, alpha uv "tiene distinto sentido a" uv, alpha < 0))$.

=== Propiedades
Sean $uv$ y $uv$ vectores y $alpha, beta in RR$ escalares, entonces:
+ $alpha (uv + vv) = alpha uv + alpha vv$
+ $(alpha + beta) uv = alpha uv + beta uv$
+ $alpha (beta uv) = (alpha beta) uv$
+ $1 uv = uv and -1 uv = -uv$
+ $alpha uv = 0 <=> alpha = 0 or uv = nv$
+ $uv parallel uv <=> exists alpha in RR space uv = alpha vv$

== Angulo entre vectores
#todo[Encontrar una definición no circular]

== Versores
Un versor es un vector de módulo 1.

=== Versor asociado a un vector
Dado un vector $uv$ su versor asociado $uv_0$ es un versor con igual dirección y sentido que $uv$.
- $uv != nv => uv_0 = 1/abs(uv)uv$

== Proyección de un vector sobre otro
=== Proyección escalar
La proyección escalar de $vv$ sobre $uv$ es $vv_uv = abs(vv)cos(angle(uv,vv))$.

=== Vector proyección
El vector proyección de $vv$ sobre $uv$ es $proyection(vv, uv)$.
+ $uv = nv or vv = nv or uv perp vv => proyection(uv, vv) = nv$
+ $uv != nv and vv != nv and not (uv perp vv) => proyection(uv, vv) = vv_uv uv_0$

== Producto escalar
El producto escalar de $uv$ y $vv$ es $uv escalar vv$.
+ $uv = nv or vv = nv => uv escalar vv = nv$
+ $uv != nv and vv != nv => uv escalar vv = abs(uv)abs(vv)cos(angle(uv,vv))$

=== Propiedades
Sean $uv$, $vv$ y $wv$ vectores.
+ $uv escalar vv = vv escalar uv$
+ $uv escalar (vv + wv) = uv escalar vv + uv escalar wv$
+ $alpha (uv escalar vv) = (alpha uv) escalar vv = uv escalar (alpha vv)$
+ $uv escalar uv >= 0$
+ $uv escalar uv = 0 <=> uv = nv$

= Bases y componentes
== Conjuntos de vectores:
En adelante, nos va a servir considerar a los vectores como parte de un universo de vectores limitado al espacio que encierre una misma recta, un mismo plano o un mismo espacio, siendo:
- $VV_1$: Vectores en la recta (espacio vectorial de 1 dimensión).
- $VV_2$: Vectores en el plano (espacio vectorial de 2 dimensiones).
- $VV_3$: Vectores en el espacio (espacio vectorial de 3 dimensiones).
Lo que queremos decir con esto es que vamos a considerar, en cada contexto, un universo de vectores más limitado o más amplio, dependiendo de cuántas son las dimensiones espaciales en las que se distribuyen:
- $VV_1$: Todos los vectores están contenidos en una misma recta, de modo que:
+ Fijado $uv in VV_1$ no nulo, para cualquier $vv in VV_1$ existe único $alpha in RR bar vv = alpha uv$
+ La forma $vv = alpha uv$ es la _descomposición_ de $vv$ en la _base_ ${uv}$ y $alpha$ es la _componente escalar_ de $uv$ en la base $uv$
Esto quiere decir que a partir de tomar un solo vector de $VV_1$, siempre podemos multiplicarlo por algún escalar para hallar cualquier otro vector de $VV_1$. Mantengamos esta idea para pensar lo siguiente:
- $VV_2$: Todos los vectores están contenidos en un mismo plano, de modo que:
+ Fijados $uv, vv in VV_2$ no nulos ni paralelos, cualquier $wv in VV_2$ puede ser _descompuesto_ según las direcciones de $uv$ y $vv$, habiendo únicos $alpha, beta in RR bar wv = alpha uv + beta vv$.
+ ${uv, vv}$ es una base para $VV_2$ y $alpha$ y $beta$ son las _componentes_ de $wv$ en esa base.
$alpha uv + beta uv$ es una *combinación lineal* de $uv$ y $vv$, esto es decir que solo los estamos sumando entre sí con distintas escalas, como si camináramos rectamente en la dirección de uno de los vectores una cierta distancia y luego camináramos rectamente en la dirección del otro.
Para cualquier conjunto de vectores ${vv_1, vv_2, vv_3, vv_4, ...}$, los ponemos todos en un origen común y decimos que el universo de vectores que son conseguibles a través de combinaciones lineales de esos vectores son el *espacio generado* por dichos vectores (estos vectores serían el _sistema generador_).
Pero ahora imaginemos que $uv$ y $vv$ son paralelos. ¿Generan realmente a $VV_2$?
Bueno, no.
Si pensamos en un sistema generador ${uv, vv}$ con $uv parallel vv$ vamos a obtener una línea recta porque solo podemos "movernos" en una dirección. Para que hayan 2 dimensiones, necesitamos combinar vectores en 2 direcciones distintas. Dos vectores colineales no pueden formar una base.
- $VV_3$: Todos los vectores del espacio.
+ Fijando $uv, vv, wv in VV_3$ no nulos, no coplanares (no paralelos a un mismo plano), entonces para cualquier $xv$ hay únicos $alpha, beta, gamma in RR bar xv = alpha uv + beta vv + gamma wv$
+ ${uv, vv, wv}$ base para $VV_3$ sobre $RR$, con $alpha, beta, gamma$ componentes de $xv$ en esa base.

== Base de un espacio vectorial
Para un *espacio vectorial* $V$ (es decir, un conjunto que actúa como universo de vectores) decimos que una *base* $cal(B)$ de $V$ sobre $RR$ es un sistema generador de $V$ cuyos elementos son *linealmente independientes* (es decir, "apuntan" en distintas direcciones).
Eso quiere decir que se cumplirán las siguientes propiedades:
- $cal(B)$ es un *sistema generador* de $V$. o sea:
+ Sus elementos son vectores y pertenecen a $V$.
+ El espacio vectorial $V$ completo puede generarse combinando linealmente los elementos de $cal(B)$
- Los elementos de $cal(B)$ forman un conjunto *linealmente independiente*. O sea:
+ Ningún elemento de $cal(B)$ puede formarse como combinación lineal de los restantes.
Notemos que si los elementos de $cal(B)$ son linealmente independientes, entonces no solo ninguno apunta en la misma dirección que el resto (es decir, no son paralelos entre sí) sino que ninguno puede pertenecer al espacio generado por el resto de los vectores. Es decir, si tenemos que ${uv, vv}$ es base de $VV_2$, entonces la única forma de tener un conjunto ${uv, vv, wv}$ que sea base de algún espacio vectorial, es que $wv$ no pertenezca al plano que forman $uv$ y $vv$. Es necesario que $wv$ se "despegue" de ese plano y, por lo tanto, ya no hay solo 2 dimensiones sino 3.
Así tenemos que:
- $cal(B)$ debe tener exactamente tantos elementos como dimensiones espaciales tenga $V$.

= Versores fundamentales del plano
#todo[Requiere ^^]

= Versores fundamentales del espacio
#todo[Requiere ^^]

= Operaciones y propiedades por componentes
+ $uv + vv = (u_1 + v_1, u_2 + v_1, u_3 + v_3)$
+ $uv escalar vv = u_1 v_1 + u_2 v_2 + u_3 v_3$
+ $uv parallel vv <=> exists alpha in RR space (v_1 = alpha u_1 and v_2 = alpha u_2 and v_3 = alpha u_3)$
+ $abs(uv)^2 = uv escalar uv = u_1^2 + u_2^2 + u_3^2$
+ $abs(uv) = sqrt(u_1^2 + u_2^2 + u_3^2)$

= Cosenos directores
Para un vector $uv != nv$ los cosenos directores son las componentes del versor asociado $uv_0$.
- $cos(angle(uv, iv)) = u_1/abs(uv) and cos(angle(uv, jv)) = u_2/abs(uv) and cos(angle(uv, kv)) = u_3/abs(uv)$

= Componentes de un vector entre dos puntos
Dados dos vectores posición $arrow(O P_1) = (x_1, y_1, z_1)$ y $arrow(O P_2) = (x_2, y_2, z_2)$.
$ arrow(O P_1) + arrow(O P_2) = arrow(P_1 P_2) = (x_2 - x_1, y_2 - y_1, z_2 - z_1) $

= Coordenadas del punto medio entre dos puntos
Sea $M(x, y, z)$ punto medio entre los dos puntos $P_1(x_1, y_1, z_1)$ y $P_2(x_2, y_2, z_2)$ se dan.
$ arrow(P_1 P_2) = arrow(P_1 M) + arrow(M P_2) $
$ arrow(P_1 M) = arrow(M P_2) $
Entonces $2 arrow(P_1 M) = arrow(P_1 P_2)$ o por componentes:
$ cases(
        2(x - x_1) = x_2 - x_1,
        2(y - y_1) = y_2 - y_1,
        2(z - z_1) = z_2 - z_1
) => cases(
        x = (x_2 - x_1)/2 + x_1,
        y = (y_2 - y_1)/2 + y_1,
        z = (z_2 - z_1)/2 + z_1
) => cases(
        x = (x_2 + x_1)/2,
        y = (y_2 + y_1)/2,
        z = (z_2 + z_1)/2
) $

= Producto vectorial
Para los vectores $uv$ y $vv$ el producto vectorial es $uv vectorial vv$ y se define por:

1. $uv = 0 or vv = 0 or uv parallel vv => uv vectorial vv = nv$

\2.#h(0.2em) $uv != 0 and vv != 0 and not (uv parallel vv) => display(cases(
    #([Dirección dada por:]) space (uv vectorial vv perp uv) and (uv vectorial vv perp vv),
    #([Sentido dado por: regla de la mano derecha]),
    #([Módulo dado por:]) space abs(uv)abs(vv)sin(angle(u, v))
))$

#todo[Mejorar la definición, está fea]

== Propiedades
Dados los vectores $uv, vv$ y $wv$ se cumplen.
+ $forall uv [uv vectorial uv = nv]$
+ $iv vectorial jv = kv$
+ $jv vectorial kv = iv$
+ $kv vectorial iv = jv$
+ Antisimétrica: $uv vectorial vv = -(vv vectorial uv)$
\6.#h(0.2em) Distributivas: $cases(display(uv vectorial (vv + wv) = uv vectorial vv + uv vectorial wv\ (uv vectorial vv) vectorial wv = uv vectorial wv + vv vectorial wv))$

\7.#h(0.2em) $alpha (uv vectorial vv) = (alpha uv) vectorial vv = uv vectorial (alpha vv)$

== Por componentes
$ uv vectorial vv = (u_2 v_3 - u_3 v_2)iv + (u_3 v_1 - u_1 v_3)jv + (u_1 v_2 - u_2 v_1) kv $
$ uv vectorial vv = (mat(delim:"|", u_2, u_3; v_2, v_3), -mat(delim:"|", u_1, u_3; v_1, v_3), mat(delim:"|", u_1, u_2; v_1, v_2)) $

== Interpretación geométrica
#todo[]
== Producto mixto
Dados $uv, vv, wv in VV_3$ el producto mixto entre ellos es $uv vectorial vv escalar wv$
=== Interpretación geométrica
#todo[]
