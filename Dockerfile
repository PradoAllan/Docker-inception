FROM debian
// Indica que nosso container vai ser baseado no debian

LABEL app="apradoInception"
// Uma forma de identificar o container

ENV USER="aprado"
// Variável de ambiente

RUN apt-get update && apt-get install -y stress && apt-get clean
// Executar algum comando em tempo de BUILD. Isto é, no momento em que a Imagem
// estiver sendo construida.

CMD stress --cpu 1 --vm-bytes 64M --vm 1
# CMD echo "Iniciando o teste de estresse"
# CMD stress --cpu 1 --vm-bytes 64M --vm 1
// Usado para executar alguma coisa, isto é, algum comando. 
// Não Podemos ter mais de um CMD por dockerfile...
// Esse comando só vai ser executado quando SUBIRMOS o container com
// essa Imagem!!!!