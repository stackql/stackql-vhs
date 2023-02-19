import imagemin from 'imagemin';
import imageminGifsicle from 'imagemin-gifsicle';
import { 
	existsSync,
	renameSync,
	rmdirSync,
 } from 'node:fs';

const dir = process.argv[2];
console.log(`optimizing images in ${dir}`);

(async () => {
	await imagemin([`themes/${dir}/${dir}.gif`], {
		destination: `themes/${dir}/optimized`,
		plugins: [
			imageminGifsicle({
				interlaced: false,
				optimizationLevel: 3,
				colors: 32,
			})
		]
	});

	console.log('Images optimized');
	if (existsSync(`themes/${dir}/optimized/${dir}.gif`)){
		console.log(`moving optimized gif into ${dir}`);
		renameSync(`themes/${dir}/optimized/${dir}.gif`, `themes/${dir}/${dir}-optimized.gif`);
		rmdirSync(`themes/${dir}/optimized`);
	} else {
		console.log('The path does not exist.');
	}	
})();

