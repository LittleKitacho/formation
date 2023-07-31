<script>
	import { ChevronDown } from 'lucide-svelte';
	import MenuButton from './MenuButton.svelte';

	let dropdownActive = false;
	const toggleDropdown = () => (dropdownActive = !dropdownActive);
</script>

<div class="dropdown" on:mouseleave={() => (dropdownActive = false)} role="menu" tabindex="0">
	<MenuButton wide on:click={toggleDropdown} active={dropdownActive}>
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
	}
</style>
