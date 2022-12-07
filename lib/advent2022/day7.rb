module Advent2022
  module Day7
    class File
      attr_reader :size

      def initialize(size)
        @size = size
      end
    end

    class Directory
      attr_reader :parent

      def initialize(parent)
        @parent = parent
        @children = {}
      end

      def add_child(name, child)
        @children[name] = child
      end

      def find_child(name)
        @children[name]
      end

      def size
        @children
          .values
          .map(&:size)
          .sum
      end

      def subdirs
        @children.select {|name,child| child.is_a?(Directory)}
      end

      def deep_subdirs(max_size=70000000)
        subdirs.map {|name,subdir| subdir}.select {|subdir| subdir.size <= max_size} +
          subdirs.flat_map {|name,subdir| subdir.deep_subdirs(max_size)}
      end

      def to_s
        @children.to_s
      end
    end



    def self.handle_command(fs_root, cwd, command, output)
      command, arg = command.split(" ")
      case(command)
      when "cd"
        case(arg)
        when "/"
          cwd = fs_root
        when ".."
          cwd = cwd.parent
        else
          cwd = cwd.find_child(arg)
        end

      when "ls"
        output
          .map {|output_line| output_line.split(" ")}
          .each {|arg1, name|
            if arg1 == "dir"
              cwd.add_child(name, Directory.new(cwd))
            else
              cwd.add_child(name, File.new(arg1.to_i))
            end
          }
      end

      return cwd
    end

    def self.build_file_system(input)
      fs_root = Directory.new(nil)

      input
        .split("$ ")
        .map {|commands_and_output| commands_and_output.split("\n")}
        .reject {|commands_and_output| commands_and_output==[]}
        .reduce(fs_root) { |cwd,command_and_output|
          command, *output = command_and_output
          handle_command(fs_root, cwd, command, output)
        }

      fs_root
    end

    def self.part1(input)
      fs_root = build_file_system(input)

      fs_root.deep_subdirs(100_000)
        .map {|subdir| subdir.size}
        .sum
    end

    def self.part2(input)
      fs_root = build_file_system(input)
      disk_size = 70000000
      needed_free_size = 30000000
      to_be_freed = needed_free_size-(disk_size-fs_root.size)
      
      fs_root.deep_subdirs
        .map {|subdir| subdir.size}
        .sort
        .find {|size| size >= to_be_freed}
    end
  end
end

if __FILE__ == $0
  case(ARGV.shift.to_i)
  when 1
    puts Advent2022::Day7.part1(ARGF.read)
  when 2
    puts Advent2022::Day7.part2(ARGF.read)
  else
    raise "First command-line argument must be 1 or 2"
  end
end