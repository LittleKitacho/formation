<script>
	import { fly } from 'svelte/transition';
	import linger from '$lib/linger';

	/** @type {boolean} */
	export let wide = false;
	/** @type {boolean} */
	export let active = false;
	/** @type {string?} */
	export let tooltip = null;
	/** @type {number?} */
	export let tooltipOffset = 0;
	/** @type {boolean?} */
	export let hideTooltipWhenActive = false;

	let tooltipActive = false;
</script>

<button
	on:click
	use:linger={200}
	on:linger={() => (tooltipActive = true)}
	on:mouseleave={() => (tooltipActive = false)}
	class="button"
	class:wide
	class:active
>
	<slot />
	{#if tooltip && tooltipActive && !(hideTooltipWhenActive && active)}
		<div
			class="tooltip"
			transition:fly={{ y: 5, duration: 200 }}
			style:transform="translateX({tooltipOffset}px)"
		>
			{tooltip}
		</div>
	{/if}
</button>

<style>
	button {
		height: 2.9rem;
		width: 2.9rem;
		background-color: var(--surface);
		color: var(--content);
		border: none;
		border-radius: 0.5rem;
		transition: background-color 100ms linear, color 100ms linear;
		display: flex;
		align-items: center;
		justify-content: center;
		position: relative;
	}
	.wide {
		width: 3.1rem;
	}
	.active {
		background-color: var(--primary);
		color: var(--primary-content);
	}
	button:hover {
		background-color: var(--surface-tint);
	}
	button.active:hover {
		background-color: var(--primary-highlight);
	}

	.tooltip {
		position: absolute;
		top: 3rem;
		background-color: var(--tooltip);
		color: var(--tooltip-content);
		padding: 0.4rem 0.7rem;
		border-radius: 0.5rem;
		font-size: 0.9rem;
		width: max-content;
	}
</style>
