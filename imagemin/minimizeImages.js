import imagemin from 'imagemin';
import imageminGifsicle from 'imagemin-gifsicle';
import { 
	existsSync,
 } from 'node:fs';

const imageFile = process.argv[2];
const outputDir = process.argv[3];

if (existsSync(`${imageFile}`)){
	console.log(`optimizing ${imageFile}`);

	(async () => {
		await imagemin([`${imageFile}`], {
			destination: `${outputDir}`,
			plugins: [
				imageminGifsicle({
					interlaced: false,
					optimizationLevel: 3,
					colors: 32,
				})
			]
		});
	
		console.log('Image optimized');
	
	})();

} else {
	console.log('The image file does not exist.');
}	



