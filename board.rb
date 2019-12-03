require_relative 'tile'

class Board

    def self.generate_grid(size = 9)
        board = Array.new(size) do |col|
             Array.new(size) { |row| row = Tile.new }
        end
    
        self.new(board)
    end

    def initialize(grid)
        @grid = grid
    end

    def number_of_mines
        field = @grid.size ** 2
        if field <= 81
            (field * 0.12).round
        elsif 81 < field && field <= 256
            (field * 0.15).round
        else
            (field * 0.20).round
        end
    end

    def plant_mines
        random_tiles = @grid.flatten.sample(10)
        random_tiles.each do |tile|
            tile_location = @grid.flatten.index(tile)
            @grid.flatten[tile_location].plant_mine
        end
    end

    def [](*pos)
        x,y = pos
        @grid[x][y]
    end

end