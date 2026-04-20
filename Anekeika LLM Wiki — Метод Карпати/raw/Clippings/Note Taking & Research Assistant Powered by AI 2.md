---
title: "Note Taking & Research Assistant Powered by AI"
source: "https://notebooklm.google.com/notebook/ef965d40-30e1-4b14-9510-82ac8de47d42"
author:
published:
created: 2026-04-18
description: "Use the power of AI for quick summarization and note taking, NotebookLM is your powerful virtual research assistant rooted in information you can trust."
tags:
  - "clippings"
---
Руководство по источнику

Этот текст посвящен концепции **«LLM Wiki»**, предложенной экспертом Андреем Карпати как альтернатива традиционным системам поиска информации. Автор критикует стандартный метод RAG за отсутствие **накопления знаний**, так как при обычном подходе нейросеть обрабатывает данные заново для каждого запроса, не создавая устойчивых связей между фактами. Вместо этого предлагается формировать **динамичную персональную базу знаний** в формате Markdown, где модель анализирует, классифицирует и интегрирует новые документы сразу в момент их добавления. Такой подход превращает разрозненные заметки в **структурированную экосистему**, которая постоянно проверяется на наличие противоречий и позволяет пользователю полностью владеть своими данными локально. Статья служит практическим руководством, описывающим инструменты вроде **Obsidian и Git** для создания «живого» цифрового архива, способного эволюционировать вместе с ростом информации.

LLM Wiki Revolution: How Andrej Karpathy's Idea Is Changing AI

We use cookies essential for this site to function well. Please click to help us improve its usefulness with additional cookies. Learn about our use of cookies in our [Privacy Policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fprivacy-policy) & [Cookies Policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcookies-policy).

Show details

Accept all cookies

Use necessary cookies

