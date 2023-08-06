/** @type import('svelte/action').Action<HTMLElement, number> */
export default function linger(node, ms = 1000) {
	/** @type {NodeJS.Timeout} */
	let timeout;

	node.addEventListener('mouseenter', () => {
		timeout = setTimeout(() => node.dispatchEvent(new CustomEvent('linger')), ms);
	});
	node.addEventListener('mouseleave', () => clearTimeout(timeout));

	return {
		destroy: function () {
			clearTimeout(timeout);
		}
	};
}
