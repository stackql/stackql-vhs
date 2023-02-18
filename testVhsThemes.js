const fs = require('fs');
const https = require('https');
const url = 'https://raw.githubusercontent.com/charmbracelet/vhs/main/THEMES.md';
const { execSync } = require('child_process');

https.get(url, (res) => {
    let data = '';
    res.on('data', (chunk) => {
        data += chunk;
    });
    res.on('end', () => {
        fs.writeFileSync('vhsThemes.txt', data);

        const vhsThemes = fs.readFileSync('vhsThemes.txt', 'utf8');
        const themes = vhsThemes.match(/(?<=\* ).*/g).map( x => x.replace(/`/g,''));
        
        // read stackql.tape file
        const stackqlTape = fs.readFileSync('themes.tape', 'utf8');
        
        //for each theme in themes, create a temp tape file
        themes.forEach( theme => {
        
            try {
                fs.mkdirSync(`themes/${theme}`);
            } catch (err) {
                if (err.code !== 'EEXIST') throw err;
            }
        
            const themeTape = stackqlTape.replace(/Output stackql\.gif/g, `Output "themes/${theme}/${theme}.gif"\nSet Theme "${theme}"`);

            fs.writeFileSync(`themes/${theme}/${theme}.tape`, themeTape);

            try {
                console.log(`processing theme: ${theme}...`);
                execSync(`docker run --rm -v $PWD:/vhs stackql-vhs "themes/${theme}/${theme}.tape"`);
                console.log(`${theme} complete!`);
              } catch (err) {
                console.error('Error: ' + err.toString());
              }

        });

    });
}).on('error', (err) => {
    console.log('Error: ' + err.message);
});



