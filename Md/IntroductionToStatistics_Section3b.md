Introduction to Statistics for Astronomers and Physicists
================
Dr Angus H Wright
2022-02-09





# Section 3b: Introduction <!--{{{-->

<!--Setup {{{-->
<style type="text/css">
.python { 
  background-color: 
    RColorBrewer::brewer.pal(1,"Set2");
} 
.out { 
  max-height: 300px;
  overflow-y: auto;
  background-color: inherit;
}
</style>
<!--}}}-->

**Section 3: Bayesian Statistics (Weeks 7-9)**

Bayes theorem led to a revolution in statistics, via the concepts of
prior and posterior evidence. In modern astronomy and physics,
applications of Bayesian statistics are widespread. We begin with a
study of Bayes theorem, and the fundamental differences between
frequentest and Bayesian analysis. We explore applications of Bayesian
statistics, through well studied statistical problems (both within and
outside of physics).

<!--}}}-->

# Specifying Priors <!--{{{-->

The computational difficulties of practical use of Bayes’ Theorem
generally arise when it is necessary to evaluate the normalisation
constant in the denominator:
*p*(*x*) = ∫*p*(*θ*)*p*(*x*\|*θ*)d*θ*
For example, consider a dataset *x̃* that consists of i.i.d. observations
from a Poisson distribution with unknown rate parameter:
*X* ∼ Pois(*θ*). Now suppose that our prior belief about *θ* is that *θ*
is **definitely** within the range 0 ≤ *θ* ≤ 1, but all values in that
range are equally likely. Our prior on *θ* is therefore:

$$
p(\\theta)=
\\begin{cases}
1 & 0\\leq\\theta\\leq 1\\\\
0 & \\textrm{otherwise}
\\end{cases}
$$

In this case, the normalising constant in Bayes Theorem is:

which can only be evaluated numerically!

**Even simple priors can lead to awkward numerical problems**.
<!--}}}-->

# Conjugate Priors <!--{{{-->

Fortunately, there are combinations of prior-likelihood pairs that are
easy to analyse. These are the so-called **conjugate** distributions.

If *F* us a class of sampling distribution *p*(*x*\|*θ*), and *P* is a
class of prior distributions to *θ*, then the class *P* is **conjugate**
to *F* if *P*(*θ*\|*x*) ∈ *P* for all *P*(.\|*θ*) ∈ *F* and
*P*(.) ∈ *P*.

We saw such an example of such a pair of distributions last week with
the binomial data and the beta distribution prior. It turns out that the
*only* classes of data which have conjugate priors are those from the
exponential familiy. That is:

*p*(*x*\|*θ*) = *h*(*x*)*g*(*θ*)*e*<sup>*t*(*x*)*c*(*θ*)</sup>
for functions *h*, *g*, *t*, and *c*, such that:
∫*p*(*x*\|*θ*)d*x* = *g*(*θ*)∫*h*(*x*)*e*<sup>*t*(*x*)*c*(*θ*)</sup>d*x* = 1

Distributions that satisfy these requirements are:

> -   The Exponential distribution
> -   The Poisson distribution
> -   The single-parameter Gamma distribution
> -   The Binomial distribution
> -   The Gaussian distribution with known variance

Provided that there is no direct conflict with our prior beliefs, and
provided that our data follows one of the above distributions, conjugate
priors provide us with mathematical simplicity.

Some prior-likelihood conjugate pairs are:

where *k* and *τ* are known.

<!--}}}-->

# The Role of Data <!--{{{-->

Consider a set of i.i.d. random observations
*X*<sub>1</sub>, …, *X*<sub>*n*</sub> drawn from
N(*θ*, *σ*<sup>2</sup>), where *σ*<sup>2</sup> is known.

