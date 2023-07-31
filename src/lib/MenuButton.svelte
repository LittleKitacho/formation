<script>
	/** @type {boolean} */
	export let wide = false;
	/** @type {boolean} */
	export let active = false;
</script>

<button on:click class:wide class:active>
	<slot />
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
</style>
