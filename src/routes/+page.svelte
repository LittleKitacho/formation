<script>
	import MenuBar from './MenuBar.svelte';
</script>

<div class="container">
	<!-- Menu Bar -->
	<div class="menu-bar">
		<MenuBar />
	</div>
	<!-- Drill Info Pane -->
	<div class="info-pane" />
	<!-- Right Pane (Movement Manager, Person/Group Manager) -->
	<div class="side-pane" />
	<!-- Drill View -->
	<div class="drill-view" />
	<!-- Set Management Toolbar-->
	<div class="set-manager" />
</div>

<style>
	.container {
		height: 100vh;
		width: 100vw;
		display: grid;
		grid-template:
			'topbar topbar topbar' 3.1rem
			'info drill sidepane' auto
			'setmng setmng setmng' 3rem /
			min-content auto min-content;
	}
	.menu-bar {
		grid-area: topbar;
	}
	.info-pane {
		grid-area: info;
		width: 10rem;
		background-color: blue;
	}
	.drill-view {
		grid-area: drill;
		background-color: green;
	}
	.side-pane {
		grid-area: sidepane;
		background-color: yellow;
		width: 10rem;
	}
	.set-manager {
		grid-area: setmng;
		background-color: purple;
	}
</style>
