

var options = {
  mainAngularModule: 'BBB'
};


options.modulesData = {
  proxy: {
    proxyRules: {
      rules: {},
      default: 'http://localhost:9000'
    }
  },


  server: {
    routes: {
      '/vendors'          : 'vendors'
    }
  },

  unitTests: {
    testAutoConfig: {
      suppressCoverage: true
    }
  },

  scripts: {
    coffee: {
      sourcemaps: {
        active: false
      }
    }
  }
};

require('basebuild-angular')(options);