\[Master Generative AI with 10+ Real-world Projects in 2026!

d:

h:

m:

s Download Projects\](https://www.analyticsvidhya.com/pinnacleplus/pinnacleplus-projects?utm\_source=blog\_india&utm\_medium=desktop\_flashstrip&utm\_campaign=15-Feb-2025||&utm\_content=projects)

- [Free Courses](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcourses%2F%3Fref%3DNavbar)

- [Accelerator Program](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fai-accelerator-program%2F%3Futm_source%3Dblog%26utm_medium%3Dnavbar) New

- [GenAI Pinnacle Plus](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fpinnacleplus%2F%3Fref%3Dblognavbar)

- [Agentic AI Pioneer](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fagenticaipioneer%2F%3Fref%3Dblognavbar)

- [DHS 2026](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fdatahacksummit%3Futm_source%3Dblog%26utm_medium%3Dnavbar)

- Login
	- Switch Mode
	- [Logout](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com)

[Interview Prep](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Finterview-questions%2F%3Fref%3Dcategory)

[Career](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fcareer%2F%3Fref%3Dcategory)

[GenAI](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fgenerative-ai%2F%3Fref%3Dcategory)

[Prompt Engg](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fprompt-engineering%2F%3Fref%3Dcategory)

[ChatGPT](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fchatgpt%2F%3Fref%3Dcategory)

[LLM](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fllms%2F%3Fref%3Dcategory)

[Langchain](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Flangchain%2F%3Fref%3Dcategory)

[RAG](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Frag%2F%3Fref%3Dcategory)

[AI Agents](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fai-agent%2F%3Fref%3Dcategory)

[Machine Learning](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fmachine-learning%2F%3Fref%3Dcategory)

[Deep Learning](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fdeep-learning%2F%3Fref%3Dcategory)

[GenAI Tools](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fai-tools%2F%3Fref%3Dcategory)

[LLMOps](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fllmops%2F%3Fref%3Dcategory)

[Python](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fpython%2F%3Fref%3Dcategory)

[NLP](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fnlp%2F%3Fref%3Dcategory)

[SQL](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fsql%2F%3Fref%3Dcategory)

[AIML Projects](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fproject%2F%3Fref%3Dcategory)

Reading list

Introduction to Generative AI

[What is Generative AI?](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F04%2Fwhat-is-generative-ai%2F)

Introduction to Generative AI applications

[Overview of generative AI applications and their impact](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F11%2Fbeyond-the-buzz-exploring-the-practical-applications-of-generative-ai-in-industries%2F)

No-code Generative AI app development

[Introduction to No-code AI Development](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2024%2F03%2Fstep-by-step-guide-to-training-ml-model-with-no-code%2F)

Code-focused Generative AI App Development

[Introduction to LangChain, ChatGPT and Gemini Pro](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F12%2Fgoogle-gemini-api%2F)

Introduction to Responsible AI

[Introduction to Responsible AI](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F08%2Fresponsible-ai%2F)

LLMS

Prompt Engineering

Finetuning LLMs

Training LLMs from Scratch

[What do you mean by Training LLMs from Scratch?](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F07%2Fbeginners-guide-to-build-large-language-models-from-scratch%2F)

Langchain

RAG

LlamaIndex

Stable Diffusion

- [Home](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F)

- [Artificial Intelligence](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Fartificial-intelligence%2F)

- LLM Wiki Revolution: How Andrej Karpathy's Idea is Changing AI

LLM Wiki Revolution: How Andrej Karpathy's Idea is Changing AI

[Riya Bansal](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fauthor%2Friya_bansal_av%2F) Last Updated: 07 Apr, 2026

9 min read

129

Think about revisiting items you've saved to Pocket, Notion or your bookmarks. Most people don't have the time to re-read all of these things after they've saved them to these various apps, unless they have a need. We are excellent at collecting tons of information. However, we are just not very good at making any of those places interact with each other or add a cumulative layer that connects them together.

In April of 2026, Andrej Karpathy (former AI Director of Tesla and co-founder of OpenAI) suggested a solution to this issue: **use a large language model (LLM) to build your wiki in real-time.**

This idea became viral and was ultimately followed with a GitHub gist describing how to do this using an LLM. This guide will provide all of the support (with example code) for building your own living, evolving personal wiki.

Table of contents

- [The RAG Problem: Rediscovering Knowledge from Scratch, Every Single Time](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-the-rag-problem-rediscovering-knowledge-from-scratch-every-single-time)

- [Wiki Solution: Compile Knowledge Once, Query Forever](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-wiki-solution-compile-knowledge-once-query-forever)

- [How It Actually Works: A Step-by-Step Guide](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-how-it-actually-works-a-step-by-step-guide)

- [Step 1: Obtain your resources](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-step-1-obtain-your-resources)
	- [Step 2: Classify prior to extracting (Ingest)](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-step-2-classify-prior-to-extracting-ingest)
	- [Step 3: The AI writes wiki pages (Query)](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-step-3-the-ai-writes-wiki-pages-query)
	- [Step 4: Create an index](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-step-4-create-an-index)
	- [Step 5: Record your questions](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-step-5-record-your-questions)
	- [Step 6: Conduct lint passes](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-step-6-conduct-lint-passes)

- [The Complete Tool Stack](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-the-complete-tool-stack)

- [1\. Obsidian – Your Wiki IDE](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-1-obsidian-your-wiki-ide)
	- [2\. Qmd: Search at Scale](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-2-qmd-search-at-scale)
	- [3\. Git: Version Control for Knowledge](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-3-git-version-control-for-knowledge)

- [Getting Started: Your First LLM Wiki in Three Steps](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-getting-started-your-first-llm-wiki-in-three-steps)

- [The Practical Challenges (And How to Handle Them)](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-the-practical-challenges-and-how-to-handle-them)

- [Conclusion](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23h-conclusion-nbsp)

- [Frequently Asked Questions](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23faq)

[Free Certification Courses Getting Started with LLMs From NLP roots to GPT-4 • LLM fundamentals • State-of-the-art tour Get Certified Now](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcourses%2Fgetting-started-with-llms%2F%3Futm_source%3Dblog%26utm_medium%3Dbanner)

The RAG Problem: Rediscovering Knowledge from Scratch, Every Single Time

A large number of modern AI knowledge tools use [Retrieval-Augmented Generation (RAG)](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F09%2Fretrieval-augmented-generation-rag-in-ai%2F). In simple terms, you upload documents, ask a question, and the system retrieves relevant text to help the AI generate an answer. Tools like NotebookLM, ChatGPT (file uploads), and most enterprise AI systems follow this approach.

On the surface, this makes sense. But as Andrej Karpathy points out, there's a key flaw: *the model doesn't accumulate knowledge.* Each query starts from scratch.

If a question requires synthesizing five documents, RAG pulls and combines them for that one response. Ask the same question again tomorrow, and it repeats the entire process. It also struggles to connect information across time, like linking an article from March with one from October.

In short, RAG produces answers, but it doesn't build lasting knowledge.

Wiki Solution: Compile Knowledge Once, Query Forever

Karpathy's approach will change the way we look at models. Rather than processing raw documents after our queries, we will now process those documents at the time of ingestion. The results of this processing will be a permanent, structured wiki-like product (which will allow you to store and retrieve documents with a high degree of control over their location).

When you add a new document source to the [LLM](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F03%2Fan-introduction-to-large-language-models-llms%2F), the LLM does not merely create an index of that source for later retrieval. Instead, the LLM reads, understands, and integrates that source into the knowledge base, updating all relevant existing pages (where necessary). It notes down any contradictions between the new and existing claims or knowledge, creating any necessary new concept pages, and reinforcing the complex relationships across the entire wiki.

According to Karpathy, “With LLMs, knowledge is created and maintained continuously and consistently rather than being able to use individual queries to create knowledge.” Here is a simple comparison that illustrates this difference further.

| Dimension | Traditional RAG | LLM Wiki |
| --- | --- | --- |
| When knowledge is processed | At query time (for every question) | At ingest time (once per source) |
| Cross-references | Discovered ad hoc or missed entirely | Pre-built and continuously maintained |
| Contradictions between sources | Often overlooked | Detected and flagged during ingestion |
| Knowledge accumulation | None — resets with each query | Builds over time with every new source |
| Output format | Temporary chat responses | Persistent, editable Markdown files |
| Data ownership | Stored within provider systems | Fully controlled on your local machine |

How It Actually Works: A Step-by-Step Guide

Let's review how an individual would develop one of these wikis.

Step 1: Obtain your resources

You need to accumulate everything – articles that you have saved, books enjoyed, notes you have created, transcripts from discussions, and even your very own historical conversations. All these materials are your raw materials, just as ore must undergo refining before use.

Step 2: Classify prior to extracting (Ingest)

One of the best practices from this community is to not treat all documents in the same fashion. For example, a 50-page research white paper requires extraction on a section-by-section basis while a tweet or social media thread only requires a primary insight and corresponding context. Likewise, a meeting transcript requires extraction of decisions that were made, action items that are to be carried out and key quotations. By first classifying the type of document will help extract the right type of information to the correct amount of detail.

Step 3: The AI writes wiki pages (Query)

You will feed your source materials into your AI's LLM via a structured query. It will allow the LLM to produce one or more wiki pages that conform to the established template of having: a frontmatter block (YAML), a TLDR sentence, the body of the content, and the counterarguments/data gaps.

Step 4: Create an index

A central *index.md* will serve as a table of contents, and link directly to each page of the wiki. This is how an AI agent can efficiently traverse the entire knowledge base; it starts at the index, reads through the tldr's, then drills down into only those pages that are relevant to its specific question.

Step 5: Record your questions

This is one of the most under-appreciated features of the system. When you ask the LLM a well-formed question and receive a response that provides valuable insight. For example, a comparison between two frameworks, or an explanation of how two concepts are related, you save that response as a new wiki page tagged with the label query-result. As time goes on, your best thinking has been collected rather than lost in chat logs.

Step 6: Conduct lint passes

At appropriate intervals, you ask the LLM to audit the entire wiki for contradictions or inconsistencies between pages, and to indicate those statements which have been rendered obsolete by a more recent source. Additionally, the LLM will provide input on identifying orphan pages (i.e., pages that have no links pointing to them), and for providing a list of concepts that are referenced within the existing content but are not yet represented by their own respective pages.

The Complete Tool Stack

Karpathy talks about lots of specific tools in his Gist. Below you will find what each tool does and how they fit into his overall workflow.

1\. *Obsidian – Your Wiki IDE*

Obsidian is a free markdown knowledge management application which uses a local directory as a vault. For Karpathy, this is the viewing interface used for the wiki because it has three distinct features that matter for his system:

- The Graph View provides a graph of all wiki pages represented as nodes, and in addition, every wiki link ( *\[\[wiki-links\]\]* ) will be represented as edges connecting all nodes together. Hub pages will be connected to many nodes, and so will be represented as larger than average nodes. Orphan pages will be represented as isolated nodes. This allows for immediate visual representation of the density of knowledge and gaps within a person's knowledge. No other document view or file browser can provide this representation visually.

- The Dataview Plugin allows users to turn their wiki into a database that can be queried. All pages must have yaml frontmatter, so the integration specification is satisfied and therefore allows the user to run SQL-like queries against all pages in the wiki.

```
# In any Obsidian note, Dataview renders this dynamically:

# List all concept pages ordered by number of sources
TABLE length(sources) AS "Source Count", confidence, updated
FROM "wiki/concepts"
SORT length(sources) DESC

# Find low-confidence pages that need review
TABLE title, sources
FROM "wiki"
WHERE confidence = "low"
SORT file.mtime ASC

# Find pages not updated in the last 2 weeks
LIST
FROM "wiki"
WHERE updated < date(today) - dur(14 days)
SORT updated ASCCopy Code
```

- The Web Clipper browser extension (available for Chrome, Firefox, Safari, Edge, Arc, and Brave) converts web articles to clean Markdown with YAML frontmatter in one click, saving directly to your raw folder. You download all images to your computer by pressing the hotkey `Ctrl` + `Shift` + `D` after you finish clipping because the LLM requires access to the images.

2\. *Qmd: Search at Scale*

The LLM can use the *index.md* file to access the wiki content without problems at small scale. The index becomes unreadable in one context window when you have more than 100 pages because it reaches excessive size.

The local search engine qmd enables Markdown file searches through three search methods which Tobi Lutke (CEO of Shopify) developed. The system operates entirely on your device because it uses node-llama-cpp with GGUF models which require no API connections and protect your data from leaving your computer.

```
# Install qmd globally
npm install -g @tobilu/qmd 

# Register your wiki as a searchable collection
qmd collection add ./wiki --name my-research 

# Basic keyword search (BM25)
qmd search "mixture of experts routing efficiency" 

# Semantic search, finds related concepts even with different words
qmd vsearch "how do sparse models handle load balancing" 

# Hybrid search with LLM re-ranking, highest quality results
qmd query "what are the tradeoffs between top-k and expert-choice routing" 

# JSON output for piping into agent workflows
qmd query "scaling laws" --json | jq '.results[].title' 

# Expose qmd as an MCP server so Claude Code can use it as a native tool
qmd mcpCopy Code
```

The MCP server mode enables Claude Code to use qmd directly as a built-in tool which results in smoother workflow integration throughout your data ingestion and query processing tasks.

*3\. Git: Version Control for Knowledge*

Because your entire wiki is a folder of plain Markdown files, you get version history branching and collaboration for free with Git. This is quite powerful:

```
# Initialize the repo when you start
cd my-research && git init 

# Commit after every ingest session
git add .
git commit -m "ingest: MoE efficiency article — flags dense-vs-sparse contradiction" 

# See exactly what changed in any ingest
git diff HEAD~1 

# Roll back a bad compilation pass
git revert abc1234 

# See how your knowledge evolved over time
git log --oneline wiki/concepts/mixture-of-experts.md 

# Share with a team via GitHub (the wiki becomes collaborative)
git remote add origin https://github.com/yourname/research-wiki
git push -u origin mainCopy Code
```

Getting Started: Your First LLM Wiki in Three Steps

If you're excited about this concept there is an easy way to begin:

- Select one area of interest you are currently exploring and give the AI 5-10 of your best sources. Do not attempt to put everything you've done digitally into one place on the first day but instead learn how the system works and how to use it on a small scale.

- Create the basic framework soon. Create a wiki/directory for your wiki and have an index.md file there. Write down what your frontmatter is (title, type, source, created, updated, tags), and be consistent in naming your files e.g., *concept-name.md* or *firstname-lastname.md*. If this is not done it will be difficult to rectify later.

- Spend a lot of time creating your initial prompt. This is the most critical step. Create rules for Classifying, writing TLDRs, writing the frontmatter as well as guides for when to create Pages and when to edit the pages. Make sure to keep updating the prompt as you use it.

Use [Claude](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F02%2Fclaude-sonnet-4-6-the-model-for-developers%2F) with [Claude Code](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2025%2F07%2Fwhat-is-claude-code%2F), or any AI with file access, to build and maintain the wiki. Start at your index file when querying. Let the agent navigate.

The Practical Challenges (And How to Handle Them)

Let's be realistic, Constructing an LLM powered wiki is no easy task as it comes with several obstacles as well:

- **Building an LLM-powered wiki is difficult:** It involves multiple challenges across setup, structure, and long-term maintenance.

- **Prompt engineering is the first challenge:** You need clear instructions for structuring pages, deciding when to create vs update them, and resolving conflicting information, which requires iteration and refinement.

- **Scalability is a hidden factor:** Simple setups break down beyond a few hundred pages, so you need tagging, folders, and search systems planned in advance.

- **Consistency over time matters:** Without regular maintenance, your wiki will accumulate outdated information, contradictions, and orphaned pages.

- **Agent proficiency is a key skill:** Effectively guiding AI through prompts and structure takes practice, and those who invest in learning this get significantly better outcomes.

Conclusion

The most important advice for building your first LLM wiki is the same advice Karpathy gives in his gist: don't overthink the setup. The schema template from this guide can be easily copied after which you can create the directory structure by executing the bash commands.

The system achieves its magical effect through multiple architectural improvements which develop from the first day onwards. The wiki becomes more valuable with each new source material you include. The data belongs to you. The files exist in formats which can be used by any system. You can use any AI you want to query it. The LLM takes care of all maintenance tasks instead of you needing to handle them which creates a different experience from other productivity tools.

Your knowledge, finally, working as hard for you as *you worked to acquire it*.

[Riya Bansal](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fauthor%2Friya_bansal_av%2F)

Data Science Trainee at Analytics Vidhya

I am currently working as a Data Science Trainee at Analytics Vidhya, where I focus on building data-driven solutions and applying AI/ML techniques to solve real-world business problems. My work allows me to explore advanced analytics, machine learning, and AI applications that empower organizations to make smarter, evidence-based decisions.

With a strong foundation in computer science, software development, and data analytics, I am passionate about leveraging AI to create impactful, scalable solutions that bridge the gap between technology and business.

📩 You can also reach out to me at [workwithriyab@gmail.com](https://www.google.com/url?sa=E&q=mailto%3Aworkwithriyab%40gmail.com)

Keep Reading for Free

Free Courses

\[ 4.7

Generative AI - A Way of Life

Explore Generative AI for beginners: create text and images, use top AI tools, learn practical skills, and ethics.\](https://www.analyticsvidhya.com/courses/genai-a-way-of-life/?utm\_source=blog&utm\_medium=free\_course\_recommendation)

\[ 4.5

Getting Started with Large Language Models

Master Large Language Models (LLMs) with this course, offering clear guidance in NLP and model training made simple.\](https://www.analyticsvidhya.com/courses/getting-started-with-llms/?utm\_source=blog&utm\_medium=free\_course\_recommendation)

\[ 4.6

Building LLM Applications using Prompt Engineering

This free course guides you on building LLM apps, mastering prompt engineering, and developing chatbots with enterprise data.\](https://www.analyticsvidhya.com/courses/building-llm-applications-using-prompt-engineering-free/?utm\_source=blog&utm\_medium=free\_course\_recommendation)

\[ 4.6

Improving Real World RAG Systems: Key Challenges & Practical Solutions

Explore practical solutions, advanced retrieval strategies, and agentic RAG systems to improve context, relevance, and accuracy in AI-driven applications.\](https://www.analyticsvidhya.com/courses/improving-real-world-rag-systems-key-challenges/?utm\_source=blog&utm\_medium=free\_course\_recommendation)

\[ 4.7

Microsoft Excel: Formulas & Functions

Master MS Excel for data analysis with key formulas, functions, and LookUp tools in this comprehensive course.\](https://www.analyticsvidhya.com/courses/microsoft-excel-formulas-functions/?utm\_source=blog&utm\_medium=free\_course\_recommendation)

Recommended Articles

- [GPT-4 vs. Llama 3.1 – Which Model is Better?](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2024%2F08%2Fgpt-4-vs-llama-3-1%2F)

- [Llama-3.1-Storm-8B: The 8B LLM Powerhouse Surpa...](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2024%2F08%2Fllama-3-1-storm-8b%2F)

- [A Comprehensive Guide to Building Agentic RAG S...](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2024%2F07%2Fbuilding-agentic-rag-systems-with-langgraph%2F)

- [Top 10 Machine Learning Algorithms in 2026](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2017%2F09%2Fcommon-machine-learning-algorithms%2F)

- [45 Questions to Test a Data Scientist on Basics...](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2017%2F01%2Fmust-know-questions-deep-learning%2F)

- [90+ Python Interview Questions and Answers (202...](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2022%2F07%2Fpython-coding-interview-questions-for-freshers%2F)

- [8 Easy Ways to Access ChatGPT for Free](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F12%2Fchatgpt-4-for-free%2F)

- [Prompt Engineering: Definition, Examples, Tips...](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F06%2Fwhat-is-prompt-engineering%2F)

- [What is LangChain?](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2024%2F06%2Flangchain-guide%2F)

- [What is Retrieval-Augmented Generation (RAG)?](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2023%2F09%2Fretrieval-augmented-generation-rag-in-ai%2F)

[Cancel reply](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F2026%2F04%2Fllm-wiki-by-andrej-karpathy%2F%3Futm_source%3Dchatgpt.com%23respond)

Clear Submit reply

Δ

Frequently Asked Questions

Q1. What problem does RAG have with knowledge retention?

A. It doesn't accumulate knowledge; every query starts from scratch without building on past insights.

Q2. How does an LLM wiki differ from traditional RAG?

A. It processes knowledge during ingestion, creating a persistent, structured system that evolves over time.

Q3. Why is classifying documents before ingestion important?

A. It ensures the system extracts the right level of detail for each document type, improving accuracy and usefulness.

\[

Become an Author

Share insights, grow your voice, and inspire the data community.\](https://www.analyticsvidhya.com/become-an-author)

\[

- Reach a Global Audience

- Share Your Expertise with the World

- Build Your Brand & Audience

- Join a Thriving AI Community

- Level Up Your AI Game

- Expand Your Influence in Genrative AI\](https://www.analyticsvidhya.com/become-an-author)

Flagship Programs

Free Courses

Popular Categories

Generative AI Tools and Techniques

AI Development Frameworks

Data Science Tools and Techniques

Company

- [About Us](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fabout%2F%3Fref%3Dglobal_footer)

- [Contact Us](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcontact%2F%3Fref%3Dglobal_footer)

- [Careers](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcareers%2F%3Fref%3Dglobal_footer)

Discover

- [Blogs](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2F%3Fref%3Dglobal_footer)

- [Expert Sessions](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fevents%2Fdatahour%2F%3Fref%3Dglobal_footer)

- [Learning Paths](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fblog%2Fcategory%2Flearning-path%2F%3Fref%3Dglobal_footer)

- [Comprehensive Guides](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcategory%2Fguide%2F%3Fref%3Dglobal_footer)

Learn

- [Free Courses](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcourses%3Fref%3Dglobal_footer)

- [AI&ML Program](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fbbplus%3Fref%3Dglobal_footer)

- [Pinnacle Plus Program](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fpinnacleplus%2F%3Fref%3Dglobal_footer)

- [Agentic AI Program](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fagenticaipioneer%2F%3Fref%3Dglobal_footer)

Engage

- [Hackathons](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fdatahack%2F%3Fref%3Dglobal_footer)

- [Events](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fevents%2F%3Fref%3Dglobal_footer)

- [Podcasts](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fevents%2Fleading-with-data%2F%3Fref%3Dglobal_footer)

Contribute

- [Become an Author](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fbecome-an-author)

- [Become a Speaker](https://www.google.com/url?sa=E&q=https%3A%2F%2Fdocs.google.com%2Fforms%2Fd%2Fe%2F1FAIpQLSdTDIsIUzmliuTkXIlTX6qI65RCiksQ3nCbTJ7twNx2rgEsXw%2Fviewform%3Fref%3Dglobal_footer)

- [Become a Mentor](https://www.google.com/url?sa=E&q=https%3A%2F%2Fdocs.google.com%2Fforms%2Fd%2Fe%2F1FAIpQLSdTDIsIUzmliuTkXIlTX6qI65RCiksQ3nCbTJ7twNx2rgEsXw%2Fviewform%3Fref%3Dglobal_footer)

- [Become an Instructor](https://www.google.com/url?sa=E&q=https%3A%2F%2Fdocs.google.com%2Fforms%2Fd%2Fe%2F1FAIpQLSdTDIsIUzmliuTkXIlTX6qI65RCiksQ3nCbTJ7twNx2rgEsXw%2Fviewform%3Fref%3Dglobal_footer)

Enterprise

- [Our Offerings](https://www.google.com/url?sa=E&q=https%3A%2F%2Fenterprise.analyticsvidhya.com%2F%3Fref%3Dglobal_footer)

- [Trainings](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fenterprise%2Ftraining%3Fref%3Dglobal_footer)

- [Data Culture](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fenterprise%2Fdata-culture%3Fref%3Dglobal_footer)

- [AI Newsletter](https://www.google.com/url?sa=E&q=https%3A%2F%2Fnewsletter.ai%2F%3Fref%3Dglobal_footer)

Powered By

- Consent

- Details

- About

Cookies

This site uses cookies to ensure that you get the best experience possible. To learn more about how we use cookies, please refer to our [Privacy Policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fprivacy-policy) & [Cookies Policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fcookies-policy).

Necessary (2)

Necessary cookies help make a website usable by enabling basic functions like page navigation and access to secure areas of the website. The website cannot function properly without these cookies.

Analytics Vidhya (4)

brahmaid

It is needed for personalizing the website.

Expiry: Session

Type: HTTP

csrftoken

Expiry: Session

Type: HTTPS

Identityid

Preserves the login/logout state of users across the whole site.

Expiry: Session

Type: HTTPS

sessionid

Preserves users' states across page requests.

Expiry: Session

Type: HTTPS

Google (1)

g\_state

Google One-Tap login adds this g\_state cookie to set the user status on how they interact with the One-Tap modal.

Expiry: 365 days

Type: HTTP

Statistics (4)

Statistic cookies help website owners to understand how visitors interact with websites by collecting and reporting information anonymously.

Microsoft (7)

[learn more about microsoft policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fprivacy.microsoft.com%2Fen-us%2Fprivacystatement)

MUID

Used by Microsoft Clarity, to store and track visits across websites.

Expiry: 1 Year

Type: HTTP

\_clck

Used by Microsoft Clarity, Persists the Clarity User ID and preferences, unique to that site, on the browser. This ensures that behavior in subsequent visits to the same site will be attributed to the same user ID.

Expiry: 1 Year

Type: HTTP

\_clsk

Used by Microsoft Clarity, Connects multiple page views by a user into a single Clarity session recording.

Expiry: 1 Day

Type: HTTP

SRM\_I

Collects user data is specifically adapted to the user or device. The user can also be followed outside of the loaded website, creating a picture of the visitor's behavior.

Expiry: 2 Years

Type: HTTP

SM

Use to measure the use of the website for internal analytics

Expiry: 1 Years

Type: HTTP

CLID

The cookie is set by embedded Microsoft Clarity scripts. The purpose of this cookie is for heatmap and session recording.

Expiry: 1 Year

Type: HTTP

SRM\_B

Collected user data is specifically adapted to the user or device. The user can also be followed outside of the loaded website, creating a picture of the visitor's behavior.

Expiry: 2 Months

Type: HTTP

Google (7)

\_gid

This cookie is installed by Google Analytics. The cookie is used to store information of how visitors use a website and helps in creating an analytics report of how the website is doing. The data collected includes the number of visitors, the source where they have come from, and the pages visited in an anonymous form.

Expiry: 399 Days

Type: HTTP

*ga* #

Used by Google Analytics, to store and count pageviews.

Expiry: 399 Days

Type: HTTP

*gat* #

Used by Google Analytics to collect data on the number of times a user has visited the website as well as dates for the first and most recent visit.

Expiry: 1 Day

Type: HTTP

collect

Used to send data to Google Analytics about the visitor's device and behavior. Tracks the visitor across devices and marketing channels.

Expiry: Session

Type: PIXEL

AEC

cookies ensure that requests within a browsing session are made by the user, and not by other sites.

Expiry: 6 Months

Type: HTTP

G\_ENABLED\_IDPS

use the cookie when customers want to make a referral from their gmail contacts; it helps auth the gmail account.

Expiry: 2 Years

Type: HTTP

test\_cookie

This cookie is set by DoubleClick (which is owned by Google) to determine if the website visitor's browser supports cookies.

Expiry: 1 Year

Type: HTTP

Webengage (2)

\_we\_us

this is used to send push notification using webengage.

Expiry: 1 Year

Type: HTTP

WebKlipperAuth

used by webenage to track auth of webenagage.

Expiry: Session

Type: HTTP

LinkedIn (16)

ln\_or

Linkedin sets this cookie to registers statistical data on users' behavior on the website for internal analytics.

Expiry: 1 Day

Type: HTTP

JSESSIONID

Use to maintain an anonymous user session by the server.

Expiry: 1 Year

Type: HTTP

li\_rm

Used as part of the LinkedIn Remember Me feature and is set when a user clicks Remember Me on the device to make it easier for him or her to sign in to that device.

Expiry: 1 Year

Type: HTTP

AnalyticsSyncHistory

Used to store information about the time a sync with the lms\_analytics cookie took place for users in the Designated Countries.

Expiry: 6 Months

Type: HTTP

lms\_analytics

Used to store information about the time a sync with the AnalyticsSyncHistory cookie took place for users in the Designated Countries.

Expiry: 6 Months

Type: HTTP

liap

Cookie used for Sign-in with Linkedin and/or to allow for the Linkedin follow feature.

Expiry: 6 Months

Type: HTTP

visit

allow for the Linkedin follow feature.

Expiry: 1 Year

Type: HTTP

li\_at

often used to identify you, including your name, interests, and previous activity.

Expiry: 2 Months

Type: HTTP

s\_plt

Tracks the time that the previous page took to load

Expiry: Session

Type: HTTP

lang

Used to remember a user's language setting to ensure LinkedIn.com displays in the language selected by the user in their settings

Expiry: Session

Type: HTTP

s\_tp

Tracks percent of page viewed

Expiry: Session

Type: HTTP

AMCV\_14215E3D5995C57C0A495C55%40AdobeOrg

Indicates the start of a session for Adobe Experience Cloud

Expiry: Session

Type: HTTP

s\_pltp

Provides page name value (URL) for use by Adobe Analytics

Expiry: Session

Type: HTTP

s\_tslv

Used to retain and fetch time since last visit in Adobe Analytics

Expiry: 6 Months

Type: HTTP

li\_theme

Remembers a user's display preference/theme setting

Expiry: 6 Months

Type: HTTP

li\_theme\_set

Remembers which users have updated their display / theme preferences

Expiry: 6 Months

Type: HTTP

Preferences (0)

Preference cookies enable a website to remember information that changes the way the website behaves or looks, like your preferred language or the region that you are in.

We do not use cookies of this type.

Marketing (4)

Marketing cookies are used to track visitors across websites. The intention is to display ads that are relevant and engaging for the individual user and thereby more valuable for publishers and third party advertisers.

Google (11)

\_gcl\_au

Used by Google Adsense, to store and track conversions.

Expiry: 3 Months

Type: HTTP

SID

Save certain preferences, for example the number of search results per page or activation of the SafeSearch Filter. Adjusts the ads that appear in Google Search.

Expiry: 2 Years

Type: HTTP

SAPISID

Save certain preferences, for example the number of search results per page or activation of the SafeSearch Filter. Adjusts the ads that appear in Google Search.

Expiry: 2 Years

Type: HTTP

\_\_Secure-#

Save certain preferences, for example the number of search results per page or activation of the SafeSearch Filter. Adjusts the ads that appear in Google Search.

Expiry: 2 Years

Type: HTTP

APISID

Save certain preferences, for example the number of search results per page or activation of the SafeSearch Filter. Adjusts the ads that appear in Google Search.

Expiry: 2 Years

Type: HTTP

SSID

Save certain preferences, for example the number of search results per page or activation of the SafeSearch Filter. Adjusts the ads that appear in Google Search.

Expiry: 2 Years

Type: HTTP

HSID

Save certain preferences, for example the number of search results per page or activation of the SafeSearch Filter. Adjusts the ads that appear in Google Search.

Expiry: 2 Years

Type: HTTP

DV

These cookies are used for the purpose of targeted advertising.

Expiry: 6 Hours

Type: HTTP

NID

These cookies are used for the purpose of targeted advertising.

Expiry: 1 Month

Type: HTTP

1P\_JAR

These cookies are used to gather website statistics, and track conversion rates.

Expiry: 1 Month

Type: HTTP

OTZ

Aggregate analysis of website visitors

Expiry: 6 Months

Type: HTTP

Facebook (2)

\_fbp

This cookie is set by Facebook to deliver advertisements when they are on Facebook or a digital platform powered by Facebook advertising after visiting this website.

Expiry: 4 Months

Type: HTTP

fr

Contains a unique browser and user ID, used for targeted advertising.

Expiry: 2 Months

Type: HTTP

LinkedIn (6)

[Learn about linkedin policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.linkedin.com%2Flegal%2Fprivacy-policy)

bscookie

Used by LinkedIn to track the use of embedded services.

Expiry: 1 Year

Type: HTTP

lidc

Used by LinkedIn for tracking the use of embedded services.

Expiry: 1 Day

Type: HTTP

bcookie

Used by LinkedIn to track the use of embedded services.

Expiry: 6 Months

Type: HTTP

aam\_uuid

Use these cookies to assign a unique ID when users visit a website.

Expiry: 6 Months

Type: HTTP

UserMatchHistory

These cookies are set by LinkedIn for advertising purposes, including: tracking visitors so that more relevant ads can be presented, allowing users to use the 'Apply with LinkedIn' or the 'Sign-in with LinkedIn' functions, collecting information about how visitors use the site, etc.

Expiry: 6 Months

Type: HTTP

li\_sugr

Used to make a probabilistic match of a user's identity outside the Designated Countries

Expiry: 90 Days

Type: HTTP

Microsoft (2)

MR

Used to collect information for analytics purposes.

Expiry: 1 year

Type: HTTP

ANONCHK

Used to store session ID for a users session to ensure that clicks from adverts on the Bing search engine are verified for reporting purposes and for personalisation

Expiry: 1 Day

Type: HTTP

UnclassNameified (0)

UnclassNameified cookies are cookies that we are in the process of classNameifying, together with the providers of individual cookies.

We do not use cookies of this type.

Cookies are small text files that can be used by websites to make a user's experience more efficient. The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies, we need your permission. This site uses different types of cookies. Some cookies are placed by third-party services that appear on our pages. Learn more about who we are, how you can contact us, and how we process personal data in our [Privacy Policy](https://www.google.com/url?sa=E&q=https%3A%2F%2Fwww.analyticsvidhya.com%2Fprivacy-policy).

Accept all cookies Use necessary cookies

Kickstart Your Generative AI Journey

Generalized Learning Path

A standard roadmap to explore Generative AI.

Download Now

Most Popular

Personalized Learning Path

Your goals. Your timeline. Your custom learning plan.

Create Now

What's your ultimate learning goal?

\[-\] 0

🚀 Prompt Engineering Expert \[-\] 1

🔍 RAG Expert \[-\] 2

🎨 Generative AI Expert

How quickly do you want to reach your goal?

\[-\] 0

⏳ 3 Months: I want a fast-track learning path \[-\] 1

⌛ 4 Months: A balanced pace works for me \[-\] 2

🕒 6 Months: I'm in for a detailed, deep-dive journey

Download Now

Build Agentic AI Systems in 6 Weeks!

A live, cohort-based, instructor-led program

- Weekend live classes with top AI Experts

- 10+ guided projects + 5 mini assignments

- Weekly office hours for discussions and Q&A

- Lifetime access to sessions and resources

Your AI Automation Journey Starts Here

Email is required.

Phone Number is required. \[x\]

Send WhatsApp Updates

Get Program Details

I don't want to upskill

SKIP

Continue your learning for FREE

Receive updates on WhatsApp

Enter email address to continue

Email address

Get OTP

Enter OTP sent to

Edit

Wrong OTP.

Enter the OTP

Resend OTP

Resend OTP in 45s

Verify OTP

## Чат

Представленные источники описывают **концепцию LLM-Wiki**, предложенную Андреем Карпати как альтернативу традиционным системам RAG для управления знаниями. Вместо того чтобы искать фрагменты в разрозненных файлах во время каждого запроса, искусственный интеллект **автоматически создает и поддерживает структурированную базу данных** в формате Markdown. Эта система позволяет ИИ **накапливать и синтезировать знания**, выявлять противоречия в документах и постоянно обновлять перекрестные ссылки. Пользователи отмечают, что такой подход делает извлечение информации более точным и глубоким, превращая нейросеть в полноценного **редактора персональной базы знаний**. Обсуждения подчеркивают как высокую эффективность метода для личных проектов, так и технические сложности при его масштабировании.

В чем отличие концепции LLM Wiki от традиционного метода RAG?

Как организовать структуру личной базы знаний по методу Карпати?

Какие инструменты и плагины Obsidian нужны для создания такой вики?

Мастер-план оптимизации токенов и построения персистентной памяти в Claude Code

Эффективная работа с Claude Code — это не вопрос «правильных промптов», а дисциплина управления капиталом знаний. В условиях архитектурных ограничений Anthropic каждый потраченный токен должен либо приближать к результату, либо оседать в долгосрочной памяти. В противном случае вы платите «налог на некомпетентность», сжигая до 98,5% ресурсов на бессмысленное перечитывание истории. Данный документ переводит процесс разработки на рельсы «удельной интеллектуальности» и substrate-aware дизайна.

1\. Фундамент: Гигиена контекста и операционная эффективность

Стратегическая важность «контекстной гигиены» продиктована механикой LLM: модель перечитывает всю историю сессии с каждым новым сообщением. При накоплении «шума» вы не только платите за пересчет (до 140 000 токенов за итерацию), но и сталкиваетесь с эффектом **Loss in the Middle** — деградацией внимания в середине длинных сессий.

- **Командный протокол обнуления (****/clear****):** Это не просто очистка экрана, а метод GSD (Get Shit Done) для изоляции задач. Использование `/clear` между логическими блоками обнуляет «груз» истории, снижая затраты на чтение до нуля. Это обязательное действие при переключении между модулями или завершении фичи.

- **Пакетная обработка (Atomic Prompts):** Запретите себе отправлять сообщения в стиле «Привет» или «Найди баг». Одно структурированное сообщение, объединяющее анализ и инструкцию по исправлению, экономит 60–70% контекста за счет устранения лишних циклов чтения.

- **Принцип 95% уверенности в Plan Mode:** Смена контекста из-за ошибок — самая дорогая статья расходов. Внедрите в системный промпт жесткое правило: *«Do not apply changes until 95% confident in the solution; ask clarifying questions until that point»*.

- **Локализация области видимости:** Подача всего репозитория — признак архитектурной небрежности. Изолируйте контекст до конкретной функции или блока кода. Точечная подача данных обеспечивает экономию до 96% по сравнению со сканированием каталогов.

2\. Технический аудит: Скрытый налог и инфраструктура

Инфраструктурные настройки поглощают ресурсы еще до первого байта вашего сообщения. Системные промпты, описания инструментов и MCP-серверы формируют «входной налог» в размере около 51 000 токенов.

- **Ревизия MCP и переход на CLA:** Каждый подключенный MCP-сервер добавляет до 18 000 токенов описания инструментов в каждое сообщение. Отключайте неиспользуемые сервера. Там, где это технически возможно, используйте **CLA (Claude Link Architecture)** — это более легкий и эффективный протокол соединения, минимизирующий накладные расходы.

- **Иерархия моделей для оптимизации ROI:** | Модель | Доля задач | Сценарий (Intelligence per Token) | |:--- |:--- |:--- | | **Sonnet** | 80% | Основной рабочий инструмент разработки. | | **Haiku** | 15% | Форматирование, субагенты, простые исследования. | | **Opus** | 5% | Ревью сложной архитектуры и критическое планирование. |

- **5-минутное окно кэширования:** Кэш контекста Anthropic живет ровно 5 минут. Перерыв на кофе без использования `/compact` или `/clear` означает, что следующее сообщение вызовет полный пересчет всей истории по полной стоимости.

- **Лимитирование Extended Thinking:** Ограничьте бюджет на «размышление» до 10 000 токенов вместо стандартных 32 000. Для 90% задач разработки этого достаточно, чтобы сохранить глубину анализа без лишних затрат в API.

3\. Архитектура файлов: CLAUDE.md и лингвистический прагматизм

Файл `CLAUDE.md` — это «Живая Конституция» проекта. Он читается при каждом запросе, поэтому его плотность критична.

- **Лингвистическая оптимизация:** Кириллица токенизируется в 1.5–2 раза дороже латиницы. Для максимизации плотности знаний все системные инструкции, правила и `CLAUDE.md` должны быть написаны **исключительно на английском языке**.

- **Принцип «Индекса, а не Библиотеки»:** `CLAUDE.md` должен быть не более 200 строк. Он не хранит знания, а указывает на них. Используйте его как карту ссылок на `Architecture.md`, `Knowledge.md` и `Daily_Log.md`.

- **Прямое связывание через** **@****:** Используйте жесткие ссылки на файлы вместо размытых команд «найди в репозитории». Это предотвращает бесполезное сканирование файлов и раздувание контекста.

- **Блокировка токсичных путей (****.cloudignore****):** В обязательном порядке исключите `node_modules`, `dist`, `.git`, `logs` и временные файлы. Это предотвращает случайные «скачки» потребления токенов при индексации мусора.

4\. Система LLM Wiki: Метаболизм знаний по методу Карпати

Традиционный RAG не накапливает знания — он каждый раз «изобретает велосипед» с нуля. Метод LLM Wiki предлагает 70-кратное преимущество за счет компиляции знаний на этапе ingestion.

Двухуровневая архитектура:

- **Central Wiki:** Глобальная база знаний (UX-паттерны, переиспользуемые сниппеты, стандарты безопасности).

- **Project Wiki:** Специфичный контекст текущего продукта (архитектура, логи, инциденты).

Пять операций метаболизма памяти:

- **TRIAGE:** Классификация входящего источника (статья, лог сессии, PDF) перед извлечением смысла.

- **CONTEXTUALIZE:** Интеграция данных в существующие страницы с обновлением обратных ссылок. Один источник может обновить до 15 страниц Wiki.

- **CONSOLIDATE:** Синтез разрозненных заметок в единые Hub-страницы (MOC — Maps of Content).

- **DECAY (Compaction):** Использование паттерна **Actuel/Archive**. Актуальная логика находится в заголовке `## Actuel`, старая сжимается в одну строку и перемещается в `## Archive`. Это предотвращает превращение Wiki в «кладбище маркдауна».

- **AUDIT:** Регулярная проверка на наличие противоречий, «сиротских» (orphan) страниц и устаревших утверждений.

Реализация и инструменты:

Используйте **Obsidian** как IDE для этой базы. Обязательно внедряйте **YAML frontmatter** для каждой страницы, чтобы использовать плагин Dataview и превратить Wiki в queryable-базу данных. Каждая страница должна иметь краткий TLDR в начале, чтобы агент мог быстро оценить релевантность через `index.md`.

5\. Мониторинг, уплотнение и Caveman Output

Для поддержания высокой плотности сигнала в длинных сессиях необходимо активное управление.

- **Принудительный** **/compact** **на 60%:** Не ждите автоматического срабатывания на 95%. Запускайте сжатие вручную на 60%, четко указывая, какие архитектурные решения и текущие задачи должны быть сохранены в «сжатом» состоянии.

- **Метод «Пещерного человека» (Caveman Output):** Для экономии исходящих токенов (до 75%) и времени генерации, внедрите в `CLAUDE.md` жесткую инструкцию:

- Это устраняет вежливые, но бесполезные вступления, за которые вы платите из своего лимита.

- **Инструментальный контроль:** Включите строку статуса в терминале (`/status line`) для мониторинга заполнения окна. Настройте уведомления (через N8N или локальные хуки), когда остаток лимита падает ниже 20%.

- **Health Check (Linting):** Еженедельно запускайте процесс аудита Wiki. Ищите противоречия между новыми логами и старой архитектурой.

**Финальный тезис:** Переход от потребления токенов к управлению капиталом знаний позволяет работать на тарифе Pro эффективнее, чем на тарифе Max без соблюдения контекстной гигиены. Правильно выстроенная LLM Wiki — это не просто склад файлов, а экзокортекс вашего проекта, который умнеет с каждым коммитом.

Приложения Google

Аккаунт Google

Anekeika

anekeika@gmail.com

Доступ к блокноту открыт.