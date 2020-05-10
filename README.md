# AndyDNA::Google::Translate

Dead simple wrapper for "google-cloud-translate".

```ruby
GoogleTranslate << "hola"  #=> "Hello"
```

Set
```ruby
ENV["TRANSLATE_CREDENTIALS"] = File.expand_path("some/where/credentials.json")
ENV["TRANSLATE_PROJECT"]     = "project_name"
```
somehow.

