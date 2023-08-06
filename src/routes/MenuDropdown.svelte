<script>
	import { ChevronDown } from 'lucide-svelte';
	import MenuButton from './MenuButton.svelte';

	let dropdownActive = false;
	const toggleDropdown = () => (dropdownActive = !dropdownActive);

	/** @type {string?} */
	export let tooltip = null;
</script>

<div class="dropdown" on:mouseleave={() => (dropdownActive = false)} role="menu" tabindex="0">
	<MenuButton
		hideTooltipWhenActive
		wide
		on:click={toggleDropdown}
		active={dropdownActive}
		{tooltip}
	>
		<slot name="icon" />
		<ChevronDown size="16" absoluteStrokeWidth />
	</MenuButton>
	{#if dropdownActive}
		<div class="content">
			<slot name="dropdown" />
		</div>
	{/if}
</div>

<style>
	.dropdown {
		display: inline-block;
		position: relative;
	}
	.content {
		display: block;
		position: absolute;
		top: 2.9rem;
		color: var(--content);
		background: var(--surface);
		box-shadow: 0 0.1rem 0.5rem var(--shadow);
		border-radius: 0.5rem;
		width: auto;
		z-index: 3;
	}
	.content > :global(*) {
		display: flex;
		height: 2rem;
		padding: 0.4rem 1rem;
		width: 100%;
		min-width: max-content;
		background: none;
		color: var(--content);
		border: none;
		border-radius: 0.5rem;
		justify-content: space-between;
		align-content: center;
	}
	.content > :global(*:hover) {
		background-color: var(--primary);
		color: var(--primary-content);
	}
	.content > :global(*:hover) :global(*) {
		color: var(--primary-content) !important;
	}
</style>
