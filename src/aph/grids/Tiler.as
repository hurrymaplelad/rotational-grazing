﻿package aph.grids{	import aph.grids.GridPoint;	import flash.geom.Point;	import flash.display.Sprite;	import flash.display.DisplayObject;	public class Tiler extends Sprite {		protected var grid:Grid;		private var tiles:Array;		/** Constructor **/		public function Tiler(grid:Grid) {			this.grid=grid;			clear();		}				public function clear():void {			// removes all tiles			while (numChildren>0) {				removeChildAt(0);			}			// create an empty r by c array			tiles = new Array(grid.rows);			for (var i=0; i<tiles.length; i++) {				tiles[i] = new Array(grid.columns);			}		}				public function clearTile(gp:GridPoint):void {			if (!isEmpty(gp)) {				removeChild(tiles[gp.r][gp.c]);				tiles[gp.r][gp.c]=null;			}		}				public function fill(clip:Class):void {			for (var i=grid.rows-1; i>=0; i--) {				for (var j=0; j<grid.columns; j++) {					setTile(new GridPoint(i,j),clip);				}			}		}				public function remap(from:GridPoint, to:GridPoint):void {			var temp = tiles[from.r][from.c];			tiles[from.r][from.c]=null;			tiles[to.r][to.c]=temp;		}				public function setTile(gp:GridPoint, clip:Class):void {			clearTile(gp);			var tile:DisplayObject = new clip();			var pos:Point = grid.tilePosition(gp);			tile.x = pos.x;			tile.y = pos.y;			tiles[gp.r][gp.c]=tile;			addChild(tile);		}				public function getTile(gp:GridPoint):DisplayObject {			return tiles[gp.r][gp.c];		}				public function isEmpty(gp:GridPoint):Boolean {			return tiles[gp.r][gp.c] == null;		}			}}