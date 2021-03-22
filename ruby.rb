
Dir.glob "#{ARGV.first}/*.yaml" do |yaml_file|
  content = YAML.load(File.read yaml_file)

    content["persistentVolume"] = {
      "enabled" => true,
      "accessMode" => "ReadWriteMany",
      "azureFile" => {
        "readOnly" => false,
        "shareName" => "customtding"
      }
    }
    content["persistentVolumeClaim"] = {
      "enabled" => true,
      "accessMode" => "ReadWriteMany",
      "storageSize" => "10Gi"
    }

  File.open(yaml_file, 'w') {|file| file.write content.to_yaml(:indentation => 2)}
end


