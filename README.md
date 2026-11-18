![profile](img/profile.gif)

<div align="center">

  <img src="img/octocat.png" alt="Octocat" width="400"/>

  ![](https://komarev.com/ghpvc/?username=yousefhadder)

  ### Connect with Me

  [![](https://skillicons.dev/icons?i=linkedin)](https://www.linkedin.com/in/yousefhadder)

  ### Languages and Tools

  [![My Skills](https://skillicons.dev/icons?i=html,css,js,ts,java,cpp,nodejs,express,ruby,go,aws,neovim)](https://skillicons.dev)

</div>

### Profile GIF automation

The weekly **Update Profile GIF** workflow intentionally publishes aggregate contribution counts and language totals, including private/internal contributions accessible to `GH_PAT`. It does not publish repository names. Keep `PUBLISH_PRIVATE_AGGREGATES` enabled only while publication of those aggregates is approved.

Store a valid classic PAT with `read:user` as the repository Actions secret `GH_PAT`, and authorize it for the organization through SSO when required. Do not add repository-write scopes for this workflow. The PAT is available only to the stats-collection step on a dedicated runner; rendering runs separately without the PAT or repository-write permission, and publishing receives only the GIF artifact on a third runner. Runs are restricted to the default branch.

Renderer downloads and Python wheels are SHA-256 verified; actions, Neovim plugins, and the tmux theme use immutable commit pins. Update each release version together with its verified checksum or commit, and keep `config/requirements.txt` fully pinned and hashed. System packages still receive updates from Ubuntu's authenticated package repositories.
