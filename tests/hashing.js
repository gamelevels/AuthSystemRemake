const hash = require('../shared/hash.js');

(async () => {
  const passwordHash = await hash.HashPassword(process.argv[2]);
  console.log(passwordHash);
})();