<script>
	import MenuButton from '$lib/MenuButton.svelte';
	import MenuDropdown from '$lib/MenuDropdown.svelte';
	import {
		AlertTriangle,
		Component,
		Eye,
		File,
		HelpCircle,
		Info,
		Pen,
		PencilLine,
		PencilRuler
	} from 'lucide-svelte';

	/** @type {boolean} */
	export let infoPaneVisible = false;

	/** @type {string} */
	let chartName = 'New Formation';
</script>

<nav class="container">
	<span class="left">
		<MenuButton active={infoPaneVisible} on:click={() => (infoPaneVisible = !infoPaneVisible)}
			><Info size="20" absoluteStrokeWidth /></MenuButton
		>
		<MenuDropdown>
			<File size="20" absoluteStrokeWidth slot="icon" />
			<div slot="dropdown" class="dropdown">
				<button>New Chart<span class="shortcut">Ctrl+N</span></button>
				<button>Open<span class="shortcut">Ctrl+O</span></button>
				<button>Save<span class="shortcut">Ctrl+S</span></button>
				<button>Save As<span class="shortcut">Ctrl+Shift+S</span></button>
			</div>
		</MenuDropdown>
		<MenuDropdown>
			<Pen size="20" absoluteStrokeWidth slot="icon" />
			<div slot="dropdown" class="dropdown">
				<button>Undo<span class="shortcut">Ctrl+Z</span></button>
				<button>Redo<span class="shortcut">Ctrl+Shift+Z</span></button>
			</div>
		</MenuDropdown>
		<MenuDropdown>
			<Eye size="20" absoluteStrokeWidth slot="icon" />
		</MenuDropdown>
	</span>
	<span class="center">
		<span class="chart-name" contenteditable role="textbox" bind:innerText={chartName} />
		<span class="chart-name-icon"><PencilLine size="12" absoluteStrokeWidth /></span>
	</span>
	<span class="right">
		<MenuButton>
			<HelpCircle size="20" absoluteStrokeWidth />
		</MenuButton>
		<MenuButton>
			<Component size="20" absoluteStrokeWidth />
		</MenuButton>
		<MenuButton wide>
			<AlertTriangle size="20" absoluteStrokeWidth />
			2
		</MenuButton>
		<MenuButton>
			<PencilRuler size="20" absoluteStrokeWidth />
		</MenuButton>
	</span>
</nav>

<style>
	.container {
		display: flex;
		height: 100%;
		width: 100%;
		justify-content: space-between;
		z-index: 2;
	}
	.left,
	.center,
	.right {
		display: flex;
		align-items: center;
	}
	.left > * {
		margin-top: 0.1rem;
	}

	.dropdown > * {
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
	.dropdown > *:hover {
		background-color: var(--primary);
		color: var(--primary-content) !important;
	}
	.shortcut {
		margin-left: 1rem;
		margin-top: 0.05em;
		font-size: 0.9em;
		color: var(--content-light);
	}

	.chart-name {
		min-width: 0.5rem;
		font-size: 0.9em;
		background: none;
		color: var(--content);
		border: none;
		text-align: center;
		border-bottom: 0.1rem solid var(--outline);
		transition: border 100ms linear;
	}
	.chart-name:focus {
		outline: none;
		border-bottom-color: var(--primary);
	}

	.chart-name-icon {
		margin-left: 0.3rem;
		color: var(--content-light);
	}
</style>
