<template>
  <div class="max-w-3xl mx-auto p-4 bg-white shadow-lg rounded-lg">
    <h1 class="text-2xl font-bold text-center text-gray-800 mb-4">Operadoras de Planos de Saúde Com Registro Ativo</h1>

    <!-- Filtro -->
    <div class="flex flex-col md:flex-row gap-4 mb-4">
      <input
        v-model="searchColum"
        placeholder="Pesquisar por coluna"
        class="border rounded-lg px-4 py-2 w-full md:w-1/3 focus:ring-2 focus:ring-blue-400 text-sm"
      />
      <div class="relative w-full md:w-1/3">
        <input
          v-model="searchTerm"
          placeholder="Digite para filtrar"
          :class="{'border-red-500': isTermInvalid}"
          class="border rounded-lg px-4 py-2 w-full focus:ring-2 focus:ring-blue-400 text-sm"
        />
        <small v-if="isTermInvalid" class="text-red-500 text-xs absolute left-0 -bottom-5">Campo obrigatório</small>
      </div>
      <button
        @click="handleSearch"
        class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 transition text-sm"
      >
        Buscar
      </button>
    </div>

    <!-- Filtro na Tabela -->
    <div class="mb-4">
      <input
        v-model="tableSearchTerm"
        placeholder="Pesquisar na tabela..."
        class="border rounded-lg px-4 py-2 w-full md:w-1/3 focus:ring-2 focus:ring-blue-400 text-sm"
      />
    </div>

    <!-- Tabela -->
    <div class="relative">
      <div class="overflow-auto max-h-96 border border-gray-300 shadow rounded-lg bg-gray-50">
        <table v-if="filteredData.length" class="w-full text-sm text-gray-700 pr-5">
          <thead class="bg-blue-100 text-gray-700">
            <tr>
              <th v-for="(value, key) in filteredData[0]" :key="key" class="px-4 py-2 text-left font-medium">
                {{ key }}
              </th>
            </tr>
          </thead>
          <tbody ref="tableBody" @scroll="handleScroll">
            <tr v-for="user in filteredData" :key="user.id" class="border-b hover:bg-gray-100 transition-all">
              <td v-for="(value, key) in user" :key="key" class="px-4 py-3">
                {{ value }}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="hasMore" class="absolute bottom-0 left-0 w-full h-6 bg-gradient-to-t from-gray-200 to-transparent"></div>
      <p v-else-if="errorMessage" class="text-red-500 text-center mt-4">
        {{ errorMessage }} <!-- Exibe a mensagem de erro do response -->
      </p>
      <p v-else-if="!filteredData.length" class="text-gray-600 text-center mt-4">
        Carregando dados...
      </p>
      <p class="text-sm text-gray-500 mt-2">Exibindo {{ filteredData.length }} registros</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      data: [],
      searchTerm: "", // Termo para busca principal, usado no botão "Buscar"
      searchColum: "",
      tableSearchTerm: "", // Termo para busca apenas na tabela
      hasMore: false,
      isTermInvalid: false, // Controla a borda vermelha e a exibição da mensagem
      errorMessage: null, // Armazena a mensagem de erro (ex: erro 404)
    };
  },
  computed: {
    filteredData() {
      // Filtro para dados carregados, baseado apenas no filtro da tabela (tableSearchTerm)
      let filtered = this.data;

      if (this.tableSearchTerm) {
        filtered = filtered.filter((item) =>
          Object.values(item).some((value) =>
            String(value).toLowerCase().includes(this.tableSearchTerm.toLowerCase())
          )
        );
      }

      return filtered;
    },
  },
  methods: {
    handleSearch() {
      // Verifica se o termo foi preenchido, caso contrário, marca como inválido
      if (!this.searchTerm) {
        this.isTermInvalid = true;
      } else {
        this.isTermInvalid = false;
        this.fetchData();
      }
    },
    async fetchData() {
      try {
        const response =
          this.searchColum !== ""
            ? await fetch(`http://127.0.0.1:5000/buscar/${this.searchColum}/${this.searchTerm}`)
            : await fetch(`http://127.0.0.1:5000/buscar/${this.searchTerm}`);
        
        if (response.status === 404) {
          const errorData = await response.json();
          this.errorMessage = errorData.message || "Erro ao buscar dados"; // Exibe a mensagem de erro do response
          this.data = []; // Limpa os dados em caso de erro
        } else {
          let result = await response.json();
          this.errorMessage = null; // Limpa qualquer mensagem de erro
          this.data = result;
        }

        this.checkScroll();
      } catch (error) {
        console.error("Erro ao buscar dados:", error);
        this.errorMessage = "Erro ao buscar dados"; // Mensagem genérica de erro
        this.data = []; // Limpa os dados em caso de falha na requisição
      }
    },
    checkScroll() {
      this.$nextTick(() => {
        const tableBody = this.$refs.tableBody;
        if (tableBody) {
          this.hasMore = tableBody.scrollHeight > tableBody.clientHeight;
        }
      });
    },
    handleScroll(event) {
      const { scrollTop, scrollHeight, clientHeight } = event.target;
      this.hasMore = scrollHeight - scrollTop > clientHeight + 5;
    },
  },
};
</script>

<style scoped>
/* Ajuste no padding da tabela para dar distância da borda */
table {
  padding-right: 15px; /* Distância extra da borda direita para o scroll */
}

table thead {
  border-bottom: 2px solid #ddd; /* Aumentando a borda inferior para separar o cabeçalho */
}
</style>