$$ 
P(x\_i\|\\theta) = \\frac{1}{\\sqrt{2\\pi\\sigma}}\\exp\\left\[-\\frac{1}{2\\sigma^2}(x\_i-\\theta)^2\\right\]
$$
The likelihood for these data is:
$$
\\therefore l(\\theta,x) \\propto \\exp\\left\[-\\frac{1}{2\\sigma^2}\\sum(x\_i-\\theta)^2\\right\]
$$
From the conjugate prior: *θ* ∼ N(*b*, *c*<sup>2</sup>). So:
$$
\\therefore p(\\theta\|x)\\propto \\exp\\left\\{-\\frac{1}{2c^2}\\sum(b-\\theta)^2 \\right\\}\\times
\\exp\\left\\{-\\frac{1}{2\\sigma^2}\\sum(x\_i-\\theta)^2 \\right\\}
$$

$$
\\therefore  \\theta\|x \\sim \\textrm{N}\\left(\\frac{\\frac{b}{c^2}-\\frac{n\\bar{x}}{\\sigma^2}}
{\\frac{1}{c^2}+\\frac{n}{\\sigma^2}},
\\frac{1}{\\left\[\\frac{1}{c^2}+\\frac{n}{\\sigma^2}\\right\]}\\right)
$$
We can write this neater by defining *τ* = 1/*σ*<sup>2</sup> and
*d* = 1/*c*<sup>2</sup>:
$$
\\theta\|x \\sim \\textrm{N}\\left(\\frac{bd-n\\bar{x}\\tau}
{d+n\\tau},
\\frac{1}{d+n\\tau}\\right)
$$
Given this, we can observe some important details:

1.  Observe that the posterior expectation is
    𝔼\[*θ*\|*x*\] = *γ*<sub>*n*</sub>*b* + (1 − *γ*<sub>*n*</sub>)*x̄*,
    where $\\gamma\_n=\\frac{d}{d+n\\tau}$. That is, the **posterior
    mean** is a weighted average of the **prior mean** and the **sample
    mean**. The weight parameter *γ*<sub>*n*</sub> is determined by the
    relative strength of information contained within the data and the
    prior. If *n**τ* is large relative to *c*, then
    *γ*<sub>*n*</sub> → 0, and the posterior expectation converges onto
    the sample mean.

2.  The posterior precision (reciprocal of the variance) is equal to the
    prior precision plus *n*× the data precision.

3.  as *n* → ∞, then
    $\\theta\|x\\sim \\textrm{N}\\left(\\bar{x},\\frac{\\sigma^2}{n}\\right)$;
    so **the prior has no effect in the limit of large *n***.

4.  as *c* → ∞, or equivalently as *d* → 0, we again obtain
    $\\theta\|x\\sim \\textrm{N}\\left(\\bar{x},\\frac{\\sigma^2}{n}\\right)$.
    **If the data is much more precise than the prior, then the prior
    has no effect**.

5.  the posterior distribution depends on the data only through *x̄*, and
    not through the individual values of *x*<sub>*i*</sub>. In
    mathematical terms: ***x̄* is *sufficient* for *θ*.**

We can use asymptotic to demonstrate that, if the true value of a
parameter *θ* is *θ*<sub>0</sub>, and the prior probability of
*θ*<sub>0</sub> is not 0, then with increasing amounts of data the
posterior probability density at *θ* = *θ*<sub>0</sub> tends to unity.

## Improper Priors

The strength of the prior belief about *θ* in this Gaussian mean example
is determined by the variance, or precision *d*, of the Gaussian prior.
Large values of *c* correspond to strong prior beliefs, and small values
correspond to weak prior beliefs (and/or information). If we let *d* → 0
(i.e. very weak prior belief), then
$\\theta\|x\\sim \\textrm{N}\\left(\\bar{x},\\frac{\\sigma^2}{n}\\right)$.

We have produced a perfectly valid posterior distribution in the limit
of *c* → 0, however this limit does not produce a valid *probability*
distribution. This is because
*p*(*θ*) = N(0, ∞) ∝ 1
which cannot be a valid probability distribution because
∫<sub>ℛ</sub>*p*(*θ*)d*θ* = ∞.

So the posterior
$\\textrm{N}\\left(\\bar{x},\\frac{\\sigma^2}{n}\\right)$ cannot be
obtained by using a “proper” prior distribution. Instead it arises
through the use of a prior specification *p*(*θ*) ∝ 1, which is an
example of an **improper prior distribution**.

<!--}}}-->

# Jeffery’s Prior <!--{{{-->

We saw from the normal mean example that attempting to represent
ignorance within the framework of a standard conjugate analysis led to
the concept of improper priors. But there is a more fundamental set of
problems as well.

If we specify a prior for *θ* of the form *p*(*θ*) ∝ 1, and then
consider the parameter *ϕ* = *θ*<sup>2</sup>:

However, if we are ignorant about the possible values of *θ*, then
surely we ought to be equally ignorant about the possible values of *ϕ*.
So we could equally justify a prior *p*(*ϕ*) ∝ 1.

This demonstrates that prior ignorance *as represented by uniformity* is
not translated across scales/transformations.

One particular point of view is that ignorance of priors ought to be
consistent across 1 − 1 parameter transformations. This idea leads us to
the concept of **Jeffery’s Prior**, which is based on the concept of
Fisher Information:

In the case of a vector parameter *θ*, *I*(*θ*) is the matrix that is
formed as minus the expectation of the matrix of second-order partial
derivatives of log \[*p*(*x*\|*θ*)\].

**Jeffery’s prior** is then defined as:
$$
P\_0(\\theta)\\propto \|I(\\theta)\|^\\frac{1}{2}
$$

The consistency of the prior under transformations can be varified
simply. Suppose *ϕ* = *g*(*θ*) is a 1 − 1 parameter transformation of
*θ*. Then, by change of variables:

By definition:
$$
I(\\phi)=I(\\theta)\\left\| \\frac{\\textrm{d}\\theta}{\\textrm{d}\\phi}\\right\|
$$
and so:
$$
p(\\phi)\\propto I(\\phi)^\\frac{1}{2}
$$
as required.

We can see the Jeffery’s prior in action using a few simple examples.

## A Binomial Sample

So:

$$
\\therefore p(\\theta) \\propto \\theta^{-\\frac{1}{2}}(1-\\theta)^{-\\frac{1}{2}}
$$

## Gaussian Distribution with both *μ* and *σ* unknown

Looking at a vector case with more than one unknown:
$$
p(x\|\\theta)\\propto \\theta^{-n}\\exp\\left\\{-\\frac{n(s+(\\bar{x}-\\mu))}{2\\sigma^2}\\right\\}
$$
where $s=\\frac{1}{n}(x\_i-\\bar{x})^2$, we have the Fisher Matrix:
$$
I(\\theta) = \\mathbb{E}\\left\\{
\\begin{pmatrix}
\\frac{\\partial^2}{\\partial\\mu^2}  & \\frac{\\partial}{\\partial\\mu}\\frac{\\partial}{\\partial\\sigma} \\\\
\\frac{\\partial}{\\partial\\sigma}\\frac{\\partial}{\\partial\\mu}  & \\frac{\\partial^2}{\\partial\\sigma^2} \\\\
\\end{pmatrix}
\\log\\left\[p(x\|\\theta)\\right\]
\\right\\}
$$
Going through each term one at a time:
$$
\\frac{\\partial^2}{\\partial\\mu^2}\\log\\left\[p(x\|\\theta)\\right\]=n\\sigma^2
$$

$$
\\frac{\\partial^2}{\\partial\\sigma^2}\\log\\left\[p(x\|\\theta)\\right\]=\\frac{-n}{2\\sigma^4}+\\frac{n(s+(\\bar{x}-\\mu)^2)}{2\\sigma^6}
$$
So:
$$
\\therefore I(\\theta) = 
\\begin{pmatrix}
n\\sigma^2 & 0 \\\\
0 & \\frac{n}{2\\sigma^4} \\\\
\\end{pmatrix}\\\\
\\propto \\frac{1}{\\sigma^4}
$$

So the Jeffery’s Prior for the Gaussian likelihood with unknown mean and
variance is:
$$
P\_0(\\mu, \\sigma^2)\\propto \\frac{1}{\\sigma^2}
$$

## Objections to Jeffery’s Prior

There are a number of issues that have been raised with Jeffery’s Prior.
The most relevant of these is that the prior relies on the likelihood,
and so depends on the form of the data. The prior distribution should
only represent prior information, and should not be influenced by what
data are to be collected.

<!--}}}-->

# Mixtures of Priors <!--{{{-->

Conjugate families of prior distributions are mathematically convenient.
However they should only be used if a suitable member can be found which
reflects the prior information at hand. In some situations, the natural
conjugate family can be too restrictive.

Consider the case of a simple coin toss.

When a ‘normal’ coin is thrown it has almost invariably a probability of
coming up heads 50% of the time. However, if the same coin is spun on a
table, slight imperfections in the coin can cause it to prefer either
heads or tails.

Taking this prior information into account, we may wish to specify a
prior on *θ* that preferentially favours the unfair outcomes, *but
agnostic to which one*. That is, we may wish to specify a bimodal
distribution with peaks at *θ* = 0.3 and *θ* = 0.7.

Our likelihood for the number of heads in *n* spins of a coin will be
Binomial: *X*\|*θ* ∼ Bin(*n*, *θ*), and the conjugate distribution for
the binomial distribution is the Beta distribution. However, no Beta
distribution allows for bi- or multi-modality within the range
0 &lt; *θ* &lt; 1.

One solution is to use mixtures of conjugate distributions.

Suppose *p*<sub>1</sub>(*θ*), …, *p*<sub>*k*</sub>(*θ*) are all the
conjugate distributions for *θ*, which lead to posterior distributions
*p*<sub>1</sub>(*θ*\|*x*), …, *p*<sub>*k*</sub>(*θ*\|*x*). We can
specify a family of multimodal prior distributions using weighted
combinations of the different conjugate priors:
$$
p(\\theta)=\\sum\_{i=1}^k w\_i p\_i(\\theta)
$$
Such that:

So the posterior is in the same family of conjugates, but with different
relative weights.

<!--}}}-->

# Multi-parameter Models <!--{{{-->

For our purposes in the natural sciences, the examples that we’ve been
using up until this point are not particularly useful. We have been
looking largely at examples that analyse a single variable, such as the
binomial coin-toss, a Gaussian distribution with known variance, etc.
However in practice all problems that we will encounter will involve
more than one variable.

This is where another aspect of Bayesian statistics is much more
straight-forward than classical statistics. For highly complex
multi-parameter models, no knew methods are required.

We now have a vector *θ⃗* = {*θ*<sub>1</sub>, …, *θ*<sub>*k*</sub>} of
unknown parameters which we wish to make inference about. We specify a
multivariate model prior distribution *p*(*θ⃗*) for *θ⃗*, and combine
the likelihood *p*(*x*\|*θ⃗*) via Bayes Theorem to obtain:
$$
p(\\vec{\\theta}\|x)=\\frac{p(x\|\\vec{\\theta})p(\\vec{\\theta})}{p(x)}
$$
exactly as before.

We often want to draw conclusions about one or more parameters at the
same time. These **marginal distributions** can be obtained in a
straight-forward manner using probability calculations on the joint
distributions.

For example, the marginal distribution of *θ*<sub>1</sub> is obtained by
integrating out all of the other components of *θ⃗*.
*p*(*θ*<sub>1</sub>\|*x*) = ∫<sub>*θ*<sub>2</sub></sub>…∫<sub>*θ*<sub>*k*</sub></sub>*p*(*θ⃗*\|*x*)d*θ*<sub>2</sub>…d*θ*<sub>*k*</sub>
Equivalently, though, we can use **simulation** to draw samples from the
joint distribution and then look at the parameters of interest
(i.e. ignore the values of the other parameters).

Inference about multiparameter models creates the following
complications:

1.  **Prior Specification**: priors are now multivariate distributions.
    This means that we need to express dependencies between parameters
    as well, which is often complicated.
2.  **Computation**: we now have even more complicated integrals to
    evaluate, which creates the necessity for complex numerical
    techniques.
3.  **Interpretation**: the structure of the posterior distribution may
    be highly complex, which causes difficulties in interpretation.

## Manufacturing a problem

Suppose a machine is either satisfactorily made (*x* = 1) or not
(*x* = 2). The probability of *x* = 1 depends on the room temperature
during manufacturing, which is either cool (*θ*<sub>1</sub> = 0) or hot
(*θ*<sub>1</sub> = 1), and the humidity, which is either dry
(*θ*<sub>2</sub> = 0) or humid (*θ*<sub>2</sub> = 1). The probabilities
of satisfactorily making a machine given the environmental conditions
are governed by the likelihood:

The joint prior distribution of *θ*<sub>1</sub>, *θ*<sub>2</sub> is
given by:

We can therefore calculate the numerator of Bayes theorem as:

And so the joint posterior distribution is:

If we are only interested in the marginal distributions of the
probability that it was hot/cool or dry/humid, we can simply sum along
the axis of interest to get the **marginal distributions**:

We can show the same methods for more complex distributions, however the
main question of interest is how do we summarise complex posteriors
sensibly and accurately.

<!--}}}-->

# Summarising Posterior Information <!--{{{-->

The posterior distribution is a complete summary of the inference about
*θ*. In essence, the posterior distribution **is** the inference about
*θ*. However, for many applications, we wish to summarise the
information contained within the posterior into some digestible
quantity.

Often such a quantity is the “best” estimate of the value of *θ*; the
**point estimate** of the unknown parameter. But this raises the
question: how does one define what is “best”?

We can do this by specifying some form of **Loss Function**
*L*(*θ*, *a*), which measures the penalty in estimating a value of *θ*
given an individual datum at *a*.

There are a range of potential loss functions that are common to use,
and the particular choice of the loss function will often depend on the
problem being analysed. The most common loss functions (some of which we
have already seen!) are:

1.  Quadratic Loss: *L*(*θ*, *a*) = (*θ* − *a*)<sup>2</sup>
2.  Absolute Error Loss: *L*(*θ*, *a*) = \|*θ* − *a*\|
3.  0 − 1 Loss:
    $$
    L(\\theta,a)=
    \\begin{cases}
    0 & \\textrm{if}\\; \|a-\\theta\|\\leq \\epsilon \\\\
    1 & \\textrm{if}\\; \|a-\\theta\|&gt;  \\epsilon \\\\
    \\end{cases}
    $$
4.  Linear Loss: for specified *g*, *h* &gt; 0
    $$
    L(\\theta,a)=
    \\begin{cases}
    g(a-\\theta) & \\textrm{if}\\; a&gt;    \\theta \\\\
    h(a-\\theta) & \\textrm{if}\\; a\\leq \\theta \\\\
    \\end{cases}
    $$

In each case, by minimising the posterior expected loss, we obtain a
particular point estimate of *θ* for that particular choice of the loss
function.

Calculating the expected loss *ρ*(*a*, *x*) given a posterior
distribution *p*(*θ*\|*x*) requires calculating:
*ρ*(*a*, *x*) = ∫*L*(*θ*, *a*)*p*(*θ*\|*x*)d*θ*

## Quadratic Loss

As:
Var(*x*) = 𝔼\[(*x*−*μ*)<sup>2</sup>\]

So the Quadratic Loss is minimized when *a* = 𝔼(*θ*\|*x*). Hence the
posterior mean minimizes the quadartic loss, and the expected loss is
the posterior variance Var(*θ*\|*x*).

## Linear Loss

We can play the same game and demonstrate the expected loss using other
loss functions. The case of absolute error loss is a special case of the
linear loss (where *g* = *h* = 1). Looking at the linear loss, we can
let *q* be the *h*/(*g* + *h*) quartile of the posterior distribution:
$$
\\frac{g}{g+h}=\\int\_{-\\infty}^q p(\\theta\|x)\\mathrm{d}\\theta
$$
and suppose that *a* &gt; *q*, then:
$$
L(\\theta,q)-L(\\theta,a)=
\\begin{cases}
g(q-a) & \\textrm{if}\\;\\;\\; \\theta\\leq q \\\\
(g+h)\\theta -hq-ga & \\textrm{if}\\;\\;\\; q&lt; \\theta &lt; a \\\\
h(a-q) & \\textrm{if}\\;\\;\\; a\\leq \\theta \\\\
\\end{cases}
$$
but for *q* &lt; *θ* &lt; *a*:
(*g* + *h*)*θ* − *h**q* − *g**a* &lt; *h*(*a*<sub>*q*</sub>)
so that:
$$
L(\\theta,q)-L(\\theta,a)\\leq 
\\begin{cases}
g(q-a) & \\textrm{if}\\;\\;\\; \\theta\\leq q \\\\
h(a-q) & \\textrm{if}\\;\\;\\; q\\leq \\theta \\\\
\\end{cases}
$$
So
$$
\\mathbb{E}\\left\[L(\\theta,q)-L(\\theta,a)\\right\]\\leq g(q-a)\\frac{h}{g+h}+h(a-q)\\left(1-\\frac{h}{g+h}\\right)=0
$$
That is, *ρ*(*a*, *x*) ≥ *ρ*(*q*, *a*) for all *a*, so by setting
*a* = *q*, the *h*/(*g* + *h*) quartile of the posterior distribution
minimises the linear loss. If *g* = *h* = 1, *h*/(*g* + *h*) = 0.5; that
is, we are looking at the **median** of the distribution. Therefore, the
absolute error loss is minimised by the posterior *median*.

