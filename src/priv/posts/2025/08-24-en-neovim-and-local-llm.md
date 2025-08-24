%{
    title: "Neovim and Local LLMs",
    author: "Fabricio Damazio",
    tags: ~w(programming),
    description: "My experience with Ollama and the CodeCompanion plugin in Neovim."
}
---

It's easy to get lost in the current frenzy around LLMs, agents, and vibe coding.
The feeling that you're falling behind or missing the next revolutionary tool is constant.

When it comes to using AI for programming, I would describe myself as a cautious person.
I usually evaluate well how and when to use it. I have more concern about the harms
it can cause to my learning than excitement about the promised productivity benefits.

In search of a more conscious and controlled use of AI,
this week I started using an LLM running locally and integrated with Neovim.
I want to talk a bit about this experience.

## Motivations

I decided to start this project because running an LLM locally provides a good answer
to the main concerns I have about using AI. The first and primary one
is regarding privacy. Processing my data locally is ideologically a
priority (not having to pay anything for it is a plus). The second is about having
control over my own environment, choosing the models and when to use them. And,
finally, the almost instantaneous response speed that makes the whole experience fluid.

I have a desktop computer with a generous configuration: an AMD 9950x CPU,
an RTX 4090 video card, and 32GB of DDR5 RAM. With this computing power
at my disposal, it makes a lot of sense to take advantage of the benefits of running a local LLM.

## Running the model locally

[Ollama](https://ollama.com/){: target="_blank" .font-medium .text-pink-800 } was my choice for running models locally.
The simplicity is absurd: just one command to install on Linux and another to
download a model and run it.

Since then I've been testing different models. I want to find one or two
specialized models for each type of task. For example, for programming in
Elixir and Rust, I've been testing the `qwen3:30b-a3b-instruct-2507-q4_K_M` model. I chose
a 30B (Billion parameters) model for offering good reasoning power
and the `q4_K_M` quantization so it would fit comfortably in the VRAM 
of my 4090 without sacrificing too much quality. The result has been surprising
and I intend to continue testing different models in the coming months.

## Integrating with Neovim

I chose the [CodeCompanion](https://github.com/olimorris/codecompanion.nvim){: target="_blank" .font-medium .text-pink-800 } plugin
for the integration between Ollama and Neovim. The installation and configuration were simple,
I basically followed the documentation instructions.

I found the experience similar to what I had when I tested the Zed editor. With one command
the chat panel opens and it's possible to interact with the model. The chat allows adding
files as context in the conversation. In the chat it's possible to change which model
to use (local or remote).

It's also possible to use tools that can perform various tasks such as searching
for files, editing them, executing commands, etc.

It's worth visiting the plugin's website and watching the available videos to understand
what the plugin is capable of doing.

## My experience so far

It's still very recent but the experience so far has been quite positive.
As I said, I'm very cautious about using AI, so my use is limited to consulting
documentation, theoretical concepts, and debating a solution I'm thinking about.

I don't use tools to edit or solve errors directly in the code. I strongly believe
that I should not outsource my understanding of the solution and the code to an AI,
but I still think it will help me have a smoother development flow.
It's too early to tell, but we'll see if this holds true over time.

All my Neovim configuration code is available [in this repository](https://github.com/FabriDamazio/nvim){: target="_blank" .font-medium .text-pink-800 }.

---

*Note: AI-assisted translation, human-reviewed. Feedback welcome.*
