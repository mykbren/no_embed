# NoEmbed Gem

A lightweight Ruby wrapper for the [NoEmbed API](https://noembed.com/). Quickly fetch rich embed data for URLs with a simple method call.
Noembed little bit outdated, and lot's of endpoints already not supported. This gem was created for getting YouTube embeds, which works fine.

## Features
- Fetch embed data for any URL supported by NoEmbed (some of them outdated and doesn't work).
- Pass optional parameters like `maxwidth` and `maxheight` for responsive embeds.
- Simple error handling for invalid or unsupported URLs.

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'no_embed'
```

And then execute:

```bash
bundle install
```

Or install it manually:

```bash
gem install no_embed
```

---

## Usage

### Basic Example
Fetch embed data for a URL:
```ruby
require 'no_embed'

url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
embed_data = NoEmbed.get_embed_for_url(url)

puts embed_data['title'] # => "Rick Astley - Never Gonna Give You Up"
```

### Additional Parameters
Pass optional parameters like `maxwidth` to resize the embed content:
```ruby
embed_data = NoEmbed.get_embed_for_url(url, maxwidth: 300)
puts embed_data['html']
```

### Error Handling
Handle cases where the API returns an error:
```ruby
begin
  embed_data = NoEmbed.get_embed_for_url('https://invalid.url')
rescue StandardError => e
  puts "Error: #{e.message}"
end
```

---

## Parameters

The `get_embed_for_url` method supports the following parameters:

| Parameter   | Description                                            |
|-------------|--------------------------------------------------------|
| `maxwidth`  | Maximum width (in pixels) for the embed content.       |
| `maxheight` | Maximum height (in pixels) for the embed content.      |
| Other       | Any other query parameters supported by NoEmbed API.   |

---

## Return Value

The method returns a Ruby `Hash` containing the following fields (if available):

- `title`: Title of the embed content.
- `author_name`: Author of the content.
- `provider_name`: Name of the embed provider.
- `html`: HTML embed code (iframe or other rich content).
- `width`, `height`: Dimensions of the embed.

For a full list of fields, refer to the [NoEmbed API Documentation](https://noembed.com/).

---

## Development

To contribute or test locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/mykbren/no_embed.git
   cd no_embed
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Run tests:
   ```bash
   bundle exec rspec
   ```

---

## Testing the Gem Locally

To test the gem without publishing it:

1. Build the gem:
   ```bash
   gem build no_embed.gemspec
   ```

2. Install it locally:
   ```bash
   gem install ./no_embed-0.1.2.gem
   ```

3. Use it in a Ruby script or add it to a project via `Gemfile`:
   ```ruby
   gem 'no_embed', path: '/path/to/local/no_embed'
   ```

---

## License

This gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

---