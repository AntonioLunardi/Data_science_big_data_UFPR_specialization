"""
 Crie um repositório no GitHub. E faça alguns commits.
 O projeto pode ser qualquer coisa. Pode também ser o projeto que foi feito na aula de hoje.
 Compartilhe o projeto com o professor no GitHub.
 Ou deixe o projeto público, e envie o link do repositório na tarefa.
 Submeta o nome do projeto, e os envolvidos em um .txt no Moodle.
 Se o projeto possui mais de uma pessoa, todos devem submeter o mesmo .txt no Moodle.

 O usuário paulorla deve ter permissão para acessar o projeto e clonar na máquina local, 
 para fazer a correção (ver os logs de quem fez
 commit, e o quê).
"""


# Verificar se está conectado
ssh -T git@github.com

# Inicia o SSH configurado p/ só pedir a senha 1x
eval "$(ssh-agent -s)"

# Adicionar chave ao SSH
ssh-add key
# Config atuais
git config --list --show-origin

# Configurar nome e email
git config --global user.name "SEU NOME AQUI"
git config --global user.email seu_email@exemplo.com

# Obter uma cópia de um repositório
git clone git@github.com:NOME_USUARIO/NOME_PROJETO.git

# Modificar o editor de texto padrão utilizado pelo Git
git config --global core.editor vim

# Para obter uma cópia de um repositório
git clone git@github.com:NOME_USUARIO/NOME_PROJETO.git

# Verificar o estado dos arquivos no projeto
git

# Monitoramento
git add <nomeArquivo> # arquivo
git add --all # Todos os arquivos

# Saída (antes e depois de add arquivo)
git status

# Commit
git commit -m "Adicionada primeira versão do arquivo de texto da aula"

# Push (se você substituir DESTINO por origin, o próprio git vai 
# entender que você quer enviar para o servidor original de onde 
# o projeto foi clonado.
git push DESTINO BRANCH
git push origin main

# Info dos commits
git log

# Modificar sem push
git add --all
git commit -m "nova linha adicionada"

# alterar o último commit
git commit --amend -m "MENSAGEM"
git commit --amend -m "nova linha adicionada e alterada"
"""Faça com muita atenção, pois você vai alterar o último commit, 
logo é como se a “versão original” deste último commit nunca 
tivesse existido"""

# Desfazer último commit
git restore NOME_ARQUIVO
"""Atenção: você vai descartar todas as alterações, e essa ação 
não pode ser desfeita. Lembre-se: todo arquivo que você fizer commit 
fica em histórico, e é possível voltar atrás. Mas alterações sem commit
não são passíveis de restauração.
"""

# TAG (último commit)
git tag -a v1.0 -m "Versão 1.0 do projeto"

# tag usando algum outro commit do projeto
git log --pretty=oneline

# especificar o commit para criar o tag
git tag -a v1.0 -m "Versão 1.0 do projeto" HASH_DO_COMMIT

# Enviar as TAGs para o servidor remoto do GitHub
git push origin --tags

# ver uma versão antiga do projeto
git checkout TAG_OU_CHECKSUM
"""checksum é o número que aparece logo após a palavra commit no 
comando git log"""

# Voltar no histórico
git checkout v1.0
"""
ao fazer um checkout, você está operando em modo detached, use 
somente para verificar os arquivos, sem alterar e fazer commits. 
Se você quer fazer alguma alteração, crie uma branch (veja na 
documentação)
"""

# voltar para a versão mais recente
git switch -

# mostra as diferenças dos arquivos atuais para o último commit
git diff

# Especificar que quer mostrar as diferenças dos arquivos em commits 
# específicos, e ainda especificar para qual arquivo você quer ver a diferença
git diff HASH_COMMIT1 HASH_COMMIT2 NOME_ARQUIVO

# criar uma branch a partir do commit atual
git branch NOME_DA_BRANCH

# trocar a branch de trabalho
git checkout NOME_BRANCH

# Unir branches
git merge BRANCH_DO_MERGE -m MENSAGEM
"""
O git vai tentar mesclar (merge) automaticamente a BRANCH_DO_MERGE 
na sua branch atual. Dependendo de como os arquivos foram alterados 
em cada branch, o Git pode não conseguir mesclar os arquivos
automaticamente. Outra forma é usar uma ferramenta de merge.

"""

#  ver os conflitos atuais
git status

# Remover branch
 git branch -d NOME_BRANCH
 """
 Depois de resolver o conflito, você pode fazer novamente um commit, 
 e um push. O conflito está resolvido, e o merge para sua branch 
 atual está completo. Você pode manter sua branch, ou então pode removê-la.
 """

# Atualizar o repositório da máquina local com os dados do remoto
 git pull
