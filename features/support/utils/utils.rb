# # Получаем абсолютный путь к файлу
# def get_filepath(filepath)
#   filename = File.join(File.expand_path(Dir.pwd), filepath)
#   unless File.file?(filename)
#     puts "file #{filename} not finded"
#     raise Errno::ENOENT
#   end
#   filename
# end