## 0-1 Loss

In this case:
*ρ*(*a*, *x*) = *P*{\|*θ*−*a*\|&gt;*ϵ*\|*x*} = 1 − *P*{\|*θ*−*a*\|≤*ϵ*\|*x*}

We can define the **modal interval** of length 2*ϵ* as the interval
\[*x* − *ϵ*, *x* + *ϵ*\] which has the highest probability, then the
midpoint of this interval is the distribution mode. If we chose *ϵ* to
be arbitrarily small, the procedure will identify the posterior mode as
the point estimate with this loss function.

<!--}}}-->

# Credability Intervals <!--{{{-->

The idea of **credability intervals** is analagous to confidence
intervals in classical statistics. The reasoning is that point estimates
give no measure of accuracy, so it is prefereable to specify the region
in which a parameter is **likely** to reside.

This causes problems in classical statistics as parameters are not
regarded as random, and so it is not possible to give an interval in
which we interpret as having a certain *probability* of the parameter
resideing there. There is no such difficulty in Bayesian Statistics,
because the parameters are treated as random.

We can therefore define a region *C*<sub>*α*</sub>(*x*) which is the
100(1 − *α*)% credible interval for *θ* if:
∫<sub>*C*<sub>*α*</sub>(*x*)</sub>*P*(*θ*\|*x*)d*θ* = 1 − *α*

That is, there is a probability of 1 − *α*, based on the posterior
distribution, that *θ* lies within *C*<sub>*α*</sub>(*x*). However this
leads to an obvious problem; the interval is not uniquely defined! Any
region containing 1 − *α* in probability will satisfy the equation.

However, as we generally want to find the **most probable** values of
the parameter, we can naturally impose additional constraints on the
credible interval. E.g. that the credible interval ought to be as small
as possible.

This amounts to a region of the form:
*C*<sub>*α*</sub>(*x*) = {*θ* : *P*(*θ*\|*x*) ≥ *γ*}
where *γ* is chosen to ensure that:
∫<sub>*C*<sub>*α*</sub>(*x*)</sub>*P*(*θ*\|*x*)d*θ* = 1 − *α*
Such a region is called the **highest posterior density region**, and in
general we find the region numerically.

<!--}}}-->
