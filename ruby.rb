#!/usr/bin/env ruby

require 'yaml'

if ARGV.length < 1
  puts "Please provide YAML directory"
  exit 1
end

Dir.glob "#{ARGV.first}/*.yaml" do |yaml_file|
  content = YAML.load(File.read yaml_file)
    content["persistentVolume"] = {
      "enabled" => true,
      "accessMode" => "ReadWriteMany",
      "azureFile" => {
        "readOnly" => false,
        "shareName" => "aksshare"
      }
    }
    content["persistentVolumeClaim"] = {
      "enabled" => true,
      "accessMode" => "ReadWriteMany",
      "storageSize" => "10Gi"
    }
  Dir.mkdir("yamlFiles") unless File.exists?("yamlFiles")
  Dir.chdir "yamlFiles"
  File.open(yaml_file, 'w') {|file| file.write content.to_yaml(:indentation => 2)}
end
