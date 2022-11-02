<template>
  <div id="app">
    <base-card>
      <header>
        <h4> Please enter your name and pick the Sectors you are currently involved in. </h4>
      </header>
      <form class="form-control">
        <div class="row">
          <label class="col">Name: </label>
          <input type="text" class="col-6" v-model.trim="person.name">
        </div>
        <div class="row">
          <label class="col">Sectors: </label>
          <select class="form-select col-6" multiple="multiple" size="5" aria-label="Sectors:"
                  v-model="person.sectorIds">
            <option v-for="sector in sectors" :key="sector.id" :value="sector.id"
                    :style="{ 'padding-left': (sector.depth * 20) + 'px' }">
              {{ sector.name }}
            </option>
          </select>
        </div>
        <div class="row">
          <label class="col">Agree to terms </label>
          <input type="checkbox" class="form-check-input" style="height: 20px" v-model="person.isAgree">
        </div>
        <div class="row">
          <button type="button" class="btn btn-outline-success w-25 col-6" @click="submitForm">Save</button>
          <button type="button" class="btn btn-outline-success w-25 col-6" @click="refill"
                  v-if="person.id">Refill my form
          </button>
        </div>

        <div v-show="errorMessage" class="alert alert-danger" role="alert" style="margin-top: 50px">
          {{ errorMessage }}
        </div>
      </form>
    </base-card>
  </div>
</template>
<script>
import BaseCard from "@/components/BaseCard";

export default {
  components: {BaseCard},
  data() {
    return {
      sectors: [],
      person: {
        id: null,
        name: '',
        sectorIds: [],
        isAgree: false
      },

      errorMessage: null,
      number: null,
    }
  },
  methods: {
    refill() {
      fetch('/get-person-data?id=' + this.person.id, {
        credentials: "include",
        method: 'GET',
      })
          .then(response => response.json())
          .then(data => {
            this.person = data;
            this.errorMessage = data.title;
          })
          .catch(error => console.error(error));

    },

    submitForm() {
      this.errorMessage = '';
      fetch('/save-person', {
        credentials: "include",
        method: 'POST',
        body: JSON.stringify(this.person),
        headers: {
          'Content-Type': 'application/json'
        }
      })
          .then(response => response.json())
          .then(data => {
            this.errorMessage = data.message;
            if (Number.isInteger(data)) {
              this.person.id = data
            }
          })
          .catch(error => console.error(error));

      this.person.name = '';
      this.person.sectorIds = [];
      this.person.isAgree = false;
    },

    getSectors: async function () {
      await fetch('/get-sectors', {
        credentials: "include",
        method: 'GET',
      })
          .then(response => response.json())
          .then(data => {
            this.sectors = data;
            this.errorMessage = data.message;
          })
          .catch(error => console.error(error));
    },
  },
  mounted() {
    this.getSectors();
  }
}


</script>
<style scoped>
.row {
  margin-top: 20px;
}

.form-control {
  margin: 0.5rem 0;
}

header {
  line-height: 1.5;
  max-height: 100vh;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
  }
}

label {
  text-align: left;
  font-weight: bold;
  display: block;
  margin-bottom: 0.5rem;
  font-size: small;
}

input {
  display: block;
  border: 1px solid #ccc;
  font: inherit;
  margin-right: 10px;
}

input:focus {
  background-color: #f0e6fd;
  outline: none;
  border-color: #3d008d;
}

.invalid label {
  color: red;
}

.invalid input {
  border: 1px solid red;
}

button {
  text-decoration: none;
  padding: 0.5rem 0.5rem;
  font: inherit;
  color: white;
  cursor: pointer;
  border-radius: 30px;
  margin-right: 0.3rem;
  display: inline-block;
}
</style>
