class Programa:
    def __init__(self, nome, ano):
        self._nome = nome.title()
        self.ano = ano
        self._likes = 0
    
    @property
    def likes(self):
        return self._likes

    def dar_likes(self):
        self._likes += 1

    @property
    def nome(self):
        return self._nome
    
    @nome.setter
    def nome(self, novo_nome):
        self._nome = novo_nome.title()

    def __str__(self):
        return f'Nome: {self.nome} Likes: {self.likes}'



class Filme(Programa):
    def __init__(self, nome, ano, duracao):
        super().__init__(nome, ano)
        self.duracao = duracao

    def __str__(self):
        return f'Nome: {self.nome} - {self.duracao} minutos - Likes: {self.likes}'


class Serie(Programa):
    def __init__(self, nome, ano, temporadas):
        super().__init__(nome, ano)
        self.temporadas = temporadas

    def __str__(self):
        return f'Nome: {self.nome} - {self.temporadas} temporadas - Likes: {self.likes}'

class Playlist():
    def __init__(self, nome, programas):
        self.nome = nome
        self._programas = programas
    
    def __getitem__(self, item):
        return self._programas[item]

    def __len__(self):
        return len(self._programas)

vingadores = Filme('vingadores - guerra infinita', 2018, 160)
atlanta = Serie('atlanta', 2018, 2)
aquarius = Filme('aquarius', 2014, 137)
robocop = Serie('robocop', 1988, 3)

vingadores.dar_likes()
vingadores.dar_likes()
aquarius.dar_likes()
aquarius.dar_likes()
atlanta.dar_likes()
aquarius.dar_likes()
atlanta.dar_likes()
robocop.dar_likes()
atlanta.dar_likes()

filmes_e_series = [vingadores, atlanta, aquarius, robocop]
playlist_fds = Playlist('fim de semana', filmes_e_series)

print(f'Tamanho do playlist: {len(playlist_fds)}')
print(f'Tá ou não tá? {aquarius in playlist_fds}')

for programa in playlist_fds:
    print(programa)