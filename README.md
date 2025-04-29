# Hi, I'm Stanislav

I am a full-stack developer with a strong preference for backend work.
I enjoy designing robust systems and appreciate having control over the entire
stack --- from infrastructure to user-facing UI details.

## A Few Links

* [StackOverflow](https://stackoverflow.com/users/14401160/sterliakov) ---
  I mostly answer in python-related tags.
* [Devpost](https://devpost.com/sterliakov) --- hackathons I participated in.
* [GitHub](https://github.com/sterliakov)
* [My resume as PDF](https://sterliakov.github.io/CV.pdf)
* To get in touch, email me at terlya \[dot] stas \[at] gmail \[dot] com.

## Technology stack I enjoy the most

* Backend: Python, Django (except for somewhat limiting ORM) + DRF or
  FastAPI with SQLAlchemy and Alembic (more powerful, but more boilerplate).
* Databases: PostgreSQL if we're talking SQL, DynamoDB for something less
  structured.
* Frontend: JavaScript or TypeScript (please don't tell me the latter is
  superior, it isn't for small and simple projects) with React and Tailwind.
  For quick prototyping I've had some exceptional experience using
  [shadcn/ui](https://ui.shadcn.com/).
* Infra: AWS is my favorite, with some features simply unmatched by other
  major providers. And Docker is the most convenient way to ship exactly
  what you test, with `docker compose` offering instant local environment
  setup.
* Tooling: [`pre-commit`](https://https://pre-commit.com/), GitHub actions,
  [`ruff`](https://docs.astral.sh/ruff/), [`uv`](https://docs.astral.sh/uv/),
  [`biomejs`](https://biomejs.dev/) (though they still lack some ESLint features),
  the list goes on... And, quite controversially, Jira as a project
  management tool.
* Dev environment: I'm running Lubuntu on my primary laptop and use Sublime
  Text instead of IDE. I also use vim for any editing that doesn't need 10
  open tabs and perform a lot of tasks via CLI.
* Rust: it doesn't clearly fall into any of categories above, but all my
  experience with it has been overwhelmingly positive.

## My Current Role

I'm currently the CTO at [Simpleem](https://simpleem.com/),
where we are building a system that uses the power of machine learning to
quantify and classify behavioral traits of video call participants.

Our platform helps sales teams improve performance by analyzing behavior and
highlighting the most impactful moments of conversations. HR teams can use
Simpleem to streamline candidate evaluation, reduce manual screening,
and identify candidates who best fit their culture and team dynamics.

We've developed a system that can predict deal outcomes with a high degree
of reliability and offer actionable insights --- powered by a mix of
LLM-based engine and in-house heuristics discovered by thorough review of
a huge dataset.

### A few implementation details

Here are a few aspects of the implementation I love the most (and was personally
responsible for):

* **Fully serverless architecture**: THe core of the Simpleem platform is
  powered by AWS lambda and orchestrated by AWS Step Functions, our inference
  engine (Python, Torch) handles many short chunks of a video in parallel,
  alongside audio analysis and transcription, achieving excellent observability
  and reliability. Switching from GPU instances to Lambda gave us a
  **20x cost reduction**.
* Our backend (Python, Django, DRF) is also deployed
  on Lambda and connected to an RDS database.
  It **scales** effortlessly and remains extremely **cost-efficient**.
* Our frontend (TypeScript + React) avoids unnecessary complexity --- no SSR,
  just a static site served via S3 and CloudFront. It's fast, lightweight, and
  easy to maintain.
* As a side product, we ship a **WebRTC-driven video pitch game**.
  It was fun to build and probably deserves its own write-up.
* Attention to **code quality and DX** pays off! Setting up a very strict set of
  linters for everything from main code (shout-out to `ruff` and `biome`) to
  "helper" files such as yaml auto-formatter or Dockerfile linter saves a lot
  of time spent resolving merge conflicts and catching weird bugs.
* Time to release matters. A change, once approved, can hit
  staging or production in less than **30 minutes**. During
  that time a lot of linters are trying to tear the code apart, and a
  comprehensive test suite with **over 90% coverage** ensures correctness at
  the next level.

## Outside of Work

In my free time, I enjoy bouldering --- a form of rock climbing focused on
short but challenging routes on low walls. Recently I climbed my first `7b/+`
route --- still proud of that milestone!

I'm also lucky to have a supportive family: my amazing wife who encourages me
through everything, a cheerful medium-sized dog (a mixed-bread rescue we found
in Armenia --- she won us over instantly!) and two cats who seem to think
4 a.m. is the perfect time to start the day.

I studied at [MIPT](https://old.mipt.ru/english/) and was working toward a
Bachelor's degree. I had to leave the program and relocate in 2022, but the
experience deeply shaped my thinking and technical foundation.

## My pet projects

### Python type checker: [`mypy`](https://github.com/python/mypy)

If you're unfamiliar, `mypy` is a static type checker for Python that brings
optional typing to an inherently dynamic language. I really enjoy the ability
to increase code correctness (and our own confidence in it) without sacrificing
flexibility.

While I'm not the original author, I've contributed around 50 PRs ranging from
[correcting a small omission](https://github.com/python/mypy/pull/18620)
to hunting down and fixing a [critical bug](https://github.com/python/mypy/pull/18906)
that affected a wide number of users.

### Developer tooling: [`mypy-issues`](https://github.com/sterliakov/mypy-issues)

A small helper built with Python and GitHub actions to check `mypy`
changes against the corpus of open project issues. It helps us keep the tracker
clean and notice some regressions before the PR gets merged.

I enjoyed building something that runs entirely via GitHub interface: open an
issue, wait for results to be reported there. Done!

### Simple time tracker client: [`toggl`](https://github.com/sterliakov/toggl)

I've been using Toggl to track my work hours until they have [deprecated](https://github.com/toggl-open-source/toggldesktop)
the native Linux app and suggested using a browser extension instead. I'm
allergic to browser extensions for daily tasks, so I built a
minimal Rust-based client tailored to my own needs.

The client has to deal with some unique API design: Toggl API returns time
**in profile timezone** --- certainly the best way to handle datetimes
that sure will never get out of sync.

For distribution, I packaged binary builds via NPM --- one for each
platform/arch, and one meta-package to <s>rule them all</s>
resolve them dynamically. It's a workaround, but it works!

### Terraform [module](https://github.com/sterliakov/terraform-aws-ecr-image) for ECR-based Lambda deployment

What came first --- the chicken or the egg? AWS engineers don't know either.

If you want to deploy a docker-based Lambda function, you need an image in
place. To build an image, you need a pipeline building that image and updating
the lambda --- which doesn't exist yet.

I ended up studying the registry specification and publishing a module that
uses curl to fetch and push a lightweight `alpine` image as a placeholder ---
no Docker installation required.

This project was inspired by this clever [StackOverflow answer](https://stackoverflow.com/a/78501527/14401160).

### VeChain SDK in Rust: [thor-devkit.rs](https://github.com/sterliakov/thor-devkit.rs)

Funded by the VeChain Foundation, this SDK brings core blockchain utilities to
Rust, enabling developers to build dApps and tools with full support for
VeChain's protocols.

While I'm cautious about the hype around crypto, I believe in its long-term
potential when used right --- especially for decentralized finance, digital
identity, and fair creator ecosystems.
