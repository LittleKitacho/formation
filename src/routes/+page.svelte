<script>
	import MenuBar from "./MenuBar.svelte";
import PlaybackControls from "./PlaybackControls.svelte";
</script>

<div class="container">
  <!-- Menu Bar -->
  <div class="menu-bar">
    <MenuBar />
  </div>
  <!-- Drill Info Pane -->
  <div class="info-pane"></div>
  <!-- Right Pane (Movement Manager, Person/Group Manager) -->
  <div class="side-pane"></div>
  <!-- Drill View -->
  <div class="drill-view"></div>
  <!-- Set Management Toolbar-->
  <div class="set-manager"></div>
</div>

<style>
  .container {
    height: 100vh;
    width: 100vw;
    display: grid;
    grid-template: "topbar topbar topbar" 3.1rem
                   "info drill sidepane" auto
                   "setmng setmng setmng" 3rem /
                   min-content auto min-content
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
