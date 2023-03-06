console.clear();

let sites = [
	{
		'title': 'HISTORY',
		'slogan': '향수의 역사',
		'url': '../smim/history.jsp',
		'image': '../imgs/history/hi-bg-1.jpg',
	}, {
		'title': 'MATERIAL',
		'slogan': '향수의 재료',
		'url': '../smim/material.jsp',
		'image': '../imgs/material/ma-bn-bg-01.jpg',
	}, {
		'title': 'VARIETY',
		'slogan': '향수의 종류',
		'url': '../smim/variety.jsp',
		'image': '../imgs/variety/va-bn-bg-5.jpg',
	}, {
		'title': 'CONSULTING',
		'slogan': '컨설팅',
		'url': '../smim/consulting.jsp',
		'image': '../imgs/consulting/co-bn-bg-1.jpg',
	},
];


const menu = document.querySelectorAll('.in-menu')[0];
const imageContainer = document.querySelectorAll('.in-image-container')[0];


sites.forEach(site => {
	let dataId = site.title.toLowerCase().replace(/\s/g, '-').replace(/'/g, '').replace(/"/g, '').replace(/</g, '').replace(/>/g, '');
	
	const listEl = $(`<li data-id="${dataId}">
											<a href="${site.url}">${site.title}</a>
											<span class="slogan">${site.slogan}</span>
										</li>`);
	
	const imgEl = $(`<div class="image" data-id="${dataId}">
									 		<img src="${site.image}" alt="${site.title} image">
								 	 </div>`);
	
	$(menu).append(listEl);
	$(imageContainer).append(imgEl);
	
	$(listEl).on('mouseover', function() {
		$('.in-image-container .image').removeClass('visible');
		$(this).addClass('hovered');
		$(imgEl).addClass('visible');
		
	}).on('mousemove', function(e) {
		let imgWidth = $(imgEl).outerWidth();
		let imgHeight = $(imgEl).outerHeight();
		TweenMax.to(imageContainer, .5, {
			left: e.clientX - (imgWidth / 2),
			top: e.clientY - (imgHeight / 2)
		});
		
	}).on('mouseleave', function() {
		$(this).removeClass('hovered');
	});
});


$(menu).on('mouseover', function() {
	$(imageContainer).addClass('visible');
}).on('mouseleave', function() {
	$(imageContainer).removeClass('visible');
});


/* $('.menu li:nth-child(3)').addClass('active');
$('a').on('click', function(e) {e.preventDefault()}); */