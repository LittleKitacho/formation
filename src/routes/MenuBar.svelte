<script>
	import MenuButton from './MenuButton.svelte';
	import MenuDropdown from './MenuDropdown.svelte';
	import {
		AlertTriangle,
		Component,
		Eye,
		File,
		HelpCircle,
		Info,
		Music4,
		Pen,
		PencilLine,
		PencilRuler
	} from 'lucide-svelte';

	/** @type {string} */
	let chartName = 'New Formation';
</script>

<nav class="container">
	<span class="left">
		<MenuDropdown tooltip="File">
			<File size="20" absoluteStrokeWidth slot="icon" />
			<svelte:fragment slot="dropdown">
				<button>New Chart<span class="shortcut">Ctrl+N</span></button>
				<button>Open<span class="shortcut">Ctrl+O</span></button>
				<button>Save<span class="shortcut">Ctrl+S</span></button>
				<button>Save As<span class="shortcut">Ctrl+Shift+S</span></button>
			</svelte:fragment>
		</MenuDropdown>
		<MenuDropdown tooltip="Edit">
			<Pen size="20" absoluteStrokeWidth slot="icon" />
			<svelte:fragment slot="dropdown">
				<button>Undo<span class="shortcut">Ctrl+Z</span></button>
				<button>Redo<span class="shortcut">Ctrl+Shift+Z</span></button>
			</svelte:fragment>
		</MenuDropdown>
		<MenuDropdown tooltip="View">
			<Eye size="20" absoluteStrokeWidth slot="icon" />
		</MenuDropdown>
		<MenuDropdown tooltip="Get Help">
			<HelpCircle size="20" absoluteStrokeWidth slot="icon" />
			<svelte:fragment slot="dropdown">
				<a href="/help">Get Help</a>
			</svelte:fragment>
		</MenuDropdown>
	</span>
	<span class="center">
		<span class="chart-name" contenteditable role="textbox" bind:innerText={chartName} />
		<span class="chart-name-icon"><PencilLine size="12" absoluteStrokeWidth /></span>
	</span>
	<span class="right">
		<MenuButton tooltip="Reference Music">
			<Music4 size="20" absoluteStrokeWidth />
		</MenuButton>
		<MenuButton tooltip="Groups & Points">
			<Component size="20" absoluteStrokeWidth />
		</MenuButton>
		<MenuButton tooltip="Preview Commands" tooltipOffset={-60}>
			<PencilRuler size="20" absoluteStrokeWidth />
		</MenuButton>
	</span>
</nav>

<style>
	.container {
		padding: 0 0.2rem;
		display: flex;
		height: 3.1rem;
		width: 100vw;
		justify-content: space-between;
		background-color: var(--surface);
		z-index: 2;
		border-bottom: 0.05rem solid var(--outline);
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
