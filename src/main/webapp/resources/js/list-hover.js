let posts = document.querySelectorAll('.post>a');

		let shadow;


		const getSize = function() {
			let w = getComputedStyle(posts[0]).getPropertyValue('width');

			shadow.style.width = w;
		}
	
		window.addEventListener('resize',getSize);


		for(let p of posts) {
			let h = getComputedStyle(p).getPropertyValue('height');
			shadow = document.createElement('div');
			shadow.style.background = "#ddd";
			shadow.style.height = '24rem';
			shadow.style.position = 'relative';
			shadow.style.top = '-24rem';
			shadow.style.zIndex = "-10";
			shadow.style.borderRadius = "1.6rem 0.6rem 1.6rem 0.6rem";

			let parent = p.parentElement;
			parent.appendChild(shadow);



		p.addEventListener('mouseover',function() {
			p.style.transition = "transform 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55)";
			p.style.transform = "scale(1.05)";

			let next = p.nextElementSibling;
			next.style.transition = "transform 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55)";
			next.style.transform = 'rotate(6deg) scale(1.05) translateY(4px)';
		});
		p.addEventListener('mouseout',function() {
			p.style.transition = "transform 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55)";
			p.style.transform = "scale(1)";

			let next = p.nextElementSibling;
			next.style.transition = "transform 0.2s cubic-bezier(0.68, -0.55, 0.265, 1.55)";
			next.style.transform = 'rotate(0deg) scale(1) translateY(0px)';
		});


